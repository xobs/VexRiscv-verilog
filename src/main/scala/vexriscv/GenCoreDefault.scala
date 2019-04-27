package vexriscv

import spinal.core._
import spinal.lib._
import vexriscv.ip.{DataCacheConfig, InstructionCacheConfig}
import vexriscv.plugin.CsrAccess.WRITE_ONLY
import vexriscv.plugin._

import scala.collection.mutable.ArrayBuffer

object SpinalConfig extends spinal.core.SpinalConfig(
  defaultConfigForClockDomains = ClockDomainConfig(
    resetKind = spinal.core.SYNC
  )
)

case class ArgConfig(
  debug : Boolean = false,
  iCacheSize : Int = 4096,
  dCacheSize : Int = 4096,
  mulDiv : Boolean = true,
  singleCycleMulDiv : Boolean = true,
  bypass : Boolean = true,
  externalInterruptArray : Boolean = true,
  prediction : BranchPrediction = NONE,
  outputFile : String = "VexRiscv",
  withPipelining : Boolean = true,
  withMemoryStage : Boolean = true,
  withWriteBackStage : Boolean = true,
  withRfBypass : Boolean = false,
  withCsr : Boolean = true,
  noComplianceOverhead : Boolean = false
)

object GenCoreDefault{
  val predictionMap = Map(
    "none" -> NONE,
    "static" -> STATIC,
    "dynamic" -> DYNAMIC,
    "dynamic_target" -> DYNAMIC_TARGET
  )

