package vexriscv

import spinal.core._
import spinal.core.internals.{ExpressionContainer, PhaseAllocateNames, PhaseContext}
import spinal.lib._
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
import vexriscv.plugin.CsrAccess.WRITE_ONLY
import vexriscv.plugin._

import scala.collection.mutable.ArrayBuffer

object MySpinalConfig extends spinal.core.SpinalConfig(
  defaultConfigForClockDomains = ClockDomainConfig(
    resetKind = spinal.core.SYNC
  )
){
  //Insert a compilation phase which will add a  (* ram_style = "block" *) on all synchronous rams.
  phasesInserters += {(array) => array.insert(array.indexWhere(_.isInstanceOf[PhaseAllocateNames]) + 1, new ForceRamBlockPhase)}
}


case class MyArgConfig(
  debug : Boolean = false,
  externalInterruptArray : Boolean = true,
  prediction : BranchPrediction = NONE,
  outputFile : String = "VexRiscv",
  hardwareBreakpointCount : Int = 4
)

object GenHaD{
  val predictionMap = Map(
    "none" -> NONE,
    "static" -> STATIC,
    "dynamic" -> DYNAMIC,
    "dynamic_target" -> DYNAMIC_TARGET
  )

  def main(args: Array[String]) {

    // Allow arguments to be passed ex:
    // sbt compile "run-main vexriscv.GenCoreDefault -d --iCacheSize=1024"
    val parser = new scopt.OptionParser[MyArgConfig]("VexRiscvGen") {
      //  ex :-d    or   --debug
      opt[Unit]('d', "debug")    action { (_, c) => c.copy(debug = true)   } text("Enable debug")
      opt[Int]("hardwareBreakpointCount")     action { (v, c) => c.copy(hardwareBreakpointCount = v) } text("Specify number of hardware breakpoints")
      opt[String]("prediction")    action { (v, c) => c.copy(prediction = predictionMap(v))   } text("switch between regular CSR and array like one")
      opt[String]("outputFile")    action { (v, c) => c.copy(outputFile = v) } text("output file name")
    }
    val argConfig = parser.parse(args, MyArgConfig()).get

    MySpinalConfig.copy(netlistFileName = argConfig.outputFile + ".v").generateVerilog {
      // Generate CPU plugin list
      val plugins = ArrayBuffer[Plugin[VexRiscv]]()

      plugins ++= List(
          new IBusCachedPlugin(
            prediction = STATIC,
            historyRamSizeLog2 = 8,
            resetVector = null,
            memoryTranslatorPortConfig = MmuPortConfig(portTlbSize = 4),
            compressedGen = true,
            config = InstructionCacheConfig(
              cacheSize = 4096,
              bytePerLine = 32,
              wayCount = 1,
              addressWidth = 32,
              cpuDataWidth = 32,
              memDataWidth = 32,
              catchIllegalAccess = true,
              catchAccessFault = true,
              asyncTagMemory = false,
              twoCycleRam = true,
              twoCycleCache = true
            )
          ),

          new DBusCachedPlugin(
              dBusCmdMasterPipe = true,
              dBusCmdSlavePipe = true,
              dBusRspSlavePipe = false,
              relaxedMemoryTranslationRegister = false,
              config = new DataCacheConfig(
                cacheSize = 4096,
                bytePerLine = 32,
                wayCount = 1,
                addressWidth = 32,
                cpuDataWidth = 32,
                memDataWidth = 32,
                catchAccessError = true,
                catchIllegal = true,
                catchUnaligned = true,
                withLrSc = true,
                withAmo = true,
                earlyWaysHits = true
              ),
              memoryTranslatorPortConfig = MmuPortConfig(portTlbSize = 4),
              csrInfo = true
          ),

        new DecoderSimplePlugin(
          catchIllegalInstruction = true
        ),
        new RegFilePlugin(
          regFileReadyKind = plugin.ASYNC,
          zeroBoot = false
        ),
        new IntAluPlugin,
        new SrcPlugin(
          separatedAddSub = false,
          executeInsertion = true
        ),
        new FullBarrelShifterPlugin(earlyInjection = true),
        new HazardSimplePlugin(
          bypassExecute           = true,
          bypassMemory            = true,
          bypassWriteBack         = true,
          bypassWriteBackBuffer   = true,
          pessimisticUseSrc       = false,
          pessimisticWriteRegFile = false,
          pessimisticAddressMatch = false
        ),
        new MulPlugin,
        new DivPlugin,
        new CsrPlugin(CsrPluginConfig.linuxFull(mtVecInit = 0).copy(ebreakGen = true)),
        new BranchPlugin(
          earlyBranch = true,
          catchAddressMisaligned = true
        ),
        new MmuPlugin(
            ioRange = (x => x(31 downto 28) === 0xB || x(31 downto 28) === 0xE || x(31 downto 28) === 0xF )
        ),
        new YamlPlugin(argConfig.outputFile.concat(".yaml"))
      )

      if (argConfig.externalInterruptArray) plugins ++= List(
        new ExternalInterruptArrayPlugin(
          machineMaskCsrId = 0xBC0,
          machinePendingsCsrId = 0xFC0,
          supervisorMaskCsrId = 0x9C0,
          supervisorPendingsCsrId = 0xDC0
        )
      )

      // Add in the Debug plugin, if requested
      if (argConfig.debug) {
        plugins += new DebugPlugin(ClockDomain.current.clone(reset = Bool().setName("debugReset")), hardwareBreakpointCount = argConfig.hardwareBreakpointCount)
      }

      // CPU configuration
      val cpuConfig = VexRiscvConfig(plugins.toList)

      // CPU instantiation
      val cpu = new VexRiscv(cpuConfig)

      // CPU modifications to be an Wishbone one
      cpu.rework {
        for (plugin <- cpuConfig.plugins) plugin match {
          case plugin: IBusSimplePlugin => {
            plugin.iBus.setAsDirectionLess() //Unset IO properties of iBus
            master(plugin.iBus.toWishbone()).setName("iBusWishbone")
          }
          case plugin: IBusCachedPlugin => {
            plugin.iBus.setAsDirectionLess()
            master(plugin.iBus.toWishbone()).setName("iBusWishbone")
          }
          case plugin: DBusSimplePlugin => {
            plugin.dBus.setAsDirectionLess()
            master(plugin.dBus.toWishbone()).setName("dBusWishbone")
          }
          case plugin: DBusCachedPlugin => {
            plugin.dBus.setAsDirectionLess()
            master(plugin.dBus.toWishbone()).setName("dBusWishbone")
          }
          case _ =>
        }
      }
      cpu
    }
  }
}

class ForceRamBlockPhase() extends spinal.core.internals.Phase{
  override def impl(pc: PhaseContext): Unit = {
    pc.walkBaseNodes{
      case mem: Mem[_] => {
        var asyncRead = false
        mem.dlcForeach[MemPortStatement]{
          case _ : MemReadAsync => asyncRead = true
          case _ =>
        }
        if(!asyncRead) mem.addAttribute("ram_style", "block")
      }
      case _ =>
    }
  }
  override def hasNetlistImpact: Boolean = false
}