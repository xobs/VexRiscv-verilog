// Generator : SpinalHDL v1.3.2    git head : 41815ceafff4e72c2e3a3e1ff7e9ada5202a0d26
// Date      : 03/04/2019, 14:26:53
// Component : VexRiscv


`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10
`define AluBitwiseCtrlEnum_defaultEncoding_SRC1 2'b11

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b11

module VexRiscv (
      input  [31:0] externalResetVector,
      input   timerInterrupt,
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
  reg [31:0] _zz_161_;
  reg [31:0] _zz_162_;
  reg [31:0] _zz_163_;
  reg [3:0] _zz_164_;
  reg [31:0] _zz_165_;
  wire  _zz_166_;
  wire  _zz_167_;
  wire  _zz_168_;
  wire  _zz_169_;
  wire  _zz_170_;
  wire  _zz_171_;
  wire  _zz_172_;
  wire  _zz_173_;
  wire [5:0] _zz_174_;
  wire  _zz_175_;
  wire [1:0] _zz_176_;
  wire [1:0] _zz_177_;
  wire  _zz_178_;
  wire [2:0] _zz_179_;
  wire [2:0] _zz_180_;
  wire [31:0] _zz_181_;
  wire [11:0] _zz_182_;
  wire [31:0] _zz_183_;
  wire [19:0] _zz_184_;
  wire [11:0] _zz_185_;
  wire [0:0] _zz_186_;
  wire [0:0] _zz_187_;
  wire [0:0] _zz_188_;
  wire [0:0] _zz_189_;
  wire [0:0] _zz_190_;
  wire [0:0] _zz_191_;
  wire [0:0] _zz_192_;
  wire [0:0] _zz_193_;
  wire [2:0] _zz_194_;
  wire [4:0] _zz_195_;
  wire [11:0] _zz_196_;
  wire [11:0] _zz_197_;
  wire [31:0] _zz_198_;
  wire [31:0] _zz_199_;
  wire [31:0] _zz_200_;
  wire [31:0] _zz_201_;
  wire [1:0] _zz_202_;
  wire [31:0] _zz_203_;
  wire [1:0] _zz_204_;
  wire [1:0] _zz_205_;
  wire [31:0] _zz_206_;
  wire [32:0] _zz_207_;
  wire [11:0] _zz_208_;
  wire [19:0] _zz_209_;
  wire [11:0] _zz_210_;
  wire [31:0] _zz_211_;
  wire [31:0] _zz_212_;
  wire [31:0] _zz_213_;
  wire [11:0] _zz_214_;
  wire [19:0] _zz_215_;
  wire [11:0] _zz_216_;
  wire [2:0] _zz_217_;
  wire [2:0] _zz_218_;
  wire [2:0] _zz_219_;
  wire [3:0] _zz_220_;
  wire [0:0] _zz_221_;
  wire [0:0] _zz_222_;
  wire [0:0] _zz_223_;
  wire [0:0] _zz_224_;
  wire [0:0] _zz_225_;
  wire [0:0] _zz_226_;
  wire [0:0] _zz_227_;
  wire [0:0] _zz_228_;
  wire [30:0] _zz_229_;
  wire [30:0] _zz_230_;
  wire [30:0] _zz_231_;
  wire [30:0] _zz_232_;
  wire [30:0] _zz_233_;
  wire [30:0] _zz_234_;
  wire [30:0] _zz_235_;
  wire [30:0] _zz_236_;
  wire [0:0] _zz_237_;
  wire [0:0] _zz_238_;
  wire [0:0] _zz_239_;
  wire [0:0] _zz_240_;
  wire [0:0] _zz_241_;
  wire [0:0] _zz_242_;
  wire [6:0] _zz_243_;
  wire [1:0] _zz_244_;
  wire [0:0] _zz_245_;
  wire [7:0] _zz_246_;
  wire  _zz_247_;
  wire [0:0] _zz_248_;
  wire [0:0] _zz_249_;
  wire [31:0] _zz_250_;
  wire [31:0] _zz_251_;
  wire [31:0] _zz_252_;
  wire [31:0] _zz_253_;
  wire  _zz_254_;
  wire [1:0] _zz_255_;
  wire [1:0] _zz_256_;
  wire  _zz_257_;
  wire [0:0] _zz_258_;
  wire [18:0] _zz_259_;
  wire [31:0] _zz_260_;
  wire  _zz_261_;
  wire [0:0] _zz_262_;
  wire [1:0] _zz_263_;
  wire [1:0] _zz_264_;
  wire [1:0] _zz_265_;
  wire  _zz_266_;
  wire [0:0] _zz_267_;
  wire [14:0] _zz_268_;
  wire [31:0] _zz_269_;
  wire [31:0] _zz_270_;
  wire [31:0] _zz_271_;
  wire [31:0] _zz_272_;
  wire [31:0] _zz_273_;
  wire [31:0] _zz_274_;
  wire  _zz_275_;
  wire  _zz_276_;
  wire [1:0] _zz_277_;
  wire [1:0] _zz_278_;
  wire  _zz_279_;
  wire [0:0] _zz_280_;
  wire [11:0] _zz_281_;
  wire [31:0] _zz_282_;
  wire [31:0] _zz_283_;
  wire [31:0] _zz_284_;
  wire [31:0] _zz_285_;
  wire  _zz_286_;
  wire [0:0] _zz_287_;
  wire [0:0] _zz_288_;
  wire [0:0] _zz_289_;
  wire [0:0] _zz_290_;
  wire  _zz_291_;
  wire [0:0] _zz_292_;
  wire [8:0] _zz_293_;
  wire [31:0] _zz_294_;
  wire [31:0] _zz_295_;
  wire  _zz_296_;
  wire  _zz_297_;
  wire [0:0] _zz_298_;
  wire [0:0] _zz_299_;
  wire  _zz_300_;
  wire [0:0] _zz_301_;
  wire [5:0] _zz_302_;
  wire [31:0] _zz_303_;
  wire [31:0] _zz_304_;
  wire  _zz_305_;
  wire  _zz_306_;
  wire [31:0] _zz_307_;
  wire [31:0] _zz_308_;
  wire [0:0] _zz_309_;
  wire [4:0] _zz_310_;
  wire [3:0] _zz_311_;
  wire [3:0] _zz_312_;
  wire  _zz_313_;
  wire [0:0] _zz_314_;
  wire [1:0] _zz_315_;
  wire [31:0] _zz_316_;
  wire [31:0] _zz_317_;
  wire  _zz_318_;
  wire [0:0] _zz_319_;
  wire [1:0] _zz_320_;
  wire [31:0] _zz_321_;
  wire [31:0] _zz_322_;
  wire  _zz_323_;
  wire [0:0] _zz_324_;
  wire [0:0] _zz_325_;
  wire  _zz_326_;
  wire [0:0] _zz_327_;
  wire [0:0] _zz_328_;
  wire  _zz_329_;
  wire [1:0] _zz_330_;
  wire [1:0] _zz_331_;
  wire [1:0] _zz_332_;
  wire [1:0] _zz_333_;
  wire [31:0] _zz_334_;
  wire [31:0] _zz_335_;
  wire [31:0] _zz_336_;
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
  wire  _zz_350_;
  wire  _zz_351_;
  wire  _zz_352_;
  wire  _zz_353_;
  wire  _zz_354_;
  wire  _zz_355_;
  wire  _zz_356_;
  wire  _zz_357_;
  wire  _zz_358_;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_1_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_2_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_3_;
  wire  decode_PREDICTION_HAD_BRANCHED2;
  wire  decode_IS_CSR;
  wire  decode_CSR_READ_OPCODE;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_4_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_5_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_6_;
  wire  execute_REGFILE_WRITE_VALID;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_7_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_8_;
  wire  decode_MEMORY_ENABLE;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_9_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_10_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11_;
  wire  decode_SRC_LESS_UNSIGNED;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_12_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_13_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_14_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_DO_EBREAK;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_15_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_16_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_17_;
  wire  decode_CSR_WRITE_OPCODE;
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
  wire  execute_SRC_USE_SUB_LESS;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_34_;
  wire [31:0] _zz_35_;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_36_;
  wire [31:0] _zz_37_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_38_;
  wire [31:0] _zz_39_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_40_;
  reg  _zz_41_;
  wire [31:0] _zz_42_;
  wire [31:0] _zz_43_;
  reg  decode_REGFILE_WRITE_VALID;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_44_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_45_;
  wire  _zz_46_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_47_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_48_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_49_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_50_;
  wire  _zz_51_;
  wire  _zz_52_;
  wire  _zz_53_;
  wire  _zz_54_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_55_;
  wire  _zz_56_;
  reg [31:0] _zz_57_;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] execute_MEMORY_READ_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire [31:0] _zz_58_;
  wire [1:0] _zz_59_;
  wire [31:0] execute_RS2;
  wire [31:0] execute_SRC_ADD;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_ALIGNEMENT_FAULT;
  wire  execute_MEMORY_ENABLE;
  wire  _zz_60_;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_61_;
  reg [31:0] _zz_62_;
  wire [31:0] _zz_63_;
  wire [31:0] _zz_64_;
  wire [31:0] _zz_65_;
  wire [31:0] decode_PC /* verilator public */ ;
  reg [31:0] decode_INSTRUCTION /* verilator public */ ;
  reg  decode_arbitration_haltItself /* verilator public */ ;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  reg  decode_arbitration_flushAll /* verilator public */ ;
  wire  decode_arbitration_redoIt;
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
  wire  execute_arbitration_redoIt;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  _zz_66_;
  reg  _zz_67_;
  reg  _zz_68_;
  wire  _zz_69_;
  wire [31:0] _zz_70_;
  wire  _zz_71_;
  wire  iBus_cmd_valid;
  wire  iBus_cmd_ready;
  wire [31:0] iBus_cmd_payload_pc;
  wire  iBus_rsp_valid;
  wire  iBus_rsp_payload_error;
  wire [31:0] iBus_rsp_payload_inst;
  reg  _zz_72_;
  wire  _zz_73_;
  reg  _zz_74_;
  reg  _zz_75_;
  reg [31:0] _zz_76_;
  wire  externalInterrupt;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  _zz_77_;
  reg [3:0] _zz_78_;
  reg  _zz_79_;
  reg  _zz_80_;
  reg  _zz_81_;
  reg  _zz_82_;
  wire  IBusSimplePlugin_jump_pcLoad_valid;
  wire [31:0] IBusSimplePlugin_jump_pcLoad_payload;
  wire [2:0] _zz_83_;
  wire [2:0] _zz_84_;
  wire  _zz_85_;
  wire  _zz_86_;
  wire  IBusSimplePlugin_fetchPc_preOutput_valid;
  wire  IBusSimplePlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_preOutput_payload;
  wire  _zz_87_;
  wire  IBusSimplePlugin_fetchPc_output_valid;
  wire  IBusSimplePlugin_fetchPc_output_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_output_payload;
  reg [31:0] IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusSimplePlugin_fetchPc_inc;
  reg  IBusSimplePlugin_fetchPc_propagatePc;
  reg [31:0] IBusSimplePlugin_fetchPc_pc;
  reg  IBusSimplePlugin_fetchPc_samplePcNext;
  reg  _zz_88_;
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
  wire  _zz_89_;
  wire  _zz_90_;
  wire  _zz_91_;
  wire  _zz_92_;
  reg  _zz_93_;
  wire  IBusSimplePlugin_iBusRsp_readyForError;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_valid;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_decodeInput_payload_pc;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_payload_isRvc;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg  IBusSimplePlugin_injector_decodeRemoved;
  wire  _zz_94_;
  reg [18:0] _zz_95_;
  wire  _zz_96_;
  reg [10:0] _zz_97_;
  wire  _zz_98_;
  reg [18:0] _zz_99_;
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
  wire  IBusSimplePlugin_rspJoin_issueDetected;
  wire  IBusSimplePlugin_rspJoin_join_valid;
  wire  IBusSimplePlugin_rspJoin_join_ready;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_pc;
  wire  IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire  IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire  _zz_100_;
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
  reg [31:0] _zz_101_;
  reg [3:0] _zz_102_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] execute_DBusSimplePlugin_rspShifted;
  wire  _zz_103_;
  reg [31:0] _zz_104_;
  wire  _zz_105_;
  reg [31:0] _zz_106_;
  reg [31:0] execute_DBusSimplePlugin_rspFormated;
  wire [24:0] _zz_107_;
  wire  _zz_108_;
  wire  _zz_109_;
  wire  _zz_110_;
  wire  _zz_111_;
  wire  _zz_112_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_113_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_114_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_115_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_116_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_117_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_118_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_119_;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire  _zz_120_;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  execute_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] execute_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] execute_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_121_;
  reg [31:0] _zz_122_;
  wire  _zz_123_;
  reg [19:0] _zz_124_;
  wire  _zz_125_;
  reg [19:0] _zz_126_;
  reg [31:0] _zz_127_;
  wire [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  reg [31:0] execute_LightShifterPlugin_shiftReg;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_128_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_129_;
  reg  _zz_130_;
  reg  _zz_131_;
  wire  _zz_132_;
  reg [19:0] _zz_133_;
  wire  _zz_134_;
  reg [10:0] _zz_135_;
  wire  _zz_136_;
  reg [18:0] _zz_137_;
  reg  _zz_138_;
  wire  execute_BranchPlugin_missAlignedTarget;
  reg [31:0] execute_BranchPlugin_branch_src1;
  reg [31:0] execute_BranchPlugin_branch_src2;
  wire  _zz_139_;
  reg [19:0] _zz_140_;
  wire  _zz_141_;
  reg [10:0] _zz_142_;
  wire  _zz_143_;
  reg [18:0] _zz_144_;
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
  wire [31:0] CsrPlugin_medeleg;
  wire [31:0] CsrPlugin_mideleg;
  wire  _zz_145_;
  wire  _zz_146_;
  wire  _zz_147_;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire  execute_exception_agregat_valid;
  wire [3:0] execute_exception_agregat_payload_code;
  wire [31:0] execute_exception_agregat_payload_badAddr;
  wire [2:0] _zz_148_;
  wire [2:0] _zz_149_;
  wire  _zz_150_;
  wire  _zz_151_;
  wire [1:0] _zz_152_;
  reg  CsrPlugin_interrupt;
  reg [3:0] CsrPlugin_interruptCode /* verilator public */ ;
  wire [1:0] CsrPlugin_interruptTargetPrivilege;
  wire  CsrPlugin_exception;
  wire  CsrPlugin_lastStageWasWfi;
  reg  CsrPlugin_pipelineLiberator_done;
  wire  CsrPlugin_interruptJump /* verilator public */ ;
  reg  CsrPlugin_hadException;
  reg [1:0] CsrPlugin_targetPrivilege;
  reg [3:0] CsrPlugin_trapCause;
  wire  execute_CsrPlugin_blockedBySideEffects;
  reg  execute_CsrPlugin_illegalAccess;
  reg  execute_CsrPlugin_illegalInstruction;
  reg [31:0] execute_CsrPlugin_readData;
  wire  execute_CsrPlugin_writeInstruction;
  wire  execute_CsrPlugin_readInstruction;
  wire  execute_CsrPlugin_writeEnable;
  wire  execute_CsrPlugin_readEnable;
  reg [31:0] execute_CsrPlugin_writeData;
  wire [11:0] execute_CsrPlugin_csrAddress;
  reg [31:0] _zz_153_;
  reg [31:0] externalInterruptArray_regNext;
  wire [31:0] _zz_154_;
  reg  DebugPlugin_firstCycle;
  reg  DebugPlugin_secondCycle;
  reg  DebugPlugin_resetIt;
  reg  DebugPlugin_haltIt;
  reg  DebugPlugin_stepIt;
  reg  DebugPlugin_isPipActive;
  reg  DebugPlugin_isPipActive_regNext;
  wire  DebugPlugin_isPipBusy;
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
  reg  _zz_155_;
  reg  DebugPlugin_resetIt_regNext;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  decode_to_execute_DO_EBREAK;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg  decode_to_execute_IS_CSR;
  reg [31:0] decode_to_execute_PC;
  reg  decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [2:0] _zz_156_;
  reg [31:0] _zz_157_;
  wire  iBus_cmd_m2sPipe_valid;
  wire  iBus_cmd_m2sPipe_ready;
  wire [31:0] iBus_cmd_m2sPipe_payload_pc;
  reg  _zz_158_;
  reg [31:0] _zz_159_;
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
  reg [3:0] _zz_160_;
  `ifndef SYNTHESIS
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_1__string;
  reg [95:0] _zz_2__string;
  reg [95:0] _zz_3__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_4__string;
  reg [71:0] _zz_5__string;
  reg [71:0] _zz_6__string;
  reg [31:0] _zz_7__string;
  reg [31:0] _zz_8__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_9__string;
  reg [39:0] _zz_10__string;
  reg [39:0] _zz_11__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_12__string;
  reg [23:0] _zz_13__string;
  reg [23:0] _zz_14__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_15__string;
  reg [63:0] _zz_16__string;
  reg [63:0] _zz_17__string;
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
  reg [63:0] _zz_38__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_40__string;
  reg [31:0] _zz_44__string;
  reg [47:0] _zz_45__string;
  reg [39:0] _zz_47__string;
  reg [95:0] _zz_48__string;
  reg [71:0] _zz_49__string;
  reg [23:0] _zz_50__string;
  reg [63:0] _zz_55__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_61__string;
  reg [63:0] _zz_113__string;
  reg [23:0] _zz_114__string;
  reg [71:0] _zz_115__string;
  reg [95:0] _zz_116__string;
  reg [39:0] _zz_117__string;
  reg [47:0] _zz_118__string;
  reg [31:0] _zz_119__string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_166_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_167_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_168_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_169_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_170_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_171_ = (1'b0 == 1'b0);
  assign _zz_172_ = (DebugPlugin_stepIt && _zz_68_);
  assign _zz_173_ = (IBusSimplePlugin_fetchPc_preOutput_valid && IBusSimplePlugin_fetchPc_preOutput_ready);
  assign _zz_174_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_175_ = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_176_ = execute_INSTRUCTION[13 : 12];
  assign _zz_177_ = execute_INSTRUCTION[29 : 28];
  assign _zz_178_ = execute_INSTRUCTION[13];
  assign _zz_179_ = (_zz_83_ - (3'b001));
  assign _zz_180_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_181_ = {29'd0, _zz_180_};
  assign _zz_182_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_183_ = {{_zz_95_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_184_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_185_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_186_ = (IBusSimplePlugin_pendingCmd + (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready));
  assign _zz_187_ = _zz_107_[1 : 1];
  assign _zz_188_ = _zz_107_[5 : 5];
  assign _zz_189_ = _zz_107_[6 : 6];
  assign _zz_190_ = _zz_107_[7 : 7];
  assign _zz_191_ = _zz_107_[10 : 10];
  assign _zz_192_ = _zz_107_[20 : 20];
  assign _zz_193_ = execute_SRC_LESS;
  assign _zz_194_ = (3'b100);
  assign _zz_195_ = execute_INSTRUCTION[19 : 15];
  assign _zz_196_ = execute_INSTRUCTION[31 : 20];
  assign _zz_197_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_198_ = ($signed(_zz_199_) + $signed(_zz_203_));
  assign _zz_199_ = ($signed(_zz_200_) + $signed(_zz_201_));
  assign _zz_200_ = execute_SRC1;
  assign _zz_201_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_202_ = (execute_SRC_USE_SUB_LESS ? _zz_204_ : _zz_205_);
  assign _zz_203_ = {{30{_zz_202_[1]}}, _zz_202_};
  assign _zz_204_ = (2'b01);
  assign _zz_205_ = (2'b00);
  assign _zz_206_ = (_zz_207_ >>> 1);
  assign _zz_207_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_208_ = execute_INSTRUCTION[31 : 20];
  assign _zz_209_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_210_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_211_ = {_zz_133_,execute_INSTRUCTION[31 : 20]};
  assign _zz_212_ = {{_zz_135_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_213_ = {{_zz_137_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_214_ = execute_INSTRUCTION[31 : 20];
  assign _zz_215_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_216_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_217_ = (3'b100);
  assign _zz_218_ = (_zz_148_ - (3'b001));
  assign _zz_219_ = (execute_INSTRUCTION[5] ? (3'b110) : (3'b100));
  assign _zz_220_ = {1'd0, _zz_219_};
  assign _zz_221_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_222_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_223_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_224_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_225_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_226_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_227_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_228_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_229_ = (decode_PC >>> 1);
  assign _zz_230_ = (decode_PC >>> 1);
  assign _zz_231_ = (decode_PC >>> 1);
  assign _zz_232_ = (decode_PC >>> 1);
  assign _zz_233_ = (decode_PC >>> 1);
  assign _zz_234_ = (decode_PC >>> 1);
  assign _zz_235_ = (decode_PC >>> 1);
  assign _zz_236_ = (decode_PC >>> 1);
  assign _zz_237_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_238_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_239_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_240_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_241_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_242_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_243_ = ({3'd0,_zz_160_} <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign _zz_244_ = {_zz_86_,_zz_85_};
  assign _zz_245_ = decode_INSTRUCTION[31];
  assign _zz_246_ = decode_INSTRUCTION[19 : 12];
  assign _zz_247_ = decode_INSTRUCTION[20];
  assign _zz_248_ = decode_INSTRUCTION[31];
  assign _zz_249_ = decode_INSTRUCTION[7];
  assign _zz_250_ = (decode_INSTRUCTION & (32'b00000000000000000001000000010100));
  assign _zz_251_ = (32'b00000000000000000000000000000100);
  assign _zz_252_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_253_ = (32'b00000000000000000000000001000000);
  assign _zz_254_ = ((decode_INSTRUCTION & (32'b00010000000000000011000001010000)) == (32'b00000000000000000000000001010000));
  assign _zz_255_ = {_zz_112_,((decode_INSTRUCTION & _zz_260_) == (32'b00010000000000000000000001010000))};
  assign _zz_256_ = (2'b00);
  assign _zz_257_ = (_zz_112_ != (1'b0));
  assign _zz_258_ = ({_zz_261_,_zz_110_} != (2'b00));
  assign _zz_259_ = {({_zz_262_,_zz_263_} != (3'b000)),{(_zz_264_ != _zz_265_),{_zz_266_,{_zz_267_,_zz_268_}}}};
  assign _zz_260_ = (32'b00010000010000000011000001010000);
  assign _zz_261_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_262_ = _zz_110_;
  assign _zz_263_ = {(_zz_269_ == _zz_270_),(_zz_271_ == _zz_272_)};
  assign _zz_264_ = {(_zz_273_ == _zz_274_),_zz_111_};
  assign _zz_265_ = (2'b00);
  assign _zz_266_ = ({_zz_275_,_zz_111_} != (2'b00));
  assign _zz_267_ = (_zz_276_ != (1'b0));
  assign _zz_268_ = {(_zz_277_ != _zz_278_),{_zz_279_,{_zz_280_,_zz_281_}}};
  assign _zz_269_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign _zz_270_ = (32'b00000000000000000001000000000000);
  assign _zz_271_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign _zz_272_ = (32'b00000000000000000010000000000000);
  assign _zz_273_ = (decode_INSTRUCTION & (32'b00000000000000000000000000010100));
  assign _zz_274_ = (32'b00000000000000000000000000000100);
  assign _zz_275_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000000000100));
  assign _zz_276_ = ((decode_INSTRUCTION & (32'b00000000000000000111000001010100)) == (32'b00000000000000000101000000010000));
  assign _zz_277_ = {(_zz_282_ == _zz_283_),(_zz_284_ == _zz_285_)};
  assign _zz_278_ = (2'b00);
  assign _zz_279_ = ({_zz_110_,_zz_286_} != (2'b00));
  assign _zz_280_ = ({_zz_287_,_zz_288_} != (2'b00));
  assign _zz_281_ = {(_zz_289_ != _zz_290_),{_zz_291_,{_zz_292_,_zz_293_}}};
  assign _zz_282_ = (decode_INSTRUCTION & (32'b01000000000000000011000001010100));
  assign _zz_283_ = (32'b01000000000000000001000000010000);
  assign _zz_284_ = (decode_INSTRUCTION & (32'b00000000000000000111000001010100));
  assign _zz_285_ = (32'b00000000000000000001000000010000);
  assign _zz_286_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001110000)) == (32'b00000000000000000000000000100000));
  assign _zz_287_ = _zz_110_;
  assign _zz_288_ = ((decode_INSTRUCTION & _zz_294_) == (32'b00000000000000000000000000000000));
  assign _zz_289_ = ((decode_INSTRUCTION & _zz_295_) == (32'b00000000000000000000000000010000));
  assign _zz_290_ = (1'b0);
  assign _zz_291_ = ({_zz_296_,_zz_297_} != (2'b00));
  assign _zz_292_ = (_zz_108_ != (1'b0));
  assign _zz_293_ = {(_zz_298_ != _zz_299_),{_zz_300_,{_zz_301_,_zz_302_}}};
  assign _zz_294_ = (32'b00000000000000000000000000100000);
  assign _zz_295_ = (32'b00000000000000000000000000010000);
  assign _zz_296_ = ((decode_INSTRUCTION & (32'b00000000000000000001000001010000)) == (32'b00000000000000000001000001010000));
  assign _zz_297_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001010000)) == (32'b00000000000000000010000001010000));
  assign _zz_298_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_299_ = (1'b0);
  assign _zz_300_ = ({(_zz_303_ == _zz_304_),{_zz_305_,_zz_306_}} != (3'b000));
  assign _zz_301_ = ((_zz_307_ == _zz_308_) != (1'b0));
  assign _zz_302_ = {({_zz_309_,_zz_310_} != (6'b000000)),{(_zz_311_ != _zz_312_),{_zz_313_,{_zz_314_,_zz_315_}}}};
  assign _zz_303_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_304_ = (32'b00000000000000000000000001000000);
  assign _zz_305_ = ((decode_INSTRUCTION & (32'b01000000000000000000000000110000)) == (32'b01000000000000000000000000110000));
  assign _zz_306_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_307_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_308_ = (32'b00000000000000000000000000000000);
  assign _zz_309_ = _zz_109_;
  assign _zz_310_ = {(_zz_316_ == _zz_317_),{_zz_318_,{_zz_319_,_zz_320_}}};
  assign _zz_311_ = {(_zz_321_ == _zz_322_),{_zz_323_,{_zz_324_,_zz_325_}}};
  assign _zz_312_ = (4'b0000);
  assign _zz_313_ = ({_zz_326_,{_zz_327_,_zz_328_}} != (3'b000));
  assign _zz_314_ = (_zz_329_ != (1'b0));
  assign _zz_315_ = {(_zz_330_ != _zz_331_),(_zz_332_ != _zz_333_)};
  assign _zz_316_ = (decode_INSTRUCTION & (32'b00000000000000000001000000010000));
  assign _zz_317_ = (32'b00000000000000000001000000010000);
  assign _zz_318_ = ((decode_INSTRUCTION & _zz_334_) == (32'b00000000000000000010000000010000));
  assign _zz_319_ = (_zz_335_ == _zz_336_);
  assign _zz_320_ = {_zz_108_,_zz_337_};
  assign _zz_321_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_322_ = (32'b00000000000000000000000000000000);
  assign _zz_323_ = ((decode_INSTRUCTION & _zz_338_) == (32'b00000000000000000000000000000000));
  assign _zz_324_ = (_zz_339_ == _zz_340_);
  assign _zz_325_ = (_zz_341_ == _zz_342_);
  assign _zz_326_ = ((decode_INSTRUCTION & _zz_343_) == (32'b00000000000000000000000000100100));
  assign _zz_327_ = (_zz_344_ == _zz_345_);
  assign _zz_328_ = (_zz_346_ == _zz_347_);
  assign _zz_329_ = ((decode_INSTRUCTION & _zz_348_) == (32'b00000000000000000010000000010000));
  assign _zz_330_ = {_zz_349_,_zz_350_};
  assign _zz_331_ = (2'b00);
  assign _zz_332_ = {_zz_351_,_zz_352_};
  assign _zz_333_ = (2'b00);
  assign _zz_334_ = (32'b00000000000000000010000000010000);
  assign _zz_335_ = (decode_INSTRUCTION & (32'b00000000000000000001000000000100));
  assign _zz_336_ = (32'b00000000000000000000000000000100);
  assign _zz_337_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000101000)) == (32'b00000000000000000000000000000000));
  assign _zz_338_ = (32'b00000000000000000000000000011000);
  assign _zz_339_ = (decode_INSTRUCTION & (32'b00000000000000000110000000000100));
  assign _zz_340_ = (32'b00000000000000000010000000000000);
  assign _zz_341_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000100));
  assign _zz_342_ = (32'b00000000000000000001000000000000);
  assign _zz_343_ = (32'b00000000000000000000000001100100);
  assign _zz_344_ = (decode_INSTRUCTION & (32'b00000000000000000100000000010100));
  assign _zz_345_ = (32'b00000000000000000100000000010000);
  assign _zz_346_ = (decode_INSTRUCTION & (32'b00000000000000000011000000010100));
  assign _zz_347_ = (32'b00000000000000000001000000010000);
  assign _zz_348_ = (32'b00000000000000000110000000010100);
  assign _zz_349_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010000)) == (32'b00000000000000000010000000000000));
  assign _zz_350_ = ((decode_INSTRUCTION & (32'b00000000000000000101000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_351_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000110100)) == (32'b00000000000000000000000000100000));
  assign _zz_352_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100000));
  assign _zz_353_ = execute_INSTRUCTION[31];
  assign _zz_354_ = execute_INSTRUCTION[31];
  assign _zz_355_ = execute_INSTRUCTION[7];
  assign _zz_356_ = ((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_229_))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_230_)));
  assign _zz_357_ = (DebugPlugin_hardwareBreakpoints_2_valid && (DebugPlugin_hardwareBreakpoints_2_pc == _zz_231_));
  assign _zz_358_ = (DebugPlugin_hardwareBreakpoints_3_pc == _zz_232_);
  always @ (posedge clk) begin
    if(_zz_41_) begin
      RegFilePlugin_regFile[execute_RegFilePlugin_regFileWrite_payload_address] <= execute_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_120_) begin
      _zz_161_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_120_) begin
      _zz_162_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(*) begin
    case(_zz_244_)
      2'b00 : begin
        _zz_163_ = execute_BRANCH_CALC;
      end
      2'b01 : begin
        _zz_163_ = _zz_76_;
      end
      default : begin
        _zz_163_ = _zz_70_;
      end
    endcase
  end

  always @(*) begin
    case(_zz_152_)
      2'b00 : begin
        _zz_164_ = _zz_220_;
        _zz_165_ = execute_REGFILE_WRITE_DATA;
      end
      2'b01 : begin
        _zz_164_ = (4'b0000);
        _zz_165_ = execute_BRANCH_CALC;
      end
      default : begin
        _zz_164_ = _zz_78_;
        _zz_165_ = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
      end
    endcase
  end

  `ifndef SYNTHESIS
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
    case(_zz_1_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_1__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_1__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_1__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_1__string = "URS1        ";
      default : _zz_1__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_2__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_2__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_2__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_2__string = "URS1        ";
      default : _zz_2__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_3__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_3__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_3__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_3__string = "URS1        ";
      default : _zz_3__string = "????????????";
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
    case(_zz_7_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_7__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_7__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_7__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_7__string = "JALR";
      default : _zz_7__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_8__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_8__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_8__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_8__string = "JALR";
      default : _zz_8__string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : decode_ALU_BITWISE_CTRL_string = "SRC1 ";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_9__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_9__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_9__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_9__string = "SRC1 ";
      default : _zz_9__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_10__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_10__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_10__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_10__string = "SRC1 ";
      default : _zz_10__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_11__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_11__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_11__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_11__string = "SRC1 ";
      default : _zz_11__string = "?????";
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
    case(_zz_12_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_12__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_12__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_12__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_12__string = "PC ";
      default : _zz_12__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_13__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_13__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_13__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_13__string = "PC ";
      default : _zz_13__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_14__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_14__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_14__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_14__string = "PC ";
      default : _zz_14__string = "???";
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
    case(_zz_15_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_15__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_15__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_15__string = "BITWISE ";
      default : _zz_15__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_16__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_16__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_16__string = "BITWISE ";
      default : _zz_16__string = "????????";
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
    case(_zz_38_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_38__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_38__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_38__string = "BITWISE ";
      default : _zz_38__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : execute_ALU_BITWISE_CTRL_string = "SRC1 ";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_40_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_40__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_40__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_40__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_40__string = "SRC1 ";
      default : _zz_40__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_44_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_44__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_44__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_44__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_44__string = "JALR";
      default : _zz_44__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_45_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_45__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_45__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_45__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_45__string = "EBREAK";
      default : _zz_45__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_47_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_47__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_47__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_47__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_47__string = "SRC1 ";
      default : _zz_47__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_48_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_48__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_48__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_48__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_48__string = "URS1        ";
      default : _zz_48__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_49_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_49__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_49__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_49__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_49__string = "SRA_1    ";
      default : _zz_49__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_50_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_50__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_50__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_50__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_50__string = "PC ";
      default : _zz_50__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_55_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_55__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_55__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_55__string = "BITWISE ";
      default : _zz_55__string = "????????";
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
    case(_zz_61_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_61__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_61__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_61__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_61__string = "JALR";
      default : _zz_61__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_113_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_113__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_113__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_113__string = "BITWISE ";
      default : _zz_113__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_114_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_114__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_114__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_114__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_114__string = "PC ";
      default : _zz_114__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_115_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_115__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_115__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_115__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_115__string = "SRA_1    ";
      default : _zz_115__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_116_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_116__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_116__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_116__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_116__string = "URS1        ";
      default : _zz_116__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_117_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_117__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_117__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_117__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_117__string = "SRC1 ";
      default : _zz_117__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_118_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_118__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_118__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_118__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_118__string = "EBREAK";
      default : _zz_118__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_119_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_119__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_119__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_119__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_119__string = "JALR";
      default : _zz_119__string = "????";
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
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
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
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : decode_to_execute_ALU_BITWISE_CTRL_string = "SRC1 ";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
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
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
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
  `endif

  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_63_;
  assign decode_SRC1_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign decode_PREDICTION_HAD_BRANCHED2 = _zz_29_;
  assign decode_IS_CSR = _zz_51_;
  assign decode_CSR_READ_OPCODE = _zz_22_;
  assign decode_SHIFT_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign _zz_7_ = _zz_8_;
  assign decode_MEMORY_ENABLE = _zz_53_;
  assign decode_ALU_BITWISE_CTRL = _zz_9_;
  assign _zz_10_ = _zz_11_;
  assign decode_SRC_LESS_UNSIGNED = _zz_56_;
  assign decode_SRC2_CTRL = _zz_12_;
  assign _zz_13_ = _zz_14_;
  assign decode_SRC_USE_SUB_LESS = _zz_52_;
  assign decode_DO_EBREAK = _zz_21_;
  assign decode_ALU_CTRL = _zz_15_;
  assign _zz_16_ = _zz_17_;
  assign decode_CSR_WRITE_OPCODE = _zz_23_;
  assign decode_ENV_CTRL = _zz_18_;
  assign _zz_19_ = _zz_20_;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_46_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign execute_ENV_CTRL = _zz_24_;
  assign execute_BRANCH_CALC = _zz_25_;
  assign execute_BRANCH_DO = _zz_26_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_RS1 = _zz_43_;
  assign execute_BRANCH_COND_RESULT = _zz_28_;
  assign execute_BRANCH_CTRL = _zz_27_;
  assign execute_SHIFT_CTRL = _zz_30_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign execute_SRC2_CTRL = _zz_34_;
  assign execute_SRC1_CTRL = _zz_36_;
  assign execute_SRC_ADD_SUB = _zz_33_;
  assign execute_SRC_LESS = _zz_31_;
  assign execute_ALU_CTRL = _zz_38_;
  assign execute_SRC2 = _zz_35_;
  assign execute_SRC1 = _zz_37_;
  assign execute_ALU_BITWISE_CTRL = _zz_40_;
  always @ (*) begin
    _zz_41_ = 1'b0;
    if(execute_RegFilePlugin_regFileWrite_valid)begin
      _zz_41_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_54_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_57_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_ALIGNEMENT_FAULT)) && (! execute_DBusSimplePlugin_cmdSent)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_INSTRUCTION[5])) && (! dBus_rsp_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((execute_arbitration_isValid && execute_MEMORY_ENABLE))begin
      _zz_57_ = execute_DBusSimplePlugin_rspFormated;
    end
    if(_zz_166_)begin
      _zz_57_ = _zz_128_;
      if(_zz_167_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_57_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_MEMORY_ADDRESS_LOW = _zz_59_;
  assign execute_MEMORY_READ_DATA = _zz_58_;
  assign execute_REGFILE_WRITE_DATA = _zz_39_;
  assign execute_RS2 = _zz_42_;
  assign execute_SRC_ADD = _zz_32_;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_ALIGNEMENT_FAULT = _zz_60_;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign decode_BRANCH_CTRL = _zz_61_;
  always @ (*) begin
    _zz_62_ = decode_FORMAL_PC_NEXT;
    if(_zz_69_)begin
      _zz_62_ = _zz_70_;
    end
  end

  assign decode_PC = _zz_65_;
  always @ (*) begin
    decode_INSTRUCTION = _zz_64_;
    if((_zz_156_ != (3'b000)))begin
      decode_INSTRUCTION = _zz_157_;
    end
  end

  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    decode_arbitration_isValid = (IBusSimplePlugin_iBusRsp_decodeInput_valid && (! IBusSimplePlugin_injector_decodeRemoved));
    _zz_82_ = 1'b0;
    case(_zz_156_)
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
        _zz_82_ = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((CsrPlugin_interrupt && decode_arbitration_isValid))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(1'b0)begin
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
    execute_arbitration_removeIt = 1'b0;
    _zz_75_ = 1'b0;
    _zz_76_ = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(_zz_73_)begin
      decode_arbitration_flushAll = 1'b1;
    end
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_exception_agregat_valid)begin
      decode_arbitration_flushAll = 1'b1;
      execute_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(_zz_168_)begin
      _zz_75_ = 1'b1;
      _zz_76_ = {CsrPlugin_mtvec_base,(2'b00)};
      decode_arbitration_flushAll = 1'b1;
    end
    if(_zz_169_)begin
      _zz_76_ = CsrPlugin_mepc;
      _zz_75_ = 1'b1;
      decode_arbitration_flushAll = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_redoIt = 1'b0;
  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    _zz_66_ = 1'b0;
    _zz_67_ = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode} != (2'b00)))begin
      _zz_66_ = 1'b1;
    end
    if(_zz_170_)begin
      execute_arbitration_haltByOther = 1'b1;
      if(_zz_171_)begin
        _zz_67_ = 1'b1;
        _zz_66_ = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      _zz_66_ = 1'b1;
    end
    if(_zz_172_)begin
      _zz_66_ = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(_zz_170_)begin
      if(_zz_171_)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
  end

  assign execute_arbitration_redoIt = 1'b0;
  always @ (*) begin
    _zz_68_ = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      _zz_68_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_79_ = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      _zz_79_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_80_ = 1'b1;
    if(DebugPlugin_haltIt)begin
      _zz_80_ = 1'b0;
    end
  end

  assign IBusSimplePlugin_jump_pcLoad_valid = ({_zz_75_,{_zz_73_,_zz_69_}} != (3'b000));
  assign _zz_83_ = {_zz_69_,{_zz_75_,_zz_73_}};
  assign _zz_84_ = (_zz_83_ & (~ _zz_179_));
  assign _zz_85_ = _zz_84_[1];
  assign _zz_86_ = _zz_84_[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_163_;
  assign _zz_87_ = (! _zz_66_);
  assign IBusSimplePlugin_fetchPc_output_valid = (IBusSimplePlugin_fetchPc_preOutput_valid && _zz_87_);
  assign IBusSimplePlugin_fetchPc_preOutput_ready = (IBusSimplePlugin_fetchPc_output_ready && _zz_87_);
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
    if(IBusSimplePlugin_fetchPc_propagatePc)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    if(_zz_173_)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusSimplePlugin_fetchPc_preOutput_valid = _zz_88_;
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

  assign _zz_89_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_89_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_89_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_90_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_90_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_90_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_91_;
  assign _zz_91_ = ((1'b0 && (! _zz_92_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_92_ = _zz_93_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_92_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  assign IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
  assign IBusSimplePlugin_iBusRsp_decodeInput_ready = (! decode_arbitration_isStuck);
  assign _zz_65_ = IBusSimplePlugin_iBusRsp_decodeInput_payload_pc;
  assign _zz_64_ = IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst;
  assign _zz_63_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign _zz_94_ = _zz_182_[11];
  always @ (*) begin
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
    _zz_95_[7] = _zz_94_;
    _zz_95_[6] = _zz_94_;
    _zz_95_[5] = _zz_94_;
    _zz_95_[4] = _zz_94_;
    _zz_95_[3] = _zz_94_;
    _zz_95_[2] = _zz_94_;
    _zz_95_[1] = _zz_94_;
    _zz_95_[0] = _zz_94_;
  end

  assign _zz_71_ = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_183_[31]));
  assign _zz_69_ = (_zz_71_ && decode_arbitration_isFiring);
  assign _zz_96_ = _zz_184_[19];
  always @ (*) begin
    _zz_97_[10] = _zz_96_;
    _zz_97_[9] = _zz_96_;
    _zz_97_[8] = _zz_96_;
    _zz_97_[7] = _zz_96_;
    _zz_97_[6] = _zz_96_;
    _zz_97_[5] = _zz_96_;
    _zz_97_[4] = _zz_96_;
    _zz_97_[3] = _zz_96_;
    _zz_97_[2] = _zz_96_;
    _zz_97_[1] = _zz_96_;
    _zz_97_[0] = _zz_96_;
  end

  assign _zz_98_ = _zz_185_[11];
  always @ (*) begin
    _zz_99_[18] = _zz_98_;
    _zz_99_[17] = _zz_98_;
    _zz_99_[16] = _zz_98_;
    _zz_99_[15] = _zz_98_;
    _zz_99_[14] = _zz_98_;
    _zz_99_[13] = _zz_98_;
    _zz_99_[12] = _zz_98_;
    _zz_99_[11] = _zz_98_;
    _zz_99_[10] = _zz_98_;
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

  assign _zz_70_ = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_97_,{{{_zz_245_,_zz_246_},_zz_247_},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_99_,{{{_zz_248_,_zz_249_},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_186_ - iBus_rsp_valid);
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
  assign IBusSimplePlugin_rspJoin_issueDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBufferOutput_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_100_ = (! IBusSimplePlugin_rspJoin_issueDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_decodeInput_ready && _zz_100_);
  assign IBusSimplePlugin_iBusRsp_decodeInput_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_100_);
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_60_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_ALIGNEMENT_FAULT)) && (! execute_DBusSimplePlugin_cmdSent));
  assign dBus_cmd_payload_wr = execute_INSTRUCTION[5];
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_101_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_101_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_101_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_101_;
  assign _zz_59_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_102_ = (4'b0001);
      end
      2'b01 : begin
        _zz_102_ = (4'b0011);
      end
      default : begin
        _zz_102_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_102_ <<< dBus_cmd_payload_address[1 : 0]);
  assign _zz_58_ = dBus_rsp_data;
  always @ (*) begin
    _zz_72_ = execute_ALIGNEMENT_FAULT;
    if((! ((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers))))begin
      _zz_72_ = 1'b0;
    end
  end

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

  assign _zz_103_ = (execute_DBusSimplePlugin_rspShifted[7] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_104_[31] = _zz_103_;
    _zz_104_[30] = _zz_103_;
    _zz_104_[29] = _zz_103_;
    _zz_104_[28] = _zz_103_;
    _zz_104_[27] = _zz_103_;
    _zz_104_[26] = _zz_103_;
    _zz_104_[25] = _zz_103_;
    _zz_104_[24] = _zz_103_;
    _zz_104_[23] = _zz_103_;
    _zz_104_[22] = _zz_103_;
    _zz_104_[21] = _zz_103_;
    _zz_104_[20] = _zz_103_;
    _zz_104_[19] = _zz_103_;
    _zz_104_[18] = _zz_103_;
    _zz_104_[17] = _zz_103_;
    _zz_104_[16] = _zz_103_;
    _zz_104_[15] = _zz_103_;
    _zz_104_[14] = _zz_103_;
    _zz_104_[13] = _zz_103_;
    _zz_104_[12] = _zz_103_;
    _zz_104_[11] = _zz_103_;
    _zz_104_[10] = _zz_103_;
    _zz_104_[9] = _zz_103_;
    _zz_104_[8] = _zz_103_;
    _zz_104_[7 : 0] = execute_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_105_ = (execute_DBusSimplePlugin_rspShifted[15] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_106_[31] = _zz_105_;
    _zz_106_[30] = _zz_105_;
    _zz_106_[29] = _zz_105_;
    _zz_106_[28] = _zz_105_;
    _zz_106_[27] = _zz_105_;
    _zz_106_[26] = _zz_105_;
    _zz_106_[25] = _zz_105_;
    _zz_106_[24] = _zz_105_;
    _zz_106_[23] = _zz_105_;
    _zz_106_[22] = _zz_105_;
    _zz_106_[21] = _zz_105_;
    _zz_106_[20] = _zz_105_;
    _zz_106_[19] = _zz_105_;
    _zz_106_[18] = _zz_105_;
    _zz_106_[17] = _zz_105_;
    _zz_106_[16] = _zz_105_;
    _zz_106_[15 : 0] = execute_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_176_)
      2'b00 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_104_;
      end
      2'b01 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_106_;
      end
      default : begin
        execute_DBusSimplePlugin_rspFormated = execute_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_108_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000010000));
  assign _zz_109_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_110_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_111_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_112_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign _zz_107_ = {({_zz_109_,(_zz_250_ == _zz_251_)} != (2'b00)),{((_zz_252_ == _zz_253_) != (1'b0)),{(_zz_254_ != (1'b0)),{(_zz_255_ != _zz_256_),{_zz_257_,{_zz_258_,_zz_259_}}}}}};
  assign _zz_56_ = _zz_187_[0];
  assign _zz_113_ = _zz_107_[3 : 2];
  assign _zz_55_ = _zz_113_;
  assign _zz_54_ = _zz_188_[0];
  assign _zz_53_ = _zz_189_[0];
  assign _zz_52_ = _zz_190_[0];
  assign _zz_51_ = _zz_191_[0];
  assign _zz_114_ = _zz_107_[13 : 12];
  assign _zz_50_ = _zz_114_;
  assign _zz_115_ = _zz_107_[15 : 14];
  assign _zz_49_ = _zz_115_;
  assign _zz_116_ = _zz_107_[17 : 16];
  assign _zz_48_ = _zz_116_;
  assign _zz_117_ = _zz_107_[19 : 18];
  assign _zz_47_ = _zz_117_;
  assign _zz_46_ = _zz_192_[0];
  assign _zz_118_ = _zz_107_[22 : 21];
  assign _zz_45_ = _zz_118_;
  assign _zz_119_ = _zz_107_[24 : 23];
  assign _zz_44_ = _zz_119_;
  assign execute_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign _zz_120_ = (! execute_arbitration_isStuck);
  assign execute_RegFilePlugin_rs1Data = _zz_161_;
  assign execute_RegFilePlugin_rs2Data = _zz_162_;
  assign _zz_43_ = execute_RegFilePlugin_rs1Data;
  assign _zz_42_ = execute_RegFilePlugin_rs2Data;
  assign execute_RegFilePlugin_regFileWrite_valid = (execute_REGFILE_WRITE_VALID && execute_arbitration_isFiring);
  assign execute_RegFilePlugin_regFileWrite_payload_address = execute_INSTRUCTION[11 : 7];
  assign execute_RegFilePlugin_regFileWrite_payload_data = _zz_57_;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = execute_SRC1;
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_121_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_121_ = {31'd0, _zz_193_};
      end
      default : begin
        _zz_121_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_39_ = _zz_121_;
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_122_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_122_ = {29'd0, _zz_194_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_122_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_122_ = {27'd0, _zz_195_};
      end
    endcase
  end

  assign _zz_37_ = _zz_122_;
  assign _zz_123_ = _zz_196_[11];
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

  assign _zz_125_ = _zz_197_[11];
  always @ (*) begin
    _zz_126_[19] = _zz_125_;
    _zz_126_[18] = _zz_125_;
    _zz_126_[17] = _zz_125_;
    _zz_126_[16] = _zz_125_;
    _zz_126_[15] = _zz_125_;
    _zz_126_[14] = _zz_125_;
    _zz_126_[13] = _zz_125_;
    _zz_126_[12] = _zz_125_;
    _zz_126_[11] = _zz_125_;
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

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_127_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_127_ = {_zz_124_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_127_ = {_zz_126_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_127_ = execute_PC;
      end
    endcase
  end

  assign _zz_35_ = _zz_127_;
  assign execute_SrcPlugin_addSub = _zz_198_;
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
        _zz_128_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_128_ = _zz_206_;
      end
    endcase
  end

  assign _zz_29_ = _zz_71_;
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_129_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_129_ == (3'b000))) begin
        _zz_130_ = execute_BranchPlugin_eq;
    end else if((_zz_129_ == (3'b001))) begin
        _zz_130_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_129_ & (3'b101)) == (3'b101)))) begin
        _zz_130_ = (! execute_SRC_LESS);
    end else begin
        _zz_130_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_131_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_131_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_131_ = 1'b1;
      end
      default : begin
        _zz_131_ = _zz_130_;
      end
    endcase
  end

  assign _zz_28_ = _zz_131_;
  assign _zz_132_ = _zz_208_[11];
  always @ (*) begin
    _zz_133_[19] = _zz_132_;
    _zz_133_[18] = _zz_132_;
    _zz_133_[17] = _zz_132_;
    _zz_133_[16] = _zz_132_;
    _zz_133_[15] = _zz_132_;
    _zz_133_[14] = _zz_132_;
    _zz_133_[13] = _zz_132_;
    _zz_133_[12] = _zz_132_;
    _zz_133_[11] = _zz_132_;
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

  assign _zz_134_ = _zz_209_[19];
  always @ (*) begin
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

  assign _zz_136_ = _zz_210_[11];
  always @ (*) begin
    _zz_137_[18] = _zz_136_;
    _zz_137_[17] = _zz_136_;
    _zz_137_[16] = _zz_136_;
    _zz_137_[15] = _zz_136_;
    _zz_137_[14] = _zz_136_;
    _zz_137_[13] = _zz_136_;
    _zz_137_[12] = _zz_136_;
    _zz_137_[11] = _zz_136_;
    _zz_137_[10] = _zz_136_;
    _zz_137_[9] = _zz_136_;
    _zz_137_[8] = _zz_136_;
    _zz_137_[7] = _zz_136_;
    _zz_137_[6] = _zz_136_;
    _zz_137_[5] = _zz_136_;
    _zz_137_[4] = _zz_136_;
    _zz_137_[3] = _zz_136_;
    _zz_137_[2] = _zz_136_;
    _zz_137_[1] = _zz_136_;
    _zz_137_[0] = _zz_136_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_138_ = (_zz_211_[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_138_ = _zz_212_[1];
      end
      default : begin
        _zz_138_ = _zz_213_[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_138_);
  assign _zz_26_ = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
        execute_BranchPlugin_branch_src2 = {_zz_140_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_142_,{{{_zz_353_,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_144_,{{{_zz_354_,_zz_355_},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if((execute_PREDICTION_HAD_BRANCHED2 && (! execute_BranchPlugin_missAlignedTarget)))begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_217_};
        end
      end
    endcase
  end

  assign _zz_139_ = _zz_214_[11];
  always @ (*) begin
    _zz_140_[19] = _zz_139_;
    _zz_140_[18] = _zz_139_;
    _zz_140_[17] = _zz_139_;
    _zz_140_[16] = _zz_139_;
    _zz_140_[15] = _zz_139_;
    _zz_140_[14] = _zz_139_;
    _zz_140_[13] = _zz_139_;
    _zz_140_[12] = _zz_139_;
    _zz_140_[11] = _zz_139_;
    _zz_140_[10] = _zz_139_;
    _zz_140_[9] = _zz_139_;
    _zz_140_[8] = _zz_139_;
    _zz_140_[7] = _zz_139_;
    _zz_140_[6] = _zz_139_;
    _zz_140_[5] = _zz_139_;
    _zz_140_[4] = _zz_139_;
    _zz_140_[3] = _zz_139_;
    _zz_140_[2] = _zz_139_;
    _zz_140_[1] = _zz_139_;
    _zz_140_[0] = _zz_139_;
  end

  assign _zz_141_ = _zz_215_[19];
  always @ (*) begin
    _zz_142_[10] = _zz_141_;
    _zz_142_[9] = _zz_141_;
    _zz_142_[8] = _zz_141_;
    _zz_142_[7] = _zz_141_;
    _zz_142_[6] = _zz_141_;
    _zz_142_[5] = _zz_141_;
    _zz_142_[4] = _zz_141_;
    _zz_142_[3] = _zz_141_;
    _zz_142_[2] = _zz_141_;
    _zz_142_[1] = _zz_141_;
    _zz_142_[0] = _zz_141_;
  end

  assign _zz_143_ = _zz_216_[11];
  always @ (*) begin
    _zz_144_[18] = _zz_143_;
    _zz_144_[17] = _zz_143_;
    _zz_144_[16] = _zz_143_;
    _zz_144_[15] = _zz_143_;
    _zz_144_[14] = _zz_143_;
    _zz_144_[13] = _zz_143_;
    _zz_144_[12] = _zz_143_;
    _zz_144_[11] = _zz_143_;
    _zz_144_[10] = _zz_143_;
    _zz_144_[9] = _zz_143_;
    _zz_144_[8] = _zz_143_;
    _zz_144_[7] = _zz_143_;
    _zz_144_[6] = _zz_143_;
    _zz_144_[5] = _zz_143_;
    _zz_144_[4] = _zz_143_;
    _zz_144_[3] = _zz_143_;
    _zz_144_[2] = _zz_143_;
    _zz_144_[1] = _zz_143_;
    _zz_144_[0] = _zz_143_;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_25_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign _zz_73_ = ((execute_arbitration_isValid && (! execute_arbitration_isStuckByOthers)) && execute_BRANCH_DO);
  always @ (*) begin
    _zz_74_ = (execute_arbitration_isValid && (execute_BRANCH_DO && execute_BRANCH_CALC[1]));
    if(1'b0)begin
      _zz_74_ = 1'b0;
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign CsrPlugin_medeleg = (32'b00000000000000000000000000000000);
  assign CsrPlugin_mideleg = (32'b00000000000000000000000000000000);
  assign _zz_145_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_146_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_147_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode = 1'b0;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = (2'b11);
  assign execute_exception_agregat_valid = ({_zz_77_,{_zz_74_,_zz_72_}} != (3'b000));
  assign _zz_148_ = {_zz_77_,{_zz_74_,_zz_72_}};
  assign _zz_149_ = (_zz_148_ & (~ _zz_218_));
  assign _zz_150_ = _zz_149_[1];
  assign _zz_151_ = _zz_149_[2];
  assign _zz_152_ = {_zz_151_,_zz_150_};
  assign execute_exception_agregat_payload_code = _zz_164_;
  assign execute_exception_agregat_payload_badAddr = _zz_165_;
  assign CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  always @ (*) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'bxxxx);
    if(CsrPlugin_mstatus_MIE)begin
      if(({_zz_147_,{_zz_146_,_zz_145_}} != (3'b000)))begin
        CsrPlugin_interrupt = 1'b1;
      end
      if(_zz_145_)begin
        CsrPlugin_interruptCode = (4'b0111);
      end
      if(_zz_146_)begin
        CsrPlugin_interruptCode = (4'b0011);
      end
      if(_zz_147_)begin
        CsrPlugin_interruptCode = (4'b1011);
      end
    end
    if((! _zz_79_))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_interruptTargetPrivilege = (2'b11);
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && _zz_80_);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! (execute_arbitration_isValid != (1'b0))) && IBusSimplePlugin_injector_nextPcCalc_valids_1);
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

  assign contextSwitching = _zz_75_;
  assign _zz_23_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_22_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_blockedBySideEffects = 1'b0;
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = _zz_153_;
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
        execute_CsrPlugin_readData[31 : 0] = _zz_154_;
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
      if((execute_INSTRUCTION[29 : 28] != CsrPlugin_privilege))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    _zz_77_ = 1'b0;
    _zz_78_ = (4'bxxxx);
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL)))begin
      _zz_77_ = 1'b1;
      _zz_78_ = (4'b1011);
    end
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK)))begin
      _zz_77_ = 1'b1;
      _zz_78_ = (4'b0011);
    end
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  always @ (*) begin
    case(_zz_178_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readData & (~ execute_SRC1)) : (execute_CsrPlugin_readData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_154_ = (_zz_153_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_154_ != (32'b00000000000000000000000000000000));
  assign DebugPlugin_isPipBusy = (DebugPlugin_isPipActive || DebugPlugin_isPipActive_regNext);
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    _zz_81_ = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_174_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            _zz_81_ = 1'b1;
            debug_bus_cmd_ready = _zz_82_;
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
    if((! _zz_155_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign _zz_21_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || ((((((_zz_356_ || _zz_357_) || (DebugPlugin_hardwareBreakpoints_3_valid && _zz_358_)) || (DebugPlugin_hardwareBreakpoints_4_valid && (DebugPlugin_hardwareBreakpoints_4_pc == _zz_233_))) || (DebugPlugin_hardwareBreakpoints_5_valid && (DebugPlugin_hardwareBreakpoints_5_pc == _zz_234_))) || (DebugPlugin_hardwareBreakpoints_6_valid && (DebugPlugin_hardwareBreakpoints_6_pc == _zz_235_))) || (DebugPlugin_hardwareBreakpoints_7_valid && (DebugPlugin_hardwareBreakpoints_7_pc == _zz_236_)))));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_20_ = decode_ENV_CTRL;
  assign _zz_18_ = _zz_45_;
  assign _zz_24_ = decode_to_execute_ENV_CTRL;
  assign _zz_17_ = decode_ALU_CTRL;
  assign _zz_15_ = _zz_55_;
  assign _zz_38_ = decode_to_execute_ALU_CTRL;
  assign _zz_14_ = decode_SRC2_CTRL;
  assign _zz_12_ = _zz_50_;
  assign _zz_34_ = decode_to_execute_SRC2_CTRL;
  assign _zz_11_ = decode_ALU_BITWISE_CTRL;
  assign _zz_9_ = _zz_47_;
  assign _zz_40_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_8_ = decode_BRANCH_CTRL;
  assign _zz_61_ = _zz_44_;
  assign _zz_27_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_6_ = decode_SHIFT_CTRL;
  assign _zz_4_ = _zz_49_;
  assign _zz_30_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_3_ = decode_SRC1_CTRL;
  assign _zz_1_ = _zz_48_;
  assign _zz_36_ = decode_to_execute_SRC1_CTRL;
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
  assign iBus_cmd_m2sPipe_valid = _zz_158_;
  assign iBus_cmd_m2sPipe_payload_pc = _zz_159_;
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
        _zz_160_ = (4'b0001);
      end
      2'b01 : begin
        _zz_160_ = (4'b0011);
      end
      default : begin
        _zz_160_ = (4'b1111);
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = _zz_243_[3:0];
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
      CsrPlugin_privilege <= (2'b11);
      IBusSimplePlugin_fetchPc_pcReg <= externalResetVector;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_88_ <= 1'b0;
      _zz_93_ <= 1'b0;
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
      CsrPlugin_mip_MEIP <= 1'b0;
      CsrPlugin_mip_MTIP <= 1'b0;
      CsrPlugin_mip_MSIP <= 1'b0;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      _zz_153_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      _zz_156_ <= (3'b000);
      _zz_158_ <= 1'b0;
      dBus_cmd_halfPipe_regs_valid <= 1'b0;
      dBus_cmd_halfPipe_regs_ready <= 1'b1;
    end else begin
      if(IBusSimplePlugin_fetchPc_propagatePc)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_173_)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_samplePcNext)begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      _zz_88_ <= 1'b1;
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_67_))begin
        _zz_93_ <= 1'b0;
      end
      if(_zz_91_)begin
        _zz_93_ <= IBusSimplePlugin_iBusRsp_stages_0_output_valid;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_67_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_67_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_67_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_67_))begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      end
      IBusSimplePlugin_pendingCmd <= IBusSimplePlugin_pendingCmdNext;
      IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_rspJoin_discardCounter - (iBus_rsp_valid && (IBusSimplePlugin_rspJoin_discardCounter != (1'b0))));
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_67_))begin
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
      if(_zz_166_)begin
        if(_zz_167_)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      CsrPlugin_mip_MEIP <= externalInterrupt;
      CsrPlugin_mip_MTIP <= timerInterrupt;
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_168_)begin
        CsrPlugin_privilege <= CsrPlugin_targetPrivilege;
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
      if(_zz_169_)begin
        case(_zz_177_)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MPIE <= 1'b1;
            CsrPlugin_privilege <= CsrPlugin_mstatus_MPP;
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
      case(_zz_156_)
        3'b000 : begin
          if(_zz_81_)begin
            _zz_156_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_156_ <= (3'b010);
        end
        3'b010 : begin
          _zz_156_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_156_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_156_ <= (3'b000);
        end
        default : begin
        end
      endcase
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_153_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_237_[0];
            CsrPlugin_mstatus_MIE <= _zz_238_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000101 : begin
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mip_MSIP <= _zz_239_[0];
          end
        end
        12'b001101000011 : begin
        end
        12'b111111000000 : begin
        end
        12'b001101000000 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_240_[0];
            CsrPlugin_mie_MTIE <= _zz_241_[0];
            CsrPlugin_mie_MSIE <= _zz_242_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(iBus_cmd_ready)begin
        _zz_158_ <= iBus_cmd_valid;
      end
      if(_zz_175_)begin
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
      execute_LightShifterPlugin_shiftReg <= _zz_57_;
    end
    if(_zz_166_)begin
      if(_zz_167_)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - (5'b00001));
      end
    end
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(execute_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(execute_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= execute_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= execute_exception_agregat_payload_badAddr;
    end
    if((CsrPlugin_exception || CsrPlugin_interruptJump))begin
      case(CsrPlugin_privilege)
        2'b11 : begin
          CsrPlugin_mepc <= execute_PC;
        end
        default : begin
        end
      endcase
    end
    if(_zz_168_)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
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
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_16_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_13_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_10_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_7_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_2_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_62_;
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
      _zz_159_ <= iBus_cmd_payload_pc;
    end
    if(_zz_175_)begin
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
    DebugPlugin_isPipActive <= ({execute_arbitration_isValid,decode_arbitration_isValid} != (2'b00));
    DebugPlugin_isPipActive_regNext <= DebugPlugin_isPipActive;
    if(execute_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_57_;
    end
    _zz_155_ <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid)begin
      case(_zz_174_)
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
    if(_zz_170_)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge clk) begin
    if(debugReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
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
      if(debug_bus_cmd_valid)begin
        case(_zz_174_)
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
            end
          end
          6'b000001 : begin
          end
          6'b010000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_0_valid <= _zz_221_[0];
            end
          end
          6'b010001 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_1_valid <= _zz_222_[0];
            end
          end
          6'b010010 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_2_valid <= _zz_223_[0];
            end
          end
          6'b010011 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_3_valid <= _zz_224_[0];
            end
          end
          6'b010100 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_4_valid <= _zz_225_[0];
            end
          end
          6'b010101 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_5_valid <= _zz_226_[0];
            end
          end
          6'b010110 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_6_valid <= _zz_227_[0];
            end
          end
          6'b010111 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_7_valid <= _zz_228_[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_170_)begin
        if(_zz_171_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_172_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      if((DebugPlugin_stepIt && ({execute_arbitration_redoIt,decode_arbitration_redoIt} != (2'b00))))begin
        DebugPlugin_haltIt <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    _zz_157_ <= debug_bus_cmd_payload_data;
  end

endmodule