  def main(args: Array[String]) {

    // Allow arguments to be passed ex:
    // sbt compile "run-main vexriscv.GenCoreDefault -d --iCacheSize=1024"
    val parser = new scopt.OptionParser[ArgConfig]("VexRiscvGen") {
      //  ex :-d    or   --debug
      opt[Unit]('d', "debug")    action { (_, c) => c.copy(debug = true)   } text("Enable debug")
      // ex : -iCacheSize=XXX
      opt[Int]("iCacheSize")     action { (v, c) => c.copy(iCacheSize = v) } text("Set instruction cache size, 0 mean no cache")
      // ex : -dCacheSize=XXX
      opt[Int]("dCacheSize")     action { (v, c) => c.copy(dCacheSize = v) } text("Set data cache size, 0 mean no cache")
      opt[Boolean]("mulDiv")    action { (v, c) => c.copy(mulDiv = v)   } text("set RV32IM")
      opt[Boolean]("singleCycleMulDiv")    action { (v, c) => c.copy(singleCycleMulDiv = v)   } text("If true, MUL/DIV/Shifts are single-cycle")
      opt[Boolean]("bypass")    action { (v, c) => c.copy(bypass = v)   } text("set pipeline interlock/bypass")
      opt[Boolean]("externalInterruptArray")    action { (v, c) => c.copy(externalInterruptArray = v)   } text("switch between regular CSR and array like one")
      opt[String]("prediction")    action { (v, c) => c.copy(prediction = predictionMap(v))   } text("switch between regular CSR and array like one")
      opt[String]("outputFile")    action { (v, c) => c.copy(outputFile = v) } text("output file name")

      opt[Boolean]("pipelining")            action { (v, c) => c.copy(withPipelining = v) } text("output file name")
      opt[Boolean]("memoryStage")           action { (v, c) => c.copy(withMemoryStage = v) } text("output file name")
      opt[Boolean]("writeBackStage")        action { (v, c) => c.copy(withWriteBackStage = v) } text("output file name")
      opt[Boolean]("rfBypass")              action { (v, c) => c.copy(withRfBypass = v) } text("output file name")
      opt[Boolean]("withCsr")               action { (v, c) => c.copy(withCsr = v) } text("output file name")
      opt[Boolean]("noComplianceOverhead")  action { (v, c) => c.copy(noComplianceOverhead = v) } text("output file name")
    }
    val argConfig = parser.parse(args, ArgConfig()).get

    SpinalConfig.copy(netlistFileName = argConfig.outputFile + ".v").generateVerilog {
      // Generate CPU plugin list
      val plugins = ArrayBuffer[Plugin[VexRiscv]]()

      plugins ++= List(
        if(argConfig.iCacheSize <= 0){
          new IBusSimplePlugin(
            resetVector = null,
            cmdForkOnSecondStage = false,
            cmdForkPersistence = false,
            prediction = argConfig.prediction,
            catchAccessFault = false,
            compressedGen = true,
            injectorStage = false,
            rspHoldValue = !argConfig.withPipelining,
            singleInstructionPipeline = !argConfig.withPipelining,
            busLatencyMin = 1,
            pendingMax = if(argConfig.withPipelining) 3 else 1,
            memoryTranslatorPortConfig = MmuPortConfig(
              portTlbSize = 4
            )
          )
        } else {
          new IBusCachedPlugin(
            resetVector = null,
            prediction = argConfig.prediction,
            withoutInjectorStage = true,

            memoryTranslatorPortConfig = MmuPortConfig(
              portTlbSize = 4
            ),
            config = InstructionCacheConfig(
              cacheSize = argConfig.iCacheSize,
              bytePerLine = 32,
              wayCount = 1,
              addressWidth = 32,
              cpuDataWidth = 32,
              memDataWidth = 32,
              catchIllegalAccess = true,
              catchAccessFault = true,
              asyncTagMemory = false,
              twoCycleRam = false,
              twoCycleCache = false,
              preResetFlush = false
            )
          )
        },

        if(argConfig.dCacheSize <= 0){
          // new DBusSimplePlugin(
          //   catchAddressMisaligned = false,
          //   catchAccessFault = false
          // )
          new DBusSimplePlugin(
            catchAddressMisaligned = argConfig.withCsr && !argConfig.noComplianceOverhead,
            catchAccessFault = false,
            memoryTranslatorPortConfig = MmuPortConfig(
              portTlbSize = 4
            )
          )
        } else {
          new DBusCachedPlugin(
            config = new DataCacheConfig(
              cacheSize = argConfig.dCacheSize,
              bytePerLine = 32,
              wayCount = 1,
              addressWidth = 32,
              cpuDataWidth = 32,
              memDataWidth = 32,
              catchAccessError = true,
              catchIllegal = true,
              catchUnaligned = true
              // catchMemoryTranslationMiss = true
            ),
            memoryTranslatorPortConfig = MmuPortConfig(
              portTlbSize = 4
            ),
            csrInfo = true
          )
        },

        new DecoderSimplePlugin(
          catchIllegalInstruction = true
        ),
        new RegFilePlugin(
          regFileReadyKind = plugin.SYNC,
          zeroBoot = true,
          x0Init = false,
          readInExecute = true,
          syncUpdateOnStall = argConfig.withPipelining
        ),
        // new RegFilePlugin(
        //   regFileReadyKind = plugin.SYNC,
        //   zeroBoot = false
        // ),
        new IntAluPlugin,
        new SrcPlugin(
          separatedAddSub = false,
          executeInsertion = true,
          decodeAddSub = false
        ),
        if(argConfig.singleCycleMulDiv) {
          new FullBarrelShifterPlugin
        }else {
          new LightShifterPlugin
        },
        // new HazardSimplePlugin(
        //   bypassExecute           = argConfig.bypass,
        //   bypassMemory            = argConfig.bypass,
        //   bypassWriteBack         = argConfig.bypass,
        //   bypassWriteBackBuffer   = argConfig.bypass,
        //   pessimisticUseSrc       = false,
        //   pessimisticWriteRegFile = false,
        //   pessimisticAddressMatch = false
        // ),
        new BranchPlugin(
          earlyBranch = true,
          catchAddressMisaligned = argConfig.withCsr && !argConfig.noComplianceOverhead,
          fenceiGenAsAJump = argConfig.withPipelining,
          fenceiGenAsANop = !argConfig.withPipelining
        ),

        new MmuPlugin(
          ioRange = (x => x(31 downto 28) === 0xB || x(31 downto 28) === 0xE || x(31 downto 28) === 0xF )
        ),
        new YamlPlugin(argConfig.outputFile.concat(".yaml"))
      )

      if(argConfig.withCsr) plugins ++= List(new CsrPlugin(
        if (argConfig.noComplianceOverhead) new CsrPluginConfig(
          catchIllegalAccess = true,
          mvendorid = null,
          marchid = null,
          mimpid = null,
          mhartid = null,
          misaExtensionsInit = 0,
          misaAccess = CsrAccess.NONE,
          mtvecAccess = CsrAccess.WRITE_ONLY,
          mtvecInit = null,
          mepcAccess = CsrAccess.READ_WRITE,
          mscratchGen = false,
          mcauseAccess = CsrAccess.READ_ONLY,
          mbadaddrAccess = CsrAccess.NONE,
          mcycleAccess = CsrAccess.NONE,
          minstretAccess = CsrAccess.NONE,
          ecallGen = true,
          ebreakGen = false,
          wfiGenAsWait = false,
          wfiGenAsNop = true,
          ucycleAccess = CsrAccess.NONE
        )
        else new CsrPluginConfig(
          catchIllegalAccess = false,
          mvendorid = null,
          marchid = null,
          mimpid = null,
          mhartid = null,
          misaExtensionsInit = 0,
          misaAccess = CsrAccess.NONE,
          mtvecAccess = CsrAccess.WRITE_ONLY,
          mtvecInit = null,
          mepcAccess = CsrAccess.READ_WRITE,
          mscratchGen = true,
          mcauseAccess = CsrAccess.READ_ONLY,
          mbadaddrAccess = CsrAccess.READ_ONLY,
          mcycleAccess = CsrAccess.NONE,
          minstretAccess = CsrAccess.NONE,
          ecallGen = true,
          ebreakGen = true,
          wfiGenAsWait = false,
          wfiGenAsNop = true,
          ucycleAccess = CsrAccess.NONE
        )
      ))

      if(argConfig.mulDiv) {
        if(argConfig.singleCycleMulDiv) {
          plugins ++= List(
            new MulPlugin,
            new DivPlugin
          )
        }else {
          plugins ++= List(
            new MulDivIterativePlugin(
              genMul = true,
              genDiv = true,
              mulUnrollFactor = 1,
              divUnrollFactor = 1
            )
          )
        }
      }
      // plugins += new MulSimplePlugin
      // plugins += new DivPlugin
      // plugins += new MulDivIterativePlugin(
      //   genMul = false,
      //   genDiv = true,
      //   divUnrollFactor = 1,
      //   dhrystoneOpt = true
      // )

      if(argConfig.withPipelining){
        plugins += new HazardSimplePlugin(
          bypassExecute = argConfig.withRfBypass,
          bypassMemory  = argConfig.withRfBypass && argConfig.withMemoryStage,
          bypassWriteBackBuffer = argConfig.withRfBypass
        )
      } else {
        plugins += new NoHazardPlugin
      }

      if(argConfig.externalInterruptArray) plugins ++= List(
        new ExternalInterruptArrayPlugin(
          maskCsrId = 0xBC0,
          pendingsCsrId = 0xFC0
        )
      )

      // Add in the Debug plugin, if requested
      if(argConfig.debug) {
        plugins += new DebugPlugin(ClockDomain.current.clone(reset = Bool().setName("debugReset")), hardwareBreakpointCount = 4)
      }

      // CPU configuration
      val cpuConfig = VexRiscvConfig(
        withMemoryStage = argConfig.withMemoryStage,
        withWriteBackStage = argConfig.withWriteBackStage,
        plugins.toList)

      // CPU instantiation
      val cpu = new VexRiscv(cpuConfig)

      // CPU modifications to be an Wishbone one
      cpu.rework {
        for (plugin <- cpuConfig.plugins) plugin match {
          case plugin: IBusSimplePlugin => {
            plugin.iBus.asDirectionLess() //Unset IO properties of iBus
            master(plugin.iBus.toWishbone()).setName("iBusWishbone")
          }
          case plugin: IBusCachedPlugin => {
            plugin.iBus.asDirectionLess()
            master(plugin.iBus.toWishbone()).setName("iBusWishbone")
          }
          case plugin: DBusSimplePlugin => {
            plugin.dBus.asDirectionLess()
            master(plugin.dBus.toWishbone()).setName("dBusWishbone")
          }
          case plugin: DBusCachedPlugin => {
            plugin.dBus.asDirectionLess()
            master(plugin.dBus.toWishbone()).setName("dBusWishbone")
          }
          case _ =>
        }
      }
      cpu
    }
  }
}
