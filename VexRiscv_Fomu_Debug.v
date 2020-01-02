// Generator : SpinalHDL v1.3.6    git head : 9bf01e7f360e003fac1dd5ca8b8f4bffec0e52b8
// Date      : 01/01/2020, 22:59:59
// Component : VexRiscv


`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

module InstructionCache (
      input   io_flush,
      input   io_cpu_prefetch_isValid,
      output reg  io_cpu_prefetch_haltIt,
      input  [31:0] io_cpu_prefetch_pc,
      input   io_cpu_fetch_isValid,
      input   io_cpu_fetch_isStuck,
      input   io_cpu_fetch_isRemoved,
      input  [31:0] io_cpu_fetch_pc,
      output [31:0] io_cpu_fetch_data,
      input   io_cpu_fetch_dataBypassValid,
      input  [31:0] io_cpu_fetch_dataBypass,
      output  io_cpu_fetch_mmuBus_cmd_isValid,
      output [31:0] io_cpu_fetch_mmuBus_cmd_virtualAddress,
      output  io_cpu_fetch_mmuBus_cmd_bypassTranslation,
      input  [31:0] io_cpu_fetch_mmuBus_rsp_physicalAddress,
      input   io_cpu_fetch_mmuBus_rsp_isIoAccess,
      input   io_cpu_fetch_mmuBus_rsp_allowRead,
      input   io_cpu_fetch_mmuBus_rsp_allowWrite,
      input   io_cpu_fetch_mmuBus_rsp_allowExecute,
      input   io_cpu_fetch_mmuBus_rsp_exception,
      input   io_cpu_fetch_mmuBus_rsp_refilling,
      output  io_cpu_fetch_mmuBus_end,
      input   io_cpu_fetch_mmuBus_busy,
      output [31:0] io_cpu_fetch_physicalAddress,
      output  io_cpu_fetch_cacheMiss,
      output  io_cpu_fetch_error,
      output  io_cpu_fetch_mmuRefilling,
      output  io_cpu_fetch_mmuException,
      input   io_cpu_fetch_isUser,
      output  io_cpu_fetch_haltIt,
      input   io_cpu_decode_isValid,
      input   io_cpu_decode_isStuck,
      input  [31:0] io_cpu_decode_pc,
      output [31:0] io_cpu_decode_physicalAddress,
      output [31:0] io_cpu_decode_data,
      input   io_cpu_fill_valid,
      input  [31:0] io_cpu_fill_payload,
      output  io_mem_cmd_valid,
      input   io_mem_cmd_ready,
      output [31:0] io_mem_cmd_payload_address,
      output [2:0] io_mem_cmd_payload_size,
      input   io_mem_rsp_valid,
      input  [31:0] io_mem_rsp_payload_data,
      input   io_mem_rsp_payload_error,
      input   clk,
      input   reset);
  reg [22:0] _zz_10_;
  reg [31:0] _zz_11_;
  wire  _zz_12_;
  wire  _zz_13_;
  wire [0:0] _zz_14_;
  wire [0:0] _zz_15_;
  wire [22:0] _zz_16_;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  lineLoader_fire;
  reg  lineLoader_valid;
  reg [31:0] lineLoader_address;
  reg  lineLoader_hadError;
  reg  lineLoader_flushPending;
  reg [6:0] lineLoader_flushCounter;
  reg  _zz_3_;
  reg  lineLoader_cmdSent;
  reg  lineLoader_wayToAllocate_willIncrement;
  wire  lineLoader_wayToAllocate_willClear;
  wire  lineLoader_wayToAllocate_willOverflowIfInc;
  wire  lineLoader_wayToAllocate_willOverflow;
  reg [2:0] lineLoader_wordIndex;
  wire  lineLoader_write_tag_0_valid;
  wire [5:0] lineLoader_write_tag_0_payload_address;
  wire  lineLoader_write_tag_0_payload_data_valid;
  wire  lineLoader_write_tag_0_payload_data_error;
  wire [20:0] lineLoader_write_tag_0_payload_data_address;
  wire  lineLoader_write_data_0_valid;
  wire [8:0] lineLoader_write_data_0_payload_address;
  wire [31:0] lineLoader_write_data_0_payload_data;
  wire  _zz_4_;
  wire [5:0] _zz_5_;
  wire  _zz_6_;
  wire  fetchStage_read_waysValues_0_tag_valid;
  wire  fetchStage_read_waysValues_0_tag_error;
  wire [20:0] fetchStage_read_waysValues_0_tag_address;
  wire [22:0] _zz_7_;
  wire [8:0] _zz_8_;
  wire  _zz_9_;
  wire [31:0] fetchStage_read_waysValues_0_data;
  wire  fetchStage_hit_hits_0;
  wire  fetchStage_hit_valid;
  wire  fetchStage_hit_error;
  wire [31:0] fetchStage_hit_data;
  wire [31:0] fetchStage_hit_word;
  reg [22:0] ways_0_tags [0:63];
  reg [31:0] ways_0_datas [0:511];
  assign _zz_12_ = (! lineLoader_flushCounter[6]);
  assign _zz_13_ = (lineLoader_flushPending && (! (lineLoader_valid || io_cpu_fetch_isValid)));
  assign _zz_14_ = _zz_7_[0 : 0];
  assign _zz_15_ = _zz_7_[1 : 1];
  assign _zz_16_ = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_2_) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_16_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_6_) begin
      _zz_10_ <= ways_0_tags[_zz_5_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1_) begin
      ways_0_datas[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_9_) begin
      _zz_11_ <= ways_0_datas[_zz_8_];
    end
  end

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(lineLoader_write_data_0_valid)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if(lineLoader_write_tag_0_valid)begin
      _zz_2_ = 1'b1;
    end
  end

  assign io_cpu_fetch_haltIt = io_cpu_fetch_mmuBus_busy;
  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == (3'b111)))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_cpu_prefetch_haltIt = (lineLoader_valid || lineLoader_flushPending);
    if(_zz_12_)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_3_))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],(5'b00000)};
  assign io_mem_cmd_payload_size = (3'b101);
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if((! lineLoader_valid))begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign _zz_4_ = 1'b1;
  assign lineLoader_write_tag_0_valid = ((_zz_4_ && lineLoader_fire) || (! lineLoader_flushCounter[6]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[6] ? lineLoader_address[10 : 5] : lineLoader_flushCounter[5 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[6];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 11];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && _zz_4_);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[10 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_5_ = io_cpu_prefetch_pc[10 : 5];
  assign _zz_6_ = (! io_cpu_fetch_isStuck);
  assign _zz_7_ = _zz_10_;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_14_[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_15_[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_7_[22 : 2];
  assign _zz_8_ = io_cpu_prefetch_pc[10 : 2];
  assign _zz_9_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_0_data = _zz_11_;
  assign fetchStage_hit_hits_0 = (fetchStage_read_waysValues_0_tag_valid && (fetchStage_read_waysValues_0_tag_address == io_cpu_fetch_mmuBus_rsp_physicalAddress[31 : 11]));
  assign fetchStage_hit_valid = (fetchStage_hit_hits_0 != (1'b0));
  assign fetchStage_hit_error = fetchStage_read_waysValues_0_tag_error;
  assign fetchStage_hit_data = fetchStage_read_waysValues_0_data;
  assign fetchStage_hit_word = fetchStage_hit_data[31 : 0];
  assign io_cpu_fetch_data = (io_cpu_fetch_dataBypassValid ? io_cpu_fetch_dataBypass : fetchStage_hit_word);
  assign io_cpu_fetch_mmuBus_cmd_isValid = io_cpu_fetch_isValid;
  assign io_cpu_fetch_mmuBus_cmd_virtualAddress = io_cpu_fetch_pc;
  assign io_cpu_fetch_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_fetch_mmuBus_end = ((! io_cpu_fetch_isStuck) || io_cpu_fetch_isRemoved);
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuBus_rsp_physicalAddress;
  assign io_cpu_fetch_cacheMiss = (! fetchStage_hit_valid);
  assign io_cpu_fetch_error = fetchStage_hit_error;
  assign io_cpu_fetch_mmuRefilling = io_cpu_fetch_mmuBus_rsp_refilling;
  assign io_cpu_fetch_mmuException = ((! io_cpu_fetch_mmuBus_rsp_refilling) && (io_cpu_fetch_mmuBus_rsp_exception || (! io_cpu_fetch_mmuBus_rsp_allowExecute)));
  always @ (posedge clk) begin
    if(reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushPending <= 1'b1;
      lineLoader_cmdSent <= 1'b0;
      lineLoader_wordIndex <= (3'b000);
    end else begin
      if(lineLoader_fire)begin
        lineLoader_valid <= 1'b0;
      end
      if(lineLoader_fire)begin
        lineLoader_hadError <= 1'b0;
      end
      if(io_cpu_fill_valid)begin
        lineLoader_valid <= 1'b1;
      end
      if(io_flush)begin
        lineLoader_flushPending <= 1'b1;
      end
      if(_zz_13_)begin
        lineLoader_flushPending <= 1'b0;
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        lineLoader_cmdSent <= 1'b1;
      end
      if(lineLoader_fire)begin
        lineLoader_cmdSent <= 1'b0;
      end
      if(io_mem_rsp_valid)begin
        lineLoader_wordIndex <= (lineLoader_wordIndex + (3'b001));
        if(io_mem_rsp_payload_error)begin
          lineLoader_hadError <= 1'b1;
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(io_cpu_fill_valid)begin
      lineLoader_address <= io_cpu_fill_payload;
    end
    if(_zz_12_)begin
      lineLoader_flushCounter <= (lineLoader_flushCounter + (7'b0000001));
    end
    _zz_3_ <= lineLoader_flushCounter[6];
    if(_zz_13_)begin
      lineLoader_flushCounter <= (7'b0000000);
    end
  end

endmodule

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
      output reg  iBusWishbone_CYC,
      output reg  iBusWishbone_STB,
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
  wire  _zz_160_;
  wire  _zz_161_;
  wire  _zz_162_;
  wire  _zz_163_;
  wire [31:0] _zz_164_;
  wire  _zz_165_;
  wire  _zz_166_;
  wire  _zz_167_;
  wire  _zz_168_;
  wire  _zz_169_;
  wire  _zz_170_;
  wire  _zz_171_;
  wire  _zz_172_;
  wire  _zz_173_;
  wire  _zz_174_;
  wire [31:0] _zz_175_;
  reg  _zz_176_;
  reg [31:0] _zz_177_;
  reg [31:0] _zz_178_;
  reg [31:0] _zz_179_;
  reg [3:0] _zz_180_;
  reg [31:0] _zz_181_;
  wire  IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_error;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuException;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_cacheMiss;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_haltIt;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_decode_data;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire  IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire [31:0] IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire [2:0] IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire  _zz_182_;
  wire  _zz_183_;
  wire  _zz_184_;
  wire  _zz_185_;
  wire  _zz_186_;
  wire  _zz_187_;
  wire  _zz_188_;
  wire  _zz_189_;
  wire  _zz_190_;
  wire  _zz_191_;
  wire  _zz_192_;
  wire  _zz_193_;
  wire  _zz_194_;
  wire  _zz_195_;
  wire  _zz_196_;
  wire [1:0] _zz_197_;
  wire  _zz_198_;
  wire  _zz_199_;
  wire  _zz_200_;
  wire [1:0] _zz_201_;
  wire  _zz_202_;
  wire  _zz_203_;
  wire [5:0] _zz_204_;
  wire  _zz_205_;
  wire  _zz_206_;
  wire  _zz_207_;
  wire  _zz_208_;
  wire  _zz_209_;
  wire  _zz_210_;
  wire [1:0] _zz_211_;
  wire  _zz_212_;
  wire [1:0] _zz_213_;
  wire [2:0] _zz_214_;
  wire [2:0] _zz_215_;
  wire [31:0] _zz_216_;
  wire [2:0] _zz_217_;
  wire [0:0] _zz_218_;
  wire [0:0] _zz_219_;
  wire [0:0] _zz_220_;
  wire [0:0] _zz_221_;
  wire [0:0] _zz_222_;
  wire [0:0] _zz_223_;
  wire [0:0] _zz_224_;
  wire [0:0] _zz_225_;
  wire [0:0] _zz_226_;
  wire [0:0] _zz_227_;
  wire [0:0] _zz_228_;
  wire [0:0] _zz_229_;
  wire [0:0] _zz_230_;
  wire [0:0] _zz_231_;
  wire [2:0] _zz_232_;
  wire [4:0] _zz_233_;
  wire [11:0] _zz_234_;
  wire [11:0] _zz_235_;
  wire [31:0] _zz_236_;
  wire [31:0] _zz_237_;
  wire [31:0] _zz_238_;
  wire [31:0] _zz_239_;
  wire [31:0] _zz_240_;
  wire [31:0] _zz_241_;
  wire [31:0] _zz_242_;
  wire [31:0] _zz_243_;
  wire [32:0] _zz_244_;
  wire [19:0] _zz_245_;
  wire [11:0] _zz_246_;
  wire [11:0] _zz_247_;
  wire [1:0] _zz_248_;
  wire [1:0] _zz_249_;
  wire [2:0] _zz_250_;
  wire [51:0] _zz_251_;
  wire [51:0] _zz_252_;
  wire [51:0] _zz_253_;
  wire [32:0] _zz_254_;
  wire [51:0] _zz_255_;
  wire [49:0] _zz_256_;
  wire [51:0] _zz_257_;
  wire [49:0] _zz_258_;
  wire [51:0] _zz_259_;
  wire [31:0] _zz_260_;
  wire [65:0] _zz_261_;
  wire [31:0] _zz_262_;
  wire [65:0] _zz_263_;
  wire [65:0] _zz_264_;
  wire [0:0] _zz_265_;
  wire [5:0] _zz_266_;
  wire [32:0] _zz_267_;
  wire [32:0] _zz_268_;
  wire [31:0] _zz_269_;
  wire [31:0] _zz_270_;
  wire [32:0] _zz_271_;
  wire [32:0] _zz_272_;
  wire [32:0] _zz_273_;
  wire [0:0] _zz_274_;
  wire [32:0] _zz_275_;
  wire [0:0] _zz_276_;
  wire [32:0] _zz_277_;
  wire [0:0] _zz_278_;
  wire [31:0] _zz_279_;
  wire [0:0] _zz_280_;
  wire [0:0] _zz_281_;
  wire [30:0] _zz_282_;
  wire [30:0] _zz_283_;
  wire [0:0] _zz_284_;
  wire [0:0] _zz_285_;
  wire [0:0] _zz_286_;
  wire [0:0] _zz_287_;
  wire [0:0] _zz_288_;
  wire [0:0] _zz_289_;
  wire [26:0] _zz_290_;
  wire [6:0] _zz_291_;
  wire [1:0] _zz_292_;
  wire  _zz_293_;
  wire [0:0] _zz_294_;
  wire [2:0] _zz_295_;
  wire [31:0] _zz_296_;
  wire [31:0] _zz_297_;
  wire  _zz_298_;
  wire [1:0] _zz_299_;
  wire [1:0] _zz_300_;
  wire  _zz_301_;
  wire [0:0] _zz_302_;
  wire [25:0] _zz_303_;
  wire [31:0] _zz_304_;
  wire [31:0] _zz_305_;
  wire [31:0] _zz_306_;
  wire  _zz_307_;
  wire  _zz_308_;
  wire [31:0] _zz_309_;
  wire [31:0] _zz_310_;
  wire [31:0] _zz_311_;
  wire [31:0] _zz_312_;
  wire [31:0] _zz_313_;
  wire [31:0] _zz_314_;
  wire [0:0] _zz_315_;
  wire [0:0] _zz_316_;
  wire [0:0] _zz_317_;
  wire [0:0] _zz_318_;
  wire  _zz_319_;
  wire [0:0] _zz_320_;
  wire [22:0] _zz_321_;
  wire [31:0] _zz_322_;
  wire [31:0] _zz_323_;
  wire [31:0] _zz_324_;
  wire [31:0] _zz_325_;
  wire  _zz_326_;
  wire [2:0] _zz_327_;
  wire [2:0] _zz_328_;
  wire  _zz_329_;
  wire [0:0] _zz_330_;
  wire [19:0] _zz_331_;
  wire [31:0] _zz_332_;
  wire [31:0] _zz_333_;
  wire  _zz_334_;
  wire  _zz_335_;
  wire  _zz_336_;
  wire [0:0] _zz_337_;
  wire [0:0] _zz_338_;
  wire [1:0] _zz_339_;
  wire [1:0] _zz_340_;
  wire  _zz_341_;
  wire [0:0] _zz_342_;
  wire [16:0] _zz_343_;
  wire [31:0] _zz_344_;
  wire [31:0] _zz_345_;
  wire [31:0] _zz_346_;
  wire [31:0] _zz_347_;
  wire [31:0] _zz_348_;
  wire [31:0] _zz_349_;
  wire [31:0] _zz_350_;
  wire [0:0] _zz_351_;
  wire [0:0] _zz_352_;
  wire [1:0] _zz_353_;
  wire [1:0] _zz_354_;
  wire  _zz_355_;
  wire [0:0] _zz_356_;
  wire [13:0] _zz_357_;
  wire [31:0] _zz_358_;
  wire [31:0] _zz_359_;
  wire [31:0] _zz_360_;
  wire [31:0] _zz_361_;
  wire [31:0] _zz_362_;
  wire [0:0] _zz_363_;
  wire [3:0] _zz_364_;
  wire [0:0] _zz_365_;
  wire [0:0] _zz_366_;
  wire  _zz_367_;
  wire [0:0] _zz_368_;
  wire [10:0] _zz_369_;
  wire [31:0] _zz_370_;
  wire  _zz_371_;
  wire [0:0] _zz_372_;
  wire [0:0] _zz_373_;
  wire [31:0] _zz_374_;
  wire [1:0] _zz_375_;
  wire [1:0] _zz_376_;
  wire  _zz_377_;
  wire [0:0] _zz_378_;
  wire [7:0] _zz_379_;
  wire [31:0] _zz_380_;
  wire [31:0] _zz_381_;
  wire [31:0] _zz_382_;
  wire [31:0] _zz_383_;
  wire [31:0] _zz_384_;
  wire  _zz_385_;
  wire [0:0] _zz_386_;
  wire [1:0] _zz_387_;
  wire [0:0] _zz_388_;
  wire [0:0] _zz_389_;
  wire [2:0] _zz_390_;
  wire [2:0] _zz_391_;
  wire  _zz_392_;
  wire [0:0] _zz_393_;
  wire [4:0] _zz_394_;
  wire [31:0] _zz_395_;
  wire [31:0] _zz_396_;
  wire [31:0] _zz_397_;
  wire  _zz_398_;
  wire  _zz_399_;
  wire [31:0] _zz_400_;
  wire [31:0] _zz_401_;
  wire [31:0] _zz_402_;
  wire [31:0] _zz_403_;
  wire  _zz_404_;
  wire [0:0] _zz_405_;
  wire [0:0] _zz_406_;
  wire [0:0] _zz_407_;
  wire [0:0] _zz_408_;
  wire [3:0] _zz_409_;
  wire [3:0] _zz_410_;
  wire  _zz_411_;
  wire [0:0] _zz_412_;
  wire [2:0] _zz_413_;
  wire [31:0] _zz_414_;
  wire [31:0] _zz_415_;
  wire [31:0] _zz_416_;
  wire [31:0] _zz_417_;
  wire [31:0] _zz_418_;
  wire [31:0] _zz_419_;
  wire [31:0] _zz_420_;
  wire [31:0] _zz_421_;
  wire [31:0] _zz_422_;
  wire [31:0] _zz_423_;
  wire [31:0] _zz_424_;
  wire [0:0] _zz_425_;
  wire [1:0] _zz_426_;
  wire  _zz_427_;
  wire [0:0] _zz_428_;
  wire [0:0] _zz_429_;
  wire  _zz_430_;
  wire [0:0] _zz_431_;
  wire [0:0] _zz_432_;
  wire [31:0] _zz_433_;
  wire [31:0] _zz_434_;
  wire [31:0] _zz_435_;
  wire [31:0] _zz_436_;
  wire [31:0] _zz_437_;
  wire  _zz_438_;
  wire [0:0] _zz_439_;
  wire [1:0] _zz_440_;
  wire [31:0] _zz_441_;
  wire [31:0] _zz_442_;
  wire [31:0] _zz_443_;
  wire  _zz_444_;
  wire [0:0] _zz_445_;
  wire [12:0] _zz_446_;
  wire [31:0] _zz_447_;
  wire [31:0] _zz_448_;
  wire [31:0] _zz_449_;
  wire  _zz_450_;
  wire [0:0] _zz_451_;
  wire [6:0] _zz_452_;
  wire [31:0] _zz_453_;
  wire [31:0] _zz_454_;
  wire [31:0] _zz_455_;
  wire  _zz_456_;
  wire [0:0] _zz_457_;
  wire [0:0] _zz_458_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_1_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_2_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_3_;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_4_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_5_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_6_;
  wire  decode_MEMORY_STORE;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_7_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_8_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_9_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_10_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_12_;
  wire  decode_IS_RS1_SIGNED;
  wire  decode_IS_RS2_SIGNED;
  wire  execute_REGFILE_WRITE_VALID;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_13_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_14_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_15_;
  wire  decode_IS_MUL;
  wire  decode_DO_EBREAK;
  wire  decode_SRC2_FORCE_ZERO;
  wire  decode_MEMORY_ENABLE;
  wire  decode_CSR_READ_OPCODE;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_16_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_17_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_18_;
  wire  decode_CSR_WRITE_OPCODE;
  wire  decode_IS_DIV;
  wire  decode_IS_CSR;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_19_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_20_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_21_;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  _zz_22_;
  wire  execute_IS_RS1_SIGNED;
  wire  execute_IS_RS2_SIGNED;
  wire  execute_IS_DIV;
  wire  execute_IS_MUL;
  wire [33:0] execute_MUL_HH;
  wire [51:0] execute_MUL_LOW;
  wire [33:0] execute_MUL_HL;
  wire [33:0] execute_MUL_LH;
  wire [31:0] execute_MUL_LL;
  wire [51:0] _zz_23_;
  wire [33:0] _zz_24_;
  wire [33:0] _zz_25_;
  wire [33:0] _zz_26_;
  wire [31:0] _zz_27_;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire  _zz_28_;
  wire  _zz_29_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_30_;
  wire [31:0] execute_BRANCH_CALC;
  wire  execute_BRANCH_DO;
  wire [31:0] _zz_31_;
  wire [31:0] execute_RS1;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_32_;
  wire  _zz_33_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_34_;
  wire  _zz_35_;
  wire [31:0] _zz_36_;
  wire [31:0] _zz_37_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_38_;
  wire [31:0] _zz_39_;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_40_;
  wire [31:0] _zz_41_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire  _zz_42_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_43_;
  wire [31:0] _zz_44_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_45_;
  reg  _zz_46_;
  wire [31:0] _zz_47_;
  wire [31:0] _zz_48_;
  reg  decode_REGFILE_WRITE_VALID;
  wire  decode_LEGAL_INSTRUCTION;
  wire  decode_INSTRUCTION_READY;
  wire  _zz_49_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_50_;
  wire  _zz_51_;
  wire  _zz_52_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_53_;
  wire  _zz_54_;
  wire  _zz_55_;
  wire  _zz_56_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_57_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_58_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_59_;
  wire  _zz_60_;
  wire  _zz_61_;
  wire  _zz_62_;
  wire  _zz_63_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_64_;
  wire  _zz_65_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_66_;
  wire  _zz_67_;
  wire  _zz_68_;
  wire  _zz_69_;
  reg [31:0] _zz_70_;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] execute_MEMORY_READ_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire [31:0] _zz_71_;
  wire [31:0] execute_SRC_ADD;
  wire [1:0] _zz_72_;
  wire [31:0] execute_RS2;
  wire  execute_MEMORY_STORE;
  wire  execute_MEMORY_ENABLE;
  wire  execute_ALIGNEMENT_FAULT;
  wire  _zz_73_;
  wire  decode_FLUSH_ALL;
  reg  IBusCachedPlugin_rsp_issueDetected;
  reg  _zz_74_;
  reg  _zz_75_;
  reg  _zz_76_;
  reg [31:0] _zz_77_;
  wire [31:0] decode_PC;
  wire [31:0] _zz_78_;
  wire [31:0] _zz_79_;
  wire [31:0] _zz_80_;
  wire [31:0] decode_INSTRUCTION;
  wire [31:0] execute_PC;
  wire [31:0] execute_INSTRUCTION;
  reg  decode_arbitration_haltItself;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  wire  decode_arbitration_flushIt;
  reg  decode_arbitration_flushNext;
  reg  decode_arbitration_isValid;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  reg  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushIt;
  reg  execute_arbitration_flushNext;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  wire  execute_arbitration_isMoving;
  wire  execute_arbitration_isFiring;
  wire [31:0] lastStageInstruction /* verilator public */ ;
  wire [31:0] lastStagePc /* verilator public */ ;
  wire  lastStageIsValid /* verilator public */ ;
  wire  lastStageIsFiring /* verilator public */ ;
  reg  IBusCachedPlugin_fetcherHalt;
  reg  IBusCachedPlugin_fetcherflushIt;
  reg  IBusCachedPlugin_incomingInstruction;
  wire  IBusCachedPlugin_pcValids_0;
  wire  IBusCachedPlugin_pcValids_1;
  wire  IBusCachedPlugin_redoBranch_valid;
  wire [31:0] IBusCachedPlugin_redoBranch_payload;
  reg  IBusCachedPlugin_decodeExceptionPort_valid;
  reg [3:0] IBusCachedPlugin_decodeExceptionPort_payload_code;
  wire [31:0] IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  reg  DBusSimplePlugin_memoryExceptionPort_valid;
  reg [3:0] DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire [31:0] DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire  decodeExceptionPort_valid;
  wire [3:0] decodeExceptionPort_payload_code;
  wire [31:0] decodeExceptionPort_payload_badAddr;
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
  reg  IBusCachedPlugin_injectionPort_valid;
  reg  IBusCachedPlugin_injectionPort_ready;
  wire [31:0] IBusCachedPlugin_injectionPort_payload;
  wire  IBusCachedPlugin_jump_pcLoad_valid;
  wire [31:0] IBusCachedPlugin_jump_pcLoad_payload;
  wire [2:0] _zz_81_;
  wire [2:0] _zz_82_;
  wire  _zz_83_;
  wire  _zz_84_;
  wire  IBusCachedPlugin_fetchPc_output_valid;
  wire  IBusCachedPlugin_fetchPc_output_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_output_payload;
  reg [31:0] IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusCachedPlugin_fetchPc_corrected;
  reg  IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg  IBusCachedPlugin_fetchPc_booted;
  reg  IBusCachedPlugin_fetchPc_inc;
  reg [31:0] IBusCachedPlugin_fetchPc_pc;
  wire  IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire  IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg  IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire  IBusCachedPlugin_iBusRsp_stages_0_inputSample;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  reg  IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_inputSample;
  wire  _zz_85_;
  wire  _zz_86_;
  wire  _zz_87_;
  wire  _zz_88_;
  reg  _zz_89_;
  reg  IBusCachedPlugin_iBusRsp_readyForError;
  wire  IBusCachedPlugin_iBusRsp_inputBeforeStage_valid;
  wire  IBusCachedPlugin_iBusRsp_inputBeforeStage_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_pc;
  wire  IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_inst;
  wire  IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_isRvc;
  wire  IBusCachedPlugin_injector_decodeInput_valid;
  wire  IBusCachedPlugin_injector_decodeInput_ready;
  wire [31:0] IBusCachedPlugin_injector_decodeInput_payload_pc;
  wire  IBusCachedPlugin_injector_decodeInput_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  wire  IBusCachedPlugin_injector_decodeInput_payload_isRvc;
  reg  _zz_90_;
  reg [31:0] _zz_91_;
  reg  _zz_92_;
  reg [31:0] _zz_93_;
  reg  _zz_94_;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg  IBusCachedPlugin_injector_decodeRemoved;
  reg [31:0] IBusCachedPlugin_injector_formal_rawInDecode;
  wire  iBus_cmd_valid;
  wire  iBus_cmd_ready;
  reg [31:0] iBus_cmd_payload_address;
  wire [2:0] iBus_cmd_payload_size;
  wire  iBus_rsp_valid;
  wire [31:0] iBus_rsp_payload_data;
  wire  iBus_rsp_payload_error;
  wire [31:0] _zz_95_;
  reg [31:0] IBusCachedPlugin_rspCounter;
  wire  IBusCachedPlugin_s0_tightlyCoupledHit;
  reg  IBusCachedPlugin_s1_tightlyCoupledHit;
  wire  IBusCachedPlugin_rsp_iBusRspOutputHalt;
  reg  IBusCachedPlugin_rsp_redoFetch;
  wire  dBus_cmd_valid;
  wire  dBus_cmd_ready;
  wire  dBus_cmd_payload_wr;
  wire [31:0] dBus_cmd_payload_address;
  wire [31:0] dBus_cmd_payload_data;
  wire [1:0] dBus_cmd_payload_size;
  wire  dBus_rsp_ready;
  wire  dBus_rsp_error;
  wire [31:0] dBus_rsp_data;
  reg  _zz_96_;
  reg  execute_DBusSimplePlugin_skipCmd;
  reg [31:0] _zz_97_;
  reg [3:0] _zz_98_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] execute_DBusSimplePlugin_rspShifted;
  wire  _zz_99_;
  reg [31:0] _zz_100_;
  wire  _zz_101_;
  reg [31:0] _zz_102_;
  reg [31:0] execute_DBusSimplePlugin_rspFormated;
  wire [31:0] _zz_103_;
  wire  _zz_104_;
  wire  _zz_105_;
  wire  _zz_106_;
  wire  _zz_107_;
  wire  _zz_108_;
  wire  _zz_109_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_110_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_111_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_112_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_113_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_114_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_115_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_116_;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire  _zz_117_;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  lastStageRegFileWrite_valid /* verilator public */ ;
  wire [4:0] lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire [31:0] lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_118_;
  reg [31:0] _zz_119_;
  wire  _zz_120_;
  reg [19:0] _zz_121_;
  wire  _zz_122_;
  reg [19:0] _zz_123_;
  reg [31:0] _zz_124_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  reg [31:0] execute_LightShifterPlugin_shiftReg;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_125_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_126_;
  reg  _zz_127_;
  reg  _zz_128_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_129_;
  reg [10:0] _zz_130_;
  wire  _zz_131_;
  reg [19:0] _zz_132_;
  wire  _zz_133_;
  reg [18:0] _zz_134_;
  reg [31:0] _zz_135_;
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
  wire  _zz_136_;
  wire  _zz_137_;
  wire  _zz_138_;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire [1:0] _zz_139_;
  wire  _zz_140_;
  wire [2:0] _zz_141_;
  wire [2:0] _zz_142_;
  wire  _zz_143_;
  wire  _zz_144_;
  wire [1:0] _zz_145_;
  reg  CsrPlugin_interrupt_valid;
  reg [3:0] CsrPlugin_interrupt_code /* verilator public */ ;
  reg [1:0] CsrPlugin_interrupt_targetPrivilege;
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
  reg  execute_CsrPlugin_wfiWake;
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
  reg  execute_MulPlugin_aSigned;
  reg  execute_MulPlugin_bSigned;
  wire [31:0] execute_MulPlugin_a;
  wire [31:0] execute_MulPlugin_b;
  wire [15:0] execute_MulPlugin_aULow;
  wire [15:0] execute_MulPlugin_bULow;
  wire [16:0] execute_MulPlugin_aSLow;
  wire [16:0] execute_MulPlugin_bSLow;
  wire [16:0] execute_MulPlugin_aHigh;
  wire [16:0] execute_MulPlugin_bHigh;
  reg [32:0] execute_DivPlugin_rs1;
  reg [31:0] execute_DivPlugin_rs2;
  reg [64:0] execute_DivPlugin_accumulator;
  reg  execute_DivPlugin_frontendOk;
  reg  execute_DivPlugin_div_needRevert;
  reg  execute_DivPlugin_div_counter_willIncrement;
  reg  execute_DivPlugin_div_counter_willClear;
  reg [5:0] execute_DivPlugin_div_counter_valueNext;
  reg [5:0] execute_DivPlugin_div_counter_value;
  wire  execute_DivPlugin_div_counter_willOverflowIfInc;
  wire  execute_DivPlugin_div_counter_willOverflow;
  reg  execute_DivPlugin_div_done;
  reg [31:0] execute_DivPlugin_div_result;
  wire [31:0] _zz_146_;
  wire [32:0] _zz_147_;
  wire [32:0] _zz_148_;
  wire [31:0] _zz_149_;
  wire  _zz_150_;
  wire  _zz_151_;
  reg [32:0] _zz_152_;
  reg [31:0] externalInterruptArray_regNext;
  reg [31:0] _zz_153_;
  wire [31:0] _zz_154_;
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
  reg [31:0] DebugPlugin_busReadDataReg;
  reg  _zz_155_;
  reg  DebugPlugin_resetIt_regNext;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg  decode_to_execute_IS_CSR;
  reg  decode_to_execute_IS_DIV;
  reg [31:0] decode_to_execute_PC;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg  decode_to_execute_DO_EBREAK;
  reg  decode_to_execute_IS_MUL;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg  decode_to_execute_MEMORY_STORE;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg [2:0] _zz_156_;
  reg [2:0] _zz_157_;
  reg  _zz_158_;
  reg [31:0] iBusWishbone_DAT_MISO_regNext;
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
  reg [3:0] _zz_159_;
  `ifndef SYNTHESIS
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_1__string;
  reg [23:0] _zz_2__string;
  reg [23:0] _zz_3__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_4__string;
  reg [63:0] _zz_5__string;
  reg [63:0] _zz_6__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_7__string;
  reg [71:0] _zz_8__string;
  reg [71:0] _zz_9__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_10__string;
  reg [39:0] _zz_11__string;
  reg [39:0] _zz_12__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_13__string;
  reg [31:0] _zz_14__string;
  reg [31:0] _zz_15__string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_16__string;
  reg [47:0] _zz_17__string;
  reg [47:0] _zz_18__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_19__string;
  reg [95:0] _zz_20__string;
  reg [95:0] _zz_21__string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_30__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_32__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_34__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_38__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_40__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_43__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_45__string;
  reg [39:0] _zz_50__string;
  reg [31:0] _zz_53__string;
  reg [95:0] _zz_57__string;
  reg [63:0] _zz_58__string;
  reg [23:0] _zz_59__string;
  reg [71:0] _zz_64__string;
  reg [47:0] _zz_66__string;
  reg [47:0] _zz_110__string;
  reg [71:0] _zz_111__string;
  reg [23:0] _zz_112__string;
  reg [63:0] _zz_113__string;
  reg [95:0] _zz_114__string;
  reg [31:0] _zz_115__string;
  reg [39:0] _zz_116__string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_182_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_183_ = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_184_ = (execute_arbitration_isValid && execute_IS_DIV);
  assign _zz_185_ = ((_zz_162_ && IBusCachedPlugin_cache_io_cpu_fetch_error) && (! _zz_74_));
  assign _zz_186_ = ((_zz_162_ && IBusCachedPlugin_cache_io_cpu_fetch_cacheMiss) && (! _zz_75_));
  assign _zz_187_ = ((_zz_162_ && IBusCachedPlugin_cache_io_cpu_fetch_mmuException) && (! _zz_76_));
  assign _zz_188_ = ((_zz_162_ && IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling) && (! 1'b0));
  assign _zz_189_ = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != (2'b00));
  assign _zz_190_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_191_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_192_ = ({CsrPlugin_selfException_valid,{BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid}} != (3'b000));
  assign _zz_193_ = (1'b0 == 1'b0);
  assign _zz_194_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_195_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_196_ = (DebugPlugin_stepIt && IBusCachedPlugin_incomingInstruction);
  assign _zz_197_ = execute_INSTRUCTION[29 : 28];
  assign _zz_198_ = (! IBusCachedPlugin_iBusRsp_readyForError);
  assign _zz_199_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_200_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK));
  assign _zz_201_ = execute_INSTRUCTION[13 : 12];
  assign _zz_202_ = (execute_DivPlugin_frontendOk && (! execute_DivPlugin_div_done));
  assign _zz_203_ = (! execute_DivPlugin_frontendOk);
  assign _zz_204_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_205_ = (iBus_cmd_valid || (_zz_157_ != (3'b000)));
  assign _zz_206_ = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11)));
  assign _zz_207_ = ((_zz_136_ && 1'b1) && (! 1'b0));
  assign _zz_208_ = ((_zz_137_ && 1'b1) && (! 1'b0));
  assign _zz_209_ = ((_zz_138_ && 1'b1) && (! 1'b0));
  assign _zz_210_ = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_211_ = execute_INSTRUCTION[13 : 12];
  assign _zz_212_ = execute_INSTRUCTION[13];
  assign _zz_213_ = execute_INSTRUCTION[13 : 12];
  assign _zz_214_ = (_zz_81_ - (3'b001));
  assign _zz_215_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign _zz_216_ = {29'd0, _zz_215_};
  assign _zz_217_ = (execute_MEMORY_STORE ? (3'b110) : (3'b100));
  assign _zz_218_ = _zz_103_[0 : 0];
  assign _zz_219_ = _zz_103_[1 : 1];
  assign _zz_220_ = _zz_103_[6 : 6];
  assign _zz_221_ = _zz_103_[11 : 11];
  assign _zz_222_ = _zz_103_[12 : 12];
  assign _zz_223_ = _zz_103_[13 : 13];
  assign _zz_224_ = _zz_103_[15 : 15];
  assign _zz_225_ = _zz_103_[22 : 22];
  assign _zz_226_ = _zz_103_[23 : 23];
  assign _zz_227_ = _zz_103_[24 : 24];
  assign _zz_228_ = _zz_103_[27 : 27];
  assign _zz_229_ = _zz_103_[28 : 28];
  assign _zz_230_ = _zz_103_[31 : 31];
  assign _zz_231_ = execute_SRC_LESS;
  assign _zz_232_ = (3'b100);
  assign _zz_233_ = execute_INSTRUCTION[19 : 15];
  assign _zz_234_ = execute_INSTRUCTION[31 : 20];
  assign _zz_235_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_236_ = ($signed(_zz_237_) + $signed(_zz_240_));
  assign _zz_237_ = ($signed(_zz_238_) + $signed(_zz_239_));
  assign _zz_238_ = execute_SRC1;
  assign _zz_239_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_240_ = (execute_SRC_USE_SUB_LESS ? _zz_241_ : _zz_242_);
  assign _zz_241_ = (32'b00000000000000000000000000000001);
  assign _zz_242_ = (32'b00000000000000000000000000000000);
  assign _zz_243_ = (_zz_244_ >>> 1);
  assign _zz_244_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_245_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_246_ = execute_INSTRUCTION[31 : 20];
  assign _zz_247_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_248_ = (_zz_139_ & (~ _zz_249_));
  assign _zz_249_ = (_zz_139_ - (2'b01));
  assign _zz_250_ = (_zz_141_ - (3'b001));
  assign _zz_251_ = ($signed(_zz_252_) + $signed(_zz_257_));
  assign _zz_252_ = ($signed(_zz_253_) + $signed(_zz_255_));
  assign _zz_253_ = (52'b0000000000000000000000000000000000000000000000000000);
  assign _zz_254_ = {1'b0,execute_MUL_LL};
  assign _zz_255_ = {{19{_zz_254_[32]}}, _zz_254_};
  assign _zz_256_ = ({16'd0,execute_MUL_LH} <<< 16);
  assign _zz_257_ = {{2{_zz_256_[49]}}, _zz_256_};
  assign _zz_258_ = ({16'd0,execute_MUL_HL} <<< 16);
  assign _zz_259_ = {{2{_zz_258_[49]}}, _zz_258_};
  assign _zz_260_ = execute_MUL_LOW[31 : 0];
  assign _zz_261_ = ($signed(_zz_263_) + $signed(_zz_264_));
  assign _zz_262_ = _zz_261_[63 : 32];
  assign _zz_263_ = {{14{execute_MUL_LOW[51]}}, execute_MUL_LOW};
  assign _zz_264_ = ({32'd0,execute_MUL_HH} <<< 32);
  assign _zz_265_ = execute_DivPlugin_div_counter_willIncrement;
  assign _zz_266_ = {5'd0, _zz_265_};
  assign _zz_267_ = {1'd0, execute_DivPlugin_rs2};
  assign _zz_268_ = {_zz_146_,(! _zz_148_[32])};
  assign _zz_269_ = _zz_148_[31:0];
  assign _zz_270_ = _zz_147_[31:0];
  assign _zz_271_ = _zz_272_;
  assign _zz_272_ = _zz_273_;
  assign _zz_273_ = ({1'b0,(execute_DivPlugin_div_needRevert ? (~ _zz_149_) : _zz_149_)} + _zz_275_);
  assign _zz_274_ = execute_DivPlugin_div_needRevert;
  assign _zz_275_ = {32'd0, _zz_274_};
  assign _zz_276_ = _zz_151_;
  assign _zz_277_ = {32'd0, _zz_276_};
  assign _zz_278_ = _zz_150_;
  assign _zz_279_ = {31'd0, _zz_278_};
  assign _zz_280_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_281_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_282_ = (decode_PC >>> 1);
  assign _zz_283_ = (decode_PC >>> 1);
  assign _zz_284_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_285_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_286_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_287_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_288_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_289_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_290_ = (iBus_cmd_payload_address >>> 5);
  assign _zz_291_ = ({3'd0,_zz_159_} <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign _zz_292_ = {_zz_84_,_zz_83_};
  assign _zz_293_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000010000)) == (32'b00000000000000000001000000010000));
  assign _zz_294_ = ((decode_INSTRUCTION & _zz_304_) == (32'b00000000000000000010000000010000));
  assign _zz_295_ = {(_zz_305_ == _zz_306_),{_zz_307_,_zz_308_}};
  assign _zz_296_ = (decode_INSTRUCTION & (32'b00000000000000000001000000000000));
  assign _zz_297_ = (32'b00000000000000000001000000000000);
  assign _zz_298_ = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000010000000000000));
  assign _zz_299_ = {(_zz_309_ == _zz_310_),(_zz_311_ == _zz_312_)};
  assign _zz_300_ = (2'b00);
  assign _zz_301_ = ((_zz_313_ == _zz_314_) != (1'b0));
  assign _zz_302_ = ({_zz_315_,_zz_316_} != (2'b00));
  assign _zz_303_ = {(_zz_317_ != _zz_318_),{_zz_319_,{_zz_320_,_zz_321_}}};
  assign _zz_304_ = (32'b00000000000000000010000000010000);
  assign _zz_305_ = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign _zz_306_ = (32'b00000000000000000000000000010000);
  assign _zz_307_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000001100)) == (32'b00000000000000000000000000000100));
  assign _zz_308_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000101000)) == (32'b00000000000000000000000000000000));
  assign _zz_309_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_310_ = (32'b00000000000000000010000000000000);
  assign _zz_311_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_312_ = (32'b00000000000000000001000000000000);
  assign _zz_313_ = (decode_INSTRUCTION & (32'b00000010000000000100000001100100));
  assign _zz_314_ = (32'b00000010000000000100000000100000);
  assign _zz_315_ = _zz_109_;
  assign _zz_316_ = ((decode_INSTRUCTION & _zz_322_) == (32'b00000000000000000000000000000100));
  assign _zz_317_ = ((decode_INSTRUCTION & _zz_323_) == (32'b00000000000000000000000001000000));
  assign _zz_318_ = (1'b0);
  assign _zz_319_ = ((_zz_324_ == _zz_325_) != (1'b0));
  assign _zz_320_ = (_zz_326_ != (1'b0));
  assign _zz_321_ = {(_zz_327_ != _zz_328_),{_zz_329_,{_zz_330_,_zz_331_}}};
  assign _zz_322_ = (32'b00000000000000000000000000011100);
  assign _zz_323_ = (32'b00000000000000000000000001011000);
  assign _zz_324_ = (decode_INSTRUCTION & (32'b00000000000000000000000000100000));
  assign _zz_325_ = (32'b00000000000000000000000000100000);
  assign _zz_326_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000000000000));
  assign _zz_327_ = {(_zz_332_ == _zz_333_),{_zz_334_,_zz_335_}};
  assign _zz_328_ = (3'b000);
  assign _zz_329_ = ({_zz_336_,_zz_108_} != (2'b00));
  assign _zz_330_ = ({_zz_337_,_zz_338_} != (2'b00));
  assign _zz_331_ = {(_zz_339_ != _zz_340_),{_zz_341_,{_zz_342_,_zz_343_}}};
  assign _zz_332_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_333_ = (32'b00000000000000000000000001000000);
  assign _zz_334_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_335_ = ((decode_INSTRUCTION & (32'b01000000000000000100000000110100)) == (32'b01000000000000000000000000110000));
  assign _zz_336_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_337_ = ((decode_INSTRUCTION & _zz_344_) == (32'b00000000000000000000000000000100));
  assign _zz_338_ = _zz_108_;
  assign _zz_339_ = {(_zz_345_ == _zz_346_),(_zz_347_ == _zz_348_)};
  assign _zz_340_ = (2'b00);
  assign _zz_341_ = ((_zz_349_ == _zz_350_) != (1'b0));
  assign _zz_342_ = ({_zz_351_,_zz_352_} != (2'b00));
  assign _zz_343_ = {(_zz_353_ != _zz_354_),{_zz_355_,{_zz_356_,_zz_357_}}};
  assign _zz_344_ = (32'b00000000000000000000000001000100);
  assign _zz_345_ = (decode_INSTRUCTION & (32'b00000000000000000110000000010100));
  assign _zz_346_ = (32'b00000000000000000110000000010000);
  assign _zz_347_ = (decode_INSTRUCTION & (32'b00000000000000000101000000010100));
  assign _zz_348_ = (32'b00000000000000000100000000010000);
  assign _zz_349_ = (decode_INSTRUCTION & (32'b00000000000000000110000000010100));
  assign _zz_350_ = (32'b00000000000000000010000000010000);
  assign _zz_351_ = _zz_107_;
  assign _zz_352_ = ((decode_INSTRUCTION & _zz_358_) == (32'b00000000000000000000000000100000));
  assign _zz_353_ = {_zz_107_,(_zz_359_ == _zz_360_)};
  assign _zz_354_ = (2'b00);
  assign _zz_355_ = ((_zz_361_ == _zz_362_) != (1'b0));
  assign _zz_356_ = ({_zz_363_,_zz_364_} != (5'b00000));
  assign _zz_357_ = {(_zz_365_ != _zz_366_),{_zz_367_,{_zz_368_,_zz_369_}}};
  assign _zz_358_ = (32'b00000000000000000000000001110000);
  assign _zz_359_ = (decode_INSTRUCTION & (32'b00000000000000000000000000100000));
  assign _zz_360_ = (32'b00000000000000000000000000000000);
  assign _zz_361_ = (decode_INSTRUCTION & (32'b00000000000000000001000001001000));
  assign _zz_362_ = (32'b00000000000000000001000000001000);
  assign _zz_363_ = ((decode_INSTRUCTION & _zz_370_) == (32'b00000000000000000000000001000000));
  assign _zz_364_ = {_zz_107_,{_zz_371_,{_zz_372_,_zz_373_}}};
  assign _zz_365_ = ((decode_INSTRUCTION & _zz_374_) == (32'b00000010000000000000000000110000));
  assign _zz_366_ = (1'b0);
  assign _zz_367_ = (_zz_104_ != (1'b0));
  assign _zz_368_ = (_zz_105_ != (1'b0));
  assign _zz_369_ = {(_zz_375_ != _zz_376_),{_zz_377_,{_zz_378_,_zz_379_}}};
  assign _zz_370_ = (32'b00000000000000000000000001000000);
  assign _zz_371_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000100000)) == (32'b00000000000000000100000000100000));
  assign _zz_372_ = _zz_106_;
  assign _zz_373_ = ((decode_INSTRUCTION & _zz_380_) == (32'b00000000000000000000000000100000));
  assign _zz_374_ = (32'b00000010000000000100000001110100);
  assign _zz_375_ = {(_zz_381_ == _zz_382_),(_zz_383_ == _zz_384_)};
  assign _zz_376_ = (2'b00);
  assign _zz_377_ = ({_zz_385_,{_zz_386_,_zz_387_}} != (4'b0000));
  assign _zz_378_ = ({_zz_388_,_zz_389_} != (2'b00));
  assign _zz_379_ = {(_zz_390_ != _zz_391_),{_zz_392_,{_zz_393_,_zz_394_}}};
  assign _zz_380_ = (32'b00000010000000000000000000100000);
  assign _zz_381_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110100));
  assign _zz_382_ = (32'b00000000000000000000000000100000);
  assign _zz_383_ = (decode_INSTRUCTION & (32'b00000000000000000000000001100100));
  assign _zz_384_ = (32'b00000000000000000000000000100000);
  assign _zz_385_ = ((decode_INSTRUCTION & _zz_395_) == (32'b00000000000000000000000000000000));
  assign _zz_386_ = (_zz_396_ == _zz_397_);
  assign _zz_387_ = {_zz_398_,_zz_399_};
  assign _zz_388_ = (_zz_400_ == _zz_401_);
  assign _zz_389_ = (_zz_402_ == _zz_403_);
  assign _zz_390_ = {_zz_404_,{_zz_405_,_zz_406_}};
  assign _zz_391_ = (3'b000);
  assign _zz_392_ = ({_zz_407_,_zz_408_} != (2'b00));
  assign _zz_393_ = (_zz_409_ != _zz_410_);
  assign _zz_394_ = {_zz_411_,{_zz_412_,_zz_413_}};
  assign _zz_395_ = (32'b00000000000000000000000001000100);
  assign _zz_396_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign _zz_397_ = (32'b00000000000000000000000000000000);
  assign _zz_398_ = ((decode_INSTRUCTION & _zz_414_) == (32'b00000000000000000010000000000000));
  assign _zz_399_ = ((decode_INSTRUCTION & _zz_415_) == (32'b00000000000000000001000000000000));
  assign _zz_400_ = (decode_INSTRUCTION & (32'b00000000000000000111000000110100));
  assign _zz_401_ = (32'b00000000000000000101000000010000);
  assign _zz_402_ = (decode_INSTRUCTION & (32'b00000010000000000111000001100100));
  assign _zz_403_ = (32'b00000000000000000101000000100000);
  assign _zz_404_ = ((decode_INSTRUCTION & _zz_416_) == (32'b01000000000000000001000000010000));
  assign _zz_405_ = (_zz_417_ == _zz_418_);
  assign _zz_406_ = (_zz_419_ == _zz_420_);
  assign _zz_407_ = (_zz_421_ == _zz_422_);
  assign _zz_408_ = (_zz_423_ == _zz_424_);
  assign _zz_409_ = {_zz_107_,{_zz_425_,_zz_426_}};
  assign _zz_410_ = (4'b0000);
  assign _zz_411_ = (_zz_427_ != (1'b0));
  assign _zz_412_ = (_zz_428_ != _zz_429_);
  assign _zz_413_ = {_zz_430_,{_zz_431_,_zz_432_}};
  assign _zz_414_ = (32'b00000000000000000110000000000100);
  assign _zz_415_ = (32'b00000000000000000101000000000100);
  assign _zz_416_ = (32'b01000000000000000011000001010100);
  assign _zz_417_ = (decode_INSTRUCTION & (32'b00000000000000000111000000110100));
  assign _zz_418_ = (32'b00000000000000000001000000010000);
  assign _zz_419_ = (decode_INSTRUCTION & (32'b00000010000000000111000001010100));
  assign _zz_420_ = (32'b00000000000000000001000000010000);
  assign _zz_421_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_422_ = (32'b00000000000000000001000001010000);
  assign _zz_423_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_424_ = (32'b00000000000000000010000001010000);
  assign _zz_425_ = _zz_106_;
  assign _zz_426_ = {(_zz_433_ == _zz_434_),(_zz_435_ == _zz_436_)};
  assign _zz_427_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_428_ = ((decode_INSTRUCTION & _zz_437_) == (32'b00000000000000000000000001010000));
  assign _zz_429_ = (1'b0);
  assign _zz_430_ = ({_zz_105_,_zz_438_} != (2'b00));
  assign _zz_431_ = (_zz_104_ != (1'b0));
  assign _zz_432_ = ({_zz_439_,_zz_440_} != (3'b000));
  assign _zz_433_ = (decode_INSTRUCTION & (32'b00000000000000000100000001100000));
  assign _zz_434_ = (32'b00000000000000000100000000100000);
  assign _zz_435_ = (decode_INSTRUCTION & (32'b00000010000000000000000001100000));
  assign _zz_436_ = (32'b00000000000000000000000000100000);
  assign _zz_437_ = (32'b00010000000000000011000001010000);
  assign _zz_438_ = ((decode_INSTRUCTION & (32'b00010000010000000011000001010000)) == (32'b00010000000000000000000001010000));
  assign _zz_439_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100100));
  assign _zz_440_ = {((decode_INSTRUCTION & (32'b00000000000000000011000000110100)) == (32'b00000000000000000001000000010000)),((decode_INSTRUCTION & (32'b00000010000000000011000001010100)) == (32'b00000000000000000001000000010000))};
  assign _zz_441_ = (32'b00000000000000000001000001111111);
  assign _zz_442_ = (decode_INSTRUCTION & (32'b00000000000000000010000001111111));
  assign _zz_443_ = (32'b00000000000000000010000001110011);
  assign _zz_444_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001111111)) == (32'b00000000000000000100000001100011));
  assign _zz_445_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000010000000010011));
  assign _zz_446_ = {((decode_INSTRUCTION & (32'b00000000000000000110000000111111)) == (32'b00000000000000000000000000100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_447_) == (32'b00000000000000000000000000000011)),{(_zz_448_ == _zz_449_),{_zz_450_,{_zz_451_,_zz_452_}}}}}};
  assign _zz_447_ = (32'b00000000000000000101000001011111);
  assign _zz_448_ = (decode_INSTRUCTION & (32'b00000000000000000111000001111011));
  assign _zz_449_ = (32'b00000000000000000000000001100011);
  assign _zz_450_ = ((decode_INSTRUCTION & (32'b00000000000000000110000001111111)) == (32'b00000000000000000000000000001111));
  assign _zz_451_ = ((decode_INSTRUCTION & (32'b11111100000000000000000001111111)) == (32'b00000000000000000000000000110011));
  assign _zz_452_ = {((decode_INSTRUCTION & (32'b10111100000000000111000001111111)) == (32'b00000000000000000101000000010011)),{((decode_INSTRUCTION & (32'b11111100000000000011000001111111)) == (32'b00000000000000000001000000010011)),{((decode_INSTRUCTION & _zz_453_) == (32'b00000000000000000101000000110011)),{(_zz_454_ == _zz_455_),{_zz_456_,{_zz_457_,_zz_458_}}}}}};
  assign _zz_453_ = (32'b10111110000000000111000001111111);
  assign _zz_454_ = (decode_INSTRUCTION & (32'b10111110000000000111000001111111));
  assign _zz_455_ = (32'b00000000000000000000000000110011);
  assign _zz_456_ = ((decode_INSTRUCTION & (32'b11011111111111111111111111111111)) == (32'b00010000001000000000000001110011));
  assign _zz_457_ = ((decode_INSTRUCTION & (32'b11111111111011111111111111111111)) == (32'b00000000000000000000000001110011));
  assign _zz_458_ = ((decode_INSTRUCTION & (32'b11111111111111111111111111111111)) == (32'b00010000010100000000000001110011));
  always @ (posedge clk) begin
    if(_zz_46_) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_117_) begin
      _zz_177_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_117_) begin
      _zz_178_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  InstructionCache IBusCachedPlugin_cache ( 
    .io_flush(_zz_160_),
    .io_cpu_prefetch_isValid(_zz_161_),
    .io_cpu_prefetch_haltIt(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt),
    .io_cpu_prefetch_pc(IBusCachedPlugin_iBusRsp_stages_0_input_payload),
    .io_cpu_fetch_isValid(_zz_162_),
    .io_cpu_fetch_isStuck(_zz_163_),
    .io_cpu_fetch_isRemoved(IBusCachedPlugin_fetcherflushIt),
    .io_cpu_fetch_pc(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload),
    .io_cpu_fetch_data(IBusCachedPlugin_cache_io_cpu_fetch_data),
    .io_cpu_fetch_dataBypassValid(IBusCachedPlugin_s1_tightlyCoupledHit),
    .io_cpu_fetch_dataBypass(_zz_164_),
    .io_cpu_fetch_mmuBus_cmd_isValid(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid),
    .io_cpu_fetch_mmuBus_cmd_virtualAddress(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress),
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation),
    .io_cpu_fetch_mmuBus_rsp_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress),
    .io_cpu_fetch_mmuBus_rsp_isIoAccess(_zz_165_),
    .io_cpu_fetch_mmuBus_rsp_allowRead(_zz_166_),
    .io_cpu_fetch_mmuBus_rsp_allowWrite(_zz_167_),
    .io_cpu_fetch_mmuBus_rsp_allowExecute(_zz_168_),
    .io_cpu_fetch_mmuBus_rsp_exception(_zz_169_),
    .io_cpu_fetch_mmuBus_rsp_refilling(_zz_170_),
    .io_cpu_fetch_mmuBus_end(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end),
    .io_cpu_fetch_mmuBus_busy(_zz_171_),
    .io_cpu_fetch_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_cpu_fetch_cacheMiss(IBusCachedPlugin_cache_io_cpu_fetch_cacheMiss),
    .io_cpu_fetch_error(IBusCachedPlugin_cache_io_cpu_fetch_error),
    .io_cpu_fetch_mmuRefilling(IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling),
    .io_cpu_fetch_mmuException(IBusCachedPlugin_cache_io_cpu_fetch_mmuException),
    .io_cpu_fetch_isUser(_zz_172_),
    .io_cpu_fetch_haltIt(IBusCachedPlugin_cache_io_cpu_fetch_haltIt),
    .io_cpu_decode_isValid(_zz_173_),
    .io_cpu_decode_isStuck(_zz_174_),
    .io_cpu_decode_pc(_zz_175_),
    .io_cpu_decode_physicalAddress(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_cpu_decode_data(IBusCachedPlugin_cache_io_cpu_decode_data),
    .io_cpu_fill_valid(_zz_176_),
    .io_cpu_fill_payload(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_mem_cmd_valid(IBusCachedPlugin_cache_io_mem_cmd_valid),
    .io_mem_cmd_ready(iBus_cmd_ready),
    .io_mem_cmd_payload_address(IBusCachedPlugin_cache_io_mem_cmd_payload_address),
    .io_mem_cmd_payload_size(IBusCachedPlugin_cache_io_mem_cmd_payload_size),
    .io_mem_rsp_valid(iBus_rsp_valid),
    .io_mem_rsp_payload_data(iBus_rsp_payload_data),
    .io_mem_rsp_payload_error(iBus_rsp_payload_error),
    .clk(clk),
    .reset(reset) 
  );
  always @(*) begin
    case(_zz_292_)
      2'b00 : begin
        _zz_179_ = BranchPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_179_ = CsrPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_179_ = IBusCachedPlugin_redoBranch_payload;
      end
    endcase
  end

  always @(*) begin
    case(_zz_145_)
      2'b00 : begin
        _zz_180_ = DBusSimplePlugin_memoryExceptionPort_payload_code;
        _zz_181_ = DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
      end
      2'b01 : begin
        _zz_180_ = BranchPlugin_branchExceptionPort_payload_code;
        _zz_181_ = BranchPlugin_branchExceptionPort_payload_badAddr;
      end
      default : begin
        _zz_180_ = CsrPlugin_selfException_payload_code;
        _zz_181_ = CsrPlugin_selfException_payload_badAddr;
      end
    endcase
  end

  `ifndef SYNTHESIS
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
    case(_zz_1_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_1__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_1__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_1__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_1__string = "PC ";
      default : _zz_1__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_2__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_2__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_2__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_2__string = "PC ";
      default : _zz_2__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_3__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_3__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_3__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_3__string = "PC ";
      default : _zz_3__string = "???";
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
    case(_zz_4_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_4__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_4__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_4__string = "BITWISE ";
      default : _zz_4__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_5__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_5__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_5__string = "BITWISE ";
      default : _zz_5__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_6__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_6__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_6__string = "BITWISE ";
      default : _zz_6__string = "????????";
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
    case(_zz_7_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_7__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_7__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_7__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_7__string = "SRA_1    ";
      default : _zz_7__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_8__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_8__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_8__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_8__string = "SRA_1    ";
      default : _zz_8__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_9__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_9__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_9__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_9__string = "SRA_1    ";
      default : _zz_9__string = "?????????";
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
    case(_zz_10_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_10__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_10__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_10__string = "AND_1";
      default : _zz_10__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_11__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_11__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_11__string = "AND_1";
      default : _zz_11__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_12__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_12__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_12__string = "AND_1";
      default : _zz_12__string = "?????";
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
    case(_zz_13_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_13__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_13__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_13__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_13__string = "JALR";
      default : _zz_13__string = "????";
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
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : decode_ENV_CTRL_string = "EBREAK";
      default : decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_16__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_16__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_16__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_16__string = "EBREAK";
      default : _zz_16__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_17__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_17__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_17__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_17__string = "EBREAK";
      default : _zz_17__string = "??????";
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
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_19__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_19__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_19__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_19__string = "URS1        ";
      default : _zz_19__string = "????????????";
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
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : execute_ENV_CTRL_string = "EBREAK";
      default : execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_30_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_30__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_30__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_30__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_30__string = "EBREAK";
      default : _zz_30__string = "??????";
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
    case(_zz_32_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_32__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_32__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_32__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_32__string = "JALR";
      default : _zz_32__string = "????";
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
    case(_zz_34_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_34__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_34__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_34__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_34__string = "SRA_1    ";
      default : _zz_34__string = "?????????";
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
    case(_zz_38_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_38__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_38__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_38__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_38__string = "PC ";
      default : _zz_38__string = "???";
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
    case(_zz_40_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_40__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_40__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_40__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_40__string = "URS1        ";
      default : _zz_40__string = "????????????";
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
    case(_zz_43_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_43__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_43__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_43__string = "BITWISE ";
      default : _zz_43__string = "????????";
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
    case(_zz_45_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_45__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_45__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_45__string = "AND_1";
      default : _zz_45__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_50_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_50__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_50__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_50__string = "AND_1";
      default : _zz_50__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_53_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_53__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_53__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_53__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_53__string = "JALR";
      default : _zz_53__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_57_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_57__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_57__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_57__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_57__string = "URS1        ";
      default : _zz_57__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_58_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_58__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_58__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_58__string = "BITWISE ";
      default : _zz_58__string = "????????";
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
    case(_zz_64_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_64__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_64__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_64__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_64__string = "SRA_1    ";
      default : _zz_64__string = "?????????";
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
    case(_zz_110_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_110__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_110__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_110__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_110__string = "EBREAK";
      default : _zz_110__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_111_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_111__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_111__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_111__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_111__string = "SRA_1    ";
      default : _zz_111__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_112_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_112__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_112__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_112__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_112__string = "PC ";
      default : _zz_112__string = "???";
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
      `Src1CtrlEnum_defaultEncoding_RS : _zz_114__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_114__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_114__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_114__string = "URS1        ";
      default : _zz_114__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_115_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_115__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_115__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_115__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_115__string = "JALR";
      default : _zz_115__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_116_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_116__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_116__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_116__string = "AND_1";
      default : _zz_116__string = "?????";
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
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : decode_to_execute_ENV_CTRL_string = "??????";
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
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
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
  always @(*) begin
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
    endcase
  end
  `endif

  assign decode_SRC2_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_78_;
  assign decode_ALU_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign decode_MEMORY_STORE = _zz_54_;
  assign decode_SHIFT_CTRL = _zz_7_;
  assign _zz_8_ = _zz_9_;
  assign decode_ALU_BITWISE_CTRL = _zz_10_;
  assign _zz_11_ = _zz_12_;
  assign decode_IS_RS1_SIGNED = _zz_67_;
  assign decode_IS_RS2_SIGNED = _zz_62_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign decode_BRANCH_CTRL = _zz_13_;
  assign _zz_14_ = _zz_15_;
  assign decode_IS_MUL = _zz_61_;
  assign decode_DO_EBREAK = _zz_22_;
  assign decode_SRC2_FORCE_ZERO = _zz_42_;
  assign decode_MEMORY_ENABLE = _zz_55_;
  assign decode_CSR_READ_OPCODE = _zz_28_;
  assign decode_ENV_CTRL = _zz_16_;
  assign _zz_17_ = _zz_18_;
  assign decode_CSR_WRITE_OPCODE = _zz_29_;
  assign decode_IS_DIV = _zz_52_;
  assign decode_IS_CSR = _zz_65_;
  assign decode_SRC1_CTRL = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign decode_SRC_LESS_UNSIGNED = _zz_51_;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_63_;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign execute_MUL_HH = _zz_24_;
  assign execute_MUL_LOW = _zz_23_;
  assign execute_MUL_HL = _zz_25_;
  assign execute_MUL_LH = _zz_26_;
  assign execute_MUL_LL = _zz_27_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign execute_ENV_CTRL = _zz_30_;
  assign execute_BRANCH_CALC = _zz_31_;
  assign execute_BRANCH_DO = _zz_33_;
  assign execute_RS1 = _zz_48_;
  assign execute_BRANCH_CTRL = _zz_32_;
  assign execute_SHIFT_CTRL = _zz_34_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign execute_SRC2_CTRL = _zz_38_;
  assign execute_SRC1_CTRL = _zz_40_;
  assign decode_SRC_USE_SUB_LESS = _zz_56_;
  assign decode_SRC_ADD_ZERO = _zz_68_;
  assign execute_SRC_ADD_SUB = _zz_37_;
  assign execute_SRC_LESS = _zz_35_;
  assign execute_ALU_CTRL = _zz_43_;
  assign execute_SRC2 = _zz_39_;
  assign execute_SRC1 = _zz_41_;
  assign execute_ALU_BITWISE_CTRL = _zz_45_;
  always @ (*) begin
    _zz_46_ = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_46_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_49_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = _zz_69_;
  assign decode_INSTRUCTION_READY = 1'b1;
  always @ (*) begin
    _zz_70_ = execute_REGFILE_WRITE_DATA;
    if((execute_arbitration_isValid && execute_MEMORY_ENABLE))begin
      _zz_70_ = execute_DBusSimplePlugin_rspFormated;
    end
    if(_zz_182_)begin
      _zz_70_ = _zz_125_;
    end
    if(_zz_183_)begin
      _zz_70_ = execute_CsrPlugin_readData;
    end
    if((execute_arbitration_isValid && execute_IS_MUL))begin
      case(_zz_213_)
        2'b00 : begin
          _zz_70_ = _zz_260_;
        end
        default : begin
          _zz_70_ = _zz_262_;
        end
      endcase
    end
    if(_zz_184_)begin
      _zz_70_ = execute_DivPlugin_div_result;
    end
  end

  assign execute_MEMORY_ADDRESS_LOW = _zz_72_;
  assign execute_MEMORY_READ_DATA = _zz_71_;
  assign execute_REGFILE_WRITE_DATA = _zz_44_;
  assign execute_SRC_ADD = _zz_36_;
  assign execute_RS2 = _zz_47_;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = _zz_73_;
  assign decode_FLUSH_ALL = _zz_60_;
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected = _zz_74_;
    if(_zz_185_)begin
      IBusCachedPlugin_rsp_issueDetected = 1'b1;
    end
  end

  always @ (*) begin
    _zz_74_ = _zz_75_;
    if(_zz_186_)begin
      _zz_74_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_75_ = _zz_76_;
    if(_zz_187_)begin
      _zz_75_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_76_ = 1'b0;
    if(_zz_188_)begin
      _zz_76_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_77_ = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_redoBranch_valid)begin
      _zz_77_ = IBusCachedPlugin_redoBranch_payload;
    end
  end

  assign decode_PC = _zz_80_;
  assign decode_INSTRUCTION = _zz_79_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    case(_zz_156_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      3'b011 : begin
      end
      3'b100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts))begin
      decode_arbitration_haltByOther = decode_arbitration_isValid;
    end
    if(((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)) != (1'b0)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_189_)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusCachedPlugin_redoBranch_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(_zz_189_)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_96_)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_MEMORY_STORE)) && ((! dBus_rsp_ready) || (! _zz_96_))))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_182_)begin
      if(_zz_190_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if(_zz_183_)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_184_)begin
      if(((! execute_DivPlugin_frontendOk) || (! execute_DivPlugin_div_done)))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(_zz_191_)begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(_zz_192_)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(_zz_191_)begin
      if(_zz_193_)begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_192_)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_194_)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_195_)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_191_)begin
      if(_zz_193_)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  assign lastStageInstruction = execute_INSTRUCTION;
  assign lastStagePc = execute_PC;
  assign lastStageIsValid = execute_arbitration_isValid;
  assign lastStageIsFiring = execute_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode} != (2'b00)))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_194_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_195_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_191_)begin
      if(_zz_193_)begin
        IBusCachedPlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_196_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetcherflushIt = 1'b0;
    if(({execute_arbitration_flushNext,decode_arbitration_flushNext} != (2'b00)))begin
      IBusCachedPlugin_fetcherflushIt = 1'b1;
    end
    if(_zz_191_)begin
      if(_zz_193_)begin
        IBusCachedPlugin_fetcherflushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid)begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
    if(IBusCachedPlugin_injector_decodeInput_valid)begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_194_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_195_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(_zz_194_)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
    end
    if(_zz_195_)begin
      case(_zz_197_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode)begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,IBusCachedPlugin_redoBranch_valid}} != (3'b000));
  assign _zz_81_ = {IBusCachedPlugin_redoBranch_valid,{CsrPlugin_jumpInterface_valid,BranchPlugin_jumpInterface_valid}};
  assign _zz_82_ = (_zz_81_ & (~ _zz_214_));
  assign _zz_83_ = _zz_82_[1];
  assign _zz_84_ = _zz_82_[2];
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_179_;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_corrected = 1'b0;
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_corrected = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)begin
      IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_216_);
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_inputSample = 1'b1;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_85_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_85_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_85_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_fetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b1;
    end
    if((IBusCachedPlugin_rsp_issueDetected || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b1;
    end
  end

  assign _zz_86_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready && _zz_86_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && _zz_86_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_87_;
  assign _zz_87_ = ((1'b0 && (! _zz_88_)) || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_88_ = _zz_89_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid = _zz_88_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if(IBusCachedPlugin_injector_decodeInput_valid)begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
    if((! IBusCachedPlugin_pcValids_0))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_iBusRsp_inputBeforeStage_ready = ((1'b0 && (! IBusCachedPlugin_injector_decodeInput_valid)) || IBusCachedPlugin_injector_decodeInput_ready);
  assign IBusCachedPlugin_injector_decodeInput_valid = _zz_90_;
  assign IBusCachedPlugin_injector_decodeInput_payload_pc = _zz_91_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_error = _zz_92_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_inst = _zz_93_;
  assign IBusCachedPlugin_injector_decodeInput_payload_isRvc = _zz_94_;
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @ (*) begin
    decode_arbitration_isValid = (IBusCachedPlugin_injector_decodeInput_valid && (! IBusCachedPlugin_injector_decodeRemoved));
    case(_zz_156_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_80_ = IBusCachedPlugin_injector_decodeInput_payload_pc;
  assign _zz_79_ = IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  assign _zz_78_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_161_ = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_164_ = (32'b00000000000000000000000000000000);
  assign _zz_162_ = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_163_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_172_ = (CsrPlugin_privilege == (2'b00));
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_188_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_186_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_198_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b0;
    end
  end

  always @ (*) begin
    _zz_176_ = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling));
    if(_zz_186_)begin
      _zz_176_ = 1'b1;
    end
    if(_zz_198_)begin
      _zz_176_ = 1'b0;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_187_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_185_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = (4'bxxxx);
    if(_zz_187_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b1100);
    end
    if(_zz_185_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b0001);
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload[31 : 2],(2'b00)};
  assign IBusCachedPlugin_redoBranch_valid = IBusCachedPlugin_rsp_redoFetch;
  assign IBusCachedPlugin_redoBranch_payload = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_inputBeforeStage_valid = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready = IBusCachedPlugin_iBusRsp_inputBeforeStage_ready;
  assign IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_fetch_data;
  assign IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_pc = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  assign _zz_168_ = 1'b1;
  assign _zz_166_ = 1'b1;
  assign _zz_167_ = 1'b1;
  assign _zz_165_ = 1'b0;
  assign _zz_169_ = 1'b0;
  assign _zz_170_ = 1'b0;
  assign _zz_171_ = 1'b0;
  assign _zz_160_ = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign _zz_73_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_96_));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_97_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_97_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_97_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_97_;
  assign _zz_72_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_98_ = (4'b0001);
      end
      2'b01 : begin
        _zz_98_ = (4'b0011);
      end
      default : begin
        _zz_98_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_98_ <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign _zz_71_ = dBus_rsp_data;
  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if((! ((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (1'b0 || (! execute_arbitration_isStuckByOthers)))))begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = (4'bxxxx);
    if(execute_ALIGNEMENT_FAULT)begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_217_};
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

  assign _zz_99_ = (execute_DBusSimplePlugin_rspShifted[7] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_100_[31] = _zz_99_;
    _zz_100_[30] = _zz_99_;
    _zz_100_[29] = _zz_99_;
    _zz_100_[28] = _zz_99_;
    _zz_100_[27] = _zz_99_;
    _zz_100_[26] = _zz_99_;
    _zz_100_[25] = _zz_99_;
    _zz_100_[24] = _zz_99_;
    _zz_100_[23] = _zz_99_;
    _zz_100_[22] = _zz_99_;
    _zz_100_[21] = _zz_99_;
    _zz_100_[20] = _zz_99_;
    _zz_100_[19] = _zz_99_;
    _zz_100_[18] = _zz_99_;
    _zz_100_[17] = _zz_99_;
    _zz_100_[16] = _zz_99_;
    _zz_100_[15] = _zz_99_;
    _zz_100_[14] = _zz_99_;
    _zz_100_[13] = _zz_99_;
    _zz_100_[12] = _zz_99_;
    _zz_100_[11] = _zz_99_;
    _zz_100_[10] = _zz_99_;
    _zz_100_[9] = _zz_99_;
    _zz_100_[8] = _zz_99_;
    _zz_100_[7 : 0] = execute_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_101_ = (execute_DBusSimplePlugin_rspShifted[15] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_102_[31] = _zz_101_;
    _zz_102_[30] = _zz_101_;
    _zz_102_[29] = _zz_101_;
    _zz_102_[28] = _zz_101_;
    _zz_102_[27] = _zz_101_;
    _zz_102_[26] = _zz_101_;
    _zz_102_[25] = _zz_101_;
    _zz_102_[24] = _zz_101_;
    _zz_102_[23] = _zz_101_;
    _zz_102_[22] = _zz_101_;
    _zz_102_[21] = _zz_101_;
    _zz_102_[20] = _zz_101_;
    _zz_102_[19] = _zz_101_;
    _zz_102_[18] = _zz_101_;
    _zz_102_[17] = _zz_101_;
    _zz_102_[16] = _zz_101_;
    _zz_102_[15 : 0] = execute_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_211_)
      2'b00 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_100_;
      end
      2'b01 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_102_;
      end
      default : begin
        execute_DBusSimplePlugin_rspFormated = execute_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_104_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_105_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign _zz_106_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000110000)) == (32'b00000000000000000000000000010000));
  assign _zz_107_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_108_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_109_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_103_ = {({_zz_109_,{_zz_293_,{_zz_294_,_zz_295_}}} != (6'b000000)),{((_zz_296_ == _zz_297_) != (1'b0)),{(_zz_298_ != (1'b0)),{(_zz_299_ != _zz_300_),{_zz_301_,{_zz_302_,_zz_303_}}}}}};
  assign _zz_69_ = ({((decode_INSTRUCTION & (32'b00000000000000000000000001011111)) == (32'b00000000000000000000000000010111)),{((decode_INSTRUCTION & (32'b00000000000000000000000001111111)) == (32'b00000000000000000000000001101111)),{((decode_INSTRUCTION & (32'b00000000000000000001000001101111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_441_) == (32'b00000000000000000001000001110011)),{(_zz_442_ == _zz_443_),{_zz_444_,{_zz_445_,_zz_446_}}}}}}} != (20'b00000000000000000000));
  assign _zz_68_ = _zz_218_[0];
  assign _zz_67_ = _zz_219_[0];
  assign _zz_110_ = _zz_103_[3 : 2];
  assign _zz_66_ = _zz_110_;
  assign _zz_65_ = _zz_220_[0];
  assign _zz_111_ = _zz_103_[8 : 7];
  assign _zz_64_ = _zz_111_;
  assign _zz_63_ = _zz_221_[0];
  assign _zz_62_ = _zz_222_[0];
  assign _zz_61_ = _zz_223_[0];
  assign _zz_60_ = _zz_224_[0];
  assign _zz_112_ = _zz_103_[17 : 16];
  assign _zz_59_ = _zz_112_;
  assign _zz_113_ = _zz_103_[19 : 18];
  assign _zz_58_ = _zz_113_;
  assign _zz_114_ = _zz_103_[21 : 20];
  assign _zz_57_ = _zz_114_;
  assign _zz_56_ = _zz_225_[0];
  assign _zz_55_ = _zz_226_[0];
  assign _zz_54_ = _zz_227_[0];
  assign _zz_115_ = _zz_103_[26 : 25];
  assign _zz_53_ = _zz_115_;
  assign _zz_52_ = _zz_228_[0];
  assign _zz_51_ = _zz_229_[0];
  assign _zz_116_ = _zz_103_[30 : 29];
  assign _zz_50_ = _zz_116_;
  assign _zz_49_ = _zz_230_[0];
  assign decodeExceptionPort_valid = ((decode_arbitration_isValid && decode_INSTRUCTION_READY) && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = (4'b0010);
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign execute_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign _zz_117_ = (! execute_arbitration_isStuck);
  assign execute_RegFilePlugin_rs1Data = _zz_177_;
  assign execute_RegFilePlugin_rs2Data = _zz_178_;
  assign _zz_48_ = execute_RegFilePlugin_rs1Data;
  assign _zz_47_ = execute_RegFilePlugin_rs2Data;
  assign lastStageRegFileWrite_valid = (execute_REGFILE_WRITE_VALID && execute_arbitration_isFiring);
  assign lastStageRegFileWrite_payload_address = execute_INSTRUCTION[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_70_;
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
        _zz_118_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_118_ = {31'd0, _zz_231_};
      end
      default : begin
        _zz_118_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_44_ = _zz_118_;
  assign _zz_42_ = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_119_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_119_ = {29'd0, _zz_232_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_119_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_119_ = {27'd0, _zz_233_};
      end
    endcase
  end

  assign _zz_41_ = _zz_119_;
  assign _zz_120_ = _zz_234_[11];
  always @ (*) begin
    _zz_121_[19] = _zz_120_;
    _zz_121_[18] = _zz_120_;
    _zz_121_[17] = _zz_120_;
    _zz_121_[16] = _zz_120_;
    _zz_121_[15] = _zz_120_;
    _zz_121_[14] = _zz_120_;
    _zz_121_[13] = _zz_120_;
    _zz_121_[12] = _zz_120_;
    _zz_121_[11] = _zz_120_;
    _zz_121_[10] = _zz_120_;
    _zz_121_[9] = _zz_120_;
    _zz_121_[8] = _zz_120_;
    _zz_121_[7] = _zz_120_;
    _zz_121_[6] = _zz_120_;
    _zz_121_[5] = _zz_120_;
    _zz_121_[4] = _zz_120_;
    _zz_121_[3] = _zz_120_;
    _zz_121_[2] = _zz_120_;
    _zz_121_[1] = _zz_120_;
    _zz_121_[0] = _zz_120_;
  end

  assign _zz_122_ = _zz_235_[11];
  always @ (*) begin
    _zz_123_[19] = _zz_122_;
    _zz_123_[18] = _zz_122_;
    _zz_123_[17] = _zz_122_;
    _zz_123_[16] = _zz_122_;
    _zz_123_[15] = _zz_122_;
    _zz_123_[14] = _zz_122_;
    _zz_123_[13] = _zz_122_;
    _zz_123_[12] = _zz_122_;
    _zz_123_[11] = _zz_122_;
    _zz_123_[10] = _zz_122_;
    _zz_123_[9] = _zz_122_;
    _zz_123_[8] = _zz_122_;
    _zz_123_[7] = _zz_122_;
    _zz_123_[6] = _zz_122_;
    _zz_123_[5] = _zz_122_;
    _zz_123_[4] = _zz_122_;
    _zz_123_[3] = _zz_122_;
    _zz_123_[2] = _zz_122_;
    _zz_123_[1] = _zz_122_;
    _zz_123_[0] = _zz_122_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_124_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_124_ = {_zz_121_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_124_ = {_zz_123_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_124_ = execute_PC;
      end
    endcase
  end

  assign _zz_39_ = _zz_124_;
  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_236_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_37_ = execute_SrcPlugin_addSub;
  assign _zz_36_ = execute_SrcPlugin_addSub;
  assign _zz_35_ = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_shiftReg : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_125_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_125_ = _zz_243_;
      end
    endcase
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_126_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_126_ == (3'b000))) begin
        _zz_127_ = execute_BranchPlugin_eq;
    end else if((_zz_126_ == (3'b001))) begin
        _zz_127_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_126_ & (3'b101)) == (3'b101)))) begin
        _zz_127_ = (! execute_SRC_LESS);
    end else begin
        _zz_127_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_128_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_128_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_128_ = 1'b1;
      end
      default : begin
        _zz_128_ = _zz_127_;
      end
    endcase
  end

  assign _zz_33_ = _zz_128_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_129_ = _zz_245_[19];
  always @ (*) begin
    _zz_130_[10] = _zz_129_;
    _zz_130_[9] = _zz_129_;
    _zz_130_[8] = _zz_129_;
    _zz_130_[7] = _zz_129_;
    _zz_130_[6] = _zz_129_;
    _zz_130_[5] = _zz_129_;
    _zz_130_[4] = _zz_129_;
    _zz_130_[3] = _zz_129_;
    _zz_130_[2] = _zz_129_;
    _zz_130_[1] = _zz_129_;
    _zz_130_[0] = _zz_129_;
  end

  assign _zz_131_ = _zz_246_[11];
  always @ (*) begin
    _zz_132_[19] = _zz_131_;
    _zz_132_[18] = _zz_131_;
    _zz_132_[17] = _zz_131_;
    _zz_132_[16] = _zz_131_;
    _zz_132_[15] = _zz_131_;
    _zz_132_[14] = _zz_131_;
    _zz_132_[13] = _zz_131_;
    _zz_132_[12] = _zz_131_;
    _zz_132_[11] = _zz_131_;
    _zz_132_[10] = _zz_131_;
    _zz_132_[9] = _zz_131_;
    _zz_132_[8] = _zz_131_;
    _zz_132_[7] = _zz_131_;
    _zz_132_[6] = _zz_131_;
    _zz_132_[5] = _zz_131_;
    _zz_132_[4] = _zz_131_;
    _zz_132_[3] = _zz_131_;
    _zz_132_[2] = _zz_131_;
    _zz_132_[1] = _zz_131_;
    _zz_132_[0] = _zz_131_;
  end

  assign _zz_133_ = _zz_247_[11];
  always @ (*) begin
    _zz_134_[18] = _zz_133_;
    _zz_134_[17] = _zz_133_;
    _zz_134_[16] = _zz_133_;
    _zz_134_[15] = _zz_133_;
    _zz_134_[14] = _zz_133_;
    _zz_134_[13] = _zz_133_;
    _zz_134_[12] = _zz_133_;
    _zz_134_[11] = _zz_133_;
    _zz_134_[10] = _zz_133_;
    _zz_134_[9] = _zz_133_;
    _zz_134_[8] = _zz_133_;
    _zz_134_[7] = _zz_133_;
    _zz_134_[6] = _zz_133_;
    _zz_134_[5] = _zz_133_;
    _zz_134_[4] = _zz_133_;
    _zz_134_[3] = _zz_133_;
    _zz_134_[2] = _zz_133_;
    _zz_134_[1] = _zz_133_;
    _zz_134_[0] = _zz_133_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_135_ = {{_zz_130_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_135_ = {_zz_132_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_135_ = {{_zz_134_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_135_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_31_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign BranchPlugin_jumpInterface_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = execute_BRANCH_CALC;
  always @ (*) begin
    BranchPlugin_branchExceptionPort_valid = ((execute_arbitration_isValid && execute_BRANCH_DO) && BranchPlugin_jumpInterface_payload[1]);
    if(1'b0)begin
      BranchPlugin_branchExceptionPort_valid = 1'b0;
    end
  end

  assign BranchPlugin_branchExceptionPort_payload_code = (4'b0000);
  assign BranchPlugin_branchExceptionPort_payload_badAddr = BranchPlugin_jumpInterface_payload;
  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign _zz_136_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_137_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_138_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b11);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_139_ = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_140_ = _zz_248_[0];
  assign _zz_141_ = {CsrPlugin_selfException_valid,{BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid}};
  assign _zz_142_ = (_zz_141_ & (~ _zz_250_));
  assign _zz_143_ = _zz_142_[1];
  assign _zz_144_ = _zz_142_[2];
  assign _zz_145_ = {_zz_144_,_zz_143_};
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_189_)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(_zz_192_)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! (execute_arbitration_isValid != (1'b0))) && IBusCachedPlugin_pcValids_1);
    if((CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute != (1'b0)))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = (30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign _zz_29_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_28_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_inWfi = 1'b0;
  assign execute_CsrPlugin_blockedBySideEffects = 1'b0;
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001100000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001101000001 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b101100000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b101110000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001100000101 : begin
        if(execute_CSR_WRITE_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b101100000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000011 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b111111000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
      12'b101110000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
      end
      12'b001101000010 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
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
    if(_zz_199_)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(_zz_200_)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = (4'bxxxx);
    if(_zz_199_)begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = (4'b1000);
        end
        default : begin
          CsrPlugin_selfException_payload_code = (4'b1011);
        end
      endcase
    end
    if(_zz_200_)begin
      CsrPlugin_selfException_payload_code = (4'b0011);
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  always @ (*) begin
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_readData[31 : 0] = _zz_153_;
      end
      12'b001100000000 : begin
        execute_CsrPlugin_readData[12 : 11] = CsrPlugin_mstatus_MPP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mstatus_MPIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mstatus_MIE;
      end
      12'b001101000001 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mepc;
      end
      12'b101100000000 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[31 : 0];
      end
      12'b101110000000 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mcycle[63 : 32];
      end
      12'b001101000100 : begin
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mip_MEIP;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mip_MTIP;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mip_MSIP;
      end
      12'b001100000101 : begin
      end
      12'b101100000010 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_minstret[31 : 0];
      end
      12'b001101000011 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mtval;
      end
      12'b111111000000 : begin
        execute_CsrPlugin_readData[31 : 0] = _zz_154_;
      end
      12'b001101000000 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_mscratch;
      end
      12'b001100000100 : begin
        execute_CsrPlugin_readData[11 : 11] = CsrPlugin_mie_MEIE;
        execute_CsrPlugin_readData[7 : 7] = CsrPlugin_mie_MTIE;
        execute_CsrPlugin_readData[3 : 3] = CsrPlugin_mie_MSIE;
      end
      12'b101110000010 : begin
        execute_CsrPlugin_readData[31 : 0] = CsrPlugin_minstret[63 : 32];
      end
      12'b001101000010 : begin
        execute_CsrPlugin_readData[31 : 31] = CsrPlugin_mcause_interrupt;
        execute_CsrPlugin_readData[3 : 0] = CsrPlugin_mcause_exceptionCode;
      end
      default : begin
      end
    endcase
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_212_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign execute_MulPlugin_a = execute_SRC1;
  assign execute_MulPlugin_b = execute_SRC2;
  always @ (*) begin
    case(_zz_201_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_201_)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign _zz_27_ = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_26_ = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign _zz_25_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign _zz_24_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign _zz_23_ = ($signed(_zz_251_) + $signed(_zz_259_));
  always @ (*) begin
    execute_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_184_)begin
      if(_zz_202_)begin
        execute_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_203_)begin
      execute_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign execute_DivPlugin_div_counter_willOverflowIfInc = (execute_DivPlugin_div_counter_value == (6'b100001));
  assign execute_DivPlugin_div_counter_willOverflow = (execute_DivPlugin_div_counter_willOverflowIfInc && execute_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(execute_DivPlugin_div_counter_willOverflow)begin
      execute_DivPlugin_div_counter_valueNext = (6'b000000);
    end else begin
      execute_DivPlugin_div_counter_valueNext = (execute_DivPlugin_div_counter_value + _zz_266_);
    end
    if(execute_DivPlugin_div_counter_willClear)begin
      execute_DivPlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_146_ = execute_DivPlugin_rs1[31 : 0];
  assign _zz_147_ = {execute_DivPlugin_accumulator[31 : 0],_zz_146_[31]};
  assign _zz_148_ = (_zz_147_ - _zz_267_);
  assign _zz_149_ = (execute_INSTRUCTION[13] ? execute_DivPlugin_accumulator[31 : 0] : execute_DivPlugin_rs1[31 : 0]);
  assign _zz_150_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_151_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_152_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_152_[31 : 0] = execute_RS1;
  end

  assign _zz_154_ = (_zz_153_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_154_ != (32'b00000000000000000000000000000000));
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_204_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            debug_bus_cmd_ready = IBusCachedPlugin_injectionPort_ready;
          end
        end
        6'b010000 : begin
        end
        6'b010001 : begin
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

  always @ (*) begin
    IBusCachedPlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_204_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusCachedPlugin_injectionPort_valid = 1'b1;
          end
        end
        6'b010000 : begin
        end
        6'b010001 : begin
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusCachedPlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign _zz_22_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || ((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_282_))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_283_)))));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_21_ = decode_SRC1_CTRL;
  assign _zz_19_ = _zz_57_;
  assign _zz_40_ = decode_to_execute_SRC1_CTRL;
  assign _zz_18_ = decode_ENV_CTRL;
  assign _zz_16_ = _zz_66_;
  assign _zz_30_ = decode_to_execute_ENV_CTRL;
  assign _zz_15_ = decode_BRANCH_CTRL;
  assign _zz_13_ = _zz_53_;
  assign _zz_32_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_12_ = decode_ALU_BITWISE_CTRL;
  assign _zz_10_ = _zz_50_;
  assign _zz_45_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_9_ = decode_SHIFT_CTRL;
  assign _zz_7_ = _zz_64_;
  assign _zz_34_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_6_ = decode_ALU_CTRL;
  assign _zz_4_ = _zz_58_;
  assign _zz_43_ = decode_to_execute_ALU_CTRL;
  assign _zz_3_ = decode_SRC2_CTRL;
  assign _zz_1_ = _zz_59_;
  assign _zz_38_ = decode_to_execute_SRC2_CTRL;
  assign decode_arbitration_isFlushed = ((execute_arbitration_flushNext != (1'b0)) || ({execute_arbitration_flushIt,decode_arbitration_flushIt} != (2'b00)));
  assign execute_arbitration_isFlushed = (1'b0 || (execute_arbitration_flushIt != (1'b0)));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (1'b0 || execute_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || 1'b0);
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  always @ (*) begin
    IBusCachedPlugin_injectionPort_ready = 1'b0;
    case(_zz_156_)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
      end
      3'b011 : begin
      end
      3'b100 : begin
        IBusCachedPlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign iBusWishbone_ADR = {_zz_290_,_zz_157_};
  assign iBusWishbone_CTI = ((_zz_157_ == (3'b111)) ? (3'b111) : (3'b010));
  assign iBusWishbone_BTE = (2'b00);
  assign iBusWishbone_SEL = (4'b1111);
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    if(_zz_205_)begin
      iBusWishbone_CYC = 1'b1;
    end
  end

  always @ (*) begin
    iBusWishbone_STB = 1'b0;
    if(_zz_205_)begin
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_158_;
  assign iBus_rsp_payload_data = iBusWishbone_DAT_MISO_regNext;
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
        _zz_159_ = (4'b0001);
      end
      2'b01 : begin
        _zz_159_ = (4'b0011);
      end
      default : begin
        _zz_159_ = (4'b1111);
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = _zz_291_[3:0];
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
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_89_ <= 1'b0;
      _zz_90_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_95_;
      IBusCachedPlugin_rspCounter <= (32'b00000000000000000000000000000000);
      _zz_96_ <= 1'b0;
      execute_LightShifterPlugin_isActive <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_DivPlugin_frontendOk <= 1'b0;
      execute_DivPlugin_div_counter_value <= (6'b000000);
      _zz_153_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      _zz_156_ <= (3'b000);
      _zz_157_ <= (3'b000);
      _zz_158_ <= 1'b0;
      dBus_cmd_halfPipe_regs_valid <= 1'b0;
      dBus_cmd_halfPipe_regs_ready <= 1'b1;
    end else begin
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if((IBusCachedPlugin_fetchPc_corrected || IBusCachedPlugin_fetchPc_pcRegPropagate))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetcherflushIt) || IBusCachedPlugin_fetchPc_pcRegPropagate)))begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        _zz_89_ <= 1'b0;
      end
      if(_zz_87_)begin
        _zz_89_ <= IBusCachedPlugin_iBusRsp_stages_0_output_valid;
      end
      if(IBusCachedPlugin_iBusRsp_inputBeforeStage_ready)begin
        _zz_90_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_valid;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        _zz_90_ <= 1'b0;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_injector_decodeInput_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b1;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + (32'b00000000000000000000000000000001));
      end
      if((dBus_cmd_valid && dBus_cmd_ready))begin
        _zz_96_ <= 1'b1;
      end
      if((! execute_arbitration_isStuck))begin
        _zz_96_ <= 1'b0;
      end
      if(_zz_182_)begin
        if(_zz_190_)begin
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
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_206_)begin
        if(_zz_207_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_208_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_209_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_194_)begin
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
      if(_zz_195_)begin
        case(_zz_197_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ({_zz_138_,{_zz_137_,_zz_136_}} != (3'b000));
      if(((execute_arbitration_isValid && (! 1'b0)) && (execute_IS_DIV || 1'b0)))begin
        execute_DivPlugin_frontendOk <= 1'b1;
      end
      if(execute_arbitration_isMoving)begin
        execute_DivPlugin_frontendOk <= 1'b0;
      end
      execute_DivPlugin_div_counter_value <= execute_DivPlugin_div_counter_valueNext;
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      case(_zz_156_)
        3'b000 : begin
          if(IBusCachedPlugin_injectionPort_valid)begin
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
            CsrPlugin_mstatus_MPIE <= _zz_284_[0];
            CsrPlugin_mstatus_MIE <= _zz_285_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b101100000000 : begin
        end
        12'b101110000000 : begin
        end
        12'b001101000100 : begin
        end
        12'b001100000101 : begin
        end
        12'b101100000010 : begin
        end
        12'b001101000011 : begin
        end
        12'b111111000000 : begin
        end
        12'b001101000000 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_287_[0];
            CsrPlugin_mie_MTIE <= _zz_288_[0];
            CsrPlugin_mie_MSIE <= _zz_289_[0];
          end
        end
        12'b101110000010 : begin
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(_zz_205_)begin
        if(iBusWishbone_ACK)begin
          _zz_157_ <= (_zz_157_ + (3'b001));
        end
      end
      _zz_158_ <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if(_zz_210_)begin
        dBus_cmd_halfPipe_regs_valid <= dBus_cmd_valid;
        dBus_cmd_halfPipe_regs_ready <= (! dBus_cmd_valid);
      end else begin
        dBus_cmd_halfPipe_regs_valid <= (! dBus_cmd_halfPipe_ready);
        dBus_cmd_halfPipe_regs_ready <= dBus_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_inputBeforeStage_ready)begin
      _zz_91_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_pc;
      _zz_92_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_error;
      _zz_93_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_inst;
      _zz_94_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_isRvc;
    end
    if(IBusCachedPlugin_injector_decodeInput_ready)begin
      IBusCachedPlugin_injector_formal_rawInDecode <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_inst;
    end
    if(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if((! execute_arbitration_isStuckByOthers))begin
      execute_LightShifterPlugin_shiftReg <= _zz_70_;
    end
    if(_zz_182_)begin
      if(_zz_190_)begin
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
    if(_zz_189_)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_140_ ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_140_ ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(_zz_192_)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= _zz_180_;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= _zz_181_;
    end
    if(_zz_206_)begin
      if(_zz_207_)begin
        CsrPlugin_interrupt_code <= (4'b0111);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_208_)begin
        CsrPlugin_interrupt_code <= (4'b0011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_209_)begin
        CsrPlugin_interrupt_code <= (4'b1011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    if(_zz_194_)begin
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
    if((execute_DivPlugin_div_counter_value == (6'b100000)))begin
      execute_DivPlugin_div_done <= 1'b1;
    end
    if((! execute_arbitration_isStuck))begin
      execute_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_184_)begin
      if(_zz_202_)begin
        execute_DivPlugin_rs1[31 : 0] <= _zz_268_[31:0];
        execute_DivPlugin_accumulator[31 : 0] <= ((! _zz_148_[32]) ? _zz_269_ : _zz_270_);
        if((execute_DivPlugin_div_counter_value == (6'b100000)))begin
          execute_DivPlugin_div_result <= _zz_271_[31:0];
        end
      end
    end
    if(_zz_203_)begin
      execute_DivPlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      execute_DivPlugin_rs1 <= ((_zz_151_ ? (~ _zz_152_) : _zz_152_) + _zz_277_);
      execute_DivPlugin_rs2 <= ((_zz_150_ ? (~ execute_RS2) : execute_RS2) + _zz_279_);
      execute_DivPlugin_div_needRevert <= ((_zz_151_ ^ (_zz_150_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_20_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if(((! execute_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_execute)))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_17_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_14_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_11_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_8_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_77_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_2_;
    end
    if((_zz_156_ != (3'b000)))begin
      _zz_93_ <= IBusCachedPlugin_injectionPort_payload;
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
      12'b101100000000 : begin
      end
      12'b101110000000 : begin
      end
      12'b001101000100 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mip_MSIP <= _zz_286_[0];
        end
      end
      12'b001100000101 : begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
          CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
        end
      end
      12'b101100000010 : begin
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
      12'b101110000010 : begin
      end
      12'b001101000010 : begin
      end
      default : begin
      end
    endcase
    iBusWishbone_DAT_MISO_regNext <= iBusWishbone_DAT_MISO;
    if(_zz_210_)begin
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
    DebugPlugin_isPipBusy <= (({execute_arbitration_isValid,decode_arbitration_isValid} != (2'b00)) || IBusCachedPlugin_incomingInstruction);
    if(execute_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_70_;
    end
    _zz_155_ <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid)begin
      case(_zz_204_)
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
        default : begin
        end
      endcase
    end
    if(_zz_191_)begin
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
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_204_)
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
              DebugPlugin_hardwareBreakpoints_0_valid <= _zz_280_[0];
            end
          end
          6'b010001 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_1_valid <= _zz_281_[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_191_)begin
        if(_zz_193_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_196_)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end

endmodule

