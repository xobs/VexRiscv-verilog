// Generator : SpinalHDL v1.3.2    git head : 41815ceafff4e72c2e3a3e1ff7e9ada5202a0d26
// Date      : 26/03/2019, 03:04:08
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

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10
`define AluBitwiseCtrlEnum_defaultEncoding_SRC1 2'b11

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

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

module StreamFifoLowLatency (
      input   io_push_valid,
      output  io_push_ready,
      input   io_push_payload_error,
      input  [31:0] io_push_payload_inst,
      output reg  io_pop_valid,
      input   io_pop_ready,
      output reg  io_pop_payload_error,
      output reg [31:0] io_pop_payload_inst,
      input   io_flush,
      output [0:0] io_occupancy,
      input   clk,
      input   reset);
  wire [0:0] _zz_5_;
  reg  _zz_1_;
  reg  pushPtr_willIncrement;
  reg  pushPtr_willClear;
  wire  pushPtr_willOverflowIfInc;
  wire  pushPtr_willOverflow;
  reg  popPtr_willIncrement;
  reg  popPtr_willClear;
  wire  popPtr_willOverflowIfInc;
  wire  popPtr_willOverflow;
  wire  ptrMatch;
  reg  risingOccupancy;
  wire  empty;
  wire  full;
  wire  pushing;
  wire  popping;
  wire [32:0] _zz_2_;
  wire [32:0] _zz_3_;
  reg [32:0] _zz_4_;
  assign _zz_5_ = _zz_2_[0 : 0];
  always @ (*) begin
    _zz_1_ = 1'b0;
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      _zz_1_ = 1'b1;
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
      popPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if((! empty))begin
      io_pop_valid = 1'b1;
      io_pop_payload_error = _zz_5_[0];
      io_pop_payload_inst = _zz_2_[32 : 1];
    end else begin
      io_pop_valid = io_push_valid;
      io_pop_payload_error = io_push_payload_error;
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign _zz_2_ = _zz_3_;
  assign io_occupancy = (risingOccupancy && ptrMatch);
  assign _zz_3_ = _zz_4_;
  always @ (posedge clk) begin
    if(reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_1_)begin
      _zz_4_ <= {io_push_payload_inst,io_push_payload_error};
    end
  end

endmodule

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
  wire  _zz_157_;
  reg [31:0] _zz_158_;
  reg [31:0] _zz_159_;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire  IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire [0:0] IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire  _zz_160_;
  wire  _zz_161_;
  wire  _zz_162_;
  wire  _zz_163_;
  wire  _zz_164_;
  wire  _zz_165_;
  wire  _zz_166_;
  wire  _zz_167_;
  wire [5:0] _zz_168_;
  wire  _zz_169_;
  wire [1:0] _zz_170_;
  wire [1:0] _zz_171_;
  wire  _zz_172_;
  wire [1:0] _zz_173_;
  wire [1:0] _zz_174_;
  wire [2:0] _zz_175_;
  wire [31:0] _zz_176_;
  wire [1:0] _zz_177_;
  wire [0:0] _zz_178_;
  wire [1:0] _zz_179_;
  wire [0:0] _zz_180_;
  wire [1:0] _zz_181_;
  wire [0:0] _zz_182_;
  wire [1:0] _zz_183_;
  wire [0:0] _zz_184_;
  wire [1:0] _zz_185_;
  wire [2:0] _zz_186_;
  wire [0:0] _zz_187_;
  wire [0:0] _zz_188_;
  wire [0:0] _zz_189_;
  wire [0:0] _zz_190_;
  wire [0:0] _zz_191_;
  wire [0:0] _zz_192_;
  wire [0:0] _zz_193_;
  wire [0:0] _zz_194_;
  wire [0:0] _zz_195_;
  wire [0:0] _zz_196_;
  wire [0:0] _zz_197_;
  wire [2:0] _zz_198_;
  wire [4:0] _zz_199_;
  wire [11:0] _zz_200_;
  wire [11:0] _zz_201_;
  wire [31:0] _zz_202_;
  wire [31:0] _zz_203_;
  wire [31:0] _zz_204_;
  wire [31:0] _zz_205_;
  wire [1:0] _zz_206_;
  wire [31:0] _zz_207_;
  wire [1:0] _zz_208_;
  wire [1:0] _zz_209_;
  wire [31:0] _zz_210_;
  wire [32:0] _zz_211_;
  wire [19:0] _zz_212_;
  wire [11:0] _zz_213_;
  wire [11:0] _zz_214_;
  wire [1:0] _zz_215_;
  wire [1:0] _zz_216_;
  wire [0:0] _zz_217_;
  wire [0:0] _zz_218_;
  wire [0:0] _zz_219_;
  wire [0:0] _zz_220_;
  wire [0:0] _zz_221_;
  wire [0:0] _zz_222_;
  wire [0:0] _zz_223_;
  wire [0:0] _zz_224_;
  wire [30:0] _zz_225_;
  wire [30:0] _zz_226_;
  wire [30:0] _zz_227_;
  wire [30:0] _zz_228_;
  wire [30:0] _zz_229_;
  wire [30:0] _zz_230_;
  wire [30:0] _zz_231_;
  wire [30:0] _zz_232_;
  wire [0:0] _zz_233_;
  wire [0:0] _zz_234_;
  wire [0:0] _zz_235_;
  wire [0:0] _zz_236_;
  wire [0:0] _zz_237_;
  wire [0:0] _zz_238_;
  wire [6:0] _zz_239_;
  wire  _zz_240_;
  wire  _zz_241_;
  wire [31:0] _zz_242_;
  wire [31:0] _zz_243_;
  wire [31:0] _zz_244_;
  wire [31:0] _zz_245_;
  wire [0:0] _zz_246_;
  wire [0:0] _zz_247_;
  wire [2:0] _zz_248_;
  wire [2:0] _zz_249_;
  wire  _zz_250_;
  wire [0:0] _zz_251_;
  wire [19:0] _zz_252_;
  wire [31:0] _zz_253_;
  wire  _zz_254_;
  wire  _zz_255_;
  wire  _zz_256_;
  wire [0:0] _zz_257_;
  wire [0:0] _zz_258_;
  wire  _zz_259_;
  wire [5:0] _zz_260_;
  wire [5:0] _zz_261_;
  wire  _zz_262_;
  wire [0:0] _zz_263_;
  wire [16:0] _zz_264_;
  wire [31:0] _zz_265_;
  wire [31:0] _zz_266_;
  wire [31:0] _zz_267_;
  wire [31:0] _zz_268_;
  wire [31:0] _zz_269_;
  wire [31:0] _zz_270_;
  wire [31:0] _zz_271_;
  wire [31:0] _zz_272_;
  wire  _zz_273_;
  wire [0:0] _zz_274_;
  wire [3:0] _zz_275_;
  wire  _zz_276_;
  wire [2:0] _zz_277_;
  wire [2:0] _zz_278_;
  wire  _zz_279_;
  wire [0:0] _zz_280_;
  wire [14:0] _zz_281_;
  wire [31:0] _zz_282_;
  wire [31:0] _zz_283_;
  wire [31:0] _zz_284_;
  wire  _zz_285_;
  wire [0:0] _zz_286_;
  wire [1:0] _zz_287_;
  wire [31:0] _zz_288_;
  wire  _zz_289_;
  wire [0:0] _zz_290_;
  wire [0:0] _zz_291_;
  wire  _zz_292_;
  wire [1:0] _zz_293_;
  wire [1:0] _zz_294_;
  wire  _zz_295_;
  wire [0:0] _zz_296_;
  wire [12:0] _zz_297_;
  wire [31:0] _zz_298_;
  wire [31:0] _zz_299_;
  wire [31:0] _zz_300_;
  wire  _zz_301_;
  wire [31:0] _zz_302_;
  wire [31:0] _zz_303_;
  wire [31:0] _zz_304_;
  wire [31:0] _zz_305_;
  wire [31:0] _zz_306_;
  wire [31:0] _zz_307_;
  wire  _zz_308_;
  wire  _zz_309_;
  wire  _zz_310_;
  wire [1:0] _zz_311_;
  wire [1:0] _zz_312_;
  wire  _zz_313_;
  wire [0:0] _zz_314_;
  wire [10:0] _zz_315_;
  wire [31:0] _zz_316_;
  wire [31:0] _zz_317_;
  wire [31:0] _zz_318_;
  wire [31:0] _zz_319_;
  wire  _zz_320_;
  wire [0:0] _zz_321_;
  wire [0:0] _zz_322_;
  wire  _zz_323_;
  wire [0:0] _zz_324_;
  wire [7:0] _zz_325_;
  wire [31:0] _zz_326_;
  wire [31:0] _zz_327_;
  wire  _zz_328_;
  wire [0:0] _zz_329_;
  wire [0:0] _zz_330_;
  wire  _zz_331_;
  wire  _zz_332_;
  wire [0:0] _zz_333_;
  wire [1:0] _zz_334_;
  wire [1:0] _zz_335_;
  wire [1:0] _zz_336_;
  wire  _zz_337_;
  wire [0:0] _zz_338_;
  wire [3:0] _zz_339_;
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
  wire [0:0] _zz_351_;
  wire [0:0] _zz_352_;
  wire [0:0] _zz_353_;
  wire [0:0] _zz_354_;
  wire  _zz_355_;
  wire [0:0] _zz_356_;
  wire [1:0] _zz_357_;
  wire [31:0] _zz_358_;
  wire  _zz_359_;
  wire [0:0] _zz_360_;
  wire [0:0] _zz_361_;
  wire [0:0] _zz_362_;
  wire [0:0] _zz_363_;
  wire [1:0] _zz_364_;
  wire [1:0] _zz_365_;
  wire  _zz_366_;
  wire  _zz_367_;
  wire  _zz_368_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_1_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_2_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_3_;
  wire [31:0] memory_MEMORY_READ_DATA;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire  decode_SRC_LESS_UNSIGNED;
  wire [31:0] memory_PC;
  wire  decode_DO_EBREAK;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire  decode_SRC_USE_SUB_LESS;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_4_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_5_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_6_;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_7_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_8_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_9_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_10_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_11_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_12_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_13_;
  wire  decode_RS2_USE;
  wire  decode_MEMORY_ENABLE;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  decode_RS1_USE;
  wire  execute_REGFILE_WRITE_VALID;
  wire  decode_CSR_WRITE_OPCODE;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_14_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_15_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_16_;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_17_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_18_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_19_;
  wire  decode_IS_CSR;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_20_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_21_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_22_;
  wire  decode_CSR_READ_OPCODE;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_23_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_24_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_25_;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  _zz_26_;
  wire  execute_RS2_USE;
  wire  execute_RS1_USE;
  wire  memory_REGFILE_WRITE_VALID;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
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
  wire  execute_IS_FENCEI;
  reg [31:0] _zz_32_;
  wire  decode_IS_FENCEI;
  wire [31:0] execute_BRANCH_CALC;
  wire  execute_BRANCH_DO;
  wire [31:0] _zz_33_;
  wire [31:0] execute_PC;
  wire [31:0] execute_RS1;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_34_;
  wire  _zz_35_;
  reg [31:0] _zz_36_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_37_;
  wire  _zz_38_;
  wire [31:0] _zz_39_;
  wire [31:0] _zz_40_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_41_;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_42_;
  wire [31:0] _zz_43_;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_44_;
  wire [31:0] _zz_45_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_46_;
  wire [31:0] _zz_47_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_48_;
  wire [31:0] _zz_49_;
  wire  _zz_50_;
  reg  _zz_51_;
  wire [31:0] _zz_52_;
  wire [31:0] _zz_53_;
  reg  decode_REGFILE_WRITE_VALID;
  wire  _zz_54_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_55_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_56_;
  wire  _zz_57_;
  wire  _zz_58_;
  wire  _zz_59_;
  wire  _zz_60_;
  wire  _zz_61_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_62_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_63_;
  wire  _zz_64_;
  wire  _zz_65_;
  wire  _zz_66_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_67_;
  wire  _zz_68_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_69_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_70_;
  reg [31:0] _zz_71_;
  wire  writeBack_MEMORY_ENABLE;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_MEMORY_READ_DATA;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire  memory_ALIGNEMENT_FAULT;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_MEMORY_ENABLE;
  wire [31:0] _zz_72_;
  wire [1:0] _zz_73_;
  wire [31:0] execute_RS2;
  wire [31:0] execute_SRC_ADD;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_ALIGNEMENT_FAULT;
  wire  execute_MEMORY_ENABLE;
  wire  _zz_74_;
  reg [31:0] _zz_75_;
  wire [31:0] _zz_76_;
  wire [31:0] _zz_77_;
  wire [31:0] _zz_78_;
  wire [31:0] writeBack_PC /* verilator public */ ;
  wire [31:0] writeBack_INSTRUCTION /* verilator public */ ;
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
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  reg  memory_arbitration_flushAll;
  wire  memory_arbitration_redoIt;
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
  wire  writeBack_arbitration_redoIt;
  reg  writeBack_arbitration_isValid /* verilator public */ ;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isMoving;
  wire  writeBack_arbitration_isFiring /* verilator public */ ;
  reg  _zz_79_;
  reg  _zz_80_;
  reg  _zz_81_;
  wire  iBus_cmd_valid;
  wire  iBus_cmd_ready;
  wire [31:0] iBus_cmd_payload_pc;
  wire  iBus_rsp_valid;
  wire  iBus_rsp_payload_error;
  wire [31:0] iBus_rsp_payload_inst;
  reg  memory_exception_agregat_valid;
  wire [3:0] memory_exception_agregat_payload_code;
  wire [31:0] memory_exception_agregat_payload_badAddr;
  wire  _zz_82_;
  wire [31:0] _zz_83_;
  reg  _zz_84_;
  reg  _zz_85_;
  reg [31:0] _zz_86_;
  wire  externalInterrupt;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  _zz_87_;
  reg [3:0] _zz_88_;
  reg  _zz_89_;
  reg  _zz_90_;
  reg  _zz_91_;
  reg  _zz_92_;
  wire  IBusSimplePlugin_jump_pcLoad_valid;
  wire [31:0] IBusSimplePlugin_jump_pcLoad_payload;
  wire [1:0] _zz_93_;
  wire  IBusSimplePlugin_fetchPc_preOutput_valid;
  wire  IBusSimplePlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_preOutput_payload;
  wire  _zz_94_;
  wire  IBusSimplePlugin_fetchPc_output_valid;
  wire  IBusSimplePlugin_fetchPc_output_ready;
  wire [31:0] IBusSimplePlugin_fetchPc_output_payload;
  reg [31:0] IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusSimplePlugin_fetchPc_inc;
  reg  IBusSimplePlugin_fetchPc_propagatePc;
  reg [31:0] IBusSimplePlugin_fetchPc_pc;
  reg  IBusSimplePlugin_fetchPc_samplePcNext;
  reg  _zz_95_;
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
  wire  _zz_96_;
  wire  _zz_97_;
  wire  _zz_98_;
  wire  _zz_99_;
  reg  _zz_100_;
  wire  IBusSimplePlugin_iBusRsp_readyForError;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_valid;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_ready;
  wire [31:0] IBusSimplePlugin_iBusRsp_decodeInput_payload_pc;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_error;
  wire [31:0] IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst;
  wire  IBusSimplePlugin_iBusRsp_decodeInput_payload_isRvc;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg  IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg  IBusSimplePlugin_injector_decodeRemoved;
  wire  IBusSimplePlugin_cmd_valid;
  wire  IBusSimplePlugin_cmd_ready;
  wire [31:0] IBusSimplePlugin_cmd_payload_pc;
  reg [1:0] IBusSimplePlugin_pendingCmd;
  wire [1:0] IBusSimplePlugin_pendingCmdNext;
  reg [1:0] IBusSimplePlugin_rspJoin_discardCounter;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_valid;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_ready;
  wire  IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error;
  wire [31:0] IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst;
  wire  iBus_rsp_takeWhen_valid;
  wire  iBus_rsp_takeWhen_payload_error;
  wire [31:0] iBus_rsp_takeWhen_payload_inst;
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
  wire  _zz_101_;
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
  reg [31:0] _zz_102_;
  reg [3:0] _zz_103_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  wire  _zz_104_;
  reg [31:0] _zz_105_;
  wire  _zz_106_;
  reg [31:0] _zz_107_;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  wire [25:0] _zz_108_;
  wire  _zz_109_;
  wire  _zz_110_;
  wire  _zz_111_;
  wire  _zz_112_;
  wire  _zz_113_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_114_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_115_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_116_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_117_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_118_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_119_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_120_;
  wire [31:0] execute_RegFilePlugin_srcInstruction;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
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
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_128_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_129_;
  reg  _zz_130_;
  reg  _zz_131_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_132_;
  reg [10:0] _zz_133_;
  wire  _zz_134_;
  reg [19:0] _zz_135_;
  wire  _zz_136_;
  reg [18:0] _zz_137_;
  reg [31:0] _zz_138_;
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
  wire [31:0] CsrPlugin_medeleg;
  wire [31:0] CsrPlugin_mideleg;
  wire  _zz_139_;
  wire  _zz_140_;
  wire  _zz_141_;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire  execute_exception_agregat_valid;
  wire [3:0] execute_exception_agregat_payload_code;
  wire [31:0] execute_exception_agregat_payload_badAddr;
  wire [1:0] _zz_142_;
  wire  _zz_143_;
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
  reg  _zz_144_;
  reg  _zz_145_;
  wire  _zz_146_;
  reg  _zz_147_;
  reg [4:0] _zz_148_;
  reg [31:0] _zz_149_;
  reg [31:0] externalInterruptArray_regNext;
  wire [31:0] _zz_150_;
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
  reg  _zz_151_;
  reg  DebugPlugin_resetIt_regNext;
  reg  decode_to_execute_IS_FENCEI;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  execute_to_memory_ALIGNEMENT_FAULT;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg  decode_to_execute_IS_CSR;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg  decode_to_execute_RS1_USE;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg  decode_to_execute_RS2_USE;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg  decode_to_execute_DO_EBREAK;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg [31:0] memory_to_writeBack_MEMORY_READ_DATA;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg [2:0] _zz_152_;
  reg [31:0] _zz_153_;
  wire  iBus_cmd_m2sPipe_valid;
  wire  iBus_cmd_m2sPipe_ready;
  wire [31:0] iBus_cmd_m2sPipe_payload_pc;
  reg  _zz_154_;
  reg [31:0] _zz_155_;
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
  reg [3:0] _zz_156_;
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
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_14__string;
  reg [39:0] _zz_15__string;
  reg [39:0] _zz_16__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_17__string;
  reg [31:0] _zz_18__string;
  reg [31:0] _zz_19__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_20__string;
  reg [95:0] _zz_21__string;
  reg [95:0] _zz_22__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_23__string;
  reg [63:0] _zz_24__string;
  reg [63:0] _zz_25__string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_27__string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_28__string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_31__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_34__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_37__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_42__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_44__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_46__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_48__string;
  reg [39:0] _zz_55__string;
  reg [63:0] _zz_56__string;
  reg [71:0] _zz_62__string;
  reg [31:0] _zz_63__string;
  reg [95:0] _zz_67__string;
  reg [23:0] _zz_69__string;
  reg [47:0] _zz_70__string;
  reg [47:0] _zz_114__string;
  reg [23:0] _zz_115__string;
  reg [95:0] _zz_116__string;
  reg [31:0] _zz_117__string;
  reg [71:0] _zz_118__string;
  reg [63:0] _zz_119__string;
  reg [39:0] _zz_120__string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_160_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_161_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_162_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_163_ = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign _zz_164_ = (DebugPlugin_stepIt && _zz_81_);
  assign _zz_165_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_166_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_167_ = (IBusSimplePlugin_fetchPc_preOutput_valid && IBusSimplePlugin_fetchPc_preOutput_ready);
  assign _zz_168_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_169_ = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_170_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_171_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_172_ = execute_INSTRUCTION[13];
  assign _zz_173_ = (_zz_93_ & (~ _zz_174_));
  assign _zz_174_ = (_zz_93_ - (2'b01));
  assign _zz_175_ = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_176_ = {29'd0, _zz_175_};
  assign _zz_177_ = (IBusSimplePlugin_pendingCmd + _zz_179_);
  assign _zz_178_ = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign _zz_179_ = {1'd0, _zz_178_};
  assign _zz_180_ = iBus_rsp_valid;
  assign _zz_181_ = {1'd0, _zz_180_};
  assign _zz_182_ = (iBus_rsp_valid && (IBusSimplePlugin_rspJoin_discardCounter != (2'b00)));
  assign _zz_183_ = {1'd0, _zz_182_};
  assign _zz_184_ = iBus_rsp_valid;
  assign _zz_185_ = {1'd0, _zz_184_};
  assign _zz_186_ = (memory_INSTRUCTION[5] ? (3'b110) : (3'b100));
  assign _zz_187_ = _zz_108_[4 : 4];
  assign _zz_188_ = _zz_108_[8 : 8];
  assign _zz_189_ = _zz_108_[9 : 9];
  assign _zz_190_ = _zz_108_[10 : 10];
  assign _zz_191_ = _zz_108_[15 : 15];
  assign _zz_192_ = _zz_108_[16 : 16];
  assign _zz_193_ = _zz_108_[17 : 17];
  assign _zz_194_ = _zz_108_[18 : 18];
  assign _zz_195_ = _zz_108_[19 : 19];
  assign _zz_196_ = _zz_108_[25 : 25];
  assign _zz_197_ = execute_SRC_LESS;
  assign _zz_198_ = (3'b100);
  assign _zz_199_ = execute_INSTRUCTION[19 : 15];
  assign _zz_200_ = execute_INSTRUCTION[31 : 20];
  assign _zz_201_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_202_ = ($signed(_zz_203_) + $signed(_zz_207_));
  assign _zz_203_ = ($signed(_zz_204_) + $signed(_zz_205_));
  assign _zz_204_ = execute_SRC1;
  assign _zz_205_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_206_ = (execute_SRC_USE_SUB_LESS ? _zz_208_ : _zz_209_);
  assign _zz_207_ = {{30{_zz_206_[1]}}, _zz_206_};
  assign _zz_208_ = (2'b01);
  assign _zz_209_ = (2'b00);
  assign _zz_210_ = (_zz_211_ >>> 1);
  assign _zz_211_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_212_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_213_ = execute_INSTRUCTION[31 : 20];
  assign _zz_214_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_215_ = (_zz_142_ & (~ _zz_216_));
  assign _zz_216_ = (_zz_142_ - (2'b01));
  assign _zz_217_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_218_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_219_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_220_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_221_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_222_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_223_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_224_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_225_ = (decode_PC >>> 1);
  assign _zz_226_ = (decode_PC >>> 1);
  assign _zz_227_ = (decode_PC >>> 1);
  assign _zz_228_ = (decode_PC >>> 1);
  assign _zz_229_ = (decode_PC >>> 1);
  assign _zz_230_ = (decode_PC >>> 1);
  assign _zz_231_ = (decode_PC >>> 1);
  assign _zz_232_ = (decode_PC >>> 1);
  assign _zz_233_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_234_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_235_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_236_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_237_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_238_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_239_ = ({3'd0,_zz_156_} <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign _zz_240_ = 1'b1;
  assign _zz_241_ = 1'b1;
  assign _zz_242_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_243_ = (32'b00000000000000000001000001010000);
  assign _zz_244_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_245_ = (32'b00000000000000000010000001010000);
  assign _zz_246_ = ((decode_INSTRUCTION & _zz_253_) == (32'b00000000000000000001000000000000));
  assign _zz_247_ = _zz_110_;
  assign _zz_248_ = {_zz_110_,{_zz_254_,_zz_255_}};
  assign _zz_249_ = (3'b000);
  assign _zz_250_ = ({_zz_256_,{_zz_257_,_zz_258_}} != (3'b000));
  assign _zz_251_ = (_zz_259_ != (1'b0));
  assign _zz_252_ = {(_zz_260_ != _zz_261_),{_zz_262_,{_zz_263_,_zz_264_}}};
  assign _zz_253_ = (32'b00000000000000000001000000000000);
  assign _zz_254_ = ((decode_INSTRUCTION & _zz_265_) == (32'b00000000000000000001000000000000));
  assign _zz_255_ = ((decode_INSTRUCTION & _zz_266_) == (32'b00000000000000000010000000000000));
  assign _zz_256_ = ((decode_INSTRUCTION & _zz_267_) == (32'b00000000000000000000000000100100));
  assign _zz_257_ = (_zz_268_ == _zz_269_);
  assign _zz_258_ = (_zz_270_ == _zz_271_);
  assign _zz_259_ = ((decode_INSTRUCTION & _zz_272_) == (32'b00000000000000000010000000010000));
  assign _zz_260_ = {_zz_273_,{_zz_274_,_zz_275_}};
  assign _zz_261_ = (6'b000000);
  assign _zz_262_ = (_zz_276_ != (1'b0));
  assign _zz_263_ = (_zz_277_ != _zz_278_);
  assign _zz_264_ = {_zz_279_,{_zz_280_,_zz_281_}};
  assign _zz_265_ = (32'b00000000000000000011000000000000);
  assign _zz_266_ = (32'b00000000000000000011000000000000);
  assign _zz_267_ = (32'b00000000000000000000000001100100);
  assign _zz_268_ = (decode_INSTRUCTION & (32'b00000000000000000100000000010100));
  assign _zz_269_ = (32'b00000000000000000100000000010000);
  assign _zz_270_ = (decode_INSTRUCTION & (32'b00000000000000000011000000010100));
  assign _zz_271_ = (32'b00000000000000000001000000010000);
  assign _zz_272_ = (32'b00000000000000000110000000010100);
  assign _zz_273_ = ((decode_INSTRUCTION & _zz_282_) == (32'b00000000000000000000000001001000));
  assign _zz_274_ = (_zz_283_ == _zz_284_);
  assign _zz_275_ = {_zz_285_,{_zz_286_,_zz_287_}};
  assign _zz_276_ = ((decode_INSTRUCTION & _zz_288_) == (32'b00000000000000000000000000001000));
  assign _zz_277_ = {_zz_289_,{_zz_290_,_zz_291_}};
  assign _zz_278_ = (3'b000);
  assign _zz_279_ = (_zz_292_ != (1'b0));
  assign _zz_280_ = (_zz_293_ != _zz_294_);
  assign _zz_281_ = {_zz_295_,{_zz_296_,_zz_297_}};
  assign _zz_282_ = (32'b00000000000000000000000001001000);
  assign _zz_283_ = (decode_INSTRUCTION & (32'b00000000000000000001000000010000));
  assign _zz_284_ = (32'b00000000000000000001000000010000);
  assign _zz_285_ = ((decode_INSTRUCTION & _zz_298_) == (32'b00000000000000000010000000010000));
  assign _zz_286_ = (_zz_299_ == _zz_300_);
  assign _zz_287_ = {_zz_113_,_zz_301_};
  assign _zz_288_ = (32'b00000000000000000000000001001000);
  assign _zz_289_ = ((decode_INSTRUCTION & _zz_302_) == (32'b00000000000000000000000001000000));
  assign _zz_290_ = (_zz_303_ == _zz_304_);
  assign _zz_291_ = (_zz_305_ == _zz_306_);
  assign _zz_292_ = ((decode_INSTRUCTION & _zz_307_) == (32'b00000000000000000000000000000000));
  assign _zz_293_ = {_zz_308_,_zz_309_};
  assign _zz_294_ = (2'b00);
  assign _zz_295_ = (_zz_310_ != (1'b0));
  assign _zz_296_ = (_zz_311_ != _zz_312_);
  assign _zz_297_ = {_zz_313_,{_zz_314_,_zz_315_}};
  assign _zz_298_ = (32'b00000000000000000010000000010000);
  assign _zz_299_ = (decode_INSTRUCTION & (32'b00000000000000000001000000000100));
  assign _zz_300_ = (32'b00000000000000000000000000000100);
  assign _zz_301_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000101000)) == (32'b00000000000000000000000000000000));
  assign _zz_302_ = (32'b00000000000000000000000001000100);
  assign _zz_303_ = (decode_INSTRUCTION & (32'b01000000000000000000000000110000));
  assign _zz_304_ = (32'b01000000000000000000000000110000);
  assign _zz_305_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_306_ = (32'b00000000000000000010000000010000);
  assign _zz_307_ = (32'b00000000000000000000000001011000);
  assign _zz_308_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000110100)) == (32'b00000000000000000000000000100000));
  assign _zz_309_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100000));
  assign _zz_310_ = ((decode_INSTRUCTION & (32'b00000000000000000111000001010100)) == (32'b00000000000000000101000000010000));
  assign _zz_311_ = {(_zz_316_ == _zz_317_),(_zz_318_ == _zz_319_)};
  assign _zz_312_ = (2'b00);
  assign _zz_313_ = (_zz_112_ != (1'b0));
  assign _zz_314_ = (_zz_320_ != (1'b0));
  assign _zz_315_ = {(_zz_321_ != _zz_322_),{_zz_323_,{_zz_324_,_zz_325_}}};
  assign _zz_316_ = (decode_INSTRUCTION & (32'b01000000000000000011000001010100));
  assign _zz_317_ = (32'b01000000000000000001000000010000);
  assign _zz_318_ = (decode_INSTRUCTION & (32'b00000000000000000111000001010100));
  assign _zz_319_ = (32'b00000000000000000001000000010000);
  assign _zz_320_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000001000000));
  assign _zz_321_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000010000)) == (32'b00000000000000000000000000010000));
  assign _zz_322_ = (1'b0);
  assign _zz_323_ = ({(_zz_326_ == _zz_327_),{_zz_328_,{_zz_329_,_zz_330_}}} != (4'b0000));
  assign _zz_324_ = ({_zz_331_,_zz_332_} != (2'b00));
  assign _zz_325_ = {({_zz_333_,_zz_334_} != (3'b000)),{(_zz_335_ != _zz_336_),{_zz_337_,{_zz_338_,_zz_339_}}}};
  assign _zz_326_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_327_ = (32'b00000000000000000000000000000000);
  assign _zz_328_ = ((decode_INSTRUCTION & _zz_340_) == (32'b00000000000000000000000000000000));
  assign _zz_329_ = (_zz_341_ == _zz_342_);
  assign _zz_330_ = (_zz_343_ == _zz_344_);
  assign _zz_331_ = ((decode_INSTRUCTION & _zz_345_) == (32'b00000000000000000010000000000000));
  assign _zz_332_ = ((decode_INSTRUCTION & _zz_346_) == (32'b00000000000000000001000000000000));
  assign _zz_333_ = (_zz_347_ == _zz_348_);
  assign _zz_334_ = {_zz_349_,_zz_350_};
  assign _zz_335_ = {_zz_112_,_zz_111_};
  assign _zz_336_ = (2'b00);
  assign _zz_337_ = ({_zz_351_,_zz_352_} != (2'b00));
  assign _zz_338_ = (_zz_353_ != _zz_354_);
  assign _zz_339_ = {_zz_355_,{_zz_356_,_zz_357_}};
  assign _zz_340_ = (32'b00000000000000000000000000011000);
  assign _zz_341_ = (decode_INSTRUCTION & (32'b00000000000000000110000000000100));
  assign _zz_342_ = (32'b00000000000000000010000000000000);
  assign _zz_343_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000100));
  assign _zz_344_ = (32'b00000000000000000001000000000000);
  assign _zz_345_ = (32'b00000000000000000010000000010000);
  assign _zz_346_ = (32'b00000000000000000101000000000000);
  assign _zz_347_ = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign _zz_348_ = (32'b00000000000000000000000001000000);
  assign _zz_349_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000110000)) == (32'b00000000000000000000000000000000));
  assign _zz_350_ = ((decode_INSTRUCTION & (32'b00000000010000000011000001000000)) == (32'b00000000000000000000000001000000));
  assign _zz_351_ = ((decode_INSTRUCTION & _zz_358_) == (32'b00000000000000000000000000000100));
  assign _zz_352_ = _zz_111_;
  assign _zz_353_ = _zz_109_;
  assign _zz_354_ = (1'b0);
  assign _zz_355_ = ({_zz_110_,_zz_359_} != (2'b00));
  assign _zz_356_ = ({_zz_360_,_zz_361_} != (2'b00));
  assign _zz_357_ = {(_zz_362_ != _zz_363_),(_zz_364_ != _zz_365_)};
  assign _zz_358_ = (32'b00000000000000000000000001000100);
  assign _zz_359_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001110000)) == (32'b00000000000000000000000000100000));
  assign _zz_360_ = _zz_110_;
  assign _zz_361_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_362_ = ((decode_INSTRUCTION & (32'b00010000000000000011000001010000)) == (32'b00000000000000000000000001010000));
  assign _zz_363_ = (1'b0);
  assign _zz_364_ = {_zz_109_,((decode_INSTRUCTION & (32'b00010000010000000011000001010000)) == (32'b00010000000000000000000001010000))};
  assign _zz_365_ = (2'b00);
  assign _zz_366_ = ((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_225_))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_226_)));
  assign _zz_367_ = (DebugPlugin_hardwareBreakpoints_2_valid && (DebugPlugin_hardwareBreakpoints_2_pc == _zz_227_));
  assign _zz_368_ = (DebugPlugin_hardwareBreakpoints_3_pc == _zz_228_);
  always @ (posedge clk) begin
    if(_zz_51_) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_240_) begin
      _zz_158_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_241_) begin
      _zz_159_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c ( 
    .io_push_valid(iBus_rsp_takeWhen_valid),
    .io_push_ready(IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready),
    .io_push_payload_error(iBus_rsp_takeWhen_payload_error),
    .io_push_payload_inst(iBus_rsp_takeWhen_payload_inst),
    .io_pop_valid(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid),
    .io_pop_ready(IBusSimplePlugin_rspJoin_rspBufferOutput_ready),
    .io_pop_payload_error(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error),
    .io_pop_payload_inst(IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst),
    .io_flush(_zz_157_),
    .io_occupancy(IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy),
    .clk(clk),
    .reset(reset) 
  );
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
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : decode_ALU_BITWISE_CTRL_string = "SRC1 ";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_14__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_14__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_14__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_14__string = "SRC1 ";
      default : _zz_14__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_15__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_15__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_15__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_15__string = "SRC1 ";
      default : _zz_15__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_16__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_16__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_16__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_16__string = "SRC1 ";
      default : _zz_16__string = "?????";
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
    case(_zz_17_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_17__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_17__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_17__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_17__string = "JALR";
      default : _zz_17__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_18__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_18__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_18__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_18__string = "JALR";
      default : _zz_18__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_19__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_19__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_19__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_19__string = "JALR";
      default : _zz_19__string = "????";
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
    case(_zz_20_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_20__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_20__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_20__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_20__string = "URS1        ";
      default : _zz_20__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_21__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_21__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_21__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_21__string = "URS1        ";
      default : _zz_21__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_22_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_22__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_22__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_22__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_22__string = "URS1        ";
      default : _zz_22__string = "????????????";
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
    case(_zz_23_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_23__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_23__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_23__string = "BITWISE ";
      default : _zz_23__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_24_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_24__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_24__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_24__string = "BITWISE ";
      default : _zz_24__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_25_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_25__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_25__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_25__string = "BITWISE ";
      default : _zz_25__string = "????????";
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
    case(_zz_34_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_34__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_34__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_34__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_34__string = "JALR";
      default : _zz_34__string = "????";
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
    case(_zz_37_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_37__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_37__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_37__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_37__string = "SRA_1    ";
      default : _zz_37__string = "?????????";
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
    case(_zz_42_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_42__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_42__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_42__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_42__string = "PC ";
      default : _zz_42__string = "???";
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
    case(_zz_44_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_44__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_44__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_44__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_44__string = "URS1        ";
      default : _zz_44__string = "????????????";
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
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : execute_ALU_BITWISE_CTRL_string = "SRC1 ";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_48_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_48__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_48__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_48__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_48__string = "SRC1 ";
      default : _zz_48__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_55_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_55__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_55__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_55__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_55__string = "SRC1 ";
      default : _zz_55__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_56_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_56__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_56__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_56__string = "BITWISE ";
      default : _zz_56__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_62_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_62__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_62__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_62__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_62__string = "SRA_1    ";
      default : _zz_62__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_63_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_63__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_63__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_63__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_63__string = "JALR";
      default : _zz_63__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_67_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_67__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_67__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_67__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_67__string = "URS1        ";
      default : _zz_67__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_69_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_69__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_69__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_69__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_69__string = "PC ";
      default : _zz_69__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_70_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_70__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_70__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_70__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_70__string = "EBREAK";
      default : _zz_70__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_114_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_114__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_114__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_114__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_114__string = "EBREAK";
      default : _zz_114__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_115_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_115__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_115__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_115__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_115__string = "PC ";
      default : _zz_115__string = "???";
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
      `BranchCtrlEnum_defaultEncoding_INC : _zz_117__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_117__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_117__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_117__string = "JALR";
      default : _zz_117__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_118_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_118__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_118__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_118__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_118__string = "SRA_1    ";
      default : _zz_118__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_119_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_119__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_119__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_119__string = "BITWISE ";
      default : _zz_119__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_120_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_120__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_120__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_120__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_120__string = "SRC1 ";
      default : _zz_120__string = "?????";
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
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : decode_to_execute_ALU_BITWISE_CTRL_string = "SRC1 ";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
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
  assign memory_MEMORY_READ_DATA = _zz_72_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_64_;
  assign decode_SRC_LESS_UNSIGNED = _zz_66_;
  assign memory_PC = execute_to_memory_PC;
  assign decode_DO_EBREAK = _zz_26_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_76_;
  assign decode_SRC_USE_SUB_LESS = _zz_59_;
  assign decode_SRC2_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_73_;
  assign _zz_7_ = _zz_8_;
  assign _zz_9_ = _zz_10_;
  assign decode_ENV_CTRL = _zz_11_;
  assign _zz_12_ = _zz_13_;
  assign decode_RS2_USE = _zz_61_;
  assign decode_MEMORY_ENABLE = _zz_60_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_47_;
  assign decode_RS1_USE = _zz_65_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign decode_CSR_WRITE_OPCODE = _zz_30_;
  assign decode_ALU_BITWISE_CTRL = _zz_14_;
  assign _zz_15_ = _zz_16_;
  assign decode_BRANCH_CTRL = _zz_17_;
  assign _zz_18_ = _zz_19_;
  assign decode_IS_CSR = _zz_54_;
  assign decode_SRC1_CTRL = _zz_20_;
  assign _zz_21_ = _zz_22_;
  assign decode_CSR_READ_OPCODE = _zz_29_;
  assign decode_ALU_CTRL = _zz_23_;
  assign _zz_24_ = _zz_25_;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_68_;
  assign execute_RS2_USE = decode_to_execute_RS2_USE;
  assign execute_RS1_USE = decode_to_execute_RS1_USE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_27_;
  assign execute_ENV_CTRL = _zz_28_;
  assign writeBack_ENV_CTRL = _zz_31_;
  assign execute_IS_FENCEI = decode_to_execute_IS_FENCEI;
  always @ (*) begin
    _zz_32_ = decode_INSTRUCTION;
    if(decode_IS_FENCEI)begin
      _zz_32_[12] = 1'b0;
      _zz_32_[22] = 1'b1;
    end
  end

  assign decode_IS_FENCEI = _zz_58_;
  assign execute_BRANCH_CALC = _zz_33_;
  assign execute_BRANCH_DO = _zz_35_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = _zz_53_;
  assign execute_BRANCH_CTRL = _zz_34_;
  always @ (*) begin
    _zz_36_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_ALIGNEMENT_FAULT)) && (! execute_DBusSimplePlugin_cmdSent)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_160_)begin
      _zz_36_ = _zz_128_;
      if(_zz_161_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_36_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_SHIFT_CTRL = _zz_37_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_41_ = execute_PC;
  assign execute_SRC2_CTRL = _zz_42_;
  assign execute_SRC1_CTRL = _zz_44_;
  assign execute_SRC_ADD_SUB = _zz_40_;
  assign execute_SRC_LESS = _zz_38_;
  assign execute_ALU_CTRL = _zz_46_;
  assign execute_SRC2 = _zz_43_;
  assign execute_SRC1 = _zz_45_;
  assign execute_ALU_BITWISE_CTRL = _zz_48_;
  assign _zz_49_ = writeBack_INSTRUCTION;
  assign _zz_50_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_51_ = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      _zz_51_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_57_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_71_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_71_ = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_RS2 = _zz_52_;
  assign execute_SRC_ADD = _zz_39_;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_ALIGNEMENT_FAULT = _zz_74_;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  always @ (*) begin
    _zz_75_ = execute_FORMAL_PC_NEXT;
    if(_zz_82_)begin
      _zz_75_ = _zz_83_;
    end
  end

  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_PC = _zz_78_;
  always @ (*) begin
    decode_INSTRUCTION = _zz_77_;
    if((_zz_152_ != (3'b000)))begin
      decode_INSTRUCTION = _zz_153_;
    end
  end

  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    decode_arbitration_isValid = (IBusSimplePlugin_iBusRsp_decodeInput_valid && (! IBusSimplePlugin_injector_decodeRemoved));
    _zz_92_ = 1'b0;
    case(_zz_152_)
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
        _zz_92_ = 1'b1;
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
    if(({(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))} != (2'b00)))begin
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
    if(_zz_82_)begin
      decode_arbitration_flushAll = 1'b1;
    end
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_exception_agregat_valid)begin
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

  assign decode_arbitration_redoIt = 1'b0;
  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    _zz_79_ = 1'b0;
    _zz_80_ = 1'b0;
    if(((execute_arbitration_isValid && execute_IS_FENCEI) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00))))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode}}} != (4'b0000)))begin
      _zz_79_ = 1'b1;
    end
    if((execute_arbitration_isValid && (_zz_144_ || _zz_145_)))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(_zz_162_)begin
      execute_arbitration_haltByOther = 1'b1;
      if(_zz_163_)begin
        _zz_80_ = 1'b1;
        _zz_79_ = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      _zz_79_ = 1'b1;
    end
    if(_zz_164_)begin
      _zz_79_ = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(memory_exception_agregat_valid)begin
      execute_arbitration_flushAll = 1'b1;
    end
    if(_zz_162_)begin
      if(_zz_163_)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
  end

  assign execute_arbitration_redoIt = 1'b0;
  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_INSTRUCTION[5])) && (! dBus_rsp_ready)))begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_exception_agregat_valid)begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_flushAll = 1'b0;
    _zz_85_ = 1'b0;
    _zz_86_ = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(_zz_165_)begin
      _zz_85_ = 1'b1;
      _zz_86_ = {CsrPlugin_mtvec_base,(2'b00)};
      memory_arbitration_flushAll = 1'b1;
    end
    if(_zz_166_)begin
      _zz_86_ = CsrPlugin_mepc;
      _zz_85_ = 1'b1;
      memory_arbitration_flushAll = 1'b1;
    end
  end

  assign memory_arbitration_redoIt = 1'b0;
  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushAll = 1'b0;
  assign writeBack_arbitration_redoIt = 1'b0;
  always @ (*) begin
    _zz_81_ = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      _zz_81_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_89_ = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      _zz_89_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_90_ = 1'b1;
    if(DebugPlugin_haltIt)begin
      _zz_90_ = 1'b0;
    end
  end

  assign IBusSimplePlugin_jump_pcLoad_valid = ({_zz_85_,_zz_82_} != (2'b00));
  assign _zz_93_ = {_zz_82_,_zz_85_};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_173_[0] ? _zz_86_ : _zz_83_);
  assign _zz_94_ = (! _zz_79_);
  assign IBusSimplePlugin_fetchPc_output_valid = (IBusSimplePlugin_fetchPc_preOutput_valid && _zz_94_);
  assign IBusSimplePlugin_fetchPc_preOutput_ready = (IBusSimplePlugin_fetchPc_output_ready && _zz_94_);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_preOutput_payload;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_propagatePc = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_iBusRsp_stages_1_input_ready))begin
      IBusSimplePlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_176_);
    IBusSimplePlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusSimplePlugin_fetchPc_propagatePc)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    if(_zz_167_)begin
      IBusSimplePlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusSimplePlugin_fetchPc_preOutput_valid = _zz_95_;
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

  assign _zz_96_ = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_96_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_96_);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_97_ = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_97_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_97_);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_98_;
  assign _zz_98_ = ((1'b0 && (! _zz_99_)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_99_ = _zz_100_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_99_;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  assign IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
  assign IBusSimplePlugin_iBusRsp_decodeInput_ready = (! decode_arbitration_isStuck);
  assign _zz_78_ = IBusSimplePlugin_iBusRsp_decodeInput_payload_pc;
  assign _zz_77_ = IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst;
  assign _zz_76_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pendingCmdNext = (_zz_177_ - _zz_181_);
  assign IBusSimplePlugin_cmd_valid = ((IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_iBusRsp_stages_0_output_ready) && (IBusSimplePlugin_pendingCmd != (2'b11)));
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],(2'b00)};
  assign iBus_rsp_takeWhen_valid = (iBus_rsp_valid && (! (IBusSimplePlugin_rspJoin_discardCounter != (2'b00))));
  assign iBus_rsp_takeWhen_payload_error = iBus_rsp_payload_error;
  assign iBus_rsp_takeWhen_payload_inst = iBus_rsp_payload_inst;
  assign _zz_157_ = (IBusSimplePlugin_jump_pcLoad_valid || _zz_80_);
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_valid = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBufferOutput_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
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
  assign _zz_101_ = (! IBusSimplePlugin_rspJoin_issueDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_decodeInput_ready && _zz_101_);
  assign IBusSimplePlugin_iBusRsp_decodeInput_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_101_);
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_decodeInput_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign execute_DBusSimplePlugin_cmdSent = 1'b0;
  assign _zz_74_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_ALIGNEMENT_FAULT)) && (! execute_DBusSimplePlugin_cmdSent));
  assign dBus_cmd_payload_wr = execute_INSTRUCTION[5];
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_102_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_102_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_102_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_102_;
  assign _zz_73_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_103_ = (4'b0001);
      end
      2'b01 : begin
        _zz_103_ = (4'b0011);
      end
      default : begin
        _zz_103_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_103_ <<< dBus_cmd_payload_address[1 : 0]);
  assign _zz_72_ = dBus_rsp_data;
  assign memory_exception_agregat_payload_code = {1'd0, _zz_186_};
  always @ (*) begin
    memory_exception_agregat_valid = memory_ALIGNEMENT_FAULT;
    if((! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && 1'b1)))begin
      memory_exception_agregat_valid = 1'b0;
    end
  end

  assign memory_exception_agregat_payload_badAddr = memory_REGFILE_WRITE_DATA;
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

  assign _zz_104_ = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_105_[31] = _zz_104_;
    _zz_105_[30] = _zz_104_;
    _zz_105_[29] = _zz_104_;
    _zz_105_[28] = _zz_104_;
    _zz_105_[27] = _zz_104_;
    _zz_105_[26] = _zz_104_;
    _zz_105_[25] = _zz_104_;
    _zz_105_[24] = _zz_104_;
    _zz_105_[23] = _zz_104_;
    _zz_105_[22] = _zz_104_;
    _zz_105_[21] = _zz_104_;
    _zz_105_[20] = _zz_104_;
    _zz_105_[19] = _zz_104_;
    _zz_105_[18] = _zz_104_;
    _zz_105_[17] = _zz_104_;
    _zz_105_[16] = _zz_104_;
    _zz_105_[15] = _zz_104_;
    _zz_105_[14] = _zz_104_;
    _zz_105_[13] = _zz_104_;
    _zz_105_[12] = _zz_104_;
    _zz_105_[11] = _zz_104_;
    _zz_105_[10] = _zz_104_;
    _zz_105_[9] = _zz_104_;
    _zz_105_[8] = _zz_104_;
    _zz_105_[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_106_ = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_107_[31] = _zz_106_;
    _zz_107_[30] = _zz_106_;
    _zz_107_[29] = _zz_106_;
    _zz_107_[28] = _zz_106_;
    _zz_107_[27] = _zz_106_;
    _zz_107_[26] = _zz_106_;
    _zz_107_[25] = _zz_106_;
    _zz_107_[24] = _zz_106_;
    _zz_107_[23] = _zz_106_;
    _zz_107_[22] = _zz_106_;
    _zz_107_[21] = _zz_106_;
    _zz_107_[20] = _zz_106_;
    _zz_107_[19] = _zz_106_;
    _zz_107_[18] = _zz_106_;
    _zz_107_[17] = _zz_106_;
    _zz_107_[16] = _zz_106_;
    _zz_107_[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_170_)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_105_;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_107_;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_109_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign _zz_110_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_111_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_112_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_113_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000010000));
  assign _zz_108_ = {({(_zz_242_ == _zz_243_),(_zz_244_ == _zz_245_)} != (2'b00)),{(_zz_113_ != (1'b0)),{({_zz_246_,_zz_247_} != (2'b00)),{(_zz_248_ != _zz_249_),{_zz_250_,{_zz_251_,_zz_252_}}}}}};
  assign _zz_114_ = _zz_108_[1 : 0];
  assign _zz_70_ = _zz_114_;
  assign _zz_115_ = _zz_108_[3 : 2];
  assign _zz_69_ = _zz_115_;
  assign _zz_68_ = _zz_187_[0];
  assign _zz_116_ = _zz_108_[6 : 5];
  assign _zz_67_ = _zz_116_;
  assign _zz_66_ = _zz_188_[0];
  assign _zz_65_ = _zz_189_[0];
  assign _zz_64_ = _zz_190_[0];
  assign _zz_117_ = _zz_108_[12 : 11];
  assign _zz_63_ = _zz_117_;
  assign _zz_118_ = _zz_108_[14 : 13];
  assign _zz_62_ = _zz_118_;
  assign _zz_61_ = _zz_191_[0];
  assign _zz_60_ = _zz_192_[0];
  assign _zz_59_ = _zz_193_[0];
  assign _zz_58_ = _zz_194_[0];
  assign _zz_57_ = _zz_195_[0];
  assign _zz_119_ = _zz_108_[21 : 20];
  assign _zz_56_ = _zz_119_;
  assign _zz_120_ = _zz_108_[23 : 22];
  assign _zz_55_ = _zz_120_;
  assign _zz_54_ = _zz_196_[0];
  assign execute_RegFilePlugin_srcInstruction = (execute_arbitration_isStuck ? execute_INSTRUCTION : decode_INSTRUCTION);
  assign execute_RegFilePlugin_regFileReadAddress1 = execute_RegFilePlugin_srcInstruction[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = execute_RegFilePlugin_srcInstruction[24 : 20];
  assign execute_RegFilePlugin_rs1Data = _zz_158_;
  assign execute_RegFilePlugin_rs2Data = _zz_159_;
  assign _zz_53_ = execute_RegFilePlugin_rs1Data;
  assign _zz_52_ = execute_RegFilePlugin_rs2Data;
  assign writeBack_RegFilePlugin_regFileWrite_valid = (_zz_50_ && writeBack_arbitration_isFiring);
  assign writeBack_RegFilePlugin_regFileWrite_payload_address = _zz_49_[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _zz_71_;
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
        _zz_121_ = {31'd0, _zz_197_};
      end
      default : begin
        _zz_121_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_47_ = _zz_121_;
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_122_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_122_ = {29'd0, _zz_198_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_122_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_122_ = {27'd0, _zz_199_};
      end
    endcase
  end

  assign _zz_45_ = _zz_122_;
  assign _zz_123_ = _zz_200_[11];
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

  assign _zz_125_ = _zz_201_[11];
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
        _zz_127_ = _zz_41_;
      end
    endcase
  end

  assign _zz_43_ = _zz_127_;
  assign execute_SrcPlugin_addSub = _zz_202_;
  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_40_ = execute_SrcPlugin_addSub;
  assign _zz_39_ = execute_SrcPlugin_addSub;
  assign _zz_38_ = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_128_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_128_ = _zz_210_;
      end
    endcase
  end

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

  assign _zz_35_ = _zz_131_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_132_ = _zz_212_[19];
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

  assign _zz_134_ = _zz_213_[11];
  always @ (*) begin
    _zz_135_[19] = _zz_134_;
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

  assign _zz_136_ = _zz_214_[11];
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
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_138_ = {{_zz_133_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_138_ = {_zz_135_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_138_ = {{_zz_137_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_138_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_33_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign _zz_82_ = ((execute_arbitration_isValid && (! execute_arbitration_isStuckByOthers)) && execute_BRANCH_DO);
  assign _zz_83_ = execute_BRANCH_CALC;
  always @ (*) begin
    _zz_84_ = ((execute_arbitration_isValid && execute_BRANCH_DO) && _zz_83_[1]);
    if(execute_arbitration_isStuckByOthers)begin
      _zz_84_ = 1'b0;
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign CsrPlugin_medeleg = (32'b00000000000000000000000000000000);
  assign CsrPlugin_mideleg = (32'b00000000000000000000000000000000);
  assign _zz_139_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_140_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_141_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode = 1'b0;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = (2'b11);
  assign execute_exception_agregat_valid = ({_zz_87_,_zz_84_} != (2'b00));
  assign _zz_142_ = {_zz_87_,_zz_84_};
  assign _zz_143_ = _zz_215_[0];
  assign execute_exception_agregat_payload_code = (_zz_143_ ? (4'b0000) : _zz_88_);
  assign execute_exception_agregat_payload_badAddr = (_zz_143_ ? _zz_83_ : (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx));
  assign CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  always @ (*) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'bxxxx);
    if(CsrPlugin_mstatus_MIE)begin
      if(({_zz_141_,{_zz_140_,_zz_139_}} != (3'b000)))begin
        CsrPlugin_interrupt = 1'b1;
      end
      if(_zz_139_)begin
        CsrPlugin_interruptCode = (4'b0111);
      end
      if(_zz_140_)begin
        CsrPlugin_interruptCode = (4'b0011);
      end
      if(_zz_141_)begin
        CsrPlugin_interruptCode = (4'b1011);
      end
    end
    if((! _zz_89_))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_interruptTargetPrivilege = (2'b11);
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && _zz_90_);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && IBusSimplePlugin_injector_nextPcCalc_valids_3);
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

  assign contextSwitching = _zz_85_;
  assign _zz_30_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_29_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = _zz_149_;
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
        execute_CsrPlugin_readData[31 : 0] = _zz_150_;
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
    _zz_87_ = 1'b0;
    _zz_88_ = (4'bxxxx);
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL)))begin
      _zz_87_ = 1'b1;
      _zz_88_ = (4'b1011);
    end
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK)))begin
      _zz_87_ = 1'b1;
      _zz_88_ = (4'b0011);
    end
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  always @ (*) begin
    case(_zz_172_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readData & (~ execute_SRC1)) : (execute_CsrPlugin_readData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  always @ (*) begin
    _zz_144_ = 1'b0;
    _zz_145_ = 1'b0;
    if(_zz_147_)begin
      if((_zz_148_ == execute_INSTRUCTION[19 : 15]))begin
        _zz_144_ = 1'b1;
      end
      if((_zz_148_ == execute_INSTRUCTION[24 : 20]))begin
        _zz_145_ = 1'b1;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! 1'b1)))begin
        if((writeBack_INSTRUCTION[11 : 7] == execute_INSTRUCTION[19 : 15]))begin
          _zz_144_ = 1'b1;
        end
        if((writeBack_INSTRUCTION[11 : 7] == execute_INSTRUCTION[24 : 20]))begin
          _zz_145_ = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if((memory_INSTRUCTION[11 : 7] == execute_INSTRUCTION[19 : 15]))begin
          _zz_144_ = 1'b1;
        end
        if((memory_INSTRUCTION[11 : 7] == execute_INSTRUCTION[24 : 20]))begin
          _zz_145_ = 1'b1;
        end
      end
    end
    if((! execute_RS1_USE))begin
      _zz_144_ = 1'b0;
    end
    if((! execute_RS2_USE))begin
      _zz_145_ = 1'b0;
    end
  end

  assign _zz_146_ = (_zz_50_ && writeBack_arbitration_isFiring);
  assign _zz_150_ = (_zz_149_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_150_ != (32'b00000000000000000000000000000000));
  assign DebugPlugin_isPipBusy = (DebugPlugin_isPipActive || DebugPlugin_isPipActive_regNext);
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    _zz_91_ = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_168_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            _zz_91_ = 1'b1;
            debug_bus_cmd_ready = _zz_92_;
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
    if((! _zz_151_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign _zz_26_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || ((((((_zz_366_ || _zz_367_) || (DebugPlugin_hardwareBreakpoints_3_valid && _zz_368_)) || (DebugPlugin_hardwareBreakpoints_4_valid && (DebugPlugin_hardwareBreakpoints_4_pc == _zz_229_))) || (DebugPlugin_hardwareBreakpoints_5_valid && (DebugPlugin_hardwareBreakpoints_5_pc == _zz_230_))) || (DebugPlugin_hardwareBreakpoints_6_valid && (DebugPlugin_hardwareBreakpoints_6_pc == _zz_231_))) || (DebugPlugin_hardwareBreakpoints_7_valid && (DebugPlugin_hardwareBreakpoints_7_pc == _zz_232_)))));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_25_ = decode_ALU_CTRL;
  assign _zz_23_ = _zz_56_;
  assign _zz_46_ = decode_to_execute_ALU_CTRL;
  assign _zz_22_ = decode_SRC1_CTRL;
  assign _zz_20_ = _zz_67_;
  assign _zz_44_ = decode_to_execute_SRC1_CTRL;
  assign _zz_19_ = decode_BRANCH_CTRL;
  assign _zz_17_ = _zz_63_;
  assign _zz_34_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_16_ = decode_ALU_BITWISE_CTRL;
  assign _zz_14_ = _zz_55_;
  assign _zz_48_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_13_ = decode_ENV_CTRL;
  assign _zz_10_ = execute_ENV_CTRL;
  assign _zz_8_ = memory_ENV_CTRL;
  assign _zz_11_ = _zz_70_;
  assign _zz_28_ = decode_to_execute_ENV_CTRL;
  assign _zz_27_ = execute_to_memory_ENV_CTRL;
  assign _zz_31_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_6_ = decode_SRC2_CTRL;
  assign _zz_4_ = _zz_69_;
  assign _zz_42_ = decode_to_execute_SRC2_CTRL;
  assign _zz_3_ = decode_SHIFT_CTRL;
  assign _zz_1_ = _zz_62_;
  assign _zz_37_ = decode_to_execute_SHIFT_CTRL;
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
  assign iBus_cmd_m2sPipe_valid = _zz_154_;
  assign iBus_cmd_m2sPipe_payload_pc = _zz_155_;
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
        _zz_156_ = (4'b0001);
      end
      2'b01 : begin
        _zz_156_ = (4'b0011);
      end
      default : begin
        _zz_156_ = (4'b1111);
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = _zz_239_[3:0];
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
      _zz_95_ <= 1'b0;
      _zz_100_ <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      IBusSimplePlugin_pendingCmd <= (2'b00);
      IBusSimplePlugin_rspJoin_discardCounter <= (2'b00);
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
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      _zz_147_ <= 1'b0;
      _zz_149_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_152_ <= (3'b000);
      _zz_154_ <= 1'b0;
      dBus_cmd_halfPipe_regs_valid <= 1'b0;
      dBus_cmd_halfPipe_regs_ready <= 1'b1;
    end else begin
      if(IBusSimplePlugin_fetchPc_propagatePc)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_jump_pcLoad_valid)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_167_)begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_samplePcNext)begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      _zz_95_ <= 1'b1;
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        _zz_100_ <= 1'b0;
      end
      if(_zz_98_)begin
        _zz_100_ <= IBusSimplePlugin_iBusRsp_stages_0_output_valid;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready)))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_injector_decodeRemoved <= 1'b0;
      end
      IBusSimplePlugin_pendingCmd <= IBusSimplePlugin_pendingCmdNext;
      IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_rspJoin_discardCounter - _zz_183_);
      if((IBusSimplePlugin_jump_pcLoad_valid || _zz_80_))begin
        IBusSimplePlugin_rspJoin_discardCounter <= (IBusSimplePlugin_pendingCmd - _zz_185_);
      end
      if(_zz_160_)begin
        if(_zz_161_)begin
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
      if(_zz_165_)begin
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
      if(_zz_166_)begin
        case(_zz_171_)
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
      _zz_147_ <= _zz_146_;
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
      case(_zz_152_)
        3'b000 : begin
          if(_zz_91_)begin
            _zz_152_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_152_ <= (3'b010);
        end
        3'b010 : begin
          _zz_152_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_152_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_152_ <= (3'b000);
        end
        default : begin
        end
      endcase
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_149_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_233_[0];
            CsrPlugin_mstatus_MIE <= _zz_234_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000101 : begin
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mip_MSIP <= _zz_235_[0];
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
            CsrPlugin_mie_MEIE <= _zz_236_[0];
            CsrPlugin_mie_MTIE <= _zz_237_[0];
            CsrPlugin_mie_MSIE <= _zz_238_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(iBus_cmd_ready)begin
        _zz_154_ <= iBus_cmd_valid;
      end
      if(_zz_169_)begin
        dBus_cmd_halfPipe_regs_valid <= dBus_cmd_valid;
        dBus_cmd_halfPipe_regs_ready <= (! dBus_cmd_valid);
      end else begin
        dBus_cmd_halfPipe_regs_valid <= (! dBus_cmd_halfPipe_ready);
        dBus_cmd_halfPipe_regs_ready <= dBus_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge clk) begin
    if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_INSTRUCTION[5])) && writeBack_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow writeback stage stall when read happend");
    end
    if(_zz_160_)begin
      if(_zz_161_)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - (5'b00001));
      end
    end
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(execute_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= execute_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= execute_exception_agregat_payload_badAddr;
    end
    if(memory_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= memory_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= memory_exception_agregat_payload_badAddr;
    end
    if((CsrPlugin_exception || CsrPlugin_interruptJump))begin
      case(CsrPlugin_privilege)
        2'b11 : begin
          CsrPlugin_mepc <= writeBack_PC;
        end
        default : begin
        end
      endcase
    end
    if(_zz_165_)begin
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
    if(_zz_146_)begin
      _zz_148_ <= _zz_49_[11 : 7];
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_FENCEI <= decode_IS_FENCEI;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_24_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_21_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_18_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_15_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
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
      decode_to_execute_RS1_USE <= decode_RS1_USE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_36_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= memory_REGFILE_WRITE_DATA;
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
      decode_to_execute_INSTRUCTION <= _zz_32_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2_USE <= decode_RS2_USE;
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
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_75_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= memory_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_41_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
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
      _zz_155_ <= iBus_cmd_payload_pc;
    end
    if(_zz_169_)begin
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
    DebugPlugin_isPipActive <= ({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000));
    DebugPlugin_isPipActive_regNext <= DebugPlugin_isPipActive;
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_71_;
    end
    _zz_151_ <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid)begin
      case(_zz_168_)
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
    if(_zz_162_)begin
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
        case(_zz_168_)
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
              DebugPlugin_hardwareBreakpoints_0_valid <= _zz_217_[0];
            end
          end
          6'b010001 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_1_valid <= _zz_218_[0];
            end
          end
          6'b010010 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_2_valid <= _zz_219_[0];
            end
          end
          6'b010011 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_3_valid <= _zz_220_[0];
            end
          end
          6'b010100 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_4_valid <= _zz_221_[0];
            end
          end
          6'b010101 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_5_valid <= _zz_222_[0];
            end
          end
          6'b010110 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_6_valid <= _zz_223_[0];
            end
          end
          6'b010111 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_7_valid <= _zz_224_[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_162_)begin
        if(_zz_163_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_164_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      if((DebugPlugin_stepIt && ({writeBack_arbitration_redoIt,{memory_arbitration_redoIt,{execute_arbitration_redoIt,decode_arbitration_redoIt}}} != (4'b0000))))begin
        DebugPlugin_haltIt <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    _zz_153_ <= debug_bus_cmd_payload_data;
  end

endmodule
