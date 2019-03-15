// Generator : SpinalHDL v1.2.2    git head : 3159d9865a8de00378e0b0405c338a97c2f5a601
// Date      : 12/03/2019, 16:09:42
// Component : VexRiscv


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

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define EnvCtrlEnum_defaultEncoding_type [0:0]
`define EnvCtrlEnum_defaultEncoding_NONE 1'b0
`define EnvCtrlEnum_defaultEncoding_XRET 1'b1

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10
`define AluBitwiseCtrlEnum_defaultEncoding_SRC1 2'b11

module VexRiscv (
      input  [31:0] externalResetVector,
      input   timerInterrupt,
      input  [31:0] externalInterruptArray,
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
      input   reset);
  reg [31:0] _zz_132_;
  reg [31:0] _zz_133_;
  wire  _zz_134_;
  wire  _zz_135_;
  wire  _zz_136_;
  wire  _zz_137_;
  wire  _zz_138_;
  wire  _zz_139_;
  wire [1:0] _zz_140_;
  wire [1:0] _zz_141_;
  wire  _zz_142_;
  wire [1:0] _zz_143_;
  wire [1:0] _zz_144_;
  wire [2:0] _zz_145_;
  wire [31:0] _zz_146_;
  wire [0:0] _zz_147_;
  wire [0:0] _zz_148_;
  wire [0:0] _zz_149_;
  wire [0:0] _zz_150_;
  wire [0:0] _zz_151_;
  wire [0:0] _zz_152_;
  wire [0:0] _zz_153_;
  wire [2:0] _zz_154_;
  wire [4:0] _zz_155_;
  wire [11:0] _zz_156_;
  wire [11:0] _zz_157_;
  wire [31:0] _zz_158_;
  wire [31:0] _zz_159_;
  wire [31:0] _zz_160_;
  wire [31:0] _zz_161_;
  wire [1:0] _zz_162_;
  wire [31:0] _zz_163_;
  wire [1:0] _zz_164_;
  wire [1:0] _zz_165_;
  wire [31:0] _zz_166_;
  wire [32:0] _zz_167_;
  wire [19:0] _zz_168_;
  wire [11:0] _zz_169_;
  wire [11:0] _zz_170_;
  wire [1:0] _zz_171_;
  wire [1:0] _zz_172_;
  wire [2:0] _zz_173_;
  wire [3:0] _zz_174_;
  wire [0:0] _zz_175_;
  wire [0:0] _zz_176_;
  wire [0:0] _zz_177_;
  wire [0:0] _zz_178_;
  wire [0:0] _zz_179_;
  wire [0:0] _zz_180_;
  wire [6:0] _zz_181_;
  wire [31:0] _zz_182_;
  wire [31:0] _zz_183_;
  wire  _zz_184_;
  wire  _zz_185_;
  wire [31:0] _zz_186_;
  wire [31:0] _zz_187_;
  wire  _zz_188_;
  wire [1:0] _zz_189_;
  wire [1:0] _zz_190_;
  wire  _zz_191_;
  wire [0:0] _zz_192_;
  wire [16:0] _zz_193_;
  wire [31:0] _zz_194_;
  wire [31:0] _zz_195_;
  wire [31:0] _zz_196_;
  wire [31:0] _zz_197_;
  wire [0:0] _zz_198_;
  wire [3:0] _zz_199_;
  wire [0:0] _zz_200_;
  wire [0:0] _zz_201_;
  wire [1:0] _zz_202_;
  wire [1:0] _zz_203_;
  wire  _zz_204_;
  wire [0:0] _zz_205_;
  wire [13:0] _zz_206_;
  wire [31:0] _zz_207_;
  wire [31:0] _zz_208_;
  wire [31:0] _zz_209_;
  wire  _zz_210_;
  wire [0:0] _zz_211_;
  wire [0:0] _zz_212_;
  wire [31:0] _zz_213_;
  wire [31:0] _zz_214_;
  wire [31:0] _zz_215_;
  wire [31:0] _zz_216_;
  wire [31:0] _zz_217_;
  wire [31:0] _zz_218_;
  wire [31:0] _zz_219_;
  wire [31:0] _zz_220_;
  wire [0:0] _zz_221_;
  wire [0:0] _zz_222_;
  wire [1:0] _zz_223_;
  wire [1:0] _zz_224_;
  wire  _zz_225_;
  wire [0:0] _zz_226_;
  wire [10:0] _zz_227_;
  wire [31:0] _zz_228_;
  wire [31:0] _zz_229_;
  wire [31:0] _zz_230_;
  wire [31:0] _zz_231_;
  wire [31:0] _zz_232_;
  wire [31:0] _zz_233_;
  wire [0:0] _zz_234_;
  wire [1:0] _zz_235_;
  wire [1:0] _zz_236_;
  wire [1:0] _zz_237_;
  wire  _zz_238_;
  wire [0:0] _zz_239_;
  wire [7:0] _zz_240_;
  wire [31:0] _zz_241_;
  wire [31:0] _zz_242_;
  wire [31:0] _zz_243_;
  wire [31:0] _zz_244_;
  wire [31:0] _zz_245_;
  wire [31:0] _zz_246_;
  wire [31:0] _zz_247_;
  wire [31:0] _zz_248_;
  wire [31:0] _zz_249_;
  wire [31:0] _zz_250_;
  wire [31:0] _zz_251_;
  wire  _zz_252_;
  wire [1:0] _zz_253_;
  wire [1:0] _zz_254_;
  wire  _zz_255_;
  wire [0:0] _zz_256_;
  wire [4:0] _zz_257_;
  wire [31:0] _zz_258_;
  wire [31:0] _zz_259_;
  wire  _zz_260_;
  wire [0:0] _zz_261_;
  wire [0:0] _zz_262_;
  wire [2:0] _zz_263_;
  wire [2:0] _zz_264_;
  wire  _zz_265_;
  wire [0:0] _zz_266_;
  wire [1:0] _zz_267_;
  wire [31:0] _zz_268_;
  wire  _zz_269_;
  wire  _zz_270_;
  wire  _zz_271_;
  wire [0:0] _zz_272_;
  wire [1:0] _zz_273_;
  wire [0:0] _zz_274_;
  wire [0:0] _zz_275_;
  wire [0:0] _zz_276_;
  wire [0:0] _zz_277_;
  wire [0:0] _zz_278_;
  wire [0:0] _zz_279_;
  wire [31:0] _zz_280_;
  wire [31:0] _zz_281_;
  wire [31:0] _zz_282_;
  wire [31:0] _zz_283_;
  wire [31:0] _zz_284_;
  wire  _zz_285_;
  wire [0:0] _zz_286_;
  wire [10:0] _zz_287_;
  wire [31:0] _zz_288_;
  wire [31:0] _zz_289_;
  wire [31:0] _zz_290_;
  wire  _zz_291_;
  wire [0:0] _zz_292_;
  wire [4:0] _zz_293_;
  wire [31:0] _zz_294_;
  wire [31:0] _zz_295_;
  wire [31:0] _zz_296_;
  wire [31:0] _zz_297_;
  wire [31:0] _zz_298_;
  wire  decode_IS_CSR;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_1_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_2_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_3_;
  wire  execute_REGFILE_WRITE_VALID;
  wire  decode_CSR_WRITE_OPCODE;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  decode_CSR_READ_OPCODE;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_4_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_5_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_6_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_7_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_8_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_9_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_10_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_11_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_12_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_13_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_14_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_15_;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_MEMORY_ENABLE;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_16_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_17_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_18_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_19_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_20_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_21_;
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
  wire [31:0] execute_RS1;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_26_;
  wire  _zz_27_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_28_;
  wire  _zz_29_;
  wire [31:0] _zz_30_;
  wire [31:0] _zz_31_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC_USE_SUB_LESS;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_32_;
  wire [31:0] _zz_33_;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_34_;
  wire [31:0] _zz_35_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_36_;
  wire [31:0] _zz_37_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_38_;
  reg  _zz_39_;
  wire [31:0] _zz_40_;
  wire [31:0] _zz_41_;
  reg  decode_REGFILE_WRITE_VALID;
  wire  decode_LEGAL_INSTRUCTION;
  wire  decode_INSTRUCTION_READY;
  wire `AluCtrlEnum_defaultEncoding_type _zz_42_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_43_;
  wire  _zz_44_;
  wire  _zz_45_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_46_;
  wire  _zz_47_;
  wire  _zz_48_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_49_;
  wire  _zz_50_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_51_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_52_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_53_;
  wire  _zz_54_;
  reg [31:0] _zz_55_;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] execute_MEMORY_READ_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire [31:0] _zz_56_;
  wire [1:0] _zz_57_;
  wire [31:0] execute_RS2;
  wire [31:0] execute_SRC_ADD;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_ALIGNEMENT_FAULT;
  wire  execute_MEMORY_ENABLE;
  wire  _zz_58_;
  wire [31:0] _zz_59_;
  wire [31:0] _zz_60_;
  wire [31:0] _zz_61_;
  wire [31:0] decode_PC /* verilator public */ ;
  wire [31:0] decode_INSTRUCTION /* verilator public */ ;
  wire  decode_arbitration_haltItself /* verilator public */ ;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  reg  decode_arbitration_flushAll /* verilator public */ ;
  wire  decode_arbitration_redoIt;
  wire  decode_arbitration_isValid /* verilator public */ ;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  wire  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  wire  execute_arbitration_flushAll;
  wire  execute_arbitration_redoIt;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  reg  _zz_62_;
  wire  _zz_63_;
  wire  iBus_cmd_valid;
  wire  iBus_cmd_ready;
  wire [31:0] iBus_cmd_payload_pc;
  wire  iBus_rsp_valid;
  wire  iBus_rsp_payload_error;
  wire [31:0] iBus_rsp_payload_inst;
  reg  _zz_64_;
  wire  decode_exception_agregat_valid;
  wire [3:0] decode_exception_agregat_payload_code;
  wire [31:0] decode_exception_agregat_payload_badAddr;
  wire  _zz_65_;
  wire [31:0] _zz_66_;
  reg  _zz_67_;
  reg  _zz_68_;
  reg [31:0] _zz_69_;
  wire  externalInterrupt;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  wire  IBusSimplePlugin_jump_pcLoad_valid;
  wire [31:0] IBusSimplePlugin_jump_pcLoad_payload;
  wire [1:0] _zz_70_;
  wire  IBusSimplePlugin_fetchPc_preOutput_valid;
  wire  IBusSimplePlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_preOutput_payload;
  wire  _zz_71_;
  wire  IBusSimplePlugin_fetchPc_output_valid;
  wire  IBusSimplePlugin_fetchPc_output_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_output_payload;
  reg [31:0] IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusSimplePlugin_fetchPc_inc;
  reg  IBusSimplePlugin_fetchPc_propagatePc;
  reg [31:0] IBusSimplePlugin_fetchPc_pc;
  reg  IBusSimplePlugin_fetchPc_samplePcNext;
  reg  _zz_72_;
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
  wire  _zz_73_;
  wire  _zz_74_;
  wire  _zz_75_;
  wire  _zz_76_;
  reg  _zz_77_;
  wire  IBusSimplePlugin_iBusRsp_readyForError;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_valid;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_decodeInput_payload_pc;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_rawInDecode;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_payload_isRvc;
  reg  IBusSimplePlugin_injector_nextPcCalc_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_1;
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
  wire  _zz_78_;
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
  reg [31:0] _zz_79_;
  reg [3:0] _zz_80_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] execute_DBusSimplePlugin_rspShifted;
  wire  _zz_81_;
  reg [31:0] _zz_82_;
  wire  _zz_83_;
  reg [31:0] _zz_84_;
  reg [31:0] execute_DBusSimplePlugin_rspFormated;
  wire [22:0] _zz_85_;
  wire  _zz_86_;
  wire  _zz_87_;
  wire  _zz_88_;
  wire  _zz_89_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_90_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_91_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_92_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_93_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_94_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_95_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_96_;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire  _zz_97_;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  execute_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] execute_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] execute_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_98_;
  reg [31:0] _zz_99_;
  wire  _zz_100_;
  reg [19:0] _zz_101_;
  wire  _zz_102_;
  reg [19:0] _zz_103_;
  reg [31:0] _zz_104_;
  wire [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  reg [31:0] execute_LightShifterPlugin_shiftReg;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_105_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_106_;
  reg  _zz_107_;
  reg  _zz_108_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_109_;
  reg [10:0] _zz_110_;
  wire  _zz_111_;
  reg [19:0] _zz_112_;
  wire  _zz_113_;
  reg [18:0] _zz_114_;
  reg [31:0] _zz_115_;
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
  reg  CsrPlugin_mcause_interrupt;
  reg [3:0] CsrPlugin_mcause_exceptionCode;
  reg [31:0] CsrPlugin_mtval;
  reg [63:0] CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg [63:0] CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire [31:0] CsrPlugin_medeleg;
  wire [31:0] CsrPlugin_mideleg;
  wire  _zz_116_;
  wire  _zz_117_;
  wire  _zz_118_;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire  execute_exception_agregat_valid;
  wire [3:0] execute_exception_agregat_payload_code;
  wire [31:0] execute_exception_agregat_payload_badAddr;
  wire [1:0] _zz_119_;
  wire  _zz_120_;
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
  reg [31:0] _zz_121_;
  reg [31:0] externalInterruptArray_regNext;
  wire [31:0] _zz_122_;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg [31:0] decode_to_execute_PC;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg  decode_to_execute_IS_CSR;
  wire  iBus_cmd_m2sPipe_valid;
  wire  iBus_cmd_m2sPipe_ready;
  wire [31:0] iBus_cmd_m2sPipe_payload_pc;
  reg  _zz_123_;
  reg [31:0] _zz_124_;
  wire  dBus_cmd_halfPipe_valid;
  wire  dBus_cmd_halfPipe_ready;
  wire  dBus_cmd_halfPipe_payload_wr;
  wire [31:0] dBus_cmd_halfPipe_payload_address;
  wire [31:0] dBus_cmd_halfPipe_payload_data;
  wire [1:0] dBus_cmd_halfPipe_payload_size;
  reg  _zz_125_;
  reg  _zz_126_;
  reg  _zz_127_;
  reg [31:0] _zz_128_;
  reg [31:0] _zz_129_;
  reg [1:0] _zz_130_;
  reg [3:0] _zz_131_;
  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_134_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_135_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_136_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_137_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_138_ = (IBusSimplePlugin_fetchPc_preOutput_valid && IBusSimplePlugin_fetchPc_preOutput_ready);
  assign _zz_139_ = (! _zz_125_);
  assign _zz_140_ = execute_INSTRUCTION[13 : 12];
  assign _zz_141_ = execute_INSTRUCTION[29 : 28];
  assign _zz_142_ = execute_INSTRUCTION[13];
  assign _zz_143_ = (_zz_70_ & (~ _zz_144_));
  assign _zz_144_ = (_zz_70_ - (2'b01));
  assign _zz_145_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_146_ = {29'd0, _zz_145_};
  assign _zz_147_ = (IBusSimplePlugin_pendingCmd + (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready));
  assign _zz_148_ = _zz_85_[8 : 8];
  assign _zz_149_ = _zz_85_[10 : 10];
  assign _zz_150_ = _zz_85_[11 : 11];
  assign _zz_151_ = _zz_85_[16 : 16];
  assign _zz_152_ = _zz_85_[18 : 18];
  assign _zz_153_ = execute_SRC_LESS;
  assign _zz_154_ = (3'b100);
  assign _zz_155_ = execute_INSTRUCTION[19 : 15];
  assign _zz_156_ = execute_INSTRUCTION[31 : 20];
  assign _zz_157_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_158_ = ($signed(_zz_159_) + $signed(_zz_163_));
  assign _zz_159_ = ($signed(_zz_160_) + $signed(_zz_161_));
  assign _zz_160_ = execute_SRC1;
  assign _zz_161_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_162_ = (execute_SRC_USE_SUB_LESS ? _zz_164_ : _zz_165_);
  assign _zz_163_ = {{30{_zz_162_[1]}}, _zz_162_};
  assign _zz_164_ = (2'b01);
  assign _zz_165_ = (2'b00);
  assign _zz_166_ = (_zz_167_ >>> 1);
  assign _zz_167_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_168_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_169_ = execute_INSTRUCTION[31 : 20];
  assign _zz_170_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_171_ = (_zz_119_ & (~ _zz_172_));
  assign _zz_172_ = (_zz_119_ - (2'b01));
  assign _zz_173_ = (execute_INSTRUCTION[5] ? (3'b110) : (3'b100));
  assign _zz_174_ = {1'd0, _zz_173_};
  assign _zz_175_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_176_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_177_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_178_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_179_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_180_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_181_ = ({3'd0,_zz_131_} <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign _zz_182_ = (decode_INSTRUCTION & (32'b00000000000000000000000001100100));
  assign _zz_183_ = (32'b00000000000000000000000000100100);
  assign _zz_184_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000010100)) == (32'b00000000000000000100000000010000));
  assign _zz_185_ = ((decode_INSTRUCTION & (32'b00000000000000000011000000010100)) == (32'b00000000000000000001000000010000));
  assign _zz_186_ = (decode_INSTRUCTION & (32'b00000000000000000110000000010100));
  assign _zz_187_ = (32'b00000000000000000010000000010000);
  assign _zz_188_ = ((decode_INSTRUCTION & (32'b00000000000000000111000001010100)) == (32'b00000000000000000101000000010000));
  assign _zz_189_ = {(_zz_194_ == _zz_195_),(_zz_196_ == _zz_197_)};
  assign _zz_190_ = (2'b00);
  assign _zz_191_ = ({_zz_87_,{_zz_198_,_zz_199_}} != (6'b000000));
  assign _zz_192_ = ({_zz_200_,_zz_201_} != (2'b00));
  assign _zz_193_ = {(_zz_202_ != _zz_203_),{_zz_204_,{_zz_205_,_zz_206_}}};
  assign _zz_194_ = (decode_INSTRUCTION & (32'b01000000000000000011000001010100));
  assign _zz_195_ = (32'b01000000000000000001000000010000);
  assign _zz_196_ = (decode_INSTRUCTION & (32'b00000000000000000111000001010100));
  assign _zz_197_ = (32'b00000000000000000001000000010000);
  assign _zz_198_ = ((decode_INSTRUCTION & _zz_207_) == (32'b00000000000000000001000000010000));
  assign _zz_199_ = {(_zz_208_ == _zz_209_),{_zz_210_,{_zz_211_,_zz_212_}}};
  assign _zz_200_ = ((decode_INSTRUCTION & _zz_213_) == (32'b00000000000000000000000000100000));
  assign _zz_201_ = ((decode_INSTRUCTION & _zz_214_) == (32'b00000000000000000000000000100000));
  assign _zz_202_ = {(_zz_215_ == _zz_216_),(_zz_217_ == _zz_218_)};
  assign _zz_203_ = (2'b00);
  assign _zz_204_ = ((_zz_219_ == _zz_220_) != (1'b0));
  assign _zz_205_ = ({_zz_221_,_zz_222_} != (2'b00));
  assign _zz_206_ = {(_zz_223_ != _zz_224_),{_zz_225_,{_zz_226_,_zz_227_}}};
  assign _zz_207_ = (32'b00000000000000000001000000010000);
  assign _zz_208_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_209_ = (32'b00000000000000000010000000010000);
  assign _zz_210_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_211_ = _zz_86_;
  assign _zz_212_ = ((decode_INSTRUCTION & _zz_228_) == (32'b00000000000000000000000000000000));
  assign _zz_213_ = (32'b00000000000000000000000000110100);
  assign _zz_214_ = (32'b00000000000000000000000001100100);
  assign _zz_215_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_216_ = (32'b00000000000000000010000000000000);
  assign _zz_217_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_218_ = (32'b00000000000000000001000000000000);
  assign _zz_219_ = (decode_INSTRUCTION & (32'b00000000000000000000000000000000));
  assign _zz_220_ = (32'b00000000000000000000000000000000);
  assign _zz_221_ = ((decode_INSTRUCTION & _zz_229_) == (32'b00000000000000000000000000000100));
  assign _zz_222_ = _zz_89_;
  assign _zz_223_ = {(_zz_230_ == _zz_231_),_zz_89_};
  assign _zz_224_ = (2'b00);
  assign _zz_225_ = ((_zz_232_ == _zz_233_) != (1'b0));
  assign _zz_226_ = ({_zz_234_,_zz_235_} != (3'b000));
  assign _zz_227_ = {(_zz_236_ != _zz_237_),{_zz_238_,{_zz_239_,_zz_240_}}};
  assign _zz_228_ = (32'b00000000000000000000000000101000);
  assign _zz_229_ = (32'b00000000000000000000000000010100);
  assign _zz_230_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_231_ = (32'b00000000000000000000000000000100);
  assign _zz_232_ = (decode_INSTRUCTION & (32'b00000000000000000000000000010000));
  assign _zz_233_ = (32'b00000000000000000000000000010000);
  assign _zz_234_ = ((decode_INSTRUCTION & _zz_241_) == (32'b00000000000000000000000001000000));
  assign _zz_235_ = {(_zz_242_ == _zz_243_),(_zz_244_ == _zz_245_)};
  assign _zz_236_ = {(_zz_246_ == _zz_247_),(_zz_248_ == _zz_249_)};
  assign _zz_237_ = (2'b00);
  assign _zz_238_ = ((_zz_250_ == _zz_251_) != (1'b0));
  assign _zz_239_ = (_zz_252_ != (1'b0));
  assign _zz_240_ = {(_zz_253_ != _zz_254_),{_zz_255_,{_zz_256_,_zz_257_}}};
  assign _zz_241_ = (32'b00000000000000000000000001000100);
  assign _zz_242_ = (decode_INSTRUCTION & (32'b01000000000000000000000000110000));
  assign _zz_243_ = (32'b01000000000000000000000000110000);
  assign _zz_244_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_245_ = (32'b00000000000000000010000000010000);
  assign _zz_246_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_247_ = (32'b00000000000000000001000001010000);
  assign _zz_248_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_249_ = (32'b00000000000000000010000001010000);
  assign _zz_250_ = (decode_INSTRUCTION & (32'b00000000000000000011000001010000));
  assign _zz_251_ = (32'b00000000000000000000000001010000);
  assign _zz_252_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000000000000));
  assign _zz_253_ = {_zz_88_,(_zz_258_ == _zz_259_)};
  assign _zz_254_ = (2'b00);
  assign _zz_255_ = ({_zz_88_,_zz_260_} != (2'b00));
  assign _zz_256_ = ({_zz_261_,_zz_262_} != (2'b00));
  assign _zz_257_ = {(_zz_263_ != _zz_264_),{_zz_265_,{_zz_266_,_zz_267_}}};
  assign _zz_258_ = (decode_INSTRUCTION & (32'b00000000000000000000000001110000));
  assign _zz_259_ = (32'b00000000000000000000000000100000);
  assign _zz_260_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_261_ = ((decode_INSTRUCTION & _zz_268_) == (32'b00000000000000000001000000000000));
  assign _zz_262_ = _zz_88_;
  assign _zz_263_ = {_zz_88_,{_zz_269_,_zz_270_}};
  assign _zz_264_ = (3'b000);
  assign _zz_265_ = ({_zz_271_,{_zz_272_,_zz_273_}} != (4'b0000));
  assign _zz_266_ = ({_zz_274_,_zz_275_} != (2'b00));
  assign _zz_267_ = {(_zz_276_ != _zz_277_),(_zz_278_ != _zz_279_)};
  assign _zz_268_ = (32'b00000000000000000001000000000000);
  assign _zz_269_ = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_270_ = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000010000000000000));
  assign _zz_271_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000000000000));
  assign _zz_272_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000011000)) == (32'b00000000000000000000000000000000));
  assign _zz_273_ = {((decode_INSTRUCTION & _zz_280_) == (32'b00000000000000000010000000000000)),((decode_INSTRUCTION & _zz_281_) == (32'b00000000000000000001000000000000))};
  assign _zz_274_ = _zz_87_;
  assign _zz_275_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_276_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000001000000));
  assign _zz_277_ = (1'b0);
  assign _zz_278_ = _zz_86_;
  assign _zz_279_ = (1'b0);
  assign _zz_280_ = (32'b00000000000000000110000000000100);
  assign _zz_281_ = (32'b00000000000000000101000000000100);
  assign _zz_282_ = (32'b00000000000000000001000001111111);
  assign _zz_283_ = (decode_INSTRUCTION & (32'b00000000000000000010000001111111));
  assign _zz_284_ = (32'b00000000000000000010000001110011);
  assign _zz_285_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001111111)) == (32'b00000000000000000100000001100011));
  assign _zz_286_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000010000000010011));
  assign _zz_287_ = {((decode_INSTRUCTION & (32'b00000000000000000110000000111111)) == (32'b00000000000000000000000000100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_288_) == (32'b00000000000000000000000000000011)),{(_zz_289_ == _zz_290_),{_zz_291_,{_zz_292_,_zz_293_}}}}}};
  assign _zz_288_ = (32'b00000000000000000101000001011111);
  assign _zz_289_ = (decode_INSTRUCTION & (32'b00000000000000000111000001111011));
  assign _zz_290_ = (32'b00000000000000000000000001100011);
  assign _zz_291_ = ((decode_INSTRUCTION & (32'b11111110000000000000000001111111)) == (32'b00000000000000000000000000110011));
  assign _zz_292_ = ((decode_INSTRUCTION & (32'b10111100000000000111000001111111)) == (32'b00000000000000000101000000010011));
  assign _zz_293_ = {((decode_INSTRUCTION & (32'b11111100000000000011000001111111)) == (32'b00000000000000000001000000010011)),{((decode_INSTRUCTION & (32'b10111110000000000111000001111111)) == (32'b00000000000000000101000000110011)),{((decode_INSTRUCTION & _zz_294_) == (32'b00000000000000000000000000110011)),{(_zz_295_ == _zz_296_),(_zz_297_ == _zz_298_)}}}};
  assign _zz_294_ = (32'b10111110000000000111000001111111);
  assign _zz_295_ = (decode_INSTRUCTION & (32'b11011111111111111111111111111111));
  assign _zz_296_ = (32'b00010000001000000000000001110011);
  assign _zz_297_ = (decode_INSTRUCTION & (32'b11111111111111111111111111111111));
  assign _zz_298_ = (32'b00000000000000000001000000001111);
  initial begin
    $readmemb("VexRiscv_Min.v_toplevel_RegFilePlugin_regFile.bin",RegFilePlugin_regFile);
  end
  always @ (posedge clk) begin
    if(_zz_39_) begin
      RegFilePlugin_regFile[execute_RegFilePlugin_regFileWrite_payload_address] <= execute_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_97_) begin
      _zz_132_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_97_) begin
      _zz_133_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  assign decode_IS_CSR = _zz_48_;
  assign decode_SRC1_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign decode_CSR_WRITE_OPCODE = _zz_23_;
  assign decode_SRC_LESS_UNSIGNED = _zz_45_;
  assign decode_CSR_READ_OPCODE = _zz_22_;
  assign decode_ALU_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign decode_ALU_BITWISE_CTRL = _zz_7_;
  assign _zz_8_ = _zz_9_;
  assign decode_SHIFT_CTRL = _zz_10_;
  assign _zz_11_ = _zz_12_;
  assign decode_ENV_CTRL = _zz_13_;
  assign _zz_14_ = _zz_15_;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_59_;
  assign decode_SRC_USE_SUB_LESS = _zz_47_;
  assign decode_MEMORY_ENABLE = _zz_50_;
  assign decode_BRANCH_CTRL = _zz_16_;
  assign _zz_17_ = _zz_18_;
  assign decode_SRC2_CTRL = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign execute_ENV_CTRL = _zz_24_;
  assign execute_BRANCH_CALC = _zz_25_;
  assign execute_BRANCH_DO = _zz_27_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = _zz_41_;
  assign execute_BRANCH_CTRL = _zz_26_;
  assign execute_SHIFT_CTRL = _zz_28_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign execute_SRC2_CTRL = _zz_32_;
  assign execute_SRC1_CTRL = _zz_34_;
  assign execute_SRC_ADD_SUB = _zz_31_;
  assign execute_SRC_LESS = _zz_29_;
  assign execute_ALU_CTRL = _zz_36_;
  assign execute_SRC2 = _zz_33_;
  assign execute_SRC1 = _zz_35_;
  assign execute_ALU_BITWISE_CTRL = _zz_38_;
  always @ (*) begin
    _zz_39_ = 1'b0;
    if(execute_RegFilePlugin_regFileWrite_valid)begin
      _zz_39_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_44_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = _zz_54_;
  assign decode_INSTRUCTION_READY = 1'b1;
  always @ (*) begin
    _zz_55_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_ALIGNEMENT_FAULT)) && (! execute_DBusSimplePlugin_cmdSent)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_INSTRUCTION[5])) && (! dBus_rsp_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((execute_arbitration_isValid && execute_MEMORY_ENABLE))begin
      _zz_55_ = execute_DBusSimplePlugin_rspFormated;
    end
    if(_zz_134_)begin
      _zz_55_ = _zz_105_;
      if(_zz_135_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_55_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_MEMORY_ADDRESS_LOW = _zz_57_;
  assign execute_MEMORY_READ_DATA = _zz_56_;
  assign execute_REGFILE_WRITE_DATA = _zz_37_;
  assign execute_RS2 = _zz_40_;
  assign execute_SRC_ADD = _zz_30_;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_ALIGNEMENT_FAULT = _zz_58_;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign decode_PC = _zz_61_;
  assign decode_INSTRUCTION = _zz_60_;
  assign decode_arbitration_haltItself = 1'b0;
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
    if(decode_exception_agregat_valid)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_flushAll = 1'b0;
    execute_arbitration_removeIt = 1'b0;
    _zz_68_ = 1'b0;
    _zz_69_ = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(_zz_65_)begin
      decode_arbitration_flushAll = 1'b1;
    end
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_exception_agregat_valid)begin
      decode_arbitration_flushAll = 1'b1;
      execute_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(_zz_136_)begin
      _zz_68_ = 1'b1;
      _zz_69_ = {CsrPlugin_mtvec_base,(2'b00)};
      decode_arbitration_flushAll = 1'b1;
    end
    if(_zz_137_)begin
      _zz_69_ = CsrPlugin_mepc;
      _zz_68_ = 1'b1;
      decode_arbitration_flushAll = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_redoIt = 1'b0;
  assign execute_arbitration_haltByOther = 1'b0;
  assign execute_arbitration_flushAll = 1'b0;
  assign execute_arbitration_redoIt = 1'b0;
  always @ (*) begin
    _zz_62_ = 1'b0;
    if((CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode || CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute))begin
      _zz_62_ = 1'b1;
    end
  end

  assign _zz_63_ = 1'b0;
  assign IBusSimplePlugin_jump_pcLoad_valid = (_zz_65_ || _zz_68_);
  assign _zz_70_ = {_zz_68_,_zz_65_};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_143_[0] ? _zz_66_ : _zz_69_);
  assign _zz_71_ = (! _zz_62_);
  assign IBusSimplePlugin_fetchPc_output_valid = (IBusSimplePlugin_fetchPc_preOutput_valid && _zz_71_);
  assign IBusSimplePlugin_fetchPc_preOutput_ready = (IBusSimplePlugin_fetchPc_output_ready && _zz_71_);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_preOutput_payload;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_propagatePc = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_iBusRsp_stages_1_input_ready))begin
      IBusSimplePlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_146_);
    IBusSimplePlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusSimplePlugin_fetchPc_propagatePc)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    if(_zz_138_)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusSimplePlugin_fetchPc_preOutput_valid = _zz_72_;
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

  assign _zz_73_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_73_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_73_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_74_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_74_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_74_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_75_;
  assign _zz_75_ = ((1'b0 && (! _zz_76_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_76_ = _zz_77_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_76_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  assign IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
  assign IBusSimplePlugin_iBusRsp_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = (IBusSimplePlugin_iBusRsp_decodeInput_valid && (! IBusSimplePlugin_injector_decodeRemoved));
  assign _zz_61_ = IBusSimplePlugin_iBusRsp_decodeInput_payload_pc;
  assign _zz_60_ = IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_rawInDecode;
  assign _zz_59_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_147_ - iBus_rsp_valid);
  assign IBusSimplePlugin_cmd_valid = ((IBusSimplePlugin_iBusRsp_stages_0_input_valid && (IBusSimplePlugin_pendingCmd != (1'b1))) && (! (decode_arbitration_isValid || execute_arbitration_isValid)));
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],(2'b00)};
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_valid = (iBus_rsp_valid && (! (IBusSimplePlugin_rspJoin_discardCounter != (1'b0))));
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_error = iBus_rsp_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_rspStream_payload_inst = iBus_rsp_payload_inst;
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
  assign _zz_78_ = (! IBusSimplePlugin_rspJoin_issueDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_decodeInput_ready && _zz_78_);
  assign IBusSimplePlugin_iBusRsp_decodeInput_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_78_);
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_rawInDecode = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_58_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_ALIGNEMENT_FAULT)) && (! execute_DBusSimplePlugin_cmdSent));
  assign dBus_cmd_payload_wr = execute_INSTRUCTION[5];
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_79_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_79_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_79_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_79_;
  assign _zz_57_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_80_ = (4'b0001);
      end
      2'b01 : begin
        _zz_80_ = (4'b0011);
      end
      default : begin
        _zz_80_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_80_ <<< dBus_cmd_payload_address[1 : 0]);
  assign _zz_56_ = dBus_rsp_data;
  always @ (*) begin
    _zz_64_ = execute_ALIGNEMENT_FAULT;
    if((! ((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers))))begin
      _zz_64_ = 1'b0;
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

  assign _zz_81_ = (execute_DBusSimplePlugin_rspShifted[7] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_82_[31] = _zz_81_;
    _zz_82_[30] = _zz_81_;
    _zz_82_[29] = _zz_81_;
    _zz_82_[28] = _zz_81_;
    _zz_82_[27] = _zz_81_;
    _zz_82_[26] = _zz_81_;
    _zz_82_[25] = _zz_81_;
    _zz_82_[24] = _zz_81_;
    _zz_82_[23] = _zz_81_;
    _zz_82_[22] = _zz_81_;
    _zz_82_[21] = _zz_81_;
    _zz_82_[20] = _zz_81_;
    _zz_82_[19] = _zz_81_;
    _zz_82_[18] = _zz_81_;
    _zz_82_[17] = _zz_81_;
    _zz_82_[16] = _zz_81_;
    _zz_82_[15] = _zz_81_;
    _zz_82_[14] = _zz_81_;
    _zz_82_[13] = _zz_81_;
    _zz_82_[12] = _zz_81_;
    _zz_82_[11] = _zz_81_;
    _zz_82_[10] = _zz_81_;
    _zz_82_[9] = _zz_81_;
    _zz_82_[8] = _zz_81_;
    _zz_82_[7 : 0] = execute_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_83_ = (execute_DBusSimplePlugin_rspShifted[15] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_84_[31] = _zz_83_;
    _zz_84_[30] = _zz_83_;
    _zz_84_[29] = _zz_83_;
    _zz_84_[28] = _zz_83_;
    _zz_84_[27] = _zz_83_;
    _zz_84_[26] = _zz_83_;
    _zz_84_[25] = _zz_83_;
    _zz_84_[24] = _zz_83_;
    _zz_84_[23] = _zz_83_;
    _zz_84_[22] = _zz_83_;
    _zz_84_[21] = _zz_83_;
    _zz_84_[20] = _zz_83_;
    _zz_84_[19] = _zz_83_;
    _zz_84_[18] = _zz_83_;
    _zz_84_[17] = _zz_83_;
    _zz_84_[16] = _zz_83_;
    _zz_84_[15 : 0] = execute_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_140_)
      2'b00 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_82_;
      end
      2'b01 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_84_;
      end
      default : begin
        execute_DBusSimplePlugin_rspFormated = execute_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_86_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000010000));
  assign _zz_87_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_88_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_89_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_85_ = {({(_zz_182_ == _zz_183_),{_zz_184_,_zz_185_}} != (3'b000)),{((_zz_186_ == _zz_187_) != (1'b0)),{(_zz_188_ != (1'b0)),{(_zz_189_ != _zz_190_),{_zz_191_,{_zz_192_,_zz_193_}}}}}};
  assign _zz_54_ = ({((decode_INSTRUCTION & (32'b00000000000000000000000001011111)) == (32'b00000000000000000000000000010111)),{((decode_INSTRUCTION & (32'b00000000000000000000000001111111)) == (32'b00000000000000000000000001101111)),{((decode_INSTRUCTION & (32'b00000000000000000001000001101111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_282_) == (32'b00000000000000000001000001110011)),{(_zz_283_ == _zz_284_),{_zz_285_,{_zz_286_,_zz_287_}}}}}}} != (18'b000000000000000000));
  assign _zz_90_ = _zz_85_[2 : 1];
  assign _zz_53_ = _zz_90_;
  assign _zz_91_ = _zz_85_[5 : 4];
  assign _zz_52_ = _zz_91_;
  assign _zz_92_ = _zz_85_[7 : 6];
  assign _zz_51_ = _zz_92_;
  assign _zz_50_ = _zz_148_[0];
  assign _zz_93_ = _zz_85_[9 : 9];
  assign _zz_49_ = _zz_93_;
  assign _zz_48_ = _zz_149_[0];
  assign _zz_47_ = _zz_150_[0];
  assign _zz_94_ = _zz_85_[14 : 13];
  assign _zz_46_ = _zz_94_;
  assign _zz_45_ = _zz_151_[0];
  assign _zz_44_ = _zz_152_[0];
  assign _zz_95_ = _zz_85_[20 : 19];
  assign _zz_43_ = _zz_95_;
  assign _zz_96_ = _zz_85_[22 : 21];
  assign _zz_42_ = _zz_96_;
  assign decode_exception_agregat_valid = ((decode_arbitration_isValid && decode_INSTRUCTION_READY) && (! decode_LEGAL_INSTRUCTION));
  assign decode_exception_agregat_payload_code = (4'b0010);
  assign decode_exception_agregat_payload_badAddr = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  assign execute_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign _zz_97_ = (! execute_arbitration_isStuck);
  assign execute_RegFilePlugin_rs1Data = _zz_132_;
  assign execute_RegFilePlugin_rs2Data = _zz_133_;
  assign _zz_41_ = execute_RegFilePlugin_rs1Data;
  assign _zz_40_ = execute_RegFilePlugin_rs2Data;
  assign execute_RegFilePlugin_regFileWrite_valid = (execute_REGFILE_WRITE_VALID && execute_arbitration_isFiring);
  assign execute_RegFilePlugin_regFileWrite_payload_address = execute_INSTRUCTION[11 : 7];
  assign execute_RegFilePlugin_regFileWrite_payload_data = _zz_55_;
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
        _zz_98_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_98_ = {31'd0, _zz_153_};
      end
      default : begin
        _zz_98_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_37_ = _zz_98_;
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_99_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_99_ = {29'd0, _zz_154_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_99_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_99_ = {27'd0, _zz_155_};
      end
    endcase
  end

  assign _zz_35_ = _zz_99_;
  assign _zz_100_ = _zz_156_[11];
  always @ (*) begin
    _zz_101_[19] = _zz_100_;
    _zz_101_[18] = _zz_100_;
    _zz_101_[17] = _zz_100_;
    _zz_101_[16] = _zz_100_;
    _zz_101_[15] = _zz_100_;
    _zz_101_[14] = _zz_100_;
    _zz_101_[13] = _zz_100_;
    _zz_101_[12] = _zz_100_;
    _zz_101_[11] = _zz_100_;
    _zz_101_[10] = _zz_100_;
    _zz_101_[9] = _zz_100_;
    _zz_101_[8] = _zz_100_;
    _zz_101_[7] = _zz_100_;
    _zz_101_[6] = _zz_100_;
    _zz_101_[5] = _zz_100_;
    _zz_101_[4] = _zz_100_;
    _zz_101_[3] = _zz_100_;
    _zz_101_[2] = _zz_100_;
    _zz_101_[1] = _zz_100_;
    _zz_101_[0] = _zz_100_;
  end

  assign _zz_102_ = _zz_157_[11];
  always @ (*) begin
    _zz_103_[19] = _zz_102_;
    _zz_103_[18] = _zz_102_;
    _zz_103_[17] = _zz_102_;
    _zz_103_[16] = _zz_102_;
    _zz_103_[15] = _zz_102_;
    _zz_103_[14] = _zz_102_;
    _zz_103_[13] = _zz_102_;
    _zz_103_[12] = _zz_102_;
    _zz_103_[11] = _zz_102_;
    _zz_103_[10] = _zz_102_;
    _zz_103_[9] = _zz_102_;
    _zz_103_[8] = _zz_102_;
    _zz_103_[7] = _zz_102_;
    _zz_103_[6] = _zz_102_;
    _zz_103_[5] = _zz_102_;
    _zz_103_[4] = _zz_102_;
    _zz_103_[3] = _zz_102_;
    _zz_103_[2] = _zz_102_;
    _zz_103_[1] = _zz_102_;
    _zz_103_[0] = _zz_102_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_104_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_104_ = {_zz_101_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_104_ = {_zz_103_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_104_ = execute_PC;
      end
    endcase
  end

  assign _zz_33_ = _zz_104_;
  assign execute_SrcPlugin_addSub = _zz_158_;
  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_31_ = execute_SrcPlugin_addSub;
  assign _zz_30_ = execute_SrcPlugin_addSub;
  assign _zz_29_ = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_shiftReg : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_105_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_105_ = _zz_166_;
      end
    endcase
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_106_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_106_ == (3'b000))) begin
        _zz_107_ = execute_BranchPlugin_eq;
    end else if((_zz_106_ == (3'b001))) begin
        _zz_107_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_106_ & (3'b101)) == (3'b101)))) begin
        _zz_107_ = (! execute_SRC_LESS);
    end else begin
        _zz_107_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_108_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_108_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_108_ = 1'b1;
      end
      default : begin
        _zz_108_ = _zz_107_;
      end
    endcase
  end

  assign _zz_27_ = _zz_108_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_109_ = _zz_168_[19];
  always @ (*) begin
    _zz_110_[10] = _zz_109_;
    _zz_110_[9] = _zz_109_;
    _zz_110_[8] = _zz_109_;
    _zz_110_[7] = _zz_109_;
    _zz_110_[6] = _zz_109_;
    _zz_110_[5] = _zz_109_;
    _zz_110_[4] = _zz_109_;
    _zz_110_[3] = _zz_109_;
    _zz_110_[2] = _zz_109_;
    _zz_110_[1] = _zz_109_;
    _zz_110_[0] = _zz_109_;
  end

  assign _zz_111_ = _zz_169_[11];
  always @ (*) begin
    _zz_112_[19] = _zz_111_;
    _zz_112_[18] = _zz_111_;
    _zz_112_[17] = _zz_111_;
    _zz_112_[16] = _zz_111_;
    _zz_112_[15] = _zz_111_;
    _zz_112_[14] = _zz_111_;
    _zz_112_[13] = _zz_111_;
    _zz_112_[12] = _zz_111_;
    _zz_112_[11] = _zz_111_;
    _zz_112_[10] = _zz_111_;
    _zz_112_[9] = _zz_111_;
    _zz_112_[8] = _zz_111_;
    _zz_112_[7] = _zz_111_;
    _zz_112_[6] = _zz_111_;
    _zz_112_[5] = _zz_111_;
    _zz_112_[4] = _zz_111_;
    _zz_112_[3] = _zz_111_;
    _zz_112_[2] = _zz_111_;
    _zz_112_[1] = _zz_111_;
    _zz_112_[0] = _zz_111_;
  end

  assign _zz_113_ = _zz_170_[11];
  always @ (*) begin
    _zz_114_[18] = _zz_113_;
    _zz_114_[17] = _zz_113_;
    _zz_114_[16] = _zz_113_;
    _zz_114_[15] = _zz_113_;
    _zz_114_[14] = _zz_113_;
    _zz_114_[13] = _zz_113_;
    _zz_114_[12] = _zz_113_;
    _zz_114_[11] = _zz_113_;
    _zz_114_[10] = _zz_113_;
    _zz_114_[9] = _zz_113_;
    _zz_114_[8] = _zz_113_;
    _zz_114_[7] = _zz_113_;
    _zz_114_[6] = _zz_113_;
    _zz_114_[5] = _zz_113_;
    _zz_114_[4] = _zz_113_;
    _zz_114_[3] = _zz_113_;
    _zz_114_[2] = _zz_113_;
    _zz_114_[1] = _zz_113_;
    _zz_114_[0] = _zz_113_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_115_ = {{_zz_110_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_115_ = {_zz_112_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_115_ = {{_zz_114_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_115_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_25_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign _zz_65_ = ((execute_arbitration_isValid && (! execute_arbitration_isStuckByOthers)) && execute_BRANCH_DO);
  assign _zz_66_ = execute_BRANCH_CALC;
  always @ (*) begin
    _zz_67_ = ((execute_arbitration_isValid && execute_BRANCH_DO) && _zz_66_[1]);
    if(1'b0)begin
      _zz_67_ = 1'b0;
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000001000010);
  assign CsrPlugin_medeleg = (32'b00000000000000000000000000000000);
  assign CsrPlugin_mideleg = (32'b00000000000000000000000000000000);
  assign _zz_116_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_117_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_118_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = CsrPlugin_privilege;
  assign execute_exception_agregat_valid = (_zz_64_ || _zz_67_);
  assign _zz_119_ = {_zz_67_,_zz_64_};
  assign _zz_120_ = _zz_171_[0];
  assign execute_exception_agregat_payload_code = (_zz_120_ ? _zz_174_ : (4'b0000));
  assign execute_exception_agregat_payload_badAddr = (_zz_120_ ? execute_REGFILE_WRITE_DATA : _zz_66_);
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(decode_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'bxxxx);
    CsrPlugin_interruptTargetPrivilege = (2'bxx);
    if(CsrPlugin_mstatus_MIE)begin
      if(((_zz_116_ || _zz_117_) || _zz_118_))begin
        CsrPlugin_interrupt = 1'b1;
      end
      if(_zz_116_)begin
        CsrPlugin_interruptCode = (4'b0111);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if(_zz_117_)begin
        CsrPlugin_interruptCode = (4'b0011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
      if(_zz_118_)begin
        CsrPlugin_interruptCode = (4'b1011);
        CsrPlugin_interruptTargetPrivilege = (2'b11);
      end
    end
    if((! 1'b1))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && 1'b1);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! execute_arbitration_isValid) && IBusSimplePlugin_injector_nextPcCalc_1);
    if(CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute)begin
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

  assign contextSwitching = _zz_68_;
  assign _zz_23_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_22_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_blockedBySideEffects = 1'b0;
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = _zz_121_;
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
        execute_CsrPlugin_readData[31 : 0] = _zz_122_;
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

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  always @ (*) begin
    case(_zz_142_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readData & (~ execute_SRC1)) : (execute_CsrPlugin_readData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_122_ = (_zz_121_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_122_ != (32'b00000000000000000000000000000000));
  assign _zz_21_ = decode_SRC2_CTRL;
  assign _zz_19_ = _zz_51_;
  assign _zz_32_ = decode_to_execute_SRC2_CTRL;
  assign _zz_18_ = decode_BRANCH_CTRL;
  assign _zz_16_ = _zz_53_;
  assign _zz_26_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_15_ = decode_ENV_CTRL;
  assign _zz_13_ = _zz_49_;
  assign _zz_24_ = decode_to_execute_ENV_CTRL;
  assign _zz_12_ = decode_SHIFT_CTRL;
  assign _zz_10_ = _zz_43_;
  assign _zz_28_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_9_ = decode_ALU_BITWISE_CTRL;
  assign _zz_7_ = _zz_52_;
  assign _zz_38_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_6_ = decode_ALU_CTRL;
  assign _zz_4_ = _zz_42_;
  assign _zz_36_ = decode_to_execute_ALU_CTRL;
  assign _zz_3_ = decode_SRC1_CTRL;
  assign _zz_1_ = _zz_46_;
  assign _zz_34_ = decode_to_execute_SRC1_CTRL;
  assign decode_arbitration_isFlushed = (decode_arbitration_flushAll || execute_arbitration_flushAll);
  assign execute_arbitration_isFlushed = execute_arbitration_flushAll;
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (1'b0 || execute_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || 1'b0);
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign iBus_cmd_ready = ((1'b1 && (! iBus_cmd_m2sPipe_valid)) || iBus_cmd_m2sPipe_ready);
  assign iBus_cmd_m2sPipe_valid = _zz_123_;
  assign iBus_cmd_m2sPipe_payload_pc = _zz_124_;
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
  assign dBus_cmd_halfPipe_valid = _zz_125_;
  assign dBus_cmd_halfPipe_payload_wr = _zz_127_;
  assign dBus_cmd_halfPipe_payload_address = _zz_128_;
  assign dBus_cmd_halfPipe_payload_data = _zz_129_;
  assign dBus_cmd_halfPipe_payload_size = _zz_130_;
  assign dBus_cmd_ready = _zz_126_;
  assign dBusWishbone_ADR = (dBus_cmd_halfPipe_payload_address >>> 2);
  assign dBusWishbone_CTI = (3'b000);
  assign dBusWishbone_BTE = (2'b00);
  always @ (*) begin
    case(dBus_cmd_halfPipe_payload_size)
      2'b00 : begin
        _zz_131_ = (4'b0001);
      end
      2'b01 : begin
        _zz_131_ = (4'b0011);
      end
      default : begin
        _zz_131_ = (4'b1111);
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = _zz_181_[3:0];
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
      _zz_72_ <= 1'b0;
      _zz_77_ <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_1 <= 1'b0;
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
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      _zz_121_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      _zz_123_ <= 1'b0;
      _zz_125_ <= 1'b0;
      _zz_126_ <= 1'b1;
    end else begin
      if(IBusSimplePlugin_fetchPc_propagatePc)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_138_)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_samplePcNext)begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      _zz_72_ <= 1'b1;
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_63_))begin
        _zz_77_ <= 1'b0;
      end
      if(_zz_75_)begin
        _zz_77_ <= IBusSimplePlugin_iBusRsp_stages_0_output_valid;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_63_))begin
        IBusSimplePlugin_injector_nextPcCalc_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_0 <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_63_))begin
        IBusSimplePlugin_injector_nextPcCalc_1 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_1 <= IBusSimplePlugin_injector_nextPcCalc_0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_63_))begin
        IBusSimplePlugin_injector_nextPcCalc_1 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_63_))begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      end
      IBusSimplePlugin_pendingCmd <= IBusSimplePlugin_pendingCmdNext;
      IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_rspJoin_discardCounter - (iBus_rsp_valid && (IBusSimplePlugin_rspJoin_discardCounter != (1'b0))));
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_63_))begin
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
      if(_zz_134_)begin
        if(_zz_135_)begin
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
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_136_)begin
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
      if(_zz_137_)begin
        case(_zz_141_)
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
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_121_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_175_[0];
            CsrPlugin_mstatus_MIE <= _zz_176_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000101 : begin
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mip_MSIP <= _zz_177_[0];
          end
        end
        12'b001101000011 : begin
        end
        12'b111111000000 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_178_[0];
            CsrPlugin_mie_MTIE <= _zz_179_[0];
            CsrPlugin_mie_MSIE <= _zz_180_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(iBus_cmd_ready)begin
        _zz_123_ <= iBus_cmd_valid;
      end
      if(_zz_139_)begin
        _zz_125_ <= dBus_cmd_valid;
        _zz_126_ <= (! dBus_cmd_valid);
      end else begin
        _zz_125_ <= (! dBus_cmd_halfPipe_ready);
        _zz_126_ <= dBus_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge clk) begin
    if((! execute_arbitration_isStuckByOthers))begin
      execute_LightShifterPlugin_shiftReg <= _zz_55_;
    end
    if(_zz_134_)begin
      if(_zz_135_)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - (5'b00001));
      end
    end
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(execute_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(decode_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= decode_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= decode_exception_agregat_payload_badAddr;
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
    if(_zz_136_)begin
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
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_20_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_17_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_14_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_11_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_8_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_2_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
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
      12'b001100000100 : begin
      end
      12'b001101000010 : begin
      end
      default : begin
      end
    endcase
    if(iBus_cmd_ready)begin
      _zz_124_ <= iBus_cmd_payload_pc;
    end
    if(_zz_139_)begin
      _zz_127_ <= dBus_cmd_payload_wr;
      _zz_128_ <= dBus_cmd_payload_address;
      _zz_129_ <= dBus_cmd_payload_data;
      _zz_130_ <= dBus_cmd_payload_size;
    end
  end

endmodule

