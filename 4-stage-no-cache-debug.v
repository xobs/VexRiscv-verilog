// Generator : SpinalHDL v1.3.3    git head : 8b8cd335eecbea3b5f1f970f218a982dbdb12d99
// Date      : 25/04/2019, 14:35:10
// Component : VexRiscv


`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b11

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

module VexRiscv (
      input  [31:0] externalResetVector,
      input   timerInterrupt,
      input   softwareInterrupt,
      input  [31:0] externalInterruptArray,
      input   debug_bus_cmd_valid,
      output reg  debug_bus_cmd_ready,
      input   debug_bus_cmd_payload_wr,
      input  [7:0] debug_bus_cmd_payload_address,
      input  [31:0] debug_bus_cmd_payload_data,
      output reg [31:0] debug_bus_rsp_data,
      output  debug_resetOut,
      output  iBusWishbone_CYC,
      output  iBusWishbone_STB,
      input   iBusWishbone_ACK,
      output  iBusWishbone_WE,
      output [29:0] iBusWishbone_ADR,
      input  [31:0] iBusWishbone_DAT_MISO,
      output [31:0] iBusWishbone_DAT_MOSI,
      output [3:0] iBusWishbone_SEL,
      input   iBusWishbone_ERR,
      output [1:0] iBusWishbone_BTE,
      output [2:0] iBusWishbone_CTI,
      output  dBusWishbone_CYC,
      output  dBusWishbone_STB,
      input   dBusWishbone_ACK,
      output  dBusWishbone_WE,
      output [29:0] dBusWishbone_ADR,
      input  [31:0] dBusWishbone_DAT_MISO,
      output [31:0] dBusWishbone_DAT_MOSI,
      output reg [3:0] dBusWishbone_SEL,
      input   dBusWishbone_ERR,
      output [1:0] dBusWishbone_BTE,
      output [2:0] dBusWishbone_CTI,
      input   clk,
      input   reset,
      input   debugReset);
  reg [31:0] _zz_159_;
  reg [31:0] _zz_160_;
  wire  _zz_161_;
  wire  _zz_162_;
  wire  _zz_163_;
  wire  _zz_164_;
  wire [1:0] _zz_165_;
  wire  _zz_166_;
  wire  _zz_167_;
  wire  _zz_168_;
  wire  _zz_169_;
  wire [5:0] _zz_170_;
  wire  _zz_171_;
  wire  _zz_172_;
  wire [4:0] _zz_173_;
  wire [1:0] _zz_174_;
  wire [1:0] _zz_175_;
  wire [1:0] _zz_176_;
  wire  _zz_177_;
  wire [1:0] _zz_178_;
  wire [1:0] _zz_179_;
  wire [2:0] _zz_180_;
  wire [31:0] _zz_181_;
  wire [2:0] _zz_182_;
  wire [31:0] _zz_183_;
  wire [31:0] _zz_184_;
  wire [11:0] _zz_185_;
  wire [11:0] _zz_186_;
  wire [2:0] _zz_187_;
  wire [31:0] _zz_188_;
  wire [0:0] _zz_189_;
  wire [2:0] _zz_190_;
  wire [0:0] _zz_191_;
  wire [0:0] _zz_192_;
  wire [0:0] _zz_193_;
  wire [0:0] _zz_194_;
  wire [0:0] _zz_195_;
  wire [0:0] _zz_196_;
  wire [0:0] _zz_197_;
  wire [0:0] _zz_198_;
  wire [0:0] _zz_199_;
  wire [2:0] _zz_200_;
  wire [4:0] _zz_201_;
  wire [11:0] _zz_202_;
  wire [11:0] _zz_203_;
  wire [31:0] _zz_204_;
  wire [31:0] _zz_205_;
  wire [31:0] _zz_206_;
  wire [31:0] _zz_207_;
  wire [31:0] _zz_208_;
  wire [31:0] _zz_209_;
  wire [31:0] _zz_210_;
  wire [31:0] _zz_211_;
  wire [32:0] _zz_212_;
  wire [19:0] _zz_213_;
  wire [11:0] _zz_214_;
  wire [11:0] _zz_215_;
  wire [0:0] _zz_216_;
  wire [0:0] _zz_217_;
  wire [0:0] _zz_218_;
  wire [0:0] _zz_219_;
  wire [30:0] _zz_220_;
  wire [30:0] _zz_221_;
  wire [30:0] _zz_222_;
  wire [30:0] _zz_223_;
  wire [0:0] _zz_224_;
  wire [0:0] _zz_225_;
  wire [0:0] _zz_226_;
  wire [0:0] _zz_227_;
  wire [0:0] _zz_228_;
  wire [0:0] _zz_229_;
  wire [6:0] _zz_230_;
  wire  _zz_231_;
  wire  _zz_232_;
  wire [6:0] _zz_233_;
  wire [4:0] _zz_234_;
  wire  _zz_235_;
  wire [4:0] _zz_236_;
  wire [31:0] _zz_237_;
  wire [31:0] _zz_238_;
  wire [31:0] _zz_239_;
  wire [31:0] _zz_240_;
  wire  _zz_241_;
  wire  _zz_242_;
  wire  _zz_243_;
  wire [1:0] _zz_244_;
  wire [1:0] _zz_245_;
  wire  _zz_246_;
  wire [0:0] _zz_247_;
  wire [20:0] _zz_248_;
  wire [31:0] _zz_249_;
  wire [31:0] _zz_250_;
  wire  _zz_251_;
  wire  _zz_252_;
  wire [0:0] _zz_253_;
  wire [0:0] _zz_254_;
  wire  _zz_255_;
  wire [0:0] _zz_256_;
  wire [17:0] _zz_257_;
  wire [31:0] _zz_258_;
  wire [31:0] _zz_259_;
  wire [31:0] _zz_260_;
  wire [0:0] _zz_261_;
  wire [0:0] _zz_262_;
  wire [1:0] _zz_263_;
  wire [1:0] _zz_264_;
  wire  _zz_265_;
  wire [0:0] _zz_266_;
  wire [13:0] _zz_267_;
  wire [31:0] _zz_268_;
  wire [31:0] _zz_269_;
  wire [31:0] _zz_270_;
  wire [31:0] _zz_271_;
  wire [31:0] _zz_272_;
  wire [31:0] _zz_273_;
  wire [31:0] _zz_274_;
  wire [31:0] _zz_275_;
  wire [0:0] _zz_276_;
  wire [0:0] _zz_277_;
  wire [1:0] _zz_278_;
  wire [1:0] _zz_279_;
  wire  _zz_280_;
  wire [0:0] _zz_281_;
  wire [10:0] _zz_282_;
  wire [31:0] _zz_283_;
  wire [31:0] _zz_284_;
  wire [31:0] _zz_285_;
  wire [31:0] _zz_286_;
  wire  _zz_287_;
  wire  _zz_288_;
  wire [1:0] _zz_289_;
  wire [1:0] _zz_290_;
  wire  _zz_291_;
  wire [0:0] _zz_292_;
  wire [7:0] _zz_293_;
  wire [31:0] _zz_294_;
  wire [31:0] _zz_295_;
  wire [31:0] _zz_296_;
  wire [31:0] _zz_297_;
  wire [0:0] _zz_298_;
  wire [4:0] _zz_299_;
  wire [3:0] _zz_300_;
  wire [3:0] _zz_301_;
  wire  _zz_302_;
  wire [0:0] _zz_303_;
  wire [4:0] _zz_304_;
  wire [31:0] _zz_305_;
  wire [31:0] _zz_306_;
  wire  _zz_307_;
  wire [0:0] _zz_308_;
  wire [1:0] _zz_309_;
  wire [31:0] _zz_310_;
  wire [31:0] _zz_311_;
  wire  _zz_312_;
  wire [0:0] _zz_313_;
  wire [0:0] _zz_314_;
  wire [31:0] _zz_315_;
  wire [31:0] _zz_316_;
  wire [0:0] _zz_317_;
  wire [0:0] _zz_318_;
  wire  _zz_319_;
  wire [0:0] _zz_320_;
  wire [1:0] _zz_321_;
  wire [31:0] _zz_322_;
  wire  _zz_323_;
  wire  _zz_324_;
  wire [31:0] _zz_325_;
  wire [31:0] _zz_326_;
  wire [31:0] _zz_327_;
  wire [31:0] _zz_328_;
  wire [31:0] _zz_329_;
  wire [31:0] _zz_330_;
  wire [31:0] _zz_331_;
  wire [0:0] _zz_332_;
  wire [1:0] _zz_333_;
  wire [1:0] _zz_334_;
  wire [1:0] _zz_335_;
  wire  _zz_336_;
  wire  _zz_337_;
  wire [31:0] _zz_338_;
  wire [31:0] _zz_339_;
  wire [31:0] _zz_340_;
  wire [31:0] _zz_341_;
  wire [31:0] _zz_342_;
  wire [31:0] _zz_343_;
  wire [31:0] _zz_344_;
  wire [31:0] _zz_345_;
  wire [31:0] _zz_346_;
  wire [31:0] _zz_347_;
  wire [31:0] _zz_348_;
  wire  _zz_349_;
  wire [31:0] _zz_350_;
  wire [31:0] _zz_351_;
  wire [31:0] _zz_352_;
  wire  _zz_353_;
  wire [0:0] _zz_354_;
  wire [12:0] _zz_355_;
  wire [31:0] _zz_356_;
  wire [31:0] _zz_357_;
  wire [31:0] _zz_358_;
  wire  _zz_359_;
  wire [0:0] _zz_360_;
  wire [6:0] _zz_361_;
  wire [31:0] _zz_362_;
  wire [31:0] _zz_363_;
  wire [31:0] _zz_364_;
  wire  _zz_365_;
  wire [0:0] _zz_366_;
  wire [0:0] _zz_367_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_1_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_2_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_3_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_4_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_5_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_6_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_7_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_8_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_9_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_10_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_11_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_12_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_13_;
  wire  decode_MEMORY_ENABLE;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_14_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_15_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_16_;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  decode_DO_EBREAK;
  wire  decode_CSR_READ_OPCODE;
  wire  decode_CSR_WRITE_OPCODE;
  wire [31:0] memory_MEMORY_READ_DATA;
  wire  decode_SRC2_FORCE_ZERO;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_17_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_18_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_19_;
  wire  decode_MEMORY_STORE;
  wire [31:0] memory_INSTRUCTION;
  wire  decode_IS_CSR;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  writeBack_REGFILE_WRITE_VALID;
  wire  memory_REGFILE_WRITE_VALID;
  wire  execute_REGFILE_WRITE_VALID;
  wire [31:0] memory_PC;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_20_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_21_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_22_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_23_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_24_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_25_;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  _zz_26_;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_27_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_28_;
  wire  _zz_29_;
  wire  _zz_30_;
  wire `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_31_;
  wire [31:0] execute_BRANCH_CALC;
  wire  execute_BRANCH_DO;
  wire [31:0] _zz_32_;
  wire [31:0] execute_PC;
  wire [31:0] execute_RS1;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_33_;
  wire  _zz_34_;
  reg [31:0] _zz_35_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_36_;
  wire  _zz_37_;
  wire [31:0] _zz_38_;
  wire [31:0] _zz_39_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_40_;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_41_;
  wire [31:0] _zz_42_;
  wire  execute_IS_RVC;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_43_;
  wire [31:0] _zz_44_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire  _zz_45_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_46_;
  wire [31:0] _zz_47_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_48_;
  reg  _zz_49_;
  wire [31:0] _zz_50_;
  wire [31:0] _zz_51_;
  reg  decode_REGFILE_WRITE_VALID;
  wire  decode_LEGAL_INSTRUCTION;
  wire  decode_INSTRUCTION_READY;
  wire  _zz_52_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_53_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_54_;
  wire  _zz_55_;
  wire  _zz_56_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_57_;
  wire  _zz_58_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_59_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_60_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_61_;
  wire  _zz_62_;
  wire  _zz_63_;
  wire  _zz_64_;
  wire  _zz_65_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_66_;
  wire  _zz_67_;
  wire  writeBack_MEMORY_STORE;
  reg [31:0] _zz_68_;
  wire  writeBack_MEMORY_ENABLE;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_MEMORY_READ_DATA;
  wire  memory_ALIGNEMENT_FAULT;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire  memory_MEMORY_STORE;
  wire  memory_MEMORY_ENABLE;
  wire [31:0] _zz_69_;
  wire [31:0] execute_SRC_ADD;
  wire [1:0] _zz_70_;
  wire [31:0] execute_RS2;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_MEMORY_STORE;
  wire  execute_MEMORY_ENABLE;
  wire  execute_ALIGNEMENT_FAULT;
  wire  _zz_71_;
  reg [31:0] _zz_72_;
  wire [31:0] _zz_73_;
  wire  _zz_74_;
  wire [31:0] _zz_75_;
  wire [31:0] _zz_76_;
  wire  decode_IS_RVC;
  wire [31:0] writeBack_PC /* verilator public */ ;
  wire [31:0] writeBack_INSTRUCTION /* verilator public */ ;
  wire [31:0] decode_PC /* verilator public */ ;
  reg [31:0] decode_INSTRUCTION /* verilator public */ ;
  reg  decode_arbitration_haltItself /* verilator public */ ;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  reg  decode_arbitration_flushAll /* verilator public */ ;
  reg  decode_arbitration_isValid /* verilator public */ ;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  reg  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushAll;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  reg  memory_arbitration_flushAll;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isMoving;
  wire  memory_arbitration_isFiring;
  wire  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  wire  writeBack_arbitration_flushAll;
  reg  writeBack_arbitration_isValid /* verilator public */ ;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring /* verilator public */ ;
  reg  IBusSimplePlugin_fetcherHalt;
  reg  IBusSimplePlugin_fetcherflushIt;
  reg  IBusSimplePlugin_incomingInstruction;
  wire  IBusSimplePlugin_pcValids_0;
  wire  IBusSimplePlugin_pcValids_1;
  wire  IBusSimplePlugin_pcValids_2;
  wire  IBusSimplePlugin_pcValids_3;
  wire  iBus_cmd_valid;
  wire  iBus_cmd_ready;
  wire [31:0] iBus_cmd_payload_pc;
  wire  iBus_rsp_valid;
  wire  iBus_rsp_payload_error;
  wire [31:0] iBus_rsp_payload_inst;
  reg  DBusSimplePlugin_memoryExceptionPort_valid;
  reg [3:0] DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire [31:0] DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire  decodeExceptionPort_valid;
  wire [3:0] decodeExceptionPort_payload_code;
  wire [31:0] decodeExceptionPort_payload_badAddr;
  wire  BranchPlugin_jumpInterface_valid;
  wire [31:0] BranchPlugin_jumpInterface_payload;
  reg  CsrPlugin_jumpInterface_valid;
  reg [31:0] CsrPlugin_jumpInterface_payload;
  wire  CsrPlugin_exceptionPendings_0;
  wire  CsrPlugin_exceptionPendings_1;
  wire  CsrPlugin_exceptionPendings_2;
  wire  CsrPlugin_exceptionPendings_3;
  wire  externalInterrupt;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  CsrPlugin_forceMachineWire;
  reg  CsrPlugin_selfException_valid;
  reg [3:0] CsrPlugin_selfException_payload_code;
  wire [31:0] CsrPlugin_selfException_payload_badAddr;
  reg  CsrPlugin_allowInterrupts;
  reg  CsrPlugin_allowException;
  reg  IBusSimplePlugin_injectionPort_valid;
  reg  IBusSimplePlugin_injectionPort_ready;
  wire [31:0] IBusSimplePlugin_injectionPort_payload;
  wire  IBusSimplePlugin_jump_pcLoad_valid;
  wire [31:0] IBusSimplePlugin_jump_pcLoad_payload;
  wire [1:0] _zz_77_;
  wire  IBusSimplePlugin_fetchPc_preOutput_valid;
  wire  IBusSimplePlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_preOutput_payload;
  wire  _zz_78_;
  wire  IBusSimplePlugin_fetchPc_output_valid;
  wire  IBusSimplePlugin_fetchPc_output_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_output_payload;
  reg [31:0] IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusSimplePlugin_fetchPc_inc;
  reg  IBusSimplePlugin_fetchPc_propagatePc;
  reg [31:0] IBusSimplePlugin_fetchPc_pc;
  reg  IBusSimplePlugin_fetchPc_samplePcNext;
  reg  _zz_79_;
  reg [31:0] IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire [31:0] IBusSimplePlugin_decodePc_pcPlus;
  reg  IBusSimplePlugin_decodePc_injectedDecode;
  wire  IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg  IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire  IBusSimplePlugin_iBusRsp_stages_0_inputSample;
  wire  IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire  IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire  IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire  IBusSimplePlugin_iBusRsp_stages_1_inputSample;
  wire  _zz_80_;
  wire  _zz_81_;
  wire  _zz_82_;
  wire  _zz_83_;
  reg  _zz_84_;
  reg  IBusSimplePlugin_iBusRsp_readyForError;
  wire  IBusSimplePlugin_iBusRsp_output_valid;
  wire  IBusSimplePlugin_iBusRsp_output_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire  IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire  IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire  IBusSimplePlugin_decompressor_decodeInput_valid;
  wire  IBusSimplePlugin_decompressor_decodeInput_ready;
  wire [31:0] IBusSimplePlugin_decompressor_decodeInput_payload_pc;
  wire  IBusSimplePlugin_decompressor_decodeInput_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_decompressor_decodeInput_payload_rsp_inst;
  wire  IBusSimplePlugin_decompressor_decodeInput_payload_isRvc;
  reg  IBusSimplePlugin_decompressor_bufferValid;
  reg [15:0] IBusSimplePlugin_decompressor_bufferData;
  wire [31:0] IBusSimplePlugin_decompressor_rawInDecode;
  wire  IBusSimplePlugin_decompressor_isRvc;
  wire [15:0] _zz_85_;
  reg [31:0] IBusSimplePlugin_decompressor_decompressed;
  wire [4:0] _zz_86_;
  wire [4:0] _zz_87_;
  wire [11:0] _zz_88_;
  wire  _zz_89_;
  reg [11:0] _zz_90_;
  wire  _zz_91_;
  reg [9:0] _zz_92_;
  wire [20:0] _zz_93_;
  wire  _zz_94_;
  reg [14:0] _zz_95_;
  wire  _zz_96_;
  reg [2:0] _zz_97_;
  wire  _zz_98_;
  reg [9:0] _zz_99_;
  wire [20:0] _zz_100_;
  wire  _zz_101_;
  reg [4:0] _zz_102_;
  wire [12:0] _zz_103_;
  wire [4:0] _zz_104_;
  wire [4:0] _zz_105_;
  wire [4:0] _zz_106_;
  wire  _zz_107_;
  reg [2:0] _zz_108_;
  reg [2:0] _zz_109_;
  wire  _zz_110_;
  reg [6:0] _zz_111_;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg  IBusSimplePlugin_injector_decodeRemoved;
  wire  IBusSimplePlugin_cmd_valid;
  wire  IBusSimplePlugin_cmd_ready;
  wire [31:0] IBusSimplePlugin_cmd_payload_pc;
  reg [0:0] IBusSimplePlugin_pendingCmd;
  wire [0:0] IBusSimplePlugin_pendingCmdNext;
  reg [0:0] IBusSimplePlugin_rspJoin_discardCounter;
  reg  IBusSimplePlugin_rspJoin_rspBufferOutput_valid;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_ready;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  wire  iBus_rsp_takeWhen_valid;
  wire  iBus_rsp_takeWhen_payload_error;
  wire [31:0] iBus_rsp_takeWhen_payload_inst;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_rspStream_ready;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_inst;
  reg  IBusSimplePlugin_rspJoin_rspBuffer_validReg;
  wire [31:0] IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg  IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire  IBusSimplePlugin_rspJoin_join_valid;
  wire  IBusSimplePlugin_rspJoin_join_ready;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_pc;
  wire  IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire  IBusSimplePlugin_rspJoin_exceptionDetected;
  wire  IBusSimplePlugin_rspJoin_redoRequired;
  wire  _zz_112_;
  wire  dBus_cmd_valid;
  wire  dBus_cmd_ready;
  wire  dBus_cmd_payload_wr;
  wire [31:0] dBus_cmd_payload_address;
  wire [31:0] dBus_cmd_payload_data;
  wire [1:0] dBus_cmd_payload_size;
  wire  dBus_rsp_ready;
  wire  dBus_rsp_error;
  wire [31:0] dBus_rsp_data;
  wire  execute_DBusSimplePlugin_cmdSent;
  reg  execute_DBusSimplePlugin_skipCmd;
  reg [31:0] _zz_113_;
  reg [3:0] _zz_114_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  wire  _zz_115_;
  reg [31:0] _zz_116_;
  wire  _zz_117_;
  reg [31:0] _zz_118_;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  wire [26:0] _zz_119_;
  wire  _zz_120_;
  wire  _zz_121_;
  wire  _zz_122_;
  wire  _zz_123_;
  wire  _zz_124_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_125_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_126_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_127_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_128_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_129_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_130_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_131_;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire  _zz_132_;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_133_;
  reg [31:0] _zz_134_;
  wire  _zz_135_;
  reg [19:0] _zz_136_;
  wire  _zz_137_;
  reg [19:0] _zz_138_;
  reg [31:0] _zz_139_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_140_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_141_;
  reg  _zz_142_;
  reg  _zz_143_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_144_;
  reg [10:0] _zz_145_;
  wire  _zz_146_;
  reg [19:0] _zz_147_;
  wire  _zz_148_;
  reg [18:0] _zz_149_;
  reg [31:0] _zz_150_;
  wire [31:0] execute_BranchPlugin_branch_src2;
  wire [31:0] execute_BranchPlugin_branchAdder;
  wire [1:0] CsrPlugin_misa_base;
  wire [25:0] CsrPlugin_misa_extensions;
  reg [1:0] CsrPlugin_mtvec_mode;
  reg [29:0] CsrPlugin_mtvec_base;
  reg [31:0] CsrPlugin_mepc;
  reg  CsrPlugin_mstatus_MIE;
  reg  CsrPlugin_mstatus_MPIE;
  reg [1:0] CsrPlugin_mstatus_MPP;
  reg  CsrPlugin_mip_MEIP;
  reg  CsrPlugin_mip_MTIP;
  reg  CsrPlugin_mip_MSIP;
  reg  CsrPlugin_mie_MEIE;
  reg  CsrPlugin_mie_MTIE;
  reg  CsrPlugin_mie_MSIE;
  reg [31:0] CsrPlugin_mscratch;
  reg  CsrPlugin_mcause_interrupt;
  reg [3:0] CsrPlugin_mcause_exceptionCode;
  reg [31:0] CsrPlugin_mtval;
  reg [63:0] CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg [63:0] CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  reg  CsrPlugin_interrupt;
  reg [3:0] CsrPlugin_interruptCode /* verilator public */ ;
  reg [1:0] CsrPlugin_interruptTargetPrivilege;
  wire  CsrPlugin_exception;
  wire  CsrPlugin_lastStageWasWfi;
  reg  CsrPlugin_pipelineLiberator_done;
  wire  CsrPlugin_interruptJump /* verilator public */ ;
  reg  CsrPlugin_hadException;
  reg [1:0] CsrPlugin_targetPrivilege;
  reg [3:0] CsrPlugin_trapCause;
  reg [1:0] CsrPlugin_xtvec_mode;
  reg [29:0] CsrPlugin_xtvec_base;
  wire  execute_CsrPlugin_inWfi /* verilator public */ ;
  wire  execute_CsrPlugin_blockedBySideEffects;
  reg  execute_CsrPlugin_illegalAccess;
  reg  execute_CsrPlugin_illegalInstruction;
  reg [31:0] execute_CsrPlugin_readData;
  wire  execute_CsrPlugin_writeInstruction;
  wire  execute_CsrPlugin_readInstruction;
  wire  execute_CsrPlugin_writeEnable;
  wire  execute_CsrPlugin_readEnable;
  wire [31:0] execute_CsrPlugin_readToWriteData;
  reg [31:0] execute_CsrPlugin_writeData;
  wire [11:0] execute_CsrPlugin_csrAddress;
  reg [31:0] _zz_151_;
  reg [31:0] externalInterruptArray_regNext;
  wire [31:0] _zz_152_;
  reg  DebugPlugin_firstCycle;
  reg  DebugPlugin_secondCycle;
  reg  DebugPlugin_resetIt;
  reg  DebugPlugin_haltIt;
  reg  DebugPlugin_stepIt;
  reg  DebugPlugin_isPipBusy;
  reg  DebugPlugin_godmode;
  reg  DebugPlugin_haltedByBreak;
  reg  DebugPlugin_hardwareBreakpoints_0_valid;
  reg [30:0] DebugPlugin_hardwareBreakpoints_0_pc;
  reg  DebugPlugin_hardwareBreakpoints_1_valid;
  reg [30:0] DebugPlugin_hardwareBreakpoints_1_pc;
  reg  DebugPlugin_hardwareBreakpoints_2_valid;
  reg [30:0] DebugPlugin_hardwareBreakpoints_2_pc;
  reg  DebugPlugin_hardwareBreakpoints_3_valid;
  reg [30:0] DebugPlugin_hardwareBreakpoints_3_pc;
  reg [31:0] DebugPlugin_busReadDataReg;
  reg  _zz_153_;
  reg  _zz_154_;
  reg  DebugPlugin_resetIt_regNext;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_IS_CSR;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg  decode_to_execute_MEMORY_STORE;
  reg  execute_to_memory_MEMORY_STORE;
  reg  memory_to_writeBack_MEMORY_STORE;
  reg  decode_to_execute_IS_RVC;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg [31:0] memory_to_writeBack_MEMORY_READ_DATA;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg  decode_to_execute_DO_EBREAK;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg  execute_to_memory_ALIGNEMENT_FAULT;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg [2:0] _zz_155_;
  reg [31:0] IBusSimplePlugin_injectionPort_payload_regNext;
  wire  iBus_cmd_m2sPipe_valid;
  wire  iBus_cmd_m2sPipe_ready;
  wire [31:0] iBus_cmd_m2sPipe_payload_pc;
  reg  _zz_156_;
  reg [31:0] _zz_157_;
  wire  dBus_cmd_halfPipe_valid;
  wire  dBus_cmd_halfPipe_ready;
  wire  dBus_cmd_halfPipe_payload_wr;
  wire [31:0] dBus_cmd_halfPipe_payload_address;
  wire [31:0] dBus_cmd_halfPipe_payload_data;
  wire [1:0] dBus_cmd_halfPipe_payload_size;
  reg  dBus_cmd_halfPipe_regs_valid;
  reg  dBus_cmd_halfPipe_regs_ready;
  reg  dBus_cmd_halfPipe_regs_payload_wr;
  reg [31:0] dBus_cmd_halfPipe_regs_payload_address;
  reg [31:0] dBus_cmd_halfPipe_regs_payload_data;
  reg [1:0] dBus_cmd_halfPipe_regs_payload_size;
  reg [3:0] _zz_158_;
  `ifndef SYNTHESIS
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_1__string;
  reg [71:0] _zz_2__string;
  reg [71:0] _zz_3__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_4__string;
  reg [23:0] _zz_5__string;
  reg [23:0] _zz_6__string;
  reg [47:0] _zz_7__string;
  reg [47:0] _zz_8__string;
  reg [47:0] _zz_9__string;
  reg [47:0] _zz_10__string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_11__string;
  reg [47:0] _zz_12__string;
  reg [47:0] _zz_13__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_14__string;
  reg [31:0] _zz_15__string;
  reg [31:0] _zz_16__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_17__string;
  reg [63:0] _zz_18__string;
  reg [63:0] _zz_19__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_20__string;
  reg [39:0] _zz_21__string;
  reg [39:0] _zz_22__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_23__string;
  reg [95:0] _zz_24__string;
  reg [95:0] _zz_25__string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_27__string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_28__string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_31__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_33__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_36__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_41__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_43__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_46__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_48__string;
  reg [63:0] _zz_53__string;
  reg [23:0] _zz_54__string;
  reg [39:0] _zz_57__string;
  reg [71:0] _zz_59__string;
  reg [95:0] _zz_60__string;
  reg [31:0] _zz_61__string;
  reg [47:0] _zz_66__string;
  reg [47:0] _zz_125__string;
  reg [31:0] _zz_126__string;
  reg [95:0] _zz_127__string;
  reg [71:0] _zz_128__string;
  reg [39:0] _zz_129__string;
  reg [23:0] _zz_130__string;
  reg [63:0] _zz_131__string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_161_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_162_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_163_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_164_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_165_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_166_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_167_ = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign _zz_168_ = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign _zz_169_ = (IBusSimplePlugin_fetchPc_preOutput_valid && IBusSimplePlugin_fetchPc_preOutput_ready);
  assign _zz_170_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_171_ = (IBusSimplePlugin_iBusRsp_output_valid && IBusSimplePlugin_iBusRsp_output_ready);
  assign _zz_172_ = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_173_ = {_zz_85_[1 : 0],_zz_85_[15 : 13]};
  assign _zz_174_ = _zz_85_[6 : 5];
  assign _zz_175_ = _zz_85_[11 : 10];
  assign _zz_176_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_177_ = execute_INSTRUCTION[13];
  assign _zz_178_ = (_zz_77_ & (~ _zz_179_));
  assign _zz_179_ = (_zz_77_ - (2'b01));
  assign _zz_180_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_181_ = {29'd0, _zz_180_};
  assign _zz_182_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_183_ = {29'd0, _zz_182_};
  assign _zz_184_ = {{_zz_95_,_zz_85_[6 : 2]},(12'b000000000000)};
  assign _zz_185_ = {{{(4'b0000),_zz_85_[8 : 7]},_zz_85_[12 : 9]},(2'b00)};
  assign _zz_186_ = {{{(4'b0000),_zz_85_[8 : 7]},_zz_85_[12 : 9]},(2'b00)};
  assign _zz_187_ = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_188_ = {29'd0, _zz_187_};
  assign _zz_189_ = (IBusSimplePlugin_pendingCmd + (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready));
  assign _zz_190_ = (memory_MEMORY_STORE ? (3'b110) : (3'b100));
  assign _zz_191_ = _zz_119_[2 : 2];
  assign _zz_192_ = _zz_119_[3 : 3];
  assign _zz_193_ = _zz_119_[4 : 4];
  assign _zz_194_ = _zz_119_[8 : 8];
  assign _zz_195_ = _zz_119_[16 : 16];
  assign _zz_196_ = _zz_119_[20 : 20];
  assign _zz_197_ = _zz_119_[21 : 21];
  assign _zz_198_ = _zz_119_[26 : 26];
  assign _zz_199_ = execute_SRC_LESS;
  assign _zz_200_ = (execute_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_201_ = execute_INSTRUCTION[19 : 15];
  assign _zz_202_ = execute_INSTRUCTION[31 : 20];
  assign _zz_203_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_204_ = ($signed(_zz_205_) + $signed(_zz_208_));
  assign _zz_205_ = ($signed(_zz_206_) + $signed(_zz_207_));
  assign _zz_206_ = execute_SRC1;
  assign _zz_207_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_208_ = (execute_SRC_USE_SUB_LESS ? _zz_209_ : _zz_210_);
  assign _zz_209_ = (32'b00000000000000000000000000000001);
  assign _zz_210_ = (32'b00000000000000000000000000000000);
  assign _zz_211_ = (_zz_212_ >>> 1);
  assign _zz_212_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_213_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_214_ = execute_INSTRUCTION[31 : 20];
  assign _zz_215_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_216_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_217_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_218_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_219_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_220_ = (decode_PC >>> 1);
  assign _zz_221_ = (decode_PC >>> 1);
  assign _zz_222_ = (decode_PC >>> 1);
  assign _zz_223_ = (decode_PC >>> 1);
  assign _zz_224_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_225_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_226_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_227_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_228_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_229_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_230_ = ({3'd0,_zz_158_} <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign _zz_231_ = (_zz_85_[11 : 10] == (2'b01));
  assign _zz_232_ = ((_zz_85_[11 : 10] == (2'b11)) && (_zz_85_[6 : 5] == (2'b00)));
  assign _zz_233_ = (7'b0000000);
  assign _zz_234_ = _zz_85_[6 : 2];
  assign _zz_235_ = _zz_85_[12];
  assign _zz_236_ = _zz_85_[11 : 7];
  assign _zz_237_ = (decode_INSTRUCTION & (32'b00000000000000000000000001100100));
  assign _zz_238_ = (32'b00000000000000000000000000100100);
  assign _zz_239_ = (decode_INSTRUCTION & (32'b00000000000000000011000001010100));
  assign _zz_240_ = (32'b00000000000000000001000000010000);
  assign _zz_241_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000010100)) == (32'b00000000000000000110000000010000));
  assign _zz_242_ = ((decode_INSTRUCTION & (32'b00000000000000000101000000010100)) == (32'b00000000000000000100000000010000));
  assign _zz_243_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_244_ = {_zz_124_,(_zz_249_ == _zz_250_)};
  assign _zz_245_ = (2'b00);
  assign _zz_246_ = ({_zz_124_,_zz_251_} != (2'b00));
  assign _zz_247_ = (_zz_252_ != (1'b0));
  assign _zz_248_ = {(_zz_253_ != _zz_254_),{_zz_255_,{_zz_256_,_zz_257_}}};
  assign _zz_249_ = (decode_INSTRUCTION & (32'b00000000000000000000000001110000));
  assign _zz_250_ = (32'b00000000000000000000000000100000);
  assign _zz_251_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_252_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000000000000));
  assign _zz_253_ = _zz_120_;
  assign _zz_254_ = (1'b0);
  assign _zz_255_ = (((decode_INSTRUCTION & _zz_258_) == (32'b00000000000000000001000000000000)) != (1'b0));
  assign _zz_256_ = ((_zz_259_ == _zz_260_) != (1'b0));
  assign _zz_257_ = {({_zz_261_,_zz_262_} != (2'b00)),{(_zz_263_ != _zz_264_),{_zz_265_,{_zz_266_,_zz_267_}}}};
  assign _zz_258_ = (32'b00000000000000000001000000000000);
  assign _zz_259_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign _zz_260_ = (32'b00000000000000000010000000000000);
  assign _zz_261_ = ((decode_INSTRUCTION & _zz_268_) == (32'b00000000000000000000000000100000));
  assign _zz_262_ = ((decode_INSTRUCTION & _zz_269_) == (32'b00000000000000000000000000100000));
  assign _zz_263_ = {(_zz_270_ == _zz_271_),(_zz_272_ == _zz_273_)};
  assign _zz_264_ = (2'b00);
  assign _zz_265_ = ((_zz_274_ == _zz_275_) != (1'b0));
  assign _zz_266_ = ({_zz_276_,_zz_277_} != (2'b00));
  assign _zz_267_ = {(_zz_278_ != _zz_279_),{_zz_280_,{_zz_281_,_zz_282_}}};
  assign _zz_268_ = (32'b00000000000000000000000000110100);
  assign _zz_269_ = (32'b00000000000000000000000001100100);
  assign _zz_270_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_271_ = (32'b00000000000000000001000001010000);
  assign _zz_272_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_273_ = (32'b00000000000000000010000001010000);
  assign _zz_274_ = (decode_INSTRUCTION & (32'b00000000000000000111000001010100));
  assign _zz_275_ = (32'b00000000000000000101000000010000);
  assign _zz_276_ = ((decode_INSTRUCTION & _zz_283_) == (32'b01000000000000000001000000010000));
  assign _zz_277_ = ((decode_INSTRUCTION & _zz_284_) == (32'b00000000000000000001000000010000));
  assign _zz_278_ = {(_zz_285_ == _zz_286_),_zz_123_};
  assign _zz_279_ = (2'b00);
  assign _zz_280_ = ({_zz_287_,_zz_123_} != (2'b00));
  assign _zz_281_ = (_zz_288_ != (1'b0));
  assign _zz_282_ = {(_zz_289_ != _zz_290_),{_zz_291_,{_zz_292_,_zz_293_}}};
  assign _zz_283_ = (32'b01000000000000000011000001010100);
  assign _zz_284_ = (32'b00000000000000000111000001010100);
  assign _zz_285_ = (decode_INSTRUCTION & (32'b00000000000000000000000000010100));
  assign _zz_286_ = (32'b00000000000000000000000000000100);
  assign _zz_287_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000000000100));
  assign _zz_288_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000010000)) == (32'b00000000000000000000000000010000));
  assign _zz_289_ = {_zz_122_,(_zz_294_ == _zz_295_)};
  assign _zz_290_ = (2'b00);
  assign _zz_291_ = ((_zz_296_ == _zz_297_) != (1'b0));
  assign _zz_292_ = ({_zz_298_,_zz_299_} != (6'b000000));
  assign _zz_293_ = {(_zz_300_ != _zz_301_),{_zz_302_,{_zz_303_,_zz_304_}}};
  assign _zz_294_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011100));
  assign _zz_295_ = (32'b00000000000000000000000000000100);
  assign _zz_296_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_297_ = (32'b00000000000000000000000001000000);
  assign _zz_298_ = _zz_122_;
  assign _zz_299_ = {(_zz_305_ == _zz_306_),{_zz_307_,{_zz_308_,_zz_309_}}};
  assign _zz_300_ = {(_zz_310_ == _zz_311_),{_zz_312_,{_zz_313_,_zz_314_}}};
  assign _zz_301_ = (4'b0000);
  assign _zz_302_ = ((_zz_315_ == _zz_316_) != (1'b0));
  assign _zz_303_ = (_zz_121_ != (1'b0));
  assign _zz_304_ = {(_zz_317_ != _zz_318_),{_zz_319_,{_zz_320_,_zz_321_}}};
  assign _zz_305_ = (decode_INSTRUCTION & (32'b00000000000000000001000000010000));
  assign _zz_306_ = (32'b00000000000000000001000000010000);
  assign _zz_307_ = ((decode_INSTRUCTION & _zz_322_) == (32'b00000000000000000010000000010000));
  assign _zz_308_ = _zz_121_;
  assign _zz_309_ = {_zz_323_,_zz_324_};
  assign _zz_310_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_311_ = (32'b00000000000000000000000000000000);
  assign _zz_312_ = ((decode_INSTRUCTION & _zz_325_) == (32'b00000000000000000000000000000000));
  assign _zz_313_ = (_zz_326_ == _zz_327_);
  assign _zz_314_ = (_zz_328_ == _zz_329_);
  assign _zz_315_ = (decode_INSTRUCTION & (32'b00000000000000000000000000000000));
  assign _zz_316_ = (32'b00000000000000000000000000000000);
  assign _zz_317_ = (_zz_330_ == _zz_331_);
  assign _zz_318_ = (1'b0);
  assign _zz_319_ = ({_zz_332_,_zz_333_} != (3'b000));
  assign _zz_320_ = (_zz_334_ != _zz_335_);
  assign _zz_321_ = {_zz_336_,_zz_337_};
  assign _zz_322_ = (32'b00000000000000000010000000010000);
  assign _zz_323_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000001100)) == (32'b00000000000000000000000000000100));
  assign _zz_324_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000101000)) == (32'b00000000000000000000000000000000));
  assign _zz_325_ = (32'b00000000000000000000000000011000);
  assign _zz_326_ = (decode_INSTRUCTION & (32'b00000000000000000110000000000100));
  assign _zz_327_ = (32'b00000000000000000010000000000000);
  assign _zz_328_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000100));
  assign _zz_329_ = (32'b00000000000000000001000000000000);
  assign _zz_330_ = (decode_INSTRUCTION & (32'b00000000000000000000000000100000));
  assign _zz_331_ = (32'b00000000000000000000000000100000);
  assign _zz_332_ = ((decode_INSTRUCTION & _zz_338_) == (32'b00000000000000000000000001000000));
  assign _zz_333_ = {(_zz_339_ == _zz_340_),(_zz_341_ == _zz_342_)};
  assign _zz_334_ = {(_zz_343_ == _zz_344_),(_zz_345_ == _zz_346_)};
  assign _zz_335_ = (2'b00);
  assign _zz_336_ = ((_zz_347_ == _zz_348_) != (1'b0));
  assign _zz_337_ = ({_zz_120_,_zz_349_} != (2'b00));
  assign _zz_338_ = (32'b00000000000000000000000001000100);
  assign _zz_339_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_340_ = (32'b00000000000000000010000000010000);
  assign _zz_341_ = (decode_INSTRUCTION & (32'b01000000000000000100000000110100));
  assign _zz_342_ = (32'b01000000000000000000000000110000);
  assign _zz_343_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_344_ = (32'b00000000000000000010000000000000);
  assign _zz_345_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_346_ = (32'b00000000000000000001000000000000);
  assign _zz_347_ = (decode_INSTRUCTION & (32'b00010000000000000011000001010000));
  assign _zz_348_ = (32'b00000000000000000000000001010000);
  assign _zz_349_ = ((decode_INSTRUCTION & (32'b00010000010000000011000001010000)) == (32'b00010000000000000000000001010000));
  assign _zz_350_ = (32'b00000000000000000001000001111111);
  assign _zz_351_ = (decode_INSTRUCTION & (32'b00000000000000000010000001111111));
  assign _zz_352_ = (32'b00000000000000000010000001110011);
  assign _zz_353_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001111111)) == (32'b00000000000000000100000001100011));
  assign _zz_354_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000010000000010011));
  assign _zz_355_ = {((decode_INSTRUCTION & (32'b00000000000000000110000000111111)) == (32'b00000000000000000000000000100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_356_) == (32'b00000000000000000000000000000011)),{(_zz_357_ == _zz_358_),{_zz_359_,{_zz_360_,_zz_361_}}}}}};
  assign _zz_356_ = (32'b00000000000000000101000001011111);
  assign _zz_357_ = (decode_INSTRUCTION & (32'b00000000000000000111000001111011));
  assign _zz_358_ = (32'b00000000000000000000000001100011);
  assign _zz_359_ = ((decode_INSTRUCTION & (32'b00000000000000000110000001111111)) == (32'b00000000000000000000000000001111));
  assign _zz_360_ = ((decode_INSTRUCTION & (32'b11111110000000000000000001111111)) == (32'b00000000000000000000000000110011));
  assign _zz_361_ = {((decode_INSTRUCTION & (32'b10111100000000000111000001111111)) == (32'b00000000000000000101000000010011)),{((decode_INSTRUCTION & (32'b11111100000000000011000001111111)) == (32'b00000000000000000001000000010011)),{((decode_INSTRUCTION & _zz_362_) == (32'b00000000000000000101000000110011)),{(_zz_363_ == _zz_364_),{_zz_365_,{_zz_366_,_zz_367_}}}}}};
  assign _zz_362_ = (32'b10111110000000000111000001111111);
  assign _zz_363_ = (decode_INSTRUCTION & (32'b10111110000000000111000001111111));
  assign _zz_364_ = (32'b00000000000000000000000000110011);
  assign _zz_365_ = ((decode_INSTRUCTION & (32'b11011111111111111111111111111111)) == (32'b00010000001000000000000001110011));
  assign _zz_366_ = ((decode_INSTRUCTION & (32'b11111111111011111111111111111111)) == (32'b00000000000000000000000001110011));
  assign _zz_367_ = ((decode_INSTRUCTION & (32'b11111111111111111111111111111111)) == (32'b00010000010100000000000001110011));
  initial begin
    $readmemb("4-stage-no-cache-debug.v_toplevel_RegFilePlugin_regFile.bin",RegFilePlugin_regFile);
  end
  always @ (posedge clk) begin
    if(_zz_49_) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_132_) begin
      _zz_159_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_132_) begin
      _zz_160_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_1_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_1__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_1__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_1__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_1__string = "SRA_1    ";
      default : _zz_1__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_2__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_2__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_2__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_2__string = "SRA_1    ";
      default : _zz_2__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_3__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_3__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_3__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_3__string = "SRA_1    ";
      default : _zz_3__string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_4_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_4__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_4__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_4__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_4__string = "PC ";
      default : _zz_4__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_5__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_5__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_5__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_5__string = "PC ";
      default : _zz_5__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_6__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_6__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_6__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_6__string = "PC ";
      default : _zz_6__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_7_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_7__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_7__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_7__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_7__string = "EBREAK";
      default : _zz_7__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_8__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_8__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_8__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_8__string = "EBREAK";
      default : _zz_8__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_9__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_9__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_9__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_9__string = "EBREAK";
      default : _zz_9__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_10__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_10__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_10__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_10__string = "EBREAK";
      default : _zz_10__string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : decode_ENV_CTRL_string = "EBREAK";
      default : decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_11__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_11__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_11__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_11__string = "EBREAK";
      default : _zz_11__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_12__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_12__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_12__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_12__string = "EBREAK";
      default : _zz_12__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_13__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_13__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_13__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_13__string = "EBREAK";
      default : _zz_13__string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_14__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_14__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_14__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_14__string = "JALR";
      default : _zz_14__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_15__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_15__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_15__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_15__string = "JALR";
      default : _zz_15__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_16__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_16__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_16__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_16__string = "JALR";
      default : _zz_16__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_17__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_17__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_17__string = "BITWISE ";
      default : _zz_17__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_18__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_18__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_18__string = "BITWISE ";
      default : _zz_18__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_19__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_19__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_19__string = "BITWISE ";
      default : _zz_19__string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_20_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_20__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_20__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_20__string = "AND_1";
      default : _zz_20__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_21__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_21__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_21__string = "AND_1";
      default : _zz_21__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_22_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_22__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_22__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_22__string = "AND_1";
      default : _zz_22__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_23_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_23__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_23__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_23__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_23__string = "URS1        ";
      default : _zz_23__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_24_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_24__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_24__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_24__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_24__string = "URS1        ";
      default : _zz_24__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_25_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_25__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_25__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_25__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_25__string = "URS1        ";
      default : _zz_25__string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : memory_ENV_CTRL_string = "EBREAK";
      default : memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_27_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_27__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_27__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_27__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_27__string = "EBREAK";
      default : _zz_27__string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : execute_ENV_CTRL_string = "EBREAK";
      default : execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_28_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_28__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_28__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_28__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_28__string = "EBREAK";
      default : _zz_28__string = "??????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : writeBack_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : writeBack_ENV_CTRL_string = "EBREAK";
      default : writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_31_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_31__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_31__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_31__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_31__string = "EBREAK";
      default : _zz_31__string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_33_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_33__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_33__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_33__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_33__string = "JALR";
      default : _zz_33__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_36_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_36__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_36__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_36__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_36__string = "SRA_1    ";
      default : _zz_36__string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : execute_SRC2_CTRL_string = "PC ";
      default : execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_41_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_41__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_41__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_41__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_41__string = "PC ";
      default : _zz_41__string = "???";
    endcase
  end
  always @(*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : execute_SRC1_CTRL_string = "URS1        ";
      default : execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_43_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_43__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_43__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_43__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_43__string = "URS1        ";
      default : _zz_43__string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_46_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_46__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_46__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_46__string = "BITWISE ";
      default : _zz_46__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_48_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_48__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_48__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_48__string = "AND_1";
      default : _zz_48__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_53_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_53__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_53__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_53__string = "BITWISE ";
      default : _zz_53__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_54_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_54__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_54__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_54__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_54__string = "PC ";
      default : _zz_54__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_57_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_57__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_57__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_57__string = "AND_1";
      default : _zz_57__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_59_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_59__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_59__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_59__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_59__string = "SRA_1    ";
      default : _zz_59__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_60_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_60__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_60__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_60__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_60__string = "URS1        ";
      default : _zz_60__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_61_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_61__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_61__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_61__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_61__string = "JALR";
      default : _zz_61__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_66_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_66__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_66__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_66__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_66__string = "EBREAK";
      default : _zz_66__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_125_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_125__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_125__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_125__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_125__string = "EBREAK";
      default : _zz_125__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_126_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_126__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_126__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_126__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_126__string = "JALR";
      default : _zz_126__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_127_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_127__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_127__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_127__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_127__string = "URS1        ";
      default : _zz_127__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_128_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_128__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_128__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_128__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_128__string = "SRA_1    ";
      default : _zz_128__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_129_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_129__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_129__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_129__string = "AND_1";
      default : _zz_129__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_130_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_130__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_130__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_130__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_130__string = "PC ";
      default : _zz_130__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_131_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_131__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_131__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_131__string = "BITWISE ";
      default : _zz_131__string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  `endif

  assign decode_SHIFT_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign decode_SRC2_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign _zz_7_ = _zz_8_;
  assign _zz_9_ = _zz_10_;
  assign decode_ENV_CTRL = _zz_11_;
  assign _zz_12_ = _zz_13_;
  assign decode_MEMORY_ENABLE = _zz_55_;
  assign decode_BRANCH_CTRL = _zz_14_;
  assign _zz_15_ = _zz_16_;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_70_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_47_;
  assign decode_DO_EBREAK = _zz_26_;
  assign decode_CSR_READ_OPCODE = _zz_29_;
  assign decode_CSR_WRITE_OPCODE = _zz_30_;
  assign memory_MEMORY_READ_DATA = _zz_69_;
  assign decode_SRC2_FORCE_ZERO = _zz_45_;
  assign decode_ALU_CTRL = _zz_17_;
  assign _zz_18_ = _zz_19_;
  assign decode_MEMORY_STORE = _zz_63_;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign decode_IS_CSR = _zz_58_;
  assign decode_SRC_LESS_UNSIGNED = _zz_65_;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign memory_PC = execute_to_memory_PC;
  assign decode_ALU_BITWISE_CTRL = _zz_20_;
  assign _zz_21_ = _zz_22_;
  assign decode_SRC1_CTRL = _zz_23_;
  assign _zz_24_ = _zz_25_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_73_;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_56_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_27_;
  assign execute_ENV_CTRL = _zz_28_;
  assign writeBack_ENV_CTRL = _zz_31_;
  assign execute_BRANCH_CALC = _zz_32_;
  assign execute_BRANCH_DO = _zz_34_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = _zz_51_;
  assign execute_BRANCH_CTRL = _zz_33_;
  always @ (*) begin
    _zz_35_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! execute_DBusSimplePlugin_cmdSent)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_161_)begin
      _zz_35_ = _zz_140_;
      if(_zz_162_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_35_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_SHIFT_CTRL = _zz_36_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_40_ = execute_PC;
  assign execute_SRC2_CTRL = _zz_41_;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_SRC1_CTRL = _zz_43_;
  assign decode_SRC_USE_SUB_LESS = _zz_64_;
  assign decode_SRC_ADD_ZERO = _zz_52_;
  assign execute_SRC_ADD_SUB = _zz_39_;
  assign execute_SRC_LESS = _zz_37_;
  assign execute_ALU_CTRL = _zz_46_;
  assign execute_SRC2 = _zz_42_;
  assign execute_SRC1 = _zz_44_;
  assign execute_ALU_BITWISE_CTRL = _zz_48_;
  always @ (*) begin
    _zz_49_ = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      _zz_49_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_62_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = _zz_67_;
  assign decode_INSTRUCTION_READY = 1'b1;
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_68_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_68_ = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = _zz_38_;
  assign execute_RS2 = _zz_50_;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = _zz_71_;
  always @ (*) begin
    _zz_72_ = execute_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_72_ = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_IS_RVC = _zz_74_;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_PC = _zz_76_;
  always @ (*) begin
    decode_INSTRUCTION = _zz_75_;
    if((_zz_155_ != (3'b000)))begin
      decode_INSTRUCTION = IBusSimplePlugin_injectionPort_payload_regNext;
    end
  end

  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    decode_arbitration_isValid = (IBusSimplePlugin_decompressor_decodeInput_valid && (! IBusSimplePlugin_injector_decodeRemoved));
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(_zz_155_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
        decode_arbitration_haltItself = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_interrupt)begin
      decode_arbitration_haltByOther = decode_arbitration_isValid;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decodeExceptionPort_valid)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(_zz_154_)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_flushAll = 1'b0;
    execute_arbitration_removeIt = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      decode_arbitration_flushAll = 1'b1;
    end
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid)begin
      decode_arbitration_flushAll = 1'b1;
      execute_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    memory_arbitration_flushAll = 1'b0;
    IBusSimplePlugin_fetcherHalt = 1'b0;
    IBusSimplePlugin_fetcherflushIt = 1'b0;
    CsrPlugin_jumpInterface_valid = 1'b0;
    CsrPlugin_jumpInterface_payload = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode}}} != (4'b0000)))begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_163_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
      memory_arbitration_flushAll = 1'b1;
    end
    if(_zz_164_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      memory_arbitration_flushAll = 1'b1;
      case(_zz_165_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
    if(_zz_166_)begin
      execute_arbitration_haltByOther = 1'b1;
      if(_zz_167_)begin
        IBusSimplePlugin_fetcherflushIt = 1'b1;
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_168_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      execute_arbitration_flushAll = 1'b1;
    end
    if(_zz_166_)begin
      if(_zz_167_)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && (! dBus_rsp_ready)))begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushAll = 1'b0;
  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if((IBusSimplePlugin_decompressor_bufferValid && (IBusSimplePlugin_decompressor_bufferData[1 : 0] != (2'b11))))begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  assign IBusSimplePlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,BranchPlugin_jumpInterface_valid} != (2'b00));
  assign _zz_77_ = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_178_[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  assign _zz_78_ = (! IBusSimplePlugin_fetcherHalt);
  assign IBusSimplePlugin_fetchPc_output_valid = (IBusSimplePlugin_fetchPc_preOutput_valid && _zz_78_);
  assign IBusSimplePlugin_fetchPc_preOutput_ready = (IBusSimplePlugin_fetchPc_output_ready && _zz_78_);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_preOutput_payload;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_propagatePc = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_iBusRsp_stages_1_input_ready))begin
      IBusSimplePlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_181_);
    IBusSimplePlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusSimplePlugin_fetchPc_inc)begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_fetchPc_propagatePc)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    if(_zz_169_)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  assign IBusSimplePlugin_fetchPc_preOutput_valid = _zz_79_;
  assign IBusSimplePlugin_fetchPc_preOutput_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_183_);
  always @ (*) begin
    IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
    if((_zz_155_ != (3'b000)))begin
      IBusSimplePlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_inputSample = 1'b1;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmd_valid) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_80_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_80_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_80_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_81_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_81_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_81_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_82_;
  assign _zz_82_ = ((1'b0 && (! _zz_83_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_83_ = _zz_84_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_83_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if((IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isRvc))begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_decompressor_rawInDecode = (IBusSimplePlugin_decompressor_bufferValid ? {IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[31 : 16],(IBusSimplePlugin_iBusRsp_output_payload_pc[1] ? IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[31 : 16] : IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_rawInDecode[1 : 0] != (2'b11));
  assign _zz_85_ = IBusSimplePlugin_decompressor_rawInDecode[15 : 0];
  always @ (*) begin
    IBusSimplePlugin_decompressor_decompressed = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(_zz_173_)
      5'b00000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{(2'b00),_zz_85_[10 : 7]},_zz_85_[12 : 11]},_zz_85_[5]},_zz_85_[6]},(2'b00)},(5'b00010)},(3'b000)},_zz_87_},(7'b0010011)};
      end
      5'b00010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_88_,_zz_86_},(3'b010)},_zz_87_},(7'b0000011)};
      end
      5'b00110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_88_[11 : 5],_zz_87_},_zz_86_},(3'b010)},_zz_88_[4 : 0]},(7'b0100011)};
      end
      5'b01000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_90_,_zz_85_[11 : 7]},(3'b000)},_zz_85_[11 : 7]},(7'b0010011)};
      end
      5'b01001 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_93_[20],_zz_93_[10 : 1]},_zz_93_[11]},_zz_93_[19 : 12]},_zz_105_},(7'b1101111)};
      end
      5'b01010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_90_,(5'b00000)},(3'b000)},_zz_85_[11 : 7]},(7'b0010011)};
      end
      5'b01011 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_85_[11 : 7] == (5'b00010)) ? {{{{{{{{{_zz_97_,_zz_85_[4 : 3]},_zz_85_[5]},_zz_85_[2]},_zz_85_[6]},(4'b0000)},_zz_85_[11 : 7]},(3'b000)},_zz_85_[11 : 7]},(7'b0010011)} : {{_zz_184_[31 : 12],_zz_85_[11 : 7]},(7'b0110111)});
      end
      5'b01100 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_85_[11 : 10] == (2'b10)) ? _zz_111_ : {{(1'b0),(_zz_231_ || _zz_232_)},(5'b00000)}),(((! _zz_85_[11]) || _zz_107_) ? _zz_85_[6 : 2] : _zz_87_)},_zz_86_},_zz_109_},_zz_86_},(_zz_107_ ? (7'b0010011) : (7'b0110011))};
      end
      5'b01101 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_100_[20],_zz_100_[10 : 1]},_zz_100_[11]},_zz_100_[19 : 12]},_zz_104_},(7'b1101111)};
      end
      5'b01110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_103_[12],_zz_103_[10 : 5]},_zz_104_},_zz_86_},(3'b000)},_zz_103_[4 : 1]},_zz_103_[11]},(7'b1100011)};
      end
      5'b01111 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_103_[12],_zz_103_[10 : 5]},_zz_104_},_zz_86_},(3'b001)},_zz_103_[4 : 1]},_zz_103_[11]},(7'b1100011)};
      end
      5'b10000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{(7'b0000000),_zz_85_[6 : 2]},_zz_85_[11 : 7]},(3'b001)},_zz_85_[11 : 7]},(7'b0010011)};
      end
      5'b10010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{(4'b0000),_zz_85_[3 : 2]},_zz_85_[12]},_zz_85_[6 : 4]},(2'b00)},_zz_106_},(3'b010)},_zz_85_[11 : 7]},(7'b0000011)};
      end
      5'b10100 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_85_[12 : 2] == (11'b10000000000)) ? (32'b00000000000100000000000001110011) : ((_zz_85_[6 : 2] == (5'b00000)) ? {{{{(12'b000000000000),_zz_85_[11 : 7]},(3'b000)},(_zz_85_[12] ? _zz_105_ : _zz_104_)},(7'b1100111)} : {{{{{_zz_233_,_zz_234_},(_zz_235_ ? _zz_236_ : _zz_104_)},(3'b000)},_zz_85_[11 : 7]},(7'b0110011)}));
      end
      5'b10110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_185_[11 : 5],_zz_85_[6 : 2]},_zz_106_},(3'b010)},_zz_186_[4 : 0]},(7'b0100011)};
      end
      default : begin
      end
    endcase
  end

  assign _zz_86_ = {(2'b01),_zz_85_[9 : 7]};
  assign _zz_87_ = {(2'b01),_zz_85_[4 : 2]};
  assign _zz_88_ = {{{{(5'b00000),_zz_85_[5]},_zz_85_[12 : 10]},_zz_85_[6]},(2'b00)};
  assign _zz_89_ = _zz_85_[12];
  always @ (*) begin
    _zz_90_[11] = _zz_89_;
    _zz_90_[10] = _zz_89_;
    _zz_90_[9] = _zz_89_;
    _zz_90_[8] = _zz_89_;
    _zz_90_[7] = _zz_89_;
    _zz_90_[6] = _zz_89_;
    _zz_90_[5] = _zz_89_;
    _zz_90_[4 : 0] = _zz_85_[6 : 2];
  end

  assign _zz_91_ = _zz_85_[12];
  always @ (*) begin
    _zz_92_[9] = _zz_91_;
    _zz_92_[8] = _zz_91_;
    _zz_92_[7] = _zz_91_;
    _zz_92_[6] = _zz_91_;
    _zz_92_[5] = _zz_91_;
    _zz_92_[4] = _zz_91_;
    _zz_92_[3] = _zz_91_;
    _zz_92_[2] = _zz_91_;
    _zz_92_[1] = _zz_91_;
    _zz_92_[0] = _zz_91_;
  end

  assign _zz_93_ = {{{{{{{{_zz_92_,_zz_85_[8]},_zz_85_[10 : 9]},_zz_85_[6]},_zz_85_[7]},_zz_85_[2]},_zz_85_[11]},_zz_85_[5 : 3]},(1'b0)};
  assign _zz_94_ = _zz_85_[12];
  always @ (*) begin
    _zz_95_[14] = _zz_94_;
    _zz_95_[13] = _zz_94_;
    _zz_95_[12] = _zz_94_;
    _zz_95_[11] = _zz_94_;
    _zz_95_[10] = _zz_94_;
    _zz_95_[9] = _zz_94_;
    _zz_95_[8] = _zz_94_;
    _zz_95_[7] = _zz_94_;
    _zz_95_[6] = _zz_94_;
    _zz_95_[5] = _zz_94_;
    _zz_95_[4] = _zz_94_;
    _zz_95_[3] = _zz_94_;
    _zz_95_[2] = _zz_94_;
    _zz_95_[1] = _zz_94_;
    _zz_95_[0] = _zz_94_;
  end

  assign _zz_96_ = _zz_85_[12];
  always @ (*) begin
    _zz_97_[2] = _zz_96_;
    _zz_97_[1] = _zz_96_;
    _zz_97_[0] = _zz_96_;
  end

  assign _zz_98_ = _zz_85_[12];
  always @ (*) begin
    _zz_99_[9] = _zz_98_;
    _zz_99_[8] = _zz_98_;
    _zz_99_[7] = _zz_98_;
    _zz_99_[6] = _zz_98_;
    _zz_99_[5] = _zz_98_;
    _zz_99_[4] = _zz_98_;
    _zz_99_[3] = _zz_98_;
    _zz_99_[2] = _zz_98_;
    _zz_99_[1] = _zz_98_;
    _zz_99_[0] = _zz_98_;
  end

  assign _zz_100_ = {{{{{{{{_zz_99_,_zz_85_[8]},_zz_85_[10 : 9]},_zz_85_[6]},_zz_85_[7]},_zz_85_[2]},_zz_85_[11]},_zz_85_[5 : 3]},(1'b0)};
  assign _zz_101_ = _zz_85_[12];
  always @ (*) begin
    _zz_102_[4] = _zz_101_;
    _zz_102_[3] = _zz_101_;
    _zz_102_[2] = _zz_101_;
    _zz_102_[1] = _zz_101_;
    _zz_102_[0] = _zz_101_;
  end

  assign _zz_103_ = {{{{{_zz_102_,_zz_85_[6 : 5]},_zz_85_[2]},_zz_85_[11 : 10]},_zz_85_[4 : 3]},(1'b0)};
  assign _zz_104_ = (5'b00000);
  assign _zz_105_ = (5'b00001);
  assign _zz_106_ = (5'b00010);
  assign _zz_107_ = (_zz_85_[11 : 10] != (2'b11));
  always @ (*) begin
    case(_zz_174_)
      2'b00 : begin
        _zz_108_ = (3'b000);
      end
      2'b01 : begin
        _zz_108_ = (3'b100);
      end
      2'b10 : begin
        _zz_108_ = (3'b110);
      end
      default : begin
        _zz_108_ = (3'b111);
      end
    endcase
  end

  always @ (*) begin
    case(_zz_175_)
      2'b00 : begin
        _zz_109_ = (3'b101);
      end
      2'b01 : begin
        _zz_109_ = (3'b101);
      end
      2'b10 : begin
        _zz_109_ = (3'b111);
      end
      default : begin
        _zz_109_ = _zz_108_;
      end
    endcase
  end

  assign _zz_110_ = _zz_85_[12];
  always @ (*) begin
    _zz_111_[6] = _zz_110_;
    _zz_111_[5] = _zz_110_;
    _zz_111_[4] = _zz_110_;
    _zz_111_[3] = _zz_110_;
    _zz_111_[2] = _zz_110_;
    _zz_111_[1] = _zz_110_;
    _zz_111_[0] = _zz_110_;
  end

  assign IBusSimplePlugin_decompressor_decodeInput_valid = (IBusSimplePlugin_decompressor_isRvc ? (IBusSimplePlugin_decompressor_bufferValid || IBusSimplePlugin_iBusRsp_output_valid) : (IBusSimplePlugin_iBusRsp_output_valid && (IBusSimplePlugin_decompressor_bufferValid || (! IBusSimplePlugin_iBusRsp_output_payload_pc[1]))));
  assign IBusSimplePlugin_decompressor_decodeInput_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_decodeInput_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_decodeInput_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_rawInDecode);
  assign IBusSimplePlugin_iBusRsp_output_ready = ((! IBusSimplePlugin_decompressor_decodeInput_valid) || (! (((! IBusSimplePlugin_decompressor_decodeInput_ready) || ((IBusSimplePlugin_decompressor_isRvc && (! IBusSimplePlugin_iBusRsp_output_payload_pc[1])) && (IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[17 : 16] != (2'b11)))) || (((! IBusSimplePlugin_decompressor_isRvc) && IBusSimplePlugin_decompressor_bufferValid) && (IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[17 : 16] != (2'b11))))));
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_decompressor_decodeInput_ready = (! decode_arbitration_isStuck);
  assign _zz_76_ = IBusSimplePlugin_decodePc_pcReg;
  assign _zz_75_ = IBusSimplePlugin_decompressor_decodeInput_payload_rsp_inst;
  assign _zz_74_ = IBusSimplePlugin_decompressor_decodeInput_payload_isRvc;
  assign _zz_73_ = (decode_PC + _zz_188_);
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_189_ - iBus_rsp_valid);
  assign IBusSimplePlugin_cmd_valid = ((IBusSimplePlugin_iBusRsp_stages_0_input_valid && (IBusSimplePlugin_pendingCmd != (1'b1))) && (! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000))));
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],(2'b00)};
  assign iBus_rsp_takeWhen_valid = (iBus_rsp_valid && (! (IBusSimplePlugin_rspJoin_discardCounter != (1'b0))));
  assign iBus_rsp_takeWhen_payload_error = iBus_rsp_payload_error;
  assign iBus_rsp_takeWhen_payload_inst = iBus_rsp_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid = iBus_rsp_takeWhen_valid;
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_error = iBus_rsp_takeWhen_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_inst = iBus_rsp_takeWhen_payload_inst;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_rspBufferOutput_valid = IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid;
    if(IBusSimplePlugin_rspJoin_rspBuffer_validReg)begin
      IBusSimplePlugin_rspJoin_rspBufferOutput_valid = 1'b1;
    end
  end

  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_ready = IBusSimplePlugin_rspJoin_rspBufferOutput_ready;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_inst;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBufferOutput_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_redoRequired = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBufferOutput_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_112_ = (! (IBusSimplePlugin_rspJoin_exceptionDetected || IBusSimplePlugin_rspJoin_redoRequired));
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_112_);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_112_);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign execute_DBusSimplePlugin_cmdSent = 1'b0;
  assign _zz_71_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! execute_DBusSimplePlugin_cmdSent));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_113_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_113_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_113_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_113_;
  assign _zz_70_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_114_ = (4'b0001);
      end
      2'b01 : begin
        _zz_114_ = (4'b0011);
      end
      default : begin
        _zz_114_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_114_ <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign _zz_69_ = dBus_rsp_data;
  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    DBusSimplePlugin_memoryExceptionPort_payload_code = (4'bxxxx);
    if(memory_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_190_};
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if((! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (1'b1 || (! memory_arbitration_isStuckByOthers)))))begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = memory_REGFILE_WRITE_DATA;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_115_ = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_116_[31] = _zz_115_;
    _zz_116_[30] = _zz_115_;
    _zz_116_[29] = _zz_115_;
    _zz_116_[28] = _zz_115_;
    _zz_116_[27] = _zz_115_;
    _zz_116_[26] = _zz_115_;
    _zz_116_[25] = _zz_115_;
    _zz_116_[24] = _zz_115_;
    _zz_116_[23] = _zz_115_;
    _zz_116_[22] = _zz_115_;
    _zz_116_[21] = _zz_115_;
    _zz_116_[20] = _zz_115_;
    _zz_116_[19] = _zz_115_;
    _zz_116_[18] = _zz_115_;
    _zz_116_[17] = _zz_115_;
    _zz_116_[16] = _zz_115_;
    _zz_116_[15] = _zz_115_;
    _zz_116_[14] = _zz_115_;
    _zz_116_[13] = _zz_115_;
    _zz_116_[12] = _zz_115_;
    _zz_116_[11] = _zz_115_;
    _zz_116_[10] = _zz_115_;
    _zz_116_[9] = _zz_115_;
    _zz_116_[8] = _zz_115_;
    _zz_116_[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_117_ = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_118_[31] = _zz_117_;
    _zz_118_[30] = _zz_117_;
    _zz_118_[29] = _zz_117_;
    _zz_118_[28] = _zz_117_;
    _zz_118_[27] = _zz_117_;
    _zz_118_[26] = _zz_117_;
    _zz_118_[25] = _zz_117_;
    _zz_118_[24] = _zz_117_;
    _zz_118_[23] = _zz_117_;
    _zz_118_[22] = _zz_117_;
    _zz_118_[21] = _zz_117_;
    _zz_118_[20] = _zz_117_;
    _zz_118_[19] = _zz_117_;
    _zz_118_[18] = _zz_117_;
    _zz_118_[17] = _zz_117_;
    _zz_118_[16] = _zz_117_;
    _zz_118_[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_176_)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_116_;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_118_;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_120_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign _zz_121_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000010000));
  assign _zz_122_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_123_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_124_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_119_ = {({(_zz_237_ == _zz_238_),(_zz_239_ == _zz_240_)} != (2'b00)),{({_zz_241_,_zz_242_} != (2'b00)),{(_zz_243_ != (1'b0)),{(_zz_244_ != _zz_245_),{_zz_246_,{_zz_247_,_zz_248_}}}}}};
  assign _zz_67_ = ({((decode_INSTRUCTION & (32'b00000000000000000000000001011111)) == (32'b00000000000000000000000000010111)),{((decode_INSTRUCTION & (32'b00000000000000000000000001111111)) == (32'b00000000000000000000000001101111)),{((decode_INSTRUCTION & (32'b00000000000000000001000001101111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_350_) == (32'b00000000000000000001000001110011)),{(_zz_351_ == _zz_352_),{_zz_353_,{_zz_354_,_zz_355_}}}}}}} != (20'b00000000000000000000));
  assign _zz_125_ = _zz_119_[1 : 0];
  assign _zz_66_ = _zz_125_;
  assign _zz_65_ = _zz_191_[0];
  assign _zz_64_ = _zz_192_[0];
  assign _zz_63_ = _zz_193_[0];
  assign _zz_62_ = _zz_194_[0];
  assign _zz_126_ = _zz_119_[10 : 9];
  assign _zz_61_ = _zz_126_;
  assign _zz_127_ = _zz_119_[13 : 12];
  assign _zz_60_ = _zz_127_;
  assign _zz_128_ = _zz_119_[15 : 14];
  assign _zz_59_ = _zz_128_;
  assign _zz_58_ = _zz_195_[0];
  assign _zz_129_ = _zz_119_[19 : 18];
  assign _zz_57_ = _zz_129_;
  assign _zz_56_ = _zz_196_[0];
  assign _zz_55_ = _zz_197_[0];
  assign _zz_130_ = _zz_119_[23 : 22];
  assign _zz_54_ = _zz_130_;
  assign _zz_131_ = _zz_119_[25 : 24];
  assign _zz_53_ = _zz_131_;
  assign _zz_52_ = _zz_198_[0];
  assign decodeExceptionPort_valid = ((decode_arbitration_isValid && decode_INSTRUCTION_READY) && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = (4'b0010);
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign execute_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign _zz_132_ = (! execute_arbitration_isStuck);
  assign execute_RegFilePlugin_rs1Data = _zz_159_;
  assign execute_RegFilePlugin_rs2Data = _zz_160_;
  assign _zz_51_ = execute_RegFilePlugin_rs1Data;
  assign _zz_50_ = execute_RegFilePlugin_rs2Data;
  assign writeBack_RegFilePlugin_regFileWrite_valid = (writeBack_REGFILE_WRITE_VALID && writeBack_arbitration_isFiring);
  assign writeBack_RegFilePlugin_regFileWrite_payload_address = writeBack_INSTRUCTION[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _zz_68_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_133_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_133_ = {31'd0, _zz_199_};
      end
      default : begin
        _zz_133_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_47_ = _zz_133_;
  assign _zz_45_ = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_134_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_134_ = {29'd0, _zz_200_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_134_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_134_ = {27'd0, _zz_201_};
      end
    endcase
  end

  assign _zz_44_ = _zz_134_;
  assign _zz_135_ = _zz_202_[11];
  always @ (*) begin
    _zz_136_[19] = _zz_135_;
    _zz_136_[18] = _zz_135_;
    _zz_136_[17] = _zz_135_;
    _zz_136_[16] = _zz_135_;
    _zz_136_[15] = _zz_135_;
    _zz_136_[14] = _zz_135_;
    _zz_136_[13] = _zz_135_;
    _zz_136_[12] = _zz_135_;
    _zz_136_[11] = _zz_135_;
    _zz_136_[10] = _zz_135_;
    _zz_136_[9] = _zz_135_;
    _zz_136_[8] = _zz_135_;
    _zz_136_[7] = _zz_135_;
    _zz_136_[6] = _zz_135_;
    _zz_136_[5] = _zz_135_;
    _zz_136_[4] = _zz_135_;
    _zz_136_[3] = _zz_135_;
    _zz_136_[2] = _zz_135_;
    _zz_136_[1] = _zz_135_;
    _zz_136_[0] = _zz_135_;
  end

  assign _zz_137_ = _zz_203_[11];
  always @ (*) begin
    _zz_138_[19] = _zz_137_;
    _zz_138_[18] = _zz_137_;
    _zz_138_[17] = _zz_137_;
    _zz_138_[16] = _zz_137_;
    _zz_138_[15] = _zz_137_;
    _zz_138_[14] = _zz_137_;
    _zz_138_[13] = _zz_137_;
    _zz_138_[12] = _zz_137_;
    _zz_138_[11] = _zz_137_;
    _zz_138_[10] = _zz_137_;
    _zz_138_[9] = _zz_137_;
    _zz_138_[8] = _zz_137_;
    _zz_138_[7] = _zz_137_;
    _zz_138_[6] = _zz_137_;
    _zz_138_[5] = _zz_137_;
    _zz_138_[4] = _zz_137_;
    _zz_138_[3] = _zz_137_;
    _zz_138_[2] = _zz_137_;
    _zz_138_[1] = _zz_137_;
    _zz_138_[0] = _zz_137_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_139_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_139_ = {_zz_136_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_139_ = {_zz_138_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_139_ = _zz_40_;
      end
    endcase
  end

  assign _zz_42_ = _zz_139_;
  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_204_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_39_ = execute_SrcPlugin_addSub;
  assign _zz_38_ = execute_SrcPlugin_addSub;
  assign _zz_37_ = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_140_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_140_ = _zz_211_;
      end
    endcase
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_141_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_141_ == (3'b000))) begin
        _zz_142_ = execute_BranchPlugin_eq;
    end else if((_zz_141_ == (3'b001))) begin
        _zz_142_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_141_ & (3'b101)) == (3'b101)))) begin
        _zz_142_ = (! execute_SRC_LESS);
    end else begin
        _zz_142_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_143_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_143_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_143_ = 1'b1;
      end
      default : begin
        _zz_143_ = _zz_142_;
      end
    endcase
  end

  assign _zz_34_ = _zz_143_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_144_ = _zz_213_[19];
  always @ (*) begin
    _zz_145_[10] = _zz_144_;
    _zz_145_[9] = _zz_144_;
    _zz_145_[8] = _zz_144_;
    _zz_145_[7] = _zz_144_;
    _zz_145_[6] = _zz_144_;
    _zz_145_[5] = _zz_144_;
    _zz_145_[4] = _zz_144_;
    _zz_145_[3] = _zz_144_;
    _zz_145_[2] = _zz_144_;
    _zz_145_[1] = _zz_144_;
    _zz_145_[0] = _zz_144_;
  end

  assign _zz_146_ = _zz_214_[11];
  always @ (*) begin
    _zz_147_[19] = _zz_146_;
    _zz_147_[18] = _zz_146_;
    _zz_147_[17] = _zz_146_;
    _zz_147_[16] = _zz_146_;
    _zz_147_[15] = _zz_146_;
    _zz_147_[14] = _zz_146_;
    _zz_147_[13] = _zz_146_;
    _zz_147_[12] = _zz_146_;
    _zz_147_[11] = _zz_146_;
    _zz_147_[10] = _zz_146_;
    _zz_147_[9] = _zz_146_;
    _zz_147_[8] = _zz_146_;
    _zz_147_[7] = _zz_146_;
    _zz_147_[6] = _zz_146_;
    _zz_147_[5] = _zz_146_;
    _zz_147_[4] = _zz_146_;
    _zz_147_[3] = _zz_146_;
    _zz_147_[2] = _zz_146_;
    _zz_147_[1] = _zz_146_;
    _zz_147_[0] = _zz_146_;
  end

  assign _zz_148_ = _zz_215_[11];
  always @ (*) begin
    _zz_149_[18] = _zz_148_;
    _zz_149_[17] = _zz_148_;
    _zz_149_[16] = _zz_148_;
    _zz_149_[15] = _zz_148_;
    _zz_149_[14] = _zz_148_;
    _zz_149_[13] = _zz_148_;
    _zz_149_[12] = _zz_148_;
    _zz_149_[11] = _zz_148_;
    _zz_149_[10] = _zz_148_;
    _zz_149_[9] = _zz_148_;
    _zz_149_[8] = _zz_148_;
    _zz_149_[7] = _zz_148_;
    _zz_149_[6] = _zz_148_;
    _zz_149_[5] = _zz_148_;
    _zz_149_[4] = _zz_148_;
    _zz_149_[3] = _zz_148_;
    _zz_149_[2] = _zz_148_;
    _zz_149_[1] = _zz_148_;
    _zz_149_[0] = _zz_148_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_150_ = {{_zz_145_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_150_ = {_zz_147_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_150_ = {{_zz_149_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_150_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_32_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign BranchPlugin_jumpInterface_valid = ((execute_arbitration_isValid && (! execute_arbitration_isStuckByOthers)) && execute_BRANCH_DO);
  assign BranchPlugin_jumpInterface_payload = execute_BRANCH_CALC;
  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b11);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  always @ (*) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'bxxxx);
    CsrPlugin_interruptTargetPrivilege = (2'bxx);
    if((CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11))))begin
      if((((CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0111);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if((((CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b0011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if((((CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE) && 1'b1) && (! 1'b0)))begin
        CsrPlugin_interrupt = 1'b1;
        CsrPlugin_interruptCode = (4'b1011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
    end
    if((! CsrPlugin_allowInterrupts))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && IBusSimplePlugin_pcValids_3);
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != (3'b000)))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = (CsrPlugin_interrupt && CsrPlugin_pipelineLiberator_done);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interruptTargetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interruptCode;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    CsrPlugin_xtvec_base = (30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign _zz_30_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_29_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_inWfi = 1'b0;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = _zz_151_;
      end
      12'b001100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
      end
      12'b001101000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mepc;
      end
      12'b001100000101 : begin
        if(execute_CSR_WRITE_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
      end
      12'b001101000011 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mtval;
      end
      12'b111111000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 0] = _zz_152_;
      end
      12'b001101000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mscratch;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
      end
      12'b001101000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      default : begin
      end
    endcase
    if((CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_valid = 1'b0;
    CsrPlugin_selfException_payload_code = (4'bxxxx);
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL)))begin
      CsrPlugin_selfException_valid = 1'b1;
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = (4'b1000);
        end
        default : begin
          CsrPlugin_selfException_payload_code = (4'b1011);
        end
      endcase
    end
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK)))begin
      CsrPlugin_selfException_valid = 1'b1;
      CsrPlugin_selfException_payload_code = (4'b0011);
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_177_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_152_ = (_zz_151_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_152_ != (32'b00000000000000000000000000000000));
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_170_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        6'b010000 : begin
        end
        6'b010001 : begin
        end
        6'b010010 : begin
        end
        6'b010011 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_153_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign _zz_26_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || ((((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_220_))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_221_))) || (DebugPlugin_hardwareBreakpoints_2_valid && (DebugPlugin_hardwareBreakpoints_2_pc == _zz_222_))) || (DebugPlugin_hardwareBreakpoints_3_valid && (DebugPlugin_hardwareBreakpoints_3_pc == _zz_223_)))));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_25_ = decode_SRC1_CTRL;
  assign _zz_23_ = _zz_60_;
  assign _zz_43_ = decode_to_execute_SRC1_CTRL;
  assign _zz_22_ = decode_ALU_BITWISE_CTRL;
  assign _zz_20_ = _zz_57_;
  assign _zz_48_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_19_ = decode_ALU_CTRL;
  assign _zz_17_ = _zz_53_;
  assign _zz_46_ = decode_to_execute_ALU_CTRL;
  assign _zz_16_ = decode_BRANCH_CTRL;
  assign _zz_14_ = _zz_61_;
  assign _zz_33_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_13_ = decode_ENV_CTRL;
  assign _zz_10_ = execute_ENV_CTRL;
  assign _zz_8_ = memory_ENV_CTRL;
  assign _zz_11_ = _zz_66_;
  assign _zz_28_ = decode_to_execute_ENV_CTRL;
  assign _zz_27_ = execute_to_memory_ENV_CTRL;
  assign _zz_31_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_6_ = decode_SRC2_CTRL;
  assign _zz_4_ = _zz_54_;
  assign _zz_41_ = decode_to_execute_SRC2_CTRL;
  assign _zz_3_ = decode_SHIFT_CTRL;
  assign _zz_1_ = _zz_59_;
  assign _zz_36_ = decode_to_execute_SHIFT_CTRL;
  assign decode_arbitration_isFlushed = ({writeBack_arbitration_flushAll,{memory_arbitration_flushAll,{execute_arbitration_flushAll,decode_arbitration_flushAll}}} != (4'b0000));
  assign execute_arbitration_isFlushed = ({writeBack_arbitration_flushAll,{memory_arbitration_flushAll,execute_arbitration_flushAll}} != (3'b000));
  assign memory_arbitration_isFlushed = ({writeBack_arbitration_flushAll,memory_arbitration_flushAll} != (2'b00));
  assign writeBack_arbitration_isFlushed = (writeBack_arbitration_flushAll != (1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign iBus_cmd_ready = ((1'b1 && (! iBus_cmd_m2sPipe_valid)) || iBus_cmd_m2sPipe_ready);
  assign iBus_cmd_m2sPipe_valid = _zz_156_;
  assign iBus_cmd_m2sPipe_payload_pc = _zz_157_;
  assign iBusWishbone_ADR = (iBus_cmd_m2sPipe_payload_pc >>> 2);
  assign iBusWishbone_CTI = (3'b000);
  assign iBusWishbone_BTE = (2'b00);
  assign iBusWishbone_SEL = (4'b1111);
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  assign iBusWishbone_CYC = iBus_cmd_m2sPipe_valid;
  assign iBusWishbone_STB = iBus_cmd_m2sPipe_valid;
  assign iBus_cmd_m2sPipe_ready = (iBus_cmd_m2sPipe_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = (iBusWishbone_CYC && iBusWishbone_ACK);
  assign iBus_rsp_payload_inst = iBusWishbone_DAT_MISO;
  assign iBus_rsp_payload_error = 1'b0;
  assign dBus_cmd_halfPipe_valid = dBus_cmd_halfPipe_regs_valid;
  assign dBus_cmd_halfPipe_payload_wr = dBus_cmd_halfPipe_regs_payload_wr;
  assign dBus_cmd_halfPipe_payload_address = dBus_cmd_halfPipe_regs_payload_address;
  assign dBus_cmd_halfPipe_payload_data = dBus_cmd_halfPipe_regs_payload_data;
  assign dBus_cmd_halfPipe_payload_size = dBus_cmd_halfPipe_regs_payload_size;
  assign dBus_cmd_ready = dBus_cmd_halfPipe_regs_ready;
  assign dBusWishbone_ADR = (dBus_cmd_halfPipe_payload_address >>> 2);
  assign dBusWishbone_CTI = (3'b000);
  assign dBusWishbone_BTE = (2'b00);
  always @ (*) begin
    case(dBus_cmd_halfPipe_payload_size)
      2'b00 : begin
        _zz_158_ = (4'b0001);
      end
      2'b01 : begin
        _zz_158_ = (4'b0011);
      end
      default : begin
        _zz_158_ = (4'b1111);
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = _zz_230_[3:0];
    if((! dBus_cmd_halfPipe_payload_wr))begin
      dBusWishbone_SEL = (4'b1111);
    end
  end

  assign dBusWishbone_WE = dBus_cmd_halfPipe_payload_wr;
  assign dBusWishbone_DAT_MOSI = dBus_cmd_halfPipe_payload_data;
  assign dBus_cmd_halfPipe_ready = (dBus_cmd_halfPipe_valid && dBusWishbone_ACK);
  assign dBusWishbone_CYC = dBus_cmd_halfPipe_valid;
  assign dBusWishbone_STB = dBus_cmd_halfPipe_valid;
  assign dBus_rsp_ready = ((dBus_cmd_halfPipe_valid && (! dBusWishbone_WE)) && dBusWishbone_ACK);
  assign dBus_rsp_data = dBusWishbone_DAT_MISO;
  assign dBus_rsp_error = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= externalResetVector;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_79_ <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= externalResetVector;
      _zz_84_ <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      IBusSimplePlugin_pendingCmd <= (1'b0);
      IBusSimplePlugin_rspJoin_discardCounter <= (1'b0);
      IBusSimplePlugin_rspJoin_rspBuffer_validReg <= 1'b0;
      execute_LightShifterPlugin_isActive <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      _zz_151_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_155_ <= (3'b000);
      _zz_156_ <= 1'b0;
      dBus_cmd_halfPipe_regs_valid <= 1'b0;
      dBus_cmd_halfPipe_regs_ready <= 1'b1;
    end else begin
      if(IBusSimplePlugin_fetchPc_propagatePc)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_169_)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_samplePcNext)begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      _zz_79_ <= 1'b1;
      if((decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode)))begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        _zz_84_ <= 1'b0;
      end
      if(_zz_82_)begin
        _zz_84_ <= IBusSimplePlugin_iBusRsp_stages_0_output_valid;
      end
      if((IBusSimplePlugin_decompressor_decodeInput_valid && IBusSimplePlugin_decompressor_decodeInput_ready))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_171_)begin
        IBusSimplePlugin_decompressor_bufferValid <= ((! (((! IBusSimplePlugin_decompressor_isRvc) && (! IBusSimplePlugin_iBusRsp_output_payload_pc[1])) && (! IBusSimplePlugin_decompressor_bufferValid))) && (! ((IBusSimplePlugin_decompressor_isRvc && IBusSimplePlugin_iBusRsp_output_payload_pc[1]) && IBusSimplePlugin_decompressor_decodeInput_ready)));
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if((! 1'b0))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      end
      IBusSimplePlugin_pendingCmd <= IBusSimplePlugin_pendingCmdNext;
      IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_rspJoin_discardCounter - (iBus_rsp_valid && (IBusSimplePlugin_rspJoin_discardCounter != (1'b0))));
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_pendingCmd - iBus_rsp_valid);
      end
      if(IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid)begin
        IBusSimplePlugin_rspJoin_rspBuffer_validReg <= 1'b1;
      end
      if(IBusSimplePlugin_rspJoin_rspBufferOutput_ready)begin
        IBusSimplePlugin_rspJoin_rspBuffer_validReg <= 1'b0;
      end
      if(_zz_161_)begin
        if(_zz_162_)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_163_)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_164_)begin
        case(_zz_165_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if((((! IBusSimplePlugin_iBusRsp_output_ready) && (IBusSimplePlugin_decompressor_decodeInput_valid && IBusSimplePlugin_decompressor_decodeInput_ready)) && (! (IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))))begin
        IBusSimplePlugin_fetchPc_pcReg[1] <= 1'b1;
      end
      case(_zz_155_)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid)begin
            _zz_155_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_155_ <= (3'b010);
        end
        3'b010 : begin
          _zz_155_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_155_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_155_ <= (3'b000);
        end
        default : begin
        end
      endcase
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_151_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_224_[0];
            CsrPlugin_mstatus_MIE <= _zz_225_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000101 : begin
        end
        12'b001101000100 : begin
        end
        12'b001101000011 : begin
        end
        12'b111111000000 : begin
        end
        12'b001101000000 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_227_[0];
            CsrPlugin_mie_MTIE <= _zz_228_[0];
            CsrPlugin_mie_MSIE <= _zz_229_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(iBus_cmd_ready)begin
        _zz_156_ <= iBus_cmd_valid;
      end
      if(_zz_172_)begin
        dBus_cmd_halfPipe_regs_valid <= dBus_cmd_valid;
        dBus_cmd_halfPipe_regs_ready <= (! dBus_cmd_valid);
      end else begin
        dBus_cmd_halfPipe_regs_valid <= (! dBus_cmd_halfPipe_ready);
        dBus_cmd_halfPipe_regs_ready <= dBus_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_171_)begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst[31 : 16];
    end
    if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow writeback stage stall when read happend");
    end
    if(_zz_161_)begin
      if(_zz_162_)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - (5'b00001));
      end
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= decodeExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= decodeExceptionPort_payload_badAddr;
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(DBusSimplePlugin_memoryExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusSimplePlugin_memoryExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
    end
    if(_zz_163_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_72_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= memory_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_24_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_21_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_40_;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_18_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_35_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= memory_REGFILE_WRITE_DATA;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_15_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_12_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_9_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_7_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_2_;
    end
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
      end
      12'b001100000000 : begin
      end
      12'b001101000001 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001100000101 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
      12'b001101000100 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mip_MSIP <= _zz_226_[0];
        end
      end
      12'b001101000011 : begin
      end
      12'b111111000000 : begin
      end
      12'b001101000000 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mscratch <= execute_CsrPlugin_writeData[31 : 0];
        end
      end
      12'b001100000100 : begin
      end
      12'b001101000010 : begin
      end
      default : begin
      end
    endcase
    if(iBus_cmd_ready)begin
      _zz_157_ <= iBus_cmd_payload_pc;
    end
    if(_zz_172_)begin
      dBus_cmd_halfPipe_regs_payload_wr <= dBus_cmd_payload_wr;
      dBus_cmd_halfPipe_regs_payload_address <= dBus_cmd_payload_address;
      dBus_cmd_halfPipe_regs_payload_data <= dBus_cmd_payload_data;
      dBus_cmd_halfPipe_regs_payload_size <= dBus_cmd_payload_size;
    end
  end

  always @ (posedge clk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000)) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_68_;
    end
    _zz_153_ <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid)begin
      case(_zz_170_)
        6'b000000 : begin
        end
        6'b000001 : begin
        end
        6'b010000 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_0_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010001 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_1_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010010 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_2_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010011 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_3_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        default : begin
        end
      endcase
    end
    if(_zz_166_)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge clk) begin
    if(debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_hardwareBreakpoints_0_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_1_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_2_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_3_valid <= 1'b0;
      _zz_154_ <= 1'b0;
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_170_)
          6'b000000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
            end
          end
          6'b000001 : begin
          end
          6'b010000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_0_valid <= _zz_216_[0];
            end
          end
          6'b010001 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_1_valid <= _zz_217_[0];
            end
          end
          6'b010010 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_2_valid <= _zz_218_[0];
            end
          end
          6'b010011 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_3_valid <= _zz_219_[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_166_)begin
        if(_zz_167_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_168_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_154_ <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
    end
  end

  always @ (posedge clk) begin
    IBusSimplePlugin_injectionPort_payload_regNext <= IBusSimplePlugin_injectionPort_payload;
  end

endmodule

