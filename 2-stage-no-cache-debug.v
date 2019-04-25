// Generator : SpinalHDL v1.3.3    git head : 8b8cd335eecbea3b5f1f970f218a982dbdb12d99
// Date      : 25/04/2019, 07:31:30
// Component : VexRiscv


`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

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

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b11

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
  reg [31:0] _zz_148_;
  reg [31:0] _zz_149_;
  reg [31:0] _zz_150_;
  reg [3:0] _zz_151_;
  reg [31:0] _zz_152_;
  wire  _zz_153_;
  wire  _zz_154_;
  wire  _zz_155_;
  wire  _zz_156_;
  wire  _zz_157_;
  wire [1:0] _zz_158_;
  wire  _zz_159_;
  wire  _zz_160_;
  wire  _zz_161_;
  wire  _zz_162_;
  wire [5:0] _zz_163_;
  wire  _zz_164_;
  wire [1:0] _zz_165_;
  wire  _zz_166_;
  wire [2:0] _zz_167_;
  wire [2:0] _zz_168_;
  wire [31:0] _zz_169_;
  wire [11:0] _zz_170_;
  wire [31:0] _zz_171_;
  wire [19:0] _zz_172_;
  wire [11:0] _zz_173_;
  wire [31:0] _zz_174_;
  wire [31:0] _zz_175_;
  wire [19:0] _zz_176_;
  wire [11:0] _zz_177_;
  wire [0:0] _zz_178_;
  wire [2:0] _zz_179_;
  wire [0:0] _zz_180_;
  wire [0:0] _zz_181_;
  wire [0:0] _zz_182_;
  wire [0:0] _zz_183_;
  wire [0:0] _zz_184_;
  wire [0:0] _zz_185_;
  wire [0:0] _zz_186_;
  wire [0:0] _zz_187_;
  wire [0:0] _zz_188_;
  wire [2:0] _zz_189_;
  wire [4:0] _zz_190_;
  wire [11:0] _zz_191_;
  wire [11:0] _zz_192_;
  wire [31:0] _zz_193_;
  wire [31:0] _zz_194_;
  wire [31:0] _zz_195_;
  wire [31:0] _zz_196_;
  wire [31:0] _zz_197_;
  wire [31:0] _zz_198_;
  wire [31:0] _zz_199_;
  wire [31:0] _zz_200_;
  wire [32:0] _zz_201_;
  wire [11:0] _zz_202_;
  wire [19:0] _zz_203_;
  wire [11:0] _zz_204_;
  wire [31:0] _zz_205_;
  wire [31:0] _zz_206_;
  wire [31:0] _zz_207_;
  wire [11:0] _zz_208_;
  wire [19:0] _zz_209_;
  wire [11:0] _zz_210_;
  wire [2:0] _zz_211_;
  wire [2:0] _zz_212_;
  wire [0:0] _zz_213_;
  wire [0:0] _zz_214_;
  wire [0:0] _zz_215_;
  wire [0:0] _zz_216_;
  wire [0:0] _zz_217_;
  wire [0:0] _zz_218_;
  wire [0:0] _zz_219_;
  wire [0:0] _zz_220_;
  wire [30:0] _zz_221_;
  wire [30:0] _zz_222_;
  wire [30:0] _zz_223_;
  wire [30:0] _zz_224_;
  wire [30:0] _zz_225_;
  wire [30:0] _zz_226_;
  wire [30:0] _zz_227_;
  wire [30:0] _zz_228_;
  wire [0:0] _zz_229_;
  wire [0:0] _zz_230_;
  wire [0:0] _zz_231_;
  wire [0:0] _zz_232_;
  wire [0:0] _zz_233_;
  wire [0:0] _zz_234_;
  wire [6:0] _zz_235_;
  wire [1:0] _zz_236_;
  wire  _zz_237_;
  wire  _zz_238_;
  wire  _zz_239_;
  wire [31:0] _zz_240_;
  wire [31:0] _zz_241_;
  wire [31:0] _zz_242_;
  wire [0:0] _zz_243_;
  wire [0:0] _zz_244_;
  wire [0:0] _zz_245_;
  wire [0:0] _zz_246_;
  wire  _zz_247_;
  wire [0:0] _zz_248_;
  wire [20:0] _zz_249_;
  wire [31:0] _zz_250_;
  wire [31:0] _zz_251_;
  wire [31:0] _zz_252_;
  wire [31:0] _zz_253_;
  wire [31:0] _zz_254_;
  wire  _zz_255_;
  wire [3:0] _zz_256_;
  wire [3:0] _zz_257_;
  wire  _zz_258_;
  wire [0:0] _zz_259_;
  wire [17:0] _zz_260_;
  wire [31:0] _zz_261_;
  wire [31:0] _zz_262_;
  wire  _zz_263_;
  wire [0:0] _zz_264_;
  wire [0:0] _zz_265_;
  wire  _zz_266_;
  wire  _zz_267_;
  wire [0:0] _zz_268_;
  wire [0:0] _zz_269_;
  wire [0:0] _zz_270_;
  wire [0:0] _zz_271_;
  wire  _zz_272_;
  wire [0:0] _zz_273_;
  wire [14:0] _zz_274_;
  wire [31:0] _zz_275_;
  wire [31:0] _zz_276_;
  wire [31:0] _zz_277_;
  wire [31:0] _zz_278_;
  wire [31:0] _zz_279_;
  wire [31:0] _zz_280_;
  wire [31:0] _zz_281_;
  wire [31:0] _zz_282_;
  wire [31:0] _zz_283_;
  wire [31:0] _zz_284_;
  wire [31:0] _zz_285_;
  wire [0:0] _zz_286_;
  wire [0:0] _zz_287_;
  wire [0:0] _zz_288_;
  wire [0:0] _zz_289_;
  wire  _zz_290_;
  wire [0:0] _zz_291_;
  wire [12:0] _zz_292_;
  wire [31:0] _zz_293_;
  wire [31:0] _zz_294_;
  wire  _zz_295_;
  wire  _zz_296_;
  wire [0:0] _zz_297_;
  wire [0:0] _zz_298_;
  wire  _zz_299_;
  wire [0:0] _zz_300_;
  wire [9:0] _zz_301_;
  wire [31:0] _zz_302_;
  wire [31:0] _zz_303_;
  wire [31:0] _zz_304_;
  wire [31:0] _zz_305_;
  wire [0:0] _zz_306_;
  wire [0:0] _zz_307_;
  wire [1:0] _zz_308_;
  wire [1:0] _zz_309_;
  wire  _zz_310_;
  wire [0:0] _zz_311_;
  wire [5:0] _zz_312_;
  wire [31:0] _zz_313_;
  wire [31:0] _zz_314_;
  wire [31:0] _zz_315_;
  wire [31:0] _zz_316_;
  wire [31:0] _zz_317_;
  wire [31:0] _zz_318_;
  wire  _zz_319_;
  wire [0:0] _zz_320_;
  wire [0:0] _zz_321_;
  wire [0:0] _zz_322_;
  wire [4:0] _zz_323_;
  wire [0:0] _zz_324_;
  wire [0:0] _zz_325_;
  wire  _zz_326_;
  wire [0:0] _zz_327_;
  wire [2:0] _zz_328_;
  wire [31:0] _zz_329_;
  wire [31:0] _zz_330_;
  wire [31:0] _zz_331_;
  wire [31:0] _zz_332_;
  wire [31:0] _zz_333_;
  wire  _zz_334_;
  wire [0:0] _zz_335_;
  wire [2:0] _zz_336_;
  wire [31:0] _zz_337_;
  wire [31:0] _zz_338_;
  wire [0:0] _zz_339_;
  wire [0:0] _zz_340_;
  wire [1:0] _zz_341_;
  wire [1:0] _zz_342_;
  wire  _zz_343_;
  wire [0:0] _zz_344_;
  wire [0:0] _zz_345_;
  wire [31:0] _zz_346_;
  wire  _zz_347_;
  wire  _zz_348_;
  wire [31:0] _zz_349_;
  wire [31:0] _zz_350_;
  wire [31:0] _zz_351_;
  wire [31:0] _zz_352_;
  wire [31:0] _zz_353_;
  wire [0:0] _zz_354_;
  wire [0:0] _zz_355_;
  wire [0:0] _zz_356_;
  wire [0:0] _zz_357_;
  wire  _zz_358_;
  wire  _zz_359_;
  wire  _zz_360_;
  wire  _zz_361_;
  wire  _zz_362_;
  wire  _zz_363_;
  wire  decode_MEMORY_ENABLE;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  decode_CSR_WRITE_OPCODE;
  wire  decode_IS_CSR;
  wire  decode_MEMORY_STORE;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_1_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_2_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_3_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_4_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_5_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_6_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_7_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_8_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_9_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_10_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_11_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_12_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_13_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_14_;
  wire  decode_DO_EBREAK;
  wire  execute_REGFILE_WRITE_VALID;
  wire  decode_PREDICTION_HAD_BRANCHED2;
  wire  decode_SRC2_FORCE_ZERO;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_15_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_16_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_17_;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire  decode_CSR_READ_OPCODE;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_18_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_19_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_20_;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  _zz_21_;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire  _zz_22_;
  wire  _zz_23_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_24_;
  wire [31:0] execute_BRANCH_CALC;
  wire  execute_BRANCH_DO;
  wire [31:0] _zz_25_;
  wire [31:0] execute_PC;
  wire  execute_PREDICTION_HAD_BRANCHED2;
  wire  _zz_26_;
  wire [31:0] execute_RS1;
  wire  execute_BRANCH_COND_RESULT;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_27_;
  wire  _zz_28_;
  wire  _zz_29_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_30_;
  wire  _zz_31_;
  wire [31:0] _zz_32_;
  wire [31:0] _zz_33_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_34_;
  wire [31:0] _zz_35_;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_36_;
  wire [31:0] _zz_37_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire  _zz_38_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_39_;
  wire [31:0] _zz_40_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_41_;
  reg  _zz_42_;
  wire [31:0] _zz_43_;
  wire [31:0] _zz_44_;
  reg  decode_REGFILE_WRITE_VALID;
  wire  _zz_45_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_46_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_47_;
  wire  _zz_48_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_49_;
  wire  _zz_50_;
  wire  _zz_51_;
  wire  _zz_52_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_53_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_54_;
  wire  _zz_55_;
  wire  _zz_56_;
  wire  _zz_57_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_58_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_59_;
  reg [31:0] _zz_60_;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] execute_MEMORY_READ_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire [31:0] _zz_61_;
  wire [31:0] execute_SRC_ADD;
  wire [1:0] _zz_62_;
  wire [31:0] execute_RS2;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_MEMORY_STORE;
  wire  execute_MEMORY_ENABLE;
  wire  execute_ALIGNEMENT_FAULT;
  wire  _zz_63_;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_64_;
  reg [31:0] _zz_65_;
  wire [31:0] _zz_66_;
  wire [31:0] _zz_67_;
  wire [31:0] _zz_68_;
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
  reg  IBusSimplePlugin_fetcherHalt;
  reg  IBusSimplePlugin_fetcherflushIt;
  reg  IBusSimplePlugin_incomingInstruction;
  wire  IBusSimplePlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire [31:0] IBusSimplePlugin_pcs_2 /* synthesis syn_keep = 1 */ ;
  reg  IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire  IBusSimplePlugin_decodePrediction_rsp_wasWrong;
  wire  IBusSimplePlugin_pcValids_0;
  wire  IBusSimplePlugin_pcValids_1;
  wire  iBus_cmd_valid;
  wire  iBus_cmd_ready;
  wire [31:0] iBus_cmd_payload_pc;
  wire  iBus_rsp_valid;
  wire  iBus_rsp_payload_error;
  wire [31:0] iBus_rsp_payload_inst;
  reg  DBusSimplePlugin_memoryExceptionPort_valid;
  reg [3:0] DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire [31:0] DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire  BranchPlugin_jumpInterface_valid;
  wire [31:0] BranchPlugin_jumpInterface_payload;
  reg  BranchPlugin_branchExceptionPort_valid;
  wire [3:0] BranchPlugin_branchExceptionPort_payload_code;
  wire [31:0] BranchPlugin_branchExceptionPort_payload_badAddr;
  reg  CsrPlugin_jumpInterface_valid;
  reg [31:0] CsrPlugin_jumpInterface_payload;
  wire  CsrPlugin_exceptionPendings_0;
  wire  CsrPlugin_exceptionPendings_1;
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
  wire [2:0] _zz_69_;
  wire [2:0] _zz_70_;
  wire  _zz_71_;
  wire  _zz_72_;
  wire  IBusSimplePlugin_fetchPc_preOutput_valid;
  wire  IBusSimplePlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_preOutput_payload;
  wire  _zz_73_;
  wire  IBusSimplePlugin_fetchPc_output_valid;
  wire  IBusSimplePlugin_fetchPc_output_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_output_payload;
  reg [31:0] IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusSimplePlugin_fetchPc_inc;
  reg  IBusSimplePlugin_fetchPc_propagatePc;
  reg [31:0] IBusSimplePlugin_fetchPc_pc;
  reg  IBusSimplePlugin_fetchPc_samplePcNext;
  reg  _zz_74_;
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
  wire  _zz_75_;
  wire  _zz_76_;
  wire  _zz_77_;
  wire  _zz_78_;
  reg  _zz_79_;
  reg  IBusSimplePlugin_iBusRsp_readyForError;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_valid;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_decodeInput_payload_pc;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_payload_isRvc;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg  IBusSimplePlugin_injector_decodeRemoved;
  wire  _zz_80_;
  reg [18:0] _zz_81_;
  wire  _zz_82_;
  reg [10:0] _zz_83_;
  wire  _zz_84_;
  reg [18:0] _zz_85_;
  reg  _zz_86_;
  wire  _zz_87_;
  reg [10:0] _zz_88_;
  wire  _zz_89_;
  reg [18:0] _zz_90_;
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
  wire  _zz_91_;
  wire  dBus_cmd_valid;
  wire  dBus_cmd_ready;
  wire  dBus_cmd_payload_wr;
  wire [31:0] dBus_cmd_payload_address;
  wire [31:0] dBus_cmd_payload_data;
  wire [1:0] dBus_cmd_payload_size;
  wire  dBus_rsp_ready;
  wire  dBus_rsp_error;
  wire [31:0] dBus_rsp_data;
  reg  execute_DBusSimplePlugin_cmdSent;
  reg  execute_DBusSimplePlugin_skipCmd;
  reg [31:0] _zz_92_;
  reg [3:0] _zz_93_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] execute_DBusSimplePlugin_rspShifted;
  wire  _zz_94_;
  reg [31:0] _zz_95_;
  wire  _zz_96_;
  reg [31:0] _zz_97_;
  reg [31:0] execute_DBusSimplePlugin_rspFormated;
  wire [26:0] _zz_98_;
  wire  _zz_99_;
  wire  _zz_100_;
  wire  _zz_101_;
  wire  _zz_102_;
  wire  _zz_103_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_104_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_105_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_106_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_107_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_108_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_109_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_110_;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire  _zz_111_;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  execute_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] execute_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] execute_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_112_;
  reg [31:0] _zz_113_;
  wire  _zz_114_;
  reg [19:0] _zz_115_;
  wire  _zz_116_;
  reg [19:0] _zz_117_;
  reg [31:0] _zz_118_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  reg [31:0] execute_LightShifterPlugin_shiftReg;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_119_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_120_;
  reg  _zz_121_;
  reg  _zz_122_;
  wire  _zz_123_;
  reg [19:0] _zz_124_;
  wire  _zz_125_;
  reg [10:0] _zz_126_;
  wire  _zz_127_;
  reg [18:0] _zz_128_;
  reg  _zz_129_;
  wire  execute_BranchPlugin_missAlignedTarget;
  reg [31:0] execute_BranchPlugin_branch_src1;
  reg [31:0] execute_BranchPlugin_branch_src2;
  wire  _zz_130_;
  reg [19:0] _zz_131_;
  wire  _zz_132_;
  reg [10:0] _zz_133_;
  wire  _zz_134_;
  reg [18:0] _zz_135_;
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
  wire  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire [2:0] _zz_136_;
  wire [2:0] _zz_137_;
  wire  _zz_138_;
  wire  _zz_139_;
  wire [1:0] _zz_140_;
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
  reg [31:0] _zz_141_;
  reg [31:0] externalInterruptArray_regNext;
  wire [31:0] _zz_142_;
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
  reg  DebugPlugin_hardwareBreakpoints_4_valid;
  reg [30:0] DebugPlugin_hardwareBreakpoints_4_pc;
  reg  DebugPlugin_hardwareBreakpoints_5_valid;
  reg [30:0] DebugPlugin_hardwareBreakpoints_5_pc;
  reg  DebugPlugin_hardwareBreakpoints_6_valid;
  reg [30:0] DebugPlugin_hardwareBreakpoints_6_pc;
  reg  DebugPlugin_hardwareBreakpoints_7_valid;
  reg [30:0] DebugPlugin_hardwareBreakpoints_7_pc;
  reg [31:0] DebugPlugin_busReadDataReg;
  reg  _zz_143_;
  reg  DebugPlugin_resetIt_regNext;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg  decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg  decode_to_execute_DO_EBREAK;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  decode_to_execute_MEMORY_STORE;
  reg  decode_to_execute_IS_CSR;
  reg [31:0] decode_to_execute_PC;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg [2:0] _zz_144_;
  reg [31:0] IBusSimplePlugin_injectionPort_payload_regNext;
  wire  iBus_cmd_m2sPipe_valid;
  wire  iBus_cmd_m2sPipe_ready;
  wire [31:0] iBus_cmd_m2sPipe_payload_pc;
  reg  _zz_145_;
  reg [31:0] _zz_146_;
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
  reg [3:0] _zz_147_;
  `ifndef SYNTHESIS
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_1__string;
  reg [63:0] _zz_2__string;
  reg [63:0] _zz_3__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_4__string;
  reg [71:0] _zz_5__string;
  reg [71:0] _zz_6__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_7__string;
  reg [23:0] _zz_8__string;
  reg [23:0] _zz_9__string;
  reg [31:0] _zz_10__string;
  reg [31:0] _zz_11__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_12__string;
  reg [95:0] _zz_13__string;
  reg [95:0] _zz_14__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_15__string;
  reg [39:0] _zz_16__string;
  reg [39:0] _zz_17__string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_18__string;
  reg [47:0] _zz_19__string;
  reg [47:0] _zz_20__string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_24__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_27__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_30__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_34__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_36__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_39__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_41__string;
  reg [63:0] _zz_46__string;
  reg [39:0] _zz_47__string;
  reg [31:0] _zz_49__string;
  reg [47:0] _zz_53__string;
  reg [71:0] _zz_54__string;
  reg [95:0] _zz_58__string;
  reg [23:0] _zz_59__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_64__string;
  reg [23:0] _zz_104__string;
  reg [95:0] _zz_105__string;
  reg [71:0] _zz_106__string;
  reg [47:0] _zz_107__string;
  reg [31:0] _zz_108__string;
  reg [39:0] _zz_109__string;
  reg [63:0] _zz_110__string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_153_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_154_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_155_ = ({CsrPlugin_selfException_valid,{BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid}} != (3'b000));
  assign _zz_156_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_157_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_158_ = execute_INSTRUCTION[29 : 28];
  assign _zz_159_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_160_ = (1'b0 == 1'b0);
  assign _zz_161_ = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign _zz_162_ = (IBusSimplePlugin_fetchPc_preOutput_valid && IBusSimplePlugin_fetchPc_preOutput_ready);
  assign _zz_163_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_164_ = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_165_ = execute_INSTRUCTION[13 : 12];
  assign _zz_166_ = execute_INSTRUCTION[13];
  assign _zz_167_ = (_zz_69_ - (3'b001));
  assign _zz_168_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_169_ = {29'd0, _zz_168_};
  assign _zz_170_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_171_ = {{_zz_81_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_172_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_173_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_174_ = {{_zz_83_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_175_ = {{_zz_85_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_176_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_177_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_178_ = (IBusSimplePlugin_pendingCmd + (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready));
  assign _zz_179_ = (execute_MEMORY_STORE ? (3'b110) : (3'b100));
  assign _zz_180_ = _zz_98_[5 : 5];
  assign _zz_181_ = _zz_98_[6 : 6];
  assign _zz_182_ = _zz_98_[7 : 7];
  assign _zz_183_ = _zz_98_[14 : 14];
  assign _zz_184_ = _zz_98_[15 : 15];
  assign _zz_185_ = _zz_98_[16 : 16];
  assign _zz_186_ = _zz_98_[19 : 19];
  assign _zz_187_ = _zz_98_[26 : 26];
  assign _zz_188_ = execute_SRC_LESS;
  assign _zz_189_ = (3'b100);
  assign _zz_190_ = execute_INSTRUCTION[19 : 15];
  assign _zz_191_ = execute_INSTRUCTION[31 : 20];
  assign _zz_192_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_193_ = ($signed(_zz_194_) + $signed(_zz_197_));
  assign _zz_194_ = ($signed(_zz_195_) + $signed(_zz_196_));
  assign _zz_195_ = execute_SRC1;
  assign _zz_196_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_197_ = (execute_SRC_USE_SUB_LESS ? _zz_198_ : _zz_199_);
  assign _zz_198_ = (32'b00000000000000000000000000000001);
  assign _zz_199_ = (32'b00000000000000000000000000000000);
  assign _zz_200_ = (_zz_201_ >>> 1);
  assign _zz_201_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_202_ = execute_INSTRUCTION[31 : 20];
  assign _zz_203_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_204_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_205_ = {_zz_124_,execute_INSTRUCTION[31 : 20]};
  assign _zz_206_ = {{_zz_126_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_207_ = {{_zz_128_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_208_ = execute_INSTRUCTION[31 : 20];
  assign _zz_209_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_210_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_211_ = (3'b100);
  assign _zz_212_ = (_zz_136_ - (3'b001));
  assign _zz_213_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_214_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_215_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_216_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_217_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_218_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_219_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_220_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_221_ = (decode_PC >>> 1);
  assign _zz_222_ = (decode_PC >>> 1);
  assign _zz_223_ = (decode_PC >>> 1);
  assign _zz_224_ = (decode_PC >>> 1);
  assign _zz_225_ = (decode_PC >>> 1);
  assign _zz_226_ = (decode_PC >>> 1);
  assign _zz_227_ = (decode_PC >>> 1);
  assign _zz_228_ = (decode_PC >>> 1);
  assign _zz_229_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_230_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_231_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_232_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_233_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_234_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_235_ = ({3'd0,_zz_147_} <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign _zz_236_ = {_zz_72_,_zz_71_};
  assign _zz_237_ = decode_INSTRUCTION[31];
  assign _zz_238_ = decode_INSTRUCTION[31];
  assign _zz_239_ = decode_INSTRUCTION[7];
  assign _zz_240_ = (32'b00000000000000000000000000100000);
  assign _zz_241_ = (decode_INSTRUCTION & (32'b00000000000000000000000000000000));
  assign _zz_242_ = (32'b00000000000000000000000000000000);
  assign _zz_243_ = ((decode_INSTRUCTION & _zz_250_) == (32'b00000000000000000110000000010000));
  assign _zz_244_ = ((decode_INSTRUCTION & _zz_251_) == (32'b00000000000000000100000000010000));
  assign _zz_245_ = ((decode_INSTRUCTION & _zz_252_) == (32'b00000000000000000010000000010000));
  assign _zz_246_ = (1'b0);
  assign _zz_247_ = ((_zz_253_ == _zz_254_) != (1'b0));
  assign _zz_248_ = (_zz_255_ != (1'b0));
  assign _zz_249_ = {(_zz_256_ != _zz_257_),{_zz_258_,{_zz_259_,_zz_260_}}};
  assign _zz_250_ = (32'b00000000000000000110000000010100);
  assign _zz_251_ = (32'b00000000000000000101000000010100);
  assign _zz_252_ = (32'b00000000000000000110000000010100);
  assign _zz_253_ = (decode_INSTRUCTION & (32'b00000000000000000001000000000000));
  assign _zz_254_ = (32'b00000000000000000001000000000000);
  assign _zz_255_ = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000010000000000000));
  assign _zz_256_ = {(_zz_261_ == _zz_262_),{_zz_263_,{_zz_264_,_zz_265_}}};
  assign _zz_257_ = (4'b0000);
  assign _zz_258_ = ({_zz_266_,_zz_267_} != (2'b00));
  assign _zz_259_ = ({_zz_268_,_zz_269_} != (2'b00));
  assign _zz_260_ = {(_zz_270_ != _zz_271_),{_zz_272_,{_zz_273_,_zz_274_}}};
  assign _zz_261_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_262_ = (32'b00000000000000000000000000000000);
  assign _zz_263_ = ((decode_INSTRUCTION & _zz_275_) == (32'b00000000000000000000000000000000));
  assign _zz_264_ = (_zz_276_ == _zz_277_);
  assign _zz_265_ = (_zz_278_ == _zz_279_);
  assign _zz_266_ = ((decode_INSTRUCTION & _zz_280_) == (32'b00000000000000000001000001010000));
  assign _zz_267_ = ((decode_INSTRUCTION & _zz_281_) == (32'b00000000000000000010000001010000));
  assign _zz_268_ = _zz_102_;
  assign _zz_269_ = (_zz_282_ == _zz_283_);
  assign _zz_270_ = (_zz_284_ == _zz_285_);
  assign _zz_271_ = (1'b0);
  assign _zz_272_ = ({_zz_286_,_zz_287_} != (2'b00));
  assign _zz_273_ = (_zz_288_ != _zz_289_);
  assign _zz_274_ = {_zz_290_,{_zz_291_,_zz_292_}};
  assign _zz_275_ = (32'b00000000000000000000000000011000);
  assign _zz_276_ = (decode_INSTRUCTION & (32'b00000000000000000110000000000100));
  assign _zz_277_ = (32'b00000000000000000010000000000000);
  assign _zz_278_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000100));
  assign _zz_279_ = (32'b00000000000000000001000000000000);
  assign _zz_280_ = (32'b00000000000000000001000001010000);
  assign _zz_281_ = (32'b00000000000000000010000001010000);
  assign _zz_282_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011100));
  assign _zz_283_ = (32'b00000000000000000000000000000100);
  assign _zz_284_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_285_ = (32'b00000000000000000000000001000000);
  assign _zz_286_ = ((decode_INSTRUCTION & _zz_293_) == (32'b00000000000000000000000000100100));
  assign _zz_287_ = ((decode_INSTRUCTION & _zz_294_) == (32'b00000000000000000001000000010000));
  assign _zz_288_ = _zz_103_;
  assign _zz_289_ = (1'b0);
  assign _zz_290_ = ({_zz_295_,_zz_296_} != (2'b00));
  assign _zz_291_ = (_zz_101_ != (1'b0));
  assign _zz_292_ = {(_zz_297_ != _zz_298_),{_zz_299_,{_zz_300_,_zz_301_}}};
  assign _zz_293_ = (32'b00000000000000000000000001100100);
  assign _zz_294_ = (32'b00000000000000000011000001010100);
  assign _zz_295_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010000)) == (32'b00000000000000000010000000000000));
  assign _zz_296_ = ((decode_INSTRUCTION & (32'b00000000000000000101000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_297_ = ((decode_INSTRUCTION & (32'b00010000000000000011000001010000)) == (32'b00000000000000000000000001010000));
  assign _zz_298_ = (1'b0);
  assign _zz_299_ = ({_zz_103_,(_zz_302_ == _zz_303_)} != (2'b00));
  assign _zz_300_ = ((_zz_304_ == _zz_305_) != (1'b0));
  assign _zz_301_ = {({_zz_306_,_zz_307_} != (2'b00)),{(_zz_308_ != _zz_309_),{_zz_310_,{_zz_311_,_zz_312_}}}};
  assign _zz_302_ = (decode_INSTRUCTION & (32'b00010000010000000011000001010000));
  assign _zz_303_ = (32'b00010000000000000000000001010000);
  assign _zz_304_ = (decode_INSTRUCTION & (32'b00000000000000000111000001010100));
  assign _zz_305_ = (32'b00000000000000000101000000010000);
  assign _zz_306_ = ((decode_INSTRUCTION & _zz_313_) == (32'b01000000000000000001000000010000));
  assign _zz_307_ = ((decode_INSTRUCTION & _zz_314_) == (32'b00000000000000000001000000010000));
  assign _zz_308_ = {(_zz_315_ == _zz_316_),(_zz_317_ == _zz_318_)};
  assign _zz_309_ = (2'b00);
  assign _zz_310_ = ({_zz_319_,{_zz_320_,_zz_321_}} != (3'b000));
  assign _zz_311_ = ({_zz_322_,_zz_323_} != (6'b000000));
  assign _zz_312_ = {(_zz_324_ != _zz_325_),{_zz_326_,{_zz_327_,_zz_328_}}};
  assign _zz_313_ = (32'b01000000000000000011000001010100);
  assign _zz_314_ = (32'b00000000000000000111000001010100);
  assign _zz_315_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110100));
  assign _zz_316_ = (32'b00000000000000000000000000100000);
  assign _zz_317_ = (decode_INSTRUCTION & (32'b00000000000000000000000001100100));
  assign _zz_318_ = (32'b00000000000000000000000000100000);
  assign _zz_319_ = ((decode_INSTRUCTION & _zz_329_) == (32'b00000000000000000000000001000000));
  assign _zz_320_ = (_zz_330_ == _zz_331_);
  assign _zz_321_ = (_zz_332_ == _zz_333_);
  assign _zz_322_ = _zz_102_;
  assign _zz_323_ = {_zz_334_,{_zz_335_,_zz_336_}};
  assign _zz_324_ = (_zz_337_ == _zz_338_);
  assign _zz_325_ = (1'b0);
  assign _zz_326_ = ({_zz_339_,_zz_340_} != (2'b00));
  assign _zz_327_ = (_zz_341_ != _zz_342_);
  assign _zz_328_ = {_zz_343_,{_zz_344_,_zz_345_}};
  assign _zz_329_ = (32'b00000000000000000000000001000100);
  assign _zz_330_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_331_ = (32'b00000000000000000010000000010000);
  assign _zz_332_ = (decode_INSTRUCTION & (32'b01000000000000000100000000110100));
  assign _zz_333_ = (32'b01000000000000000000000000110000);
  assign _zz_334_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000010000)) == (32'b00000000000000000001000000010000));
  assign _zz_335_ = ((decode_INSTRUCTION & _zz_346_) == (32'b00000000000000000010000000010000));
  assign _zz_336_ = {_zz_101_,{_zz_347_,_zz_348_}};
  assign _zz_337_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_338_ = (32'b00000000000000000000000000000000);
  assign _zz_339_ = ((decode_INSTRUCTION & _zz_349_) == (32'b00000000000000000000000000000100));
  assign _zz_340_ = _zz_100_;
  assign _zz_341_ = {(_zz_350_ == _zz_351_),_zz_100_};
  assign _zz_342_ = (2'b00);
  assign _zz_343_ = ((_zz_352_ == _zz_353_) != (1'b0));
  assign _zz_344_ = ({_zz_354_,_zz_355_} != (2'b00));
  assign _zz_345_ = ({_zz_356_,_zz_357_} != (2'b00));
  assign _zz_346_ = (32'b00000000000000000010000000010000);
  assign _zz_347_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000001100)) == (32'b00000000000000000000000000000100));
  assign _zz_348_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000101000)) == (32'b00000000000000000000000000000000));
  assign _zz_349_ = (32'b00000000000000000000000000010100);
  assign _zz_350_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_351_ = (32'b00000000000000000000000000000100);
  assign _zz_352_ = (decode_INSTRUCTION & (32'b00000000000000000000000000010000));
  assign _zz_353_ = (32'b00000000000000000000000000010000);
  assign _zz_354_ = _zz_99_;
  assign _zz_355_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001110000)) == (32'b00000000000000000000000000100000));
  assign _zz_356_ = _zz_99_;
  assign _zz_357_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_358_ = execute_INSTRUCTION[31];
  assign _zz_359_ = execute_INSTRUCTION[31];
  assign _zz_360_ = execute_INSTRUCTION[7];
  assign _zz_361_ = ((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_221_))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_222_)));
  assign _zz_362_ = (DebugPlugin_hardwareBreakpoints_2_valid && (DebugPlugin_hardwareBreakpoints_2_pc == _zz_223_));
  assign _zz_363_ = (DebugPlugin_hardwareBreakpoints_3_pc == _zz_224_);
  always @ (posedge clk) begin
    if(_zz_42_) begin
      RegFilePlugin_regFile[execute_RegFilePlugin_regFileWrite_payload_address] <= execute_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_111_) begin
      _zz_148_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_111_) begin
      _zz_149_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(*) begin
    case(_zz_236_)
      2'b00 : begin
        _zz_150_ = BranchPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_150_ = CsrPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_150_ = IBusSimplePlugin_pcs_2;
      end
    endcase
  end

  always @(*) begin
    case(_zz_140_)
      2'b00 : begin
        _zz_151_ = DBusSimplePlugin_memoryExceptionPort_payload_code;
        _zz_152_ = DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
      end
      2'b01 : begin
        _zz_151_ = BranchPlugin_branchExceptionPort_payload_code;
        _zz_152_ = BranchPlugin_branchExceptionPort_payload_badAddr;
      end
      default : begin
        _zz_151_ = CsrPlugin_selfException_payload_code;
        _zz_152_ = CsrPlugin_selfException_payload_badAddr;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_1_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_1__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_1__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_1__string = "BITWISE ";
      default : _zz_1__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_2__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_2__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_2__string = "BITWISE ";
      default : _zz_2__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_3__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_3__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_3__string = "BITWISE ";
      default : _zz_3__string = "????????";
    endcase
  end
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
    case(_zz_4_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_4__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_4__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_4__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_4__string = "SRA_1    ";
      default : _zz_4__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_5__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_5__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_5__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_5__string = "SRA_1    ";
      default : _zz_5__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_6__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_6__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_6__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_6__string = "SRA_1    ";
      default : _zz_6__string = "?????????";
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
    case(_zz_7_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_7__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_7__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_7__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_7__string = "PC ";
      default : _zz_7__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_8__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_8__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_8__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_8__string = "PC ";
      default : _zz_8__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_9__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_9__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_9__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_9__string = "PC ";
      default : _zz_9__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_10__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_10__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_10__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_10__string = "JALR";
      default : _zz_10__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_11__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_11__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_11__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_11__string = "JALR";
      default : _zz_11__string = "????";
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
    case(_zz_12_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_12__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_12__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_12__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_12__string = "URS1        ";
      default : _zz_12__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_13__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_13__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_13__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_13__string = "URS1        ";
      default : _zz_13__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_14__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_14__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_14__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_14__string = "URS1        ";
      default : _zz_14__string = "????????????";
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
    case(_zz_15_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_15__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_15__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_15__string = "AND_1";
      default : _zz_15__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_16__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_16__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_16__string = "AND_1";
      default : _zz_16__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_17__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_17__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_17__string = "AND_1";
      default : _zz_17__string = "?????";
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
    case(_zz_18_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_18__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_18__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_18__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_18__string = "EBREAK";
      default : _zz_18__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_19__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_19__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_19__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_19__string = "EBREAK";
      default : _zz_19__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_20_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_20__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_20__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_20__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_20__string = "EBREAK";
      default : _zz_20__string = "??????";
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
    case(_zz_24_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_24__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_24__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_24__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_24__string = "EBREAK";
      default : _zz_24__string = "??????";
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
    case(_zz_27_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_27__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_27__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_27__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_27__string = "JALR";
      default : _zz_27__string = "????";
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
    case(_zz_30_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_30__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_30__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_30__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_30__string = "SRA_1    ";
      default : _zz_30__string = "?????????";
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
    case(_zz_34_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_34__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_34__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_34__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_34__string = "PC ";
      default : _zz_34__string = "???";
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
    case(_zz_36_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_36__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_36__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_36__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_36__string = "URS1        ";
      default : _zz_36__string = "????????????";
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
    case(_zz_39_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_39__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_39__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_39__string = "BITWISE ";
      default : _zz_39__string = "????????";
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
    case(_zz_41_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_41__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_41__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_41__string = "AND_1";
      default : _zz_41__string = "?????";
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
    case(_zz_47_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_47__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_47__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_47__string = "AND_1";
      default : _zz_47__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_49_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_49__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_49__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_49__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_49__string = "JALR";
      default : _zz_49__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_53_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_53__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_53__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_53__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_53__string = "EBREAK";
      default : _zz_53__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_54_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_54__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_54__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_54__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_54__string = "SRA_1    ";
      default : _zz_54__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_58_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_58__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_58__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_58__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_58__string = "URS1        ";
      default : _zz_58__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_59_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_59__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_59__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_59__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_59__string = "PC ";
      default : _zz_59__string = "???";
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
    case(_zz_64_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_64__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_64__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_64__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_64__string = "JALR";
      default : _zz_64__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_104_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_104__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_104__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_104__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_104__string = "PC ";
      default : _zz_104__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_105_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_105__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_105__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_105__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_105__string = "URS1        ";
      default : _zz_105__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_106_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_106__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_106__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_106__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_106__string = "SRA_1    ";
      default : _zz_106__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_107_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_107__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_107__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_107__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_107__string = "EBREAK";
      default : _zz_107__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_108_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_108__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_108__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_108__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_108__string = "JALR";
      default : _zz_108__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_109_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_109__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_109__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_109__string = "AND_1";
      default : _zz_109__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_110_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_110__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_110__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_110__string = "BITWISE ";
      default : _zz_110__string = "????????";
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
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
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
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
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
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  `endif

  assign decode_MEMORY_ENABLE = _zz_57_;
  assign decode_SRC_LESS_UNSIGNED = _zz_52_;
  assign decode_CSR_WRITE_OPCODE = _zz_23_;
  assign decode_IS_CSR = _zz_48_;
  assign decode_MEMORY_STORE = _zz_45_;
  assign decode_ALU_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign decode_SHIFT_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign decode_SRC2_CTRL = _zz_7_;
  assign _zz_8_ = _zz_9_;
  assign _zz_10_ = _zz_11_;
  assign decode_SRC1_CTRL = _zz_12_;
  assign _zz_13_ = _zz_14_;
  assign decode_DO_EBREAK = _zz_21_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign decode_PREDICTION_HAD_BRANCHED2 = _zz_29_;
  assign decode_SRC2_FORCE_ZERO = _zz_38_;
  assign decode_ALU_BITWISE_CTRL = _zz_15_;
  assign _zz_16_ = _zz_17_;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_66_;
  assign decode_CSR_READ_OPCODE = _zz_22_;
  assign decode_ENV_CTRL = _zz_18_;
  assign _zz_19_ = _zz_20_;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_51_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign execute_ENV_CTRL = _zz_24_;
  assign execute_BRANCH_CALC = _zz_25_;
  assign execute_BRANCH_DO = _zz_26_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_RS1 = _zz_44_;
  assign execute_BRANCH_COND_RESULT = _zz_28_;
  assign execute_BRANCH_CTRL = _zz_27_;
  assign execute_SHIFT_CTRL = _zz_30_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign execute_SRC2_CTRL = _zz_34_;
  assign execute_SRC1_CTRL = _zz_36_;
  assign decode_SRC_USE_SUB_LESS = _zz_55_;
  assign decode_SRC_ADD_ZERO = _zz_50_;
  assign execute_SRC_ADD_SUB = _zz_33_;
  assign execute_SRC_LESS = _zz_31_;
  assign execute_ALU_CTRL = _zz_39_;
  assign execute_SRC2 = _zz_35_;
  assign execute_SRC1 = _zz_37_;
  assign execute_ALU_BITWISE_CTRL = _zz_41_;
  always @ (*) begin
    _zz_42_ = 1'b0;
    if(execute_RegFilePlugin_regFileWrite_valid)begin
      _zz_42_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_56_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_60_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! execute_DBusSimplePlugin_cmdSent)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_MEMORY_STORE)) && (! dBus_rsp_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((execute_arbitration_isValid && execute_MEMORY_ENABLE))begin
      _zz_60_ = execute_DBusSimplePlugin_rspFormated;
    end
    if(_zz_153_)begin
      _zz_60_ = _zz_119_;
      if(_zz_154_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_60_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_MEMORY_ADDRESS_LOW = _zz_62_;
  assign execute_MEMORY_READ_DATA = _zz_61_;
  assign execute_REGFILE_WRITE_DATA = _zz_40_;
  assign execute_SRC_ADD = _zz_32_;
  assign execute_RS2 = _zz_43_;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = _zz_63_;
  assign decode_BRANCH_CTRL = _zz_64_;
  always @ (*) begin
    _zz_65_ = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      _zz_65_ = IBusSimplePlugin_pcs_2;
    end
  end

  assign decode_PC = _zz_68_;
  always @ (*) begin
    decode_INSTRUCTION = _zz_67_;
    if((_zz_144_ != (3'b000)))begin
      decode_INSTRUCTION = IBusSimplePlugin_injectionPort_payload_regNext;
    end
  end

  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    decode_arbitration_isValid = (IBusSimplePlugin_iBusRsp_decodeInput_valid && (! IBusSimplePlugin_injector_decodeRemoved));
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(_zz_144_)
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
    if(((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)) != (1'b0)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_flushAll = 1'b0;
    execute_arbitration_haltByOther = 1'b0;
    execute_arbitration_removeIt = 1'b0;
    IBusSimplePlugin_fetcherHalt = 1'b0;
    IBusSimplePlugin_fetcherflushIt = 1'b0;
    CsrPlugin_jumpInterface_valid = 1'b0;
    CsrPlugin_jumpInterface_payload = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(BranchPlugin_jumpInterface_valid)begin
      decode_arbitration_flushAll = 1'b1;
    end
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(_zz_155_)begin
      decode_arbitration_flushAll = 1'b1;
      execute_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode} != (2'b00)))begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_156_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
      decode_arbitration_flushAll = 1'b1;
    end
    if(_zz_157_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
      CsrPlugin_jumpInterface_valid = 1'b1;
      decode_arbitration_flushAll = 1'b1;
      case(_zz_158_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
    if(_zz_159_)begin
      execute_arbitration_haltByOther = 1'b1;
      if(_zz_160_)begin
        IBusSimplePlugin_fetcherflushIt = 1'b1;
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_161_)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(_zz_159_)begin
      if(_zz_160_)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
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

  assign IBusSimplePlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid}} != (3'b000));
  assign _zz_69_ = {IBusSimplePlugin_predictionJumpInterface_valid,{CsrPlugin_jumpInterface_valid,BranchPlugin_jumpInterface_valid}};
  assign _zz_70_ = (_zz_69_ & (~ _zz_167_));
  assign _zz_71_ = _zz_70_[1];
  assign _zz_72_ = _zz_70_[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_150_;
  assign _zz_73_ = (! IBusSimplePlugin_fetcherHalt);
  assign IBusSimplePlugin_fetchPc_output_valid = (IBusSimplePlugin_fetchPc_preOutput_valid && _zz_73_);
  assign IBusSimplePlugin_fetchPc_preOutput_ready = (IBusSimplePlugin_fetchPc_output_ready && _zz_73_);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_preOutput_payload;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_propagatePc = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_iBusRsp_stages_1_input_ready))begin
      IBusSimplePlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_169_);
    IBusSimplePlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusSimplePlugin_fetchPc_propagatePc)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    if(_zz_162_)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusSimplePlugin_fetchPc_preOutput_valid = _zz_74_;
  assign IBusSimplePlugin_fetchPc_preOutput_payload = IBusSimplePlugin_fetchPc_pc;
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

  assign _zz_75_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_75_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_75_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_76_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_76_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_76_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_77_;
  assign _zz_77_ = ((1'b0 && (! _zz_78_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_78_ = _zz_79_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_78_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if((! IBusSimplePlugin_pcValids_0))begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_iBusRsp_decodeInput_ready = (! decode_arbitration_isStuck);
  assign _zz_68_ = IBusSimplePlugin_iBusRsp_decodeInput_payload_pc;
  assign _zz_67_ = IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst;
  assign _zz_66_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign _zz_80_ = _zz_170_[11];
  always @ (*) begin
    _zz_81_[18] = _zz_80_;
    _zz_81_[17] = _zz_80_;
    _zz_81_[16] = _zz_80_;
    _zz_81_[15] = _zz_80_;
    _zz_81_[14] = _zz_80_;
    _zz_81_[13] = _zz_80_;
    _zz_81_[12] = _zz_80_;
    _zz_81_[11] = _zz_80_;
    _zz_81_[10] = _zz_80_;
    _zz_81_[9] = _zz_80_;
    _zz_81_[8] = _zz_80_;
    _zz_81_[7] = _zz_80_;
    _zz_81_[6] = _zz_80_;
    _zz_81_[5] = _zz_80_;
    _zz_81_[4] = _zz_80_;
    _zz_81_[3] = _zz_80_;
    _zz_81_[2] = _zz_80_;
    _zz_81_[1] = _zz_80_;
    _zz_81_[0] = _zz_80_;
  end

  always @ (*) begin
    IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_171_[31]));
    if(_zz_86_)begin
      IBusSimplePlugin_decodePrediction_cmd_hadBranch = 1'b0;
    end
  end

  assign _zz_82_ = _zz_172_[19];
  always @ (*) begin
    _zz_83_[10] = _zz_82_;
    _zz_83_[9] = _zz_82_;
    _zz_83_[8] = _zz_82_;
    _zz_83_[7] = _zz_82_;
    _zz_83_[6] = _zz_82_;
    _zz_83_[5] = _zz_82_;
    _zz_83_[4] = _zz_82_;
    _zz_83_[3] = _zz_82_;
    _zz_83_[2] = _zz_82_;
    _zz_83_[1] = _zz_82_;
    _zz_83_[0] = _zz_82_;
  end

  assign _zz_84_ = _zz_173_[11];
  always @ (*) begin
    _zz_85_[18] = _zz_84_;
    _zz_85_[17] = _zz_84_;
    _zz_85_[16] = _zz_84_;
    _zz_85_[15] = _zz_84_;
    _zz_85_[14] = _zz_84_;
    _zz_85_[13] = _zz_84_;
    _zz_85_[12] = _zz_84_;
    _zz_85_[11] = _zz_84_;
    _zz_85_[10] = _zz_84_;
    _zz_85_[9] = _zz_84_;
    _zz_85_[8] = _zz_84_;
    _zz_85_[7] = _zz_84_;
    _zz_85_[6] = _zz_84_;
    _zz_85_[5] = _zz_84_;
    _zz_85_[4] = _zz_84_;
    _zz_85_[3] = _zz_84_;
    _zz_85_[2] = _zz_84_;
    _zz_85_[1] = _zz_84_;
    _zz_85_[0] = _zz_84_;
  end

  always @ (*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_86_ = _zz_174_[1];
      end
      default : begin
        _zz_86_ = _zz_175_[1];
      end
    endcase
  end

  assign IBusSimplePlugin_predictionJumpInterface_valid = (IBusSimplePlugin_decodePrediction_cmd_hadBranch && decode_arbitration_isFiring);
  assign _zz_87_ = _zz_176_[19];
  always @ (*) begin
    _zz_88_[10] = _zz_87_;
    _zz_88_[9] = _zz_87_;
    _zz_88_[8] = _zz_87_;
    _zz_88_[7] = _zz_87_;
    _zz_88_[6] = _zz_87_;
    _zz_88_[5] = _zz_87_;
    _zz_88_[4] = _zz_87_;
    _zz_88_[3] = _zz_87_;
    _zz_88_[2] = _zz_87_;
    _zz_88_[1] = _zz_87_;
    _zz_88_[0] = _zz_87_;
  end

  assign _zz_89_ = _zz_177_[11];
  always @ (*) begin
    _zz_90_[18] = _zz_89_;
    _zz_90_[17] = _zz_89_;
    _zz_90_[16] = _zz_89_;
    _zz_90_[15] = _zz_89_;
    _zz_90_[14] = _zz_89_;
    _zz_90_[13] = _zz_89_;
    _zz_90_[12] = _zz_89_;
    _zz_90_[11] = _zz_89_;
    _zz_90_[10] = _zz_89_;
    _zz_90_[9] = _zz_89_;
    _zz_90_[8] = _zz_89_;
    _zz_90_[7] = _zz_89_;
    _zz_90_[6] = _zz_89_;
    _zz_90_[5] = _zz_89_;
    _zz_90_[4] = _zz_89_;
    _zz_90_[3] = _zz_89_;
    _zz_90_[2] = _zz_89_;
    _zz_90_[1] = _zz_89_;
    _zz_90_[0] = _zz_89_;
  end

  assign IBusSimplePlugin_pcs_2 = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_88_,{{{_zz_237_,decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_90_,{{{_zz_238_,_zz_239_},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_178_ - iBus_rsp_valid);
  assign IBusSimplePlugin_cmd_valid = ((IBusSimplePlugin_iBusRsp_stages_0_input_valid && (IBusSimplePlugin_pendingCmd != (1'b1))) && (! ({execute_arbitration_isValid,decode_arbitration_isValid} != (2'b00))));
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
  assign _zz_91_ = (! (IBusSimplePlugin_rspJoin_exceptionDetected || IBusSimplePlugin_rspJoin_redoRequired));
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_decodeInput_ready && _zz_91_);
  assign IBusSimplePlugin_iBusRsp_decodeInput_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_91_);
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_63_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
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
        _zz_92_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_92_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_92_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_92_;
  assign _zz_62_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_93_ = (4'b0001);
      end
      2'b01 : begin
        _zz_93_ = (4'b0011);
      end
      default : begin
        _zz_93_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_93_ <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign _zz_61_ = dBus_rsp_data;
  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    DBusSimplePlugin_memoryExceptionPort_payload_code = (4'bxxxx);
    if(execute_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_179_};
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if((! ((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (1'b0 || (! execute_arbitration_isStuckByOthers)))))begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = execute_REGFILE_WRITE_DATA;
  always @ (*) begin
    execute_DBusSimplePlugin_rspShifted = execute_MEMORY_READ_DATA;
    case(execute_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        execute_DBusSimplePlugin_rspShifted[7 : 0] = execute_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        execute_DBusSimplePlugin_rspShifted[15 : 0] = execute_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        execute_DBusSimplePlugin_rspShifted[7 : 0] = execute_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_94_ = (execute_DBusSimplePlugin_rspShifted[7] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_95_[31] = _zz_94_;
    _zz_95_[30] = _zz_94_;
    _zz_95_[29] = _zz_94_;
    _zz_95_[28] = _zz_94_;
    _zz_95_[27] = _zz_94_;
    _zz_95_[26] = _zz_94_;
    _zz_95_[25] = _zz_94_;
    _zz_95_[24] = _zz_94_;
    _zz_95_[23] = _zz_94_;
    _zz_95_[22] = _zz_94_;
    _zz_95_[21] = _zz_94_;
    _zz_95_[20] = _zz_94_;
    _zz_95_[19] = _zz_94_;
    _zz_95_[18] = _zz_94_;
    _zz_95_[17] = _zz_94_;
    _zz_95_[16] = _zz_94_;
    _zz_95_[15] = _zz_94_;
    _zz_95_[14] = _zz_94_;
    _zz_95_[13] = _zz_94_;
    _zz_95_[12] = _zz_94_;
    _zz_95_[11] = _zz_94_;
    _zz_95_[10] = _zz_94_;
    _zz_95_[9] = _zz_94_;
    _zz_95_[8] = _zz_94_;
    _zz_95_[7 : 0] = execute_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_96_ = (execute_DBusSimplePlugin_rspShifted[15] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_97_[31] = _zz_96_;
    _zz_97_[30] = _zz_96_;
    _zz_97_[29] = _zz_96_;
    _zz_97_[28] = _zz_96_;
    _zz_97_[27] = _zz_96_;
    _zz_97_[26] = _zz_96_;
    _zz_97_[25] = _zz_96_;
    _zz_97_[24] = _zz_96_;
    _zz_97_[23] = _zz_96_;
    _zz_97_[22] = _zz_96_;
    _zz_97_[21] = _zz_96_;
    _zz_97_[20] = _zz_96_;
    _zz_97_[19] = _zz_96_;
    _zz_97_[18] = _zz_96_;
    _zz_97_[17] = _zz_96_;
    _zz_97_[16] = _zz_96_;
    _zz_97_[15 : 0] = execute_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_165_)
      2'b00 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_95_;
      end
      2'b01 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_97_;
      end
      default : begin
        execute_DBusSimplePlugin_rspFormated = execute_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_99_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_100_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_101_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000010000));
  assign _zz_102_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_103_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign _zz_98_ = {(((decode_INSTRUCTION & _zz_240_) == (32'b00000000000000000000000000100000)) != (1'b0)),{((_zz_241_ == _zz_242_) != (1'b0)),{({_zz_243_,_zz_244_} != (2'b00)),{(_zz_245_ != _zz_246_),{_zz_247_,{_zz_248_,_zz_249_}}}}}};
  assign _zz_104_ = _zz_98_[1 : 0];
  assign _zz_59_ = _zz_104_;
  assign _zz_105_ = _zz_98_[4 : 3];
  assign _zz_58_ = _zz_105_;
  assign _zz_57_ = _zz_180_[0];
  assign _zz_56_ = _zz_181_[0];
  assign _zz_55_ = _zz_182_[0];
  assign _zz_106_ = _zz_98_[10 : 9];
  assign _zz_54_ = _zz_106_;
  assign _zz_107_ = _zz_98_[12 : 11];
  assign _zz_53_ = _zz_107_;
  assign _zz_52_ = _zz_183_[0];
  assign _zz_51_ = _zz_184_[0];
  assign _zz_50_ = _zz_185_[0];
  assign _zz_108_ = _zz_98_[18 : 17];
  assign _zz_49_ = _zz_108_;
  assign _zz_48_ = _zz_186_[0];
  assign _zz_109_ = _zz_98_[22 : 21];
  assign _zz_47_ = _zz_109_;
  assign _zz_110_ = _zz_98_[24 : 23];
  assign _zz_46_ = _zz_110_;
  assign _zz_45_ = _zz_187_[0];
  assign execute_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign _zz_111_ = (! execute_arbitration_isStuck);
  assign execute_RegFilePlugin_rs1Data = _zz_148_;
  assign execute_RegFilePlugin_rs2Data = _zz_149_;
  assign _zz_44_ = execute_RegFilePlugin_rs1Data;
  assign _zz_43_ = execute_RegFilePlugin_rs2Data;
  assign execute_RegFilePlugin_regFileWrite_valid = (execute_REGFILE_WRITE_VALID && execute_arbitration_isFiring);
  assign execute_RegFilePlugin_regFileWrite_payload_address = execute_INSTRUCTION[11 : 7];
  assign execute_RegFilePlugin_regFileWrite_payload_data = _zz_60_;
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
        _zz_112_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_112_ = {31'd0, _zz_188_};
      end
      default : begin
        _zz_112_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_40_ = _zz_112_;
  assign _zz_38_ = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_113_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_113_ = {29'd0, _zz_189_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_113_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_113_ = {27'd0, _zz_190_};
      end
    endcase
  end

  assign _zz_37_ = _zz_113_;
  assign _zz_114_ = _zz_191_[11];
  always @ (*) begin
    _zz_115_[19] = _zz_114_;
    _zz_115_[18] = _zz_114_;
    _zz_115_[17] = _zz_114_;
    _zz_115_[16] = _zz_114_;
    _zz_115_[15] = _zz_114_;
    _zz_115_[14] = _zz_114_;
    _zz_115_[13] = _zz_114_;
    _zz_115_[12] = _zz_114_;
    _zz_115_[11] = _zz_114_;
    _zz_115_[10] = _zz_114_;
    _zz_115_[9] = _zz_114_;
    _zz_115_[8] = _zz_114_;
    _zz_115_[7] = _zz_114_;
    _zz_115_[6] = _zz_114_;
    _zz_115_[5] = _zz_114_;
    _zz_115_[4] = _zz_114_;
    _zz_115_[3] = _zz_114_;
    _zz_115_[2] = _zz_114_;
    _zz_115_[1] = _zz_114_;
    _zz_115_[0] = _zz_114_;
  end

  assign _zz_116_ = _zz_192_[11];
  always @ (*) begin
    _zz_117_[19] = _zz_116_;
    _zz_117_[18] = _zz_116_;
    _zz_117_[17] = _zz_116_;
    _zz_117_[16] = _zz_116_;
    _zz_117_[15] = _zz_116_;
    _zz_117_[14] = _zz_116_;
    _zz_117_[13] = _zz_116_;
    _zz_117_[12] = _zz_116_;
    _zz_117_[11] = _zz_116_;
    _zz_117_[10] = _zz_116_;
    _zz_117_[9] = _zz_116_;
    _zz_117_[8] = _zz_116_;
    _zz_117_[7] = _zz_116_;
    _zz_117_[6] = _zz_116_;
    _zz_117_[5] = _zz_116_;
    _zz_117_[4] = _zz_116_;
    _zz_117_[3] = _zz_116_;
    _zz_117_[2] = _zz_116_;
    _zz_117_[1] = _zz_116_;
    _zz_117_[0] = _zz_116_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_118_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_118_ = {_zz_115_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_118_ = {_zz_117_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_118_ = execute_PC;
      end
    endcase
  end

  assign _zz_35_ = _zz_118_;
  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_193_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_33_ = execute_SrcPlugin_addSub;
  assign _zz_32_ = execute_SrcPlugin_addSub;
  assign _zz_31_ = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_shiftReg : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_119_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_119_ = _zz_200_;
      end
    endcase
  end

  assign _zz_29_ = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_120_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_120_ == (3'b000))) begin
        _zz_121_ = execute_BranchPlugin_eq;
    end else if((_zz_120_ == (3'b001))) begin
        _zz_121_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_120_ & (3'b101)) == (3'b101)))) begin
        _zz_121_ = (! execute_SRC_LESS);
    end else begin
        _zz_121_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_122_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_122_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_122_ = 1'b1;
      end
      default : begin
        _zz_122_ = _zz_121_;
      end
    endcase
  end

  assign _zz_28_ = _zz_122_;
  assign _zz_123_ = _zz_202_[11];
  always @ (*) begin
    _zz_124_[19] = _zz_123_;
    _zz_124_[18] = _zz_123_;
    _zz_124_[17] = _zz_123_;
    _zz_124_[16] = _zz_123_;
    _zz_124_[15] = _zz_123_;
    _zz_124_[14] = _zz_123_;
    _zz_124_[13] = _zz_123_;
    _zz_124_[12] = _zz_123_;
    _zz_124_[11] = _zz_123_;
    _zz_124_[10] = _zz_123_;
    _zz_124_[9] = _zz_123_;
    _zz_124_[8] = _zz_123_;
    _zz_124_[7] = _zz_123_;
    _zz_124_[6] = _zz_123_;
    _zz_124_[5] = _zz_123_;
    _zz_124_[4] = _zz_123_;
    _zz_124_[3] = _zz_123_;
    _zz_124_[2] = _zz_123_;
    _zz_124_[1] = _zz_123_;
    _zz_124_[0] = _zz_123_;
  end

  assign _zz_125_ = _zz_203_[19];
  always @ (*) begin
    _zz_126_[10] = _zz_125_;
    _zz_126_[9] = _zz_125_;
    _zz_126_[8] = _zz_125_;
    _zz_126_[7] = _zz_125_;
    _zz_126_[6] = _zz_125_;
    _zz_126_[5] = _zz_125_;
    _zz_126_[4] = _zz_125_;
    _zz_126_[3] = _zz_125_;
    _zz_126_[2] = _zz_125_;
    _zz_126_[1] = _zz_125_;
    _zz_126_[0] = _zz_125_;
  end

  assign _zz_127_ = _zz_204_[11];
  always @ (*) begin
    _zz_128_[18] = _zz_127_;
    _zz_128_[17] = _zz_127_;
    _zz_128_[16] = _zz_127_;
    _zz_128_[15] = _zz_127_;
    _zz_128_[14] = _zz_127_;
    _zz_128_[13] = _zz_127_;
    _zz_128_[12] = _zz_127_;
    _zz_128_[11] = _zz_127_;
    _zz_128_[10] = _zz_127_;
    _zz_128_[9] = _zz_127_;
    _zz_128_[8] = _zz_127_;
    _zz_128_[7] = _zz_127_;
    _zz_128_[6] = _zz_127_;
    _zz_128_[5] = _zz_127_;
    _zz_128_[4] = _zz_127_;
    _zz_128_[3] = _zz_127_;
    _zz_128_[2] = _zz_127_;
    _zz_128_[1] = _zz_127_;
    _zz_128_[0] = _zz_127_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_129_ = (_zz_205_[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_129_ = _zz_206_[1];
      end
      default : begin
        _zz_129_ = _zz_207_[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_129_);
  assign _zz_26_ = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
        execute_BranchPlugin_branch_src2 = {_zz_131_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_133_,{{{_zz_358_,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_135_,{{{_zz_359_,_zz_360_},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_211_};
        end
      end
    endcase
  end

  assign _zz_130_ = _zz_208_[11];
  always @ (*) begin
    _zz_131_[19] = _zz_130_;
    _zz_131_[18] = _zz_130_;
    _zz_131_[17] = _zz_130_;
    _zz_131_[16] = _zz_130_;
    _zz_131_[15] = _zz_130_;
    _zz_131_[14] = _zz_130_;
    _zz_131_[13] = _zz_130_;
    _zz_131_[12] = _zz_130_;
    _zz_131_[11] = _zz_130_;
    _zz_131_[10] = _zz_130_;
    _zz_131_[9] = _zz_130_;
    _zz_131_[8] = _zz_130_;
    _zz_131_[7] = _zz_130_;
    _zz_131_[6] = _zz_130_;
    _zz_131_[5] = _zz_130_;
    _zz_131_[4] = _zz_130_;
    _zz_131_[3] = _zz_130_;
    _zz_131_[2] = _zz_130_;
    _zz_131_[1] = _zz_130_;
    _zz_131_[0] = _zz_130_;
  end

  assign _zz_132_ = _zz_209_[19];
  always @ (*) begin
    _zz_133_[10] = _zz_132_;
    _zz_133_[9] = _zz_132_;
    _zz_133_[8] = _zz_132_;
    _zz_133_[7] = _zz_132_;
    _zz_133_[6] = _zz_132_;
    _zz_133_[5] = _zz_132_;
    _zz_133_[4] = _zz_132_;
    _zz_133_[3] = _zz_132_;
    _zz_133_[2] = _zz_132_;
    _zz_133_[1] = _zz_132_;
    _zz_133_[0] = _zz_132_;
  end

  assign _zz_134_ = _zz_210_[11];
  always @ (*) begin
    _zz_135_[18] = _zz_134_;
    _zz_135_[17] = _zz_134_;
    _zz_135_[16] = _zz_134_;
    _zz_135_[15] = _zz_134_;
    _zz_135_[14] = _zz_134_;
    _zz_135_[13] = _zz_134_;
    _zz_135_[12] = _zz_134_;
    _zz_135_[11] = _zz_134_;
    _zz_135_[10] = _zz_134_;
    _zz_135_[9] = _zz_134_;
    _zz_135_[8] = _zz_134_;
    _zz_135_[7] = _zz_134_;
    _zz_135_[6] = _zz_134_;
    _zz_135_[5] = _zz_134_;
    _zz_135_[4] = _zz_134_;
    _zz_135_[3] = _zz_134_;
    _zz_135_[2] = _zz_134_;
    _zz_135_[1] = _zz_134_;
    _zz_135_[0] = _zz_134_;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_25_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign BranchPlugin_jumpInterface_valid = ((execute_arbitration_isValid && (! execute_arbitration_isStuckByOthers)) && execute_BRANCH_DO);
  assign BranchPlugin_jumpInterface_payload = execute_BRANCH_CALC;
  always @ (*) begin
    BranchPlugin_branchExceptionPort_valid = (execute_arbitration_isValid && (execute_BRANCH_DO && execute_BRANCH_CALC[1]));
    if(1'b0)begin
      BranchPlugin_branchExceptionPort_valid = 1'b0;
    end
  end

  assign BranchPlugin_branchExceptionPort_payload_code = (4'b0000);
  assign BranchPlugin_branchExceptionPort_payload_badAddr = execute_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode = 1'b0;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b11);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_136_ = {CsrPlugin_selfException_valid,{BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid}};
  assign _zz_137_ = (_zz_136_ & (~ _zz_212_));
  assign _zz_138_ = _zz_137_[1];
  assign _zz_139_ = _zz_137_[2];
  assign _zz_140_ = {_zz_139_,_zz_138_};
  assign CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
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

  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! (execute_arbitration_isValid != (1'b0))) && IBusSimplePlugin_pcValids_1);
    if((CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute != (1'b0)))begin
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
  assign _zz_23_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_22_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_inWfi = 1'b0;
  assign execute_CsrPlugin_blockedBySideEffects = 1'b0;
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = _zz_141_;
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
        execute_CsrPlugin_readData[31 : 0] = _zz_142_;
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
    case(_zz_166_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_142_ = (_zz_141_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_142_ != (32'b00000000000000000000000000000000));
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_163_)
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
        6'b010100 : begin
        end
        6'b010101 : begin
        end
        6'b010110 : begin
        end
        6'b010111 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_143_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign _zz_21_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || ((((((_zz_361_ || _zz_362_) || (DebugPlugin_hardwareBreakpoints_3_valid && _zz_363_)) || (DebugPlugin_hardwareBreakpoints_4_valid && (DebugPlugin_hardwareBreakpoints_4_pc == _zz_225_))) || (DebugPlugin_hardwareBreakpoints_5_valid && (DebugPlugin_hardwareBreakpoints_5_pc == _zz_226_))) || (DebugPlugin_hardwareBreakpoints_6_valid && (DebugPlugin_hardwareBreakpoints_6_pc == _zz_227_))) || (DebugPlugin_hardwareBreakpoints_7_valid && (DebugPlugin_hardwareBreakpoints_7_pc == _zz_228_)))));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_20_ = decode_ENV_CTRL;
  assign _zz_18_ = _zz_53_;
  assign _zz_24_ = decode_to_execute_ENV_CTRL;
  assign _zz_17_ = decode_ALU_BITWISE_CTRL;
  assign _zz_15_ = _zz_47_;
  assign _zz_41_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_14_ = decode_SRC1_CTRL;
  assign _zz_12_ = _zz_58_;
  assign _zz_36_ = decode_to_execute_SRC1_CTRL;
  assign _zz_11_ = decode_BRANCH_CTRL;
  assign _zz_64_ = _zz_49_;
  assign _zz_27_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_9_ = decode_SRC2_CTRL;
  assign _zz_7_ = _zz_59_;
  assign _zz_34_ = decode_to_execute_SRC2_CTRL;
  assign _zz_6_ = decode_SHIFT_CTRL;
  assign _zz_4_ = _zz_54_;
  assign _zz_30_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_3_ = decode_ALU_CTRL;
  assign _zz_1_ = _zz_46_;
  assign _zz_39_ = decode_to_execute_ALU_CTRL;
  assign decode_arbitration_isFlushed = ({execute_arbitration_flushAll,decode_arbitration_flushAll} != (2'b00));
  assign execute_arbitration_isFlushed = (execute_arbitration_flushAll != (1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (1'b0 || execute_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || 1'b0);
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign iBus_cmd_ready = ((1'b1 && (! iBus_cmd_m2sPipe_valid)) || iBus_cmd_m2sPipe_ready);
  assign iBus_cmd_m2sPipe_valid = _zz_145_;
  assign iBus_cmd_m2sPipe_payload_pc = _zz_146_;
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
        _zz_147_ = (4'b0001);
      end
      2'b01 : begin
        _zz_147_ = (4'b0011);
      end
      default : begin
        _zz_147_ = (4'b1111);
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = _zz_235_[3:0];
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
      _zz_74_ <= 1'b0;
      _zz_79_ <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      IBusSimplePlugin_pendingCmd <= (1'b0);
      IBusSimplePlugin_rspJoin_discardCounter <= (1'b0);
      IBusSimplePlugin_rspJoin_rspBuffer_validReg <= 1'b0;
      execute_DBusSimplePlugin_cmdSent <= 1'b0;
      execute_LightShifterPlugin_isActive <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      _zz_141_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      _zz_144_ <= (3'b000);
      _zz_145_ <= 1'b0;
      dBus_cmd_halfPipe_regs_valid <= 1'b0;
      dBus_cmd_halfPipe_regs_ready <= 1'b1;
    end else begin
      if(IBusSimplePlugin_fetchPc_propagatePc)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_162_)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_samplePcNext)begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      _zz_74_ <= 1'b1;
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        _zz_79_ <= 1'b0;
      end
      if(_zz_77_)begin
        _zz_79_ <= IBusSimplePlugin_iBusRsp_stages_0_output_valid;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || IBusSimplePlugin_fetcherflushIt))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
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
      if((dBus_cmd_valid && dBus_cmd_ready))begin
        execute_DBusSimplePlugin_cmdSent <= 1'b1;
      end
      if((! execute_arbitration_isStuck))begin
        execute_DBusSimplePlugin_cmdSent <= 1'b0;
      end
      if(_zz_153_)begin
        if(_zz_154_)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_156_)begin
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
      if(_zz_157_)begin
        case(_zz_158_)
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
      case(_zz_144_)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid)begin
            _zz_144_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_144_ <= (3'b010);
        end
        3'b010 : begin
          _zz_144_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_144_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_144_ <= (3'b000);
        end
        default : begin
        end
      endcase
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_141_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_229_[0];
            CsrPlugin_mstatus_MIE <= _zz_230_[0];
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
            CsrPlugin_mie_MEIE <= _zz_232_[0];
            CsrPlugin_mie_MTIE <= _zz_233_[0];
            CsrPlugin_mie_MSIE <= _zz_234_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(iBus_cmd_ready)begin
        _zz_145_ <= iBus_cmd_valid;
      end
      if(_zz_164_)begin
        dBus_cmd_halfPipe_regs_valid <= dBus_cmd_valid;
        dBus_cmd_halfPipe_regs_ready <= (! dBus_cmd_valid);
      end else begin
        dBus_cmd_halfPipe_regs_valid <= (! dBus_cmd_halfPipe_ready);
        dBus_cmd_halfPipe_regs_ready <= dBus_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge clk) begin
    if((! execute_arbitration_isStuckByOthers))begin
      execute_LightShifterPlugin_shiftReg <= _zz_60_;
    end
    if(_zz_153_)begin
      if(_zz_154_)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - (5'b00001));
      end
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(execute_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(_zz_155_)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= _zz_151_;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= _zz_152_;
    end
    if(_zz_156_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= execute_PC;
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
      decode_to_execute_ENV_CTRL <= _zz_19_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_65_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_16_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_13_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_10_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_8_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_2_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(((! execute_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_execute)))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
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
          CsrPlugin_mip_MSIP <= _zz_231_[0];
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
      _zz_146_ <= iBus_cmd_payload_pc;
    end
    if(_zz_164_)begin
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
    DebugPlugin_isPipBusy <= (({execute_arbitration_isValid,decode_arbitration_isValid} != (2'b00)) || IBusSimplePlugin_incomingInstruction);
    if(execute_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_60_;
    end
    _zz_143_ <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid)begin
      case(_zz_163_)
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
        6'b010100 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_4_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010101 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_5_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010110 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_6_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'b010111 : begin
          if(debug_bus_cmd_payload_wr)begin
            DebugPlugin_hardwareBreakpoints_7_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        default : begin
        end
      endcase
    end
    if(_zz_159_)begin
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
      DebugPlugin_hardwareBreakpoints_4_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_5_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_6_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_7_valid <= 1'b0;
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_163_)
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
              DebugPlugin_hardwareBreakpoints_0_valid <= _zz_213_[0];
            end
          end
          6'b010001 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_1_valid <= _zz_214_[0];
            end
          end
          6'b010010 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_2_valid <= _zz_215_[0];
            end
          end
          6'b010011 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_3_valid <= _zz_216_[0];
            end
          end
          6'b010100 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_4_valid <= _zz_217_[0];
            end
          end
          6'b010101 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_5_valid <= _zz_218_[0];
            end
          end
          6'b010110 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_6_valid <= _zz_219_[0];
            end
          end
          6'b010111 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_7_valid <= _zz_220_[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_159_)begin
        if(_zz_160_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_161_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end

  always @ (posedge clk) begin
    IBusSimplePlugin_injectionPort_payload_regNext <= IBusSimplePlugin_injectionPort_payload;
  end

endmodule

