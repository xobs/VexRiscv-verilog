// Generator : SpinalHDL v1.3.6    git head : 9bf01e7f360e003fac1dd5ca8b8f4bffec0e52b8
// Date      : 01/01/2020, 23:00:44
// Component : VexRiscv


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

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
      input   reset);
  wire  _zz_155_;
  wire  _zz_156_;
  wire  _zz_157_;
  wire  _zz_158_;
  wire [31:0] _zz_159_;
  wire  _zz_160_;
  wire  _zz_161_;
  wire  _zz_162_;
  wire  _zz_163_;
  wire  _zz_164_;
  wire  _zz_165_;
  wire  _zz_166_;
  wire  _zz_167_;
  wire  _zz_168_;
  wire  _zz_169_;
  wire [31:0] _zz_170_;
  reg  _zz_171_;
  reg [31:0] _zz_172_;
  reg [31:0] _zz_173_;
  reg [31:0] _zz_174_;
  reg [3:0] _zz_175_;
  reg [31:0] _zz_176_;
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
  wire  _zz_177_;
  wire  _zz_178_;
  wire  _zz_179_;
  wire  _zz_180_;
  wire  _zz_181_;
  wire  _zz_182_;
  wire  _zz_183_;
  wire  _zz_184_;
  wire  _zz_185_;
  wire  _zz_186_;
  wire  _zz_187_;
  wire  _zz_188_;
  wire [1:0] _zz_189_;
  wire  _zz_190_;
  wire  _zz_191_;
  wire  _zz_192_;
  wire [1:0] _zz_193_;
  wire  _zz_194_;
  wire  _zz_195_;
  wire  _zz_196_;
  wire  _zz_197_;
  wire  _zz_198_;
  wire  _zz_199_;
  wire  _zz_200_;
  wire  _zz_201_;
  wire [1:0] _zz_202_;
  wire  _zz_203_;
  wire [1:0] _zz_204_;
  wire [2:0] _zz_205_;
  wire [2:0] _zz_206_;
  wire [31:0] _zz_207_;
  wire [2:0] _zz_208_;
  wire [0:0] _zz_209_;
  wire [0:0] _zz_210_;
  wire [0:0] _zz_211_;
  wire [0:0] _zz_212_;
  wire [0:0] _zz_213_;
  wire [0:0] _zz_214_;
  wire [0:0] _zz_215_;
  wire [0:0] _zz_216_;
  wire [0:0] _zz_217_;
  wire [0:0] _zz_218_;
  wire [0:0] _zz_219_;
  wire [0:0] _zz_220_;
  wire [0:0] _zz_221_;
  wire [2:0] _zz_222_;
  wire [4:0] _zz_223_;
  wire [11:0] _zz_224_;
  wire [11:0] _zz_225_;
  wire [31:0] _zz_226_;
  wire [31:0] _zz_227_;
  wire [31:0] _zz_228_;
  wire [31:0] _zz_229_;
  wire [31:0] _zz_230_;
  wire [31:0] _zz_231_;
  wire [31:0] _zz_232_;
  wire [31:0] _zz_233_;
  wire [32:0] _zz_234_;
  wire [19:0] _zz_235_;
  wire [11:0] _zz_236_;
  wire [11:0] _zz_237_;
  wire [1:0] _zz_238_;
  wire [1:0] _zz_239_;
  wire [2:0] _zz_240_;
  wire [51:0] _zz_241_;
  wire [51:0] _zz_242_;
  wire [51:0] _zz_243_;
  wire [32:0] _zz_244_;
  wire [51:0] _zz_245_;
  wire [49:0] _zz_246_;
  wire [51:0] _zz_247_;
  wire [49:0] _zz_248_;
  wire [51:0] _zz_249_;
  wire [31:0] _zz_250_;
  wire [65:0] _zz_251_;
  wire [31:0] _zz_252_;
  wire [65:0] _zz_253_;
  wire [65:0] _zz_254_;
  wire [0:0] _zz_255_;
  wire [5:0] _zz_256_;
  wire [32:0] _zz_257_;
  wire [32:0] _zz_258_;
  wire [31:0] _zz_259_;
  wire [31:0] _zz_260_;
  wire [32:0] _zz_261_;
  wire [32:0] _zz_262_;
  wire [32:0] _zz_263_;
  wire [0:0] _zz_264_;
  wire [32:0] _zz_265_;
  wire [0:0] _zz_266_;
  wire [32:0] _zz_267_;
  wire [0:0] _zz_268_;
  wire [31:0] _zz_269_;
  wire [0:0] _zz_270_;
  wire [0:0] _zz_271_;
  wire [0:0] _zz_272_;
  wire [0:0] _zz_273_;
  wire [0:0] _zz_274_;
  wire [0:0] _zz_275_;
  wire [26:0] _zz_276_;
  wire [6:0] _zz_277_;
  wire [1:0] _zz_278_;
  wire [31:0] _zz_279_;
  wire [31:0] _zz_280_;
  wire  _zz_281_;
  wire [0:0] _zz_282_;
  wire [0:0] _zz_283_;
  wire  _zz_284_;
  wire  _zz_285_;
  wire [0:0] _zz_286_;
  wire [3:0] _zz_287_;
  wire [2:0] _zz_288_;
  wire [2:0] _zz_289_;
  wire  _zz_290_;
  wire [0:0] _zz_291_;
  wire [24:0] _zz_292_;
  wire [31:0] _zz_293_;
  wire [31:0] _zz_294_;
  wire [31:0] _zz_295_;
  wire [31:0] _zz_296_;
  wire [31:0] _zz_297_;
  wire [31:0] _zz_298_;
  wire [31:0] _zz_299_;
  wire [31:0] _zz_300_;
  wire [31:0] _zz_301_;
  wire [0:0] _zz_302_;
  wire [1:0] _zz_303_;
  wire  _zz_304_;
  wire [0:0] _zz_305_;
  wire [0:0] _zz_306_;
  wire [0:0] _zz_307_;
  wire [0:0] _zz_308_;
  wire [0:0] _zz_309_;
  wire [0:0] _zz_310_;
  wire  _zz_311_;
  wire [0:0] _zz_312_;
  wire [22:0] _zz_313_;
  wire [31:0] _zz_314_;
  wire [31:0] _zz_315_;
  wire  _zz_316_;
  wire [31:0] _zz_317_;
  wire [31:0] _zz_318_;
  wire [31:0] _zz_319_;
  wire [31:0] _zz_320_;
  wire [31:0] _zz_321_;
  wire [31:0] _zz_322_;
  wire [31:0] _zz_323_;
  wire [31:0] _zz_324_;
  wire [31:0] _zz_325_;
  wire [0:0] _zz_326_;
  wire [0:0] _zz_327_;
  wire [1:0] _zz_328_;
  wire [1:0] _zz_329_;
  wire  _zz_330_;
  wire [0:0] _zz_331_;
  wire [20:0] _zz_332_;
  wire [31:0] _zz_333_;
  wire [31:0] _zz_334_;
  wire [31:0] _zz_335_;
  wire [31:0] _zz_336_;
  wire [31:0] _zz_337_;
  wire [0:0] _zz_338_;
  wire [0:0] _zz_339_;
  wire [0:0] _zz_340_;
  wire [0:0] _zz_341_;
  wire  _zz_342_;
  wire [0:0] _zz_343_;
  wire [17:0] _zz_344_;
  wire [31:0] _zz_345_;
  wire [31:0] _zz_346_;
  wire [31:0] _zz_347_;
  wire  _zz_348_;
  wire [0:0] _zz_349_;
  wire [0:0] _zz_350_;
  wire [0:0] _zz_351_;
  wire [0:0] _zz_352_;
  wire  _zz_353_;
  wire [0:0] _zz_354_;
  wire [14:0] _zz_355_;
  wire [31:0] _zz_356_;
  wire  _zz_357_;
  wire  _zz_358_;
  wire [2:0] _zz_359_;
  wire [2:0] _zz_360_;
  wire  _zz_361_;
  wire [0:0] _zz_362_;
  wire [10:0] _zz_363_;
  wire [31:0] _zz_364_;
  wire [31:0] _zz_365_;
  wire  _zz_366_;
  wire  _zz_367_;
  wire [31:0] _zz_368_;
  wire [31:0] _zz_369_;
  wire [0:0] _zz_370_;
  wire [0:0] _zz_371_;
  wire [3:0] _zz_372_;
  wire [3:0] _zz_373_;
  wire  _zz_374_;
  wire [0:0] _zz_375_;
  wire [7:0] _zz_376_;
  wire [31:0] _zz_377_;
  wire [31:0] _zz_378_;
  wire [0:0] _zz_379_;
  wire [0:0] _zz_380_;
  wire  _zz_381_;
  wire  _zz_382_;
  wire [0:0] _zz_383_;
  wire [1:0] _zz_384_;
  wire [0:0] _zz_385_;
  wire [0:0] _zz_386_;
  wire  _zz_387_;
  wire [0:0] _zz_388_;
  wire [4:0] _zz_389_;
  wire [31:0] _zz_390_;
  wire [31:0] _zz_391_;
  wire [31:0] _zz_392_;
  wire [31:0] _zz_393_;
  wire [31:0] _zz_394_;
  wire [31:0] _zz_395_;
  wire [31:0] _zz_396_;
  wire [31:0] _zz_397_;
  wire  _zz_398_;
  wire  _zz_399_;
  wire [31:0] _zz_400_;
  wire [31:0] _zz_401_;
  wire  _zz_402_;
  wire [0:0] _zz_403_;
  wire [0:0] _zz_404_;
  wire  _zz_405_;
  wire [0:0] _zz_406_;
  wire [2:0] _zz_407_;
  wire [31:0] _zz_408_;
  wire  _zz_409_;
  wire  _zz_410_;
  wire  _zz_411_;
  wire [0:0] _zz_412_;
  wire [0:0] _zz_413_;
  wire  _zz_414_;
  wire  _zz_415_;
  wire [31:0] _zz_416_;
  wire [31:0] _zz_417_;
  wire [31:0] _zz_418_;
  wire  _zz_419_;
  wire [0:0] _zz_420_;
  wire [0:0] _zz_421_;
  wire [31:0] _zz_422_;
  wire [31:0] _zz_423_;
  wire [31:0] _zz_424_;
  wire  _zz_425_;
  wire [0:0] _zz_426_;
  wire [12:0] _zz_427_;
  wire [31:0] _zz_428_;
  wire [31:0] _zz_429_;
  wire [31:0] _zz_430_;
  wire  _zz_431_;
  wire [0:0] _zz_432_;
  wire [6:0] _zz_433_;
  wire [31:0] _zz_434_;
  wire [31:0] _zz_435_;
  wire [31:0] _zz_436_;
  wire  _zz_437_;
  wire [0:0] _zz_438_;
  wire [0:0] _zz_439_;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_1_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_2_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_3_;
  wire  decode_CSR_WRITE_OPCODE;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_4_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_5_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_6_;
  wire  decode_MEMORY_ENABLE;
  wire  execute_REGFILE_WRITE_VALID;
  wire  decode_IS_CSR;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_7_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_8_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_9_;
  wire  decode_MEMORY_STORE;
  wire  decode_IS_RS2_SIGNED;
  wire  decode_IS_DIV;
  wire  decode_SRC2_FORCE_ZERO;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_10_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_11_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_12_;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_13_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_14_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_15_;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_16_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_17_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_18_;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_19_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_20_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_21_;
  wire  decode_IS_MUL;
  wire  decode_IS_RS1_SIGNED;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  decode_CSR_READ_OPCODE;
  wire  execute_IS_RS1_SIGNED;
  wire  execute_IS_RS2_SIGNED;
  wire  execute_IS_DIV;
  wire  execute_IS_MUL;
  wire [33:0] execute_MUL_HH;
  wire [51:0] execute_MUL_LOW;
  wire [33:0] execute_MUL_HL;
  wire [33:0] execute_MUL_LH;
  wire [31:0] execute_MUL_LL;
  wire [51:0] _zz_22_;
  wire [33:0] _zz_23_;
  wire [33:0] _zz_24_;
  wire [33:0] _zz_25_;
  wire [31:0] _zz_26_;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire  _zz_27_;
  wire  _zz_28_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_29_;
  wire [31:0] execute_BRANCH_CALC;
  wire  execute_BRANCH_DO;
  wire [31:0] _zz_30_;
  wire [31:0] execute_RS1;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_31_;
  wire  _zz_32_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_33_;
  wire  _zz_34_;
  wire [31:0] _zz_35_;
  wire [31:0] _zz_36_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC2_FORCE_ZERO;
  wire  execute_SRC_USE_SUB_LESS;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_37_;
  wire [31:0] _zz_38_;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_39_;
  wire [31:0] _zz_40_;
  wire  decode_SRC_USE_SUB_LESS;
  wire  decode_SRC_ADD_ZERO;
  wire  _zz_41_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_42_;
  wire [31:0] _zz_43_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_44_;
  reg  _zz_45_;
  wire [31:0] _zz_46_;
  wire [31:0] _zz_47_;
  reg  decode_REGFILE_WRITE_VALID;
  wire  decode_LEGAL_INSTRUCTION;
  wire  decode_INSTRUCTION_READY;
  wire  _zz_48_;
  wire  _zz_49_;
  wire  _zz_50_;
  wire  _zz_51_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_52_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_53_;
  wire  _zz_54_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_55_;
  wire  _zz_56_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_57_;
  wire  _zz_58_;
  wire  _zz_59_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_60_;
  wire  _zz_61_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_62_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_63_;
  wire  _zz_64_;
  wire  _zz_65_;
  wire  _zz_66_;
  wire  _zz_67_;
  reg [31:0] _zz_68_;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [31:0] execute_MEMORY_READ_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire [31:0] _zz_69_;
  wire [31:0] execute_SRC_ADD;
  wire [1:0] _zz_70_;
  wire [31:0] execute_RS2;
  wire  execute_MEMORY_STORE;
  wire  execute_MEMORY_ENABLE;
  wire  execute_ALIGNEMENT_FAULT;
  wire  _zz_71_;
  wire  decode_FLUSH_ALL;
  reg  IBusCachedPlugin_rsp_issueDetected;
  reg  _zz_72_;
  reg  _zz_73_;
  reg  _zz_74_;
  reg [31:0] _zz_75_;
  wire [31:0] decode_PC;
  wire [31:0] _zz_76_;
  wire [31:0] _zz_77_;
  wire [31:0] _zz_78_;
  wire [31:0] decode_INSTRUCTION;
  wire [31:0] execute_PC;
  wire [31:0] execute_INSTRUCTION;
  wire  decode_arbitration_haltItself;
  reg  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  wire  decode_arbitration_flushIt;
  reg  decode_arbitration_flushNext;
  wire  decode_arbitration_isValid;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  wire  decode_arbitration_isMoving;
  wire  decode_arbitration_isFiring;
  reg  execute_arbitration_haltItself;
  wire  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  wire  execute_arbitration_flushIt;
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
  wire  CsrPlugin_forceMachineWire;
  reg  CsrPlugin_selfException_valid;
  reg [3:0] CsrPlugin_selfException_payload_code;
  wire [31:0] CsrPlugin_selfException_payload_badAddr;
  wire  CsrPlugin_allowInterrupts;
  wire  CsrPlugin_allowException;
  wire  IBusCachedPlugin_jump_pcLoad_valid;
  wire [31:0] IBusCachedPlugin_jump_pcLoad_payload;
  wire [2:0] _zz_79_;
  wire [2:0] _zz_80_;
  wire  _zz_81_;
  wire  _zz_82_;
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
  wire  _zz_83_;
  wire  _zz_84_;
  wire  _zz_85_;
  wire  _zz_86_;
  reg  _zz_87_;
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
  reg  _zz_88_;
  reg [31:0] _zz_89_;
  reg  _zz_90_;
  reg [31:0] _zz_91_;
  reg  _zz_92_;
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
  wire [31:0] _zz_93_;
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
  reg  _zz_94_;
  reg  execute_DBusSimplePlugin_skipCmd;
  reg [31:0] _zz_95_;
  reg [3:0] _zz_96_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] execute_DBusSimplePlugin_rspShifted;
  wire  _zz_97_;
  reg [31:0] _zz_98_;
  wire  _zz_99_;
  reg [31:0] _zz_100_;
  reg [31:0] execute_DBusSimplePlugin_rspFormated;
  wire [30:0] _zz_101_;
  wire  _zz_102_;
  wire  _zz_103_;
  wire  _zz_104_;
  wire  _zz_105_;
  wire  _zz_106_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_107_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_108_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_109_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_110_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_111_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_112_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_113_;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire  _zz_114_;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  lastStageRegFileWrite_valid /* verilator public */ ;
  wire [4:0] lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire [31:0] lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_115_;
  reg [31:0] _zz_116_;
  wire  _zz_117_;
  reg [19:0] _zz_118_;
  wire  _zz_119_;
  reg [19:0] _zz_120_;
  reg [31:0] _zz_121_;
  reg [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  reg [31:0] execute_LightShifterPlugin_shiftReg;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_122_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_123_;
  reg  _zz_124_;
  reg  _zz_125_;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire  _zz_126_;
  reg [10:0] _zz_127_;
  wire  _zz_128_;
  reg [19:0] _zz_129_;
  wire  _zz_130_;
  reg [18:0] _zz_131_;
  reg [31:0] _zz_132_;
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
  wire  _zz_133_;
  wire  _zz_134_;
  wire  _zz_135_;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg [3:0] CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg [31:0] CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire [1:0] CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  wire [1:0] _zz_136_;
  wire  _zz_137_;
  wire [2:0] _zz_138_;
  wire [2:0] _zz_139_;
  wire  _zz_140_;
  wire  _zz_141_;
  wire [1:0] _zz_142_;
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
  wire [31:0] _zz_143_;
  wire [32:0] _zz_144_;
  wire [32:0] _zz_145_;
  wire [31:0] _zz_146_;
  wire  _zz_147_;
  wire  _zz_148_;
  reg [32:0] _zz_149_;
  reg [31:0] externalInterruptArray_regNext;
  reg [31:0] _zz_150_;
  wire [31:0] _zz_151_;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg  decode_to_execute_IS_MUL;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg  decode_to_execute_SRC2_FORCE_ZERO;
  reg  decode_to_execute_IS_DIV;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg  decode_to_execute_MEMORY_STORE;
  reg [31:0] decode_to_execute_PC;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg  decode_to_execute_IS_CSR;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg [2:0] _zz_152_;
  reg  _zz_153_;
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
  reg [3:0] _zz_154_;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_1__string;
  reg [31:0] _zz_2__string;
  reg [31:0] _zz_3__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_4__string;
  reg [39:0] _zz_5__string;
  reg [39:0] _zz_6__string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_7__string;
  reg [47:0] _zz_8__string;
  reg [47:0] _zz_9__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_10__string;
  reg [71:0] _zz_11__string;
  reg [71:0] _zz_12__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_13__string;
  reg [95:0] _zz_14__string;
  reg [95:0] _zz_15__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_16__string;
  reg [63:0] _zz_17__string;
  reg [63:0] _zz_18__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_19__string;
  reg [23:0] _zz_20__string;
  reg [23:0] _zz_21__string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_29__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_31__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_33__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_37__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_39__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_42__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_44__string;
  reg [23:0] _zz_52__string;
  reg [47:0] _zz_53__string;
  reg [95:0] _zz_55__string;
  reg [31:0] _zz_57__string;
  reg [71:0] _zz_60__string;
  reg [39:0] _zz_62__string;
  reg [63:0] _zz_63__string;
  reg [63:0] _zz_107__string;
  reg [39:0] _zz_108__string;
  reg [71:0] _zz_109__string;
  reg [31:0] _zz_110__string;
  reg [95:0] _zz_111__string;
  reg [47:0] _zz_112__string;
  reg [23:0] _zz_113__string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_177_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_178_ = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_179_ = (execute_arbitration_isValid && execute_IS_DIV);
  assign _zz_180_ = ((_zz_157_ && IBusCachedPlugin_cache_io_cpu_fetch_error) && (! _zz_72_));
  assign _zz_181_ = ((_zz_157_ && IBusCachedPlugin_cache_io_cpu_fetch_cacheMiss) && (! _zz_73_));
  assign _zz_182_ = ((_zz_157_ && IBusCachedPlugin_cache_io_cpu_fetch_mmuException) && (! _zz_74_));
  assign _zz_183_ = ((_zz_157_ && IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling) && (! 1'b0));
  assign _zz_184_ = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != (2'b00));
  assign _zz_185_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_186_ = ({CsrPlugin_selfException_valid,{BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid}} != (3'b000));
  assign _zz_187_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_188_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_189_ = execute_INSTRUCTION[29 : 28];
  assign _zz_190_ = (! IBusCachedPlugin_iBusRsp_readyForError);
  assign _zz_191_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_192_ = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK));
  assign _zz_193_ = execute_INSTRUCTION[13 : 12];
  assign _zz_194_ = (execute_DivPlugin_frontendOk && (! execute_DivPlugin_div_done));
  assign _zz_195_ = (! execute_DivPlugin_frontendOk);
  assign _zz_196_ = (iBus_cmd_valid || (_zz_152_ != (3'b000)));
  assign _zz_197_ = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11)));
  assign _zz_198_ = ((_zz_133_ && 1'b1) && (! 1'b0));
  assign _zz_199_ = ((_zz_134_ && 1'b1) && (! 1'b0));
  assign _zz_200_ = ((_zz_135_ && 1'b1) && (! 1'b0));
  assign _zz_201_ = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_202_ = execute_INSTRUCTION[13 : 12];
  assign _zz_203_ = execute_INSTRUCTION[13];
  assign _zz_204_ = execute_INSTRUCTION[13 : 12];
  assign _zz_205_ = (_zz_79_ - (3'b001));
  assign _zz_206_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign _zz_207_ = {29'd0, _zz_206_};
  assign _zz_208_ = (execute_MEMORY_STORE ? (3'b110) : (3'b100));
  assign _zz_209_ = _zz_101_[0 : 0];
  assign _zz_210_ = _zz_101_[1 : 1];
  assign _zz_211_ = _zz_101_[2 : 2];
  assign _zz_212_ = _zz_101_[7 : 7];
  assign _zz_213_ = _zz_101_[12 : 12];
  assign _zz_214_ = _zz_101_[13 : 13];
  assign _zz_215_ = _zz_101_[16 : 16];
  assign _zz_216_ = _zz_101_[20 : 20];
  assign _zz_217_ = _zz_101_[25 : 25];
  assign _zz_218_ = _zz_101_[26 : 26];
  assign _zz_219_ = _zz_101_[27 : 27];
  assign _zz_220_ = _zz_101_[29 : 29];
  assign _zz_221_ = execute_SRC_LESS;
  assign _zz_222_ = (3'b100);
  assign _zz_223_ = execute_INSTRUCTION[19 : 15];
  assign _zz_224_ = execute_INSTRUCTION[31 : 20];
  assign _zz_225_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_226_ = ($signed(_zz_227_) + $signed(_zz_230_));
  assign _zz_227_ = ($signed(_zz_228_) + $signed(_zz_229_));
  assign _zz_228_ = execute_SRC1;
  assign _zz_229_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_230_ = (execute_SRC_USE_SUB_LESS ? _zz_231_ : _zz_232_);
  assign _zz_231_ = (32'b00000000000000000000000000000001);
  assign _zz_232_ = (32'b00000000000000000000000000000000);
  assign _zz_233_ = (_zz_234_ >>> 1);
  assign _zz_234_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_235_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_236_ = execute_INSTRUCTION[31 : 20];
  assign _zz_237_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_238_ = (_zz_136_ & (~ _zz_239_));
  assign _zz_239_ = (_zz_136_ - (2'b01));
  assign _zz_240_ = (_zz_138_ - (3'b001));
  assign _zz_241_ = ($signed(_zz_242_) + $signed(_zz_247_));
  assign _zz_242_ = ($signed(_zz_243_) + $signed(_zz_245_));
  assign _zz_243_ = (52'b0000000000000000000000000000000000000000000000000000);
  assign _zz_244_ = {1'b0,execute_MUL_LL};
  assign _zz_245_ = {{19{_zz_244_[32]}}, _zz_244_};
  assign _zz_246_ = ({16'd0,execute_MUL_LH} <<< 16);
  assign _zz_247_ = {{2{_zz_246_[49]}}, _zz_246_};
  assign _zz_248_ = ({16'd0,execute_MUL_HL} <<< 16);
  assign _zz_249_ = {{2{_zz_248_[49]}}, _zz_248_};
  assign _zz_250_ = execute_MUL_LOW[31 : 0];
  assign _zz_251_ = ($signed(_zz_253_) + $signed(_zz_254_));
  assign _zz_252_ = _zz_251_[63 : 32];
  assign _zz_253_ = {{14{execute_MUL_LOW[51]}}, execute_MUL_LOW};
  assign _zz_254_ = ({32'd0,execute_MUL_HH} <<< 32);
  assign _zz_255_ = execute_DivPlugin_div_counter_willIncrement;
  assign _zz_256_ = {5'd0, _zz_255_};
  assign _zz_257_ = {1'd0, execute_DivPlugin_rs2};
  assign _zz_258_ = {_zz_143_,(! _zz_145_[32])};
  assign _zz_259_ = _zz_145_[31:0];
  assign _zz_260_ = _zz_144_[31:0];
  assign _zz_261_ = _zz_262_;
  assign _zz_262_ = _zz_263_;
  assign _zz_263_ = ({1'b0,(execute_DivPlugin_div_needRevert ? (~ _zz_146_) : _zz_146_)} + _zz_265_);
  assign _zz_264_ = execute_DivPlugin_div_needRevert;
  assign _zz_265_ = {32'd0, _zz_264_};
  assign _zz_266_ = _zz_148_;
  assign _zz_267_ = {32'd0, _zz_266_};
  assign _zz_268_ = _zz_147_;
  assign _zz_269_ = {31'd0, _zz_268_};
  assign _zz_270_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_271_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_272_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_273_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_274_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_275_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_276_ = (iBus_cmd_payload_address >>> 5);
  assign _zz_277_ = ({3'd0,_zz_154_} <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign _zz_278_ = {_zz_82_,_zz_81_};
  assign _zz_279_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_280_ = (32'b00000000000000000000000000000000);
  assign _zz_281_ = ((decode_INSTRUCTION & _zz_293_) == (32'b00000000000000000000000000000000));
  assign _zz_282_ = (_zz_294_ == _zz_295_);
  assign _zz_283_ = (_zz_296_ == _zz_297_);
  assign _zz_284_ = ((decode_INSTRUCTION & _zz_298_) == (32'b00000000000000000010000000000000));
  assign _zz_285_ = ((decode_INSTRUCTION & _zz_299_) == (32'b00000000000000000001000000000000));
  assign _zz_286_ = (_zz_300_ == _zz_301_);
  assign _zz_287_ = {_zz_105_,{_zz_302_,_zz_303_}};
  assign _zz_288_ = {_zz_304_,{_zz_305_,_zz_306_}};
  assign _zz_289_ = (3'b000);
  assign _zz_290_ = ({_zz_307_,_zz_308_} != (2'b00));
  assign _zz_291_ = (_zz_309_ != _zz_310_);
  assign _zz_292_ = {_zz_311_,{_zz_312_,_zz_313_}};
  assign _zz_293_ = (32'b00000000000000000000000000011000);
  assign _zz_294_ = (decode_INSTRUCTION & (32'b00000000000000000110000000000100));
  assign _zz_295_ = (32'b00000000000000000010000000000000);
  assign _zz_296_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000100));
  assign _zz_297_ = (32'b00000000000000000001000000000000);
  assign _zz_298_ = (32'b00000000000000000010000000010000);
  assign _zz_299_ = (32'b00000000000000000101000000000000);
  assign _zz_300_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000000));
  assign _zz_301_ = (32'b00000000000000000000000001000000);
  assign _zz_302_ = (_zz_314_ == _zz_315_);
  assign _zz_303_ = {_zz_104_,_zz_316_};
  assign _zz_304_ = ((decode_INSTRUCTION & _zz_317_) == (32'b00000000000000000000000000100100));
  assign _zz_305_ = (_zz_318_ == _zz_319_);
  assign _zz_306_ = (_zz_320_ == _zz_321_);
  assign _zz_307_ = (_zz_322_ == _zz_323_);
  assign _zz_308_ = (_zz_324_ == _zz_325_);
  assign _zz_309_ = _zz_103_;
  assign _zz_310_ = (1'b0);
  assign _zz_311_ = ({_zz_326_,_zz_327_} != (2'b00));
  assign _zz_312_ = (_zz_328_ != _zz_329_);
  assign _zz_313_ = {_zz_330_,{_zz_331_,_zz_332_}};
  assign _zz_314_ = (decode_INSTRUCTION & (32'b00000000000000000100000000100000));
  assign _zz_315_ = (32'b00000000000000000100000000100000);
  assign _zz_316_ = ((decode_INSTRUCTION & (32'b00000010000000000000000000100000)) == (32'b00000000000000000000000000100000));
  assign _zz_317_ = (32'b00000000000000000000000001100100);
  assign _zz_318_ = (decode_INSTRUCTION & (32'b00000000000000000011000000110100));
  assign _zz_319_ = (32'b00000000000000000001000000010000);
  assign _zz_320_ = (decode_INSTRUCTION & (32'b00000010000000000011000001010100));
  assign _zz_321_ = (32'b00000000000000000001000000010000);
  assign _zz_322_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_323_ = (32'b00000000000000000001000001010000);
  assign _zz_324_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_325_ = (32'b00000000000000000010000001010000);
  assign _zz_326_ = _zz_105_;
  assign _zz_327_ = ((decode_INSTRUCTION & _zz_333_) == (32'b00000000000000000000000000100000));
  assign _zz_328_ = {_zz_105_,(_zz_334_ == _zz_335_)};
  assign _zz_329_ = (2'b00);
  assign _zz_330_ = ((_zz_336_ == _zz_337_) != (1'b0));
  assign _zz_331_ = ({_zz_338_,_zz_339_} != (2'b00));
  assign _zz_332_ = {(_zz_340_ != _zz_341_),{_zz_342_,{_zz_343_,_zz_344_}}};
  assign _zz_333_ = (32'b00000000000000000000000001110000);
  assign _zz_334_ = (decode_INSTRUCTION & (32'b00000000000000000000000000100000));
  assign _zz_335_ = (32'b00000000000000000000000000000000);
  assign _zz_336_ = (decode_INSTRUCTION & (32'b00010000000000000011000001010000));
  assign _zz_337_ = (32'b00000000000000000000000001010000);
  assign _zz_338_ = ((decode_INSTRUCTION & _zz_345_) == (32'b00000000000100000000000001010000));
  assign _zz_339_ = ((decode_INSTRUCTION & _zz_346_) == (32'b00010000000000000000000001010000));
  assign _zz_340_ = ((decode_INSTRUCTION & _zz_347_) == (32'b00000010000000000000000000110000));
  assign _zz_341_ = (1'b0);
  assign _zz_342_ = ({_zz_348_,_zz_106_} != (2'b00));
  assign _zz_343_ = ({_zz_349_,_zz_350_} != (2'b00));
  assign _zz_344_ = {(_zz_351_ != _zz_352_),{_zz_353_,{_zz_354_,_zz_355_}}};
  assign _zz_345_ = (32'b00010000000100000011000001010000);
  assign _zz_346_ = (32'b00010000010000000011000001010000);
  assign _zz_347_ = (32'b00000010000000000100000001110100);
  assign _zz_348_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_349_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000000000100));
  assign _zz_350_ = _zz_106_;
  assign _zz_351_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_352_ = (1'b0);
  assign _zz_353_ = (((decode_INSTRUCTION & _zz_356_) == (32'b00000010000000000100000000100000)) != (1'b0));
  assign _zz_354_ = ({_zz_102_,_zz_357_} != (2'b00));
  assign _zz_355_ = {(_zz_358_ != (1'b0)),{(_zz_359_ != _zz_360_),{_zz_361_,{_zz_362_,_zz_363_}}}};
  assign _zz_356_ = (32'b00000010000000000100000001100100);
  assign _zz_357_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000011100)) == (32'b00000000000000000000000000000100));
  assign _zz_358_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000001000000));
  assign _zz_359_ = {(_zz_364_ == _zz_365_),{_zz_366_,_zz_367_}};
  assign _zz_360_ = (3'b000);
  assign _zz_361_ = ((_zz_368_ == _zz_369_) != (1'b0));
  assign _zz_362_ = ({_zz_370_,_zz_371_} != (2'b00));
  assign _zz_363_ = {(_zz_372_ != _zz_373_),{_zz_374_,{_zz_375_,_zz_376_}}};
  assign _zz_364_ = (decode_INSTRUCTION & (32'b00000000000000000000000001000100));
  assign _zz_365_ = (32'b00000000000000000000000001000000);
  assign _zz_366_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_367_ = ((decode_INSTRUCTION & (32'b01000000000000000100000000110100)) == (32'b01000000000000000000000000110000));
  assign _zz_368_ = (decode_INSTRUCTION & (32'b00000000000000000000000001011000));
  assign _zz_369_ = (32'b00000000000000000000000000000000);
  assign _zz_370_ = ((decode_INSTRUCTION & _zz_377_) == (32'b00000000000000000000000000100000));
  assign _zz_371_ = ((decode_INSTRUCTION & _zz_378_) == (32'b00000000000000000000000000100000));
  assign _zz_372_ = {_zz_105_,{_zz_104_,{_zz_379_,_zz_380_}}};
  assign _zz_373_ = (4'b0000);
  assign _zz_374_ = ({_zz_381_,_zz_382_} != (2'b00));
  assign _zz_375_ = ({_zz_383_,_zz_384_} != (3'b000));
  assign _zz_376_ = {(_zz_385_ != _zz_386_),{_zz_387_,{_zz_388_,_zz_389_}}};
  assign _zz_377_ = (32'b00000000000000000000000000110100);
  assign _zz_378_ = (32'b00000000000000000000000001100100);
  assign _zz_379_ = (_zz_390_ == _zz_391_);
  assign _zz_380_ = (_zz_392_ == _zz_393_);
  assign _zz_381_ = ((decode_INSTRUCTION & _zz_394_) == (32'b00000000000000000101000000010000));
  assign _zz_382_ = ((decode_INSTRUCTION & _zz_395_) == (32'b00000000000000000101000000100000));
  assign _zz_383_ = (_zz_396_ == _zz_397_);
  assign _zz_384_ = {_zz_398_,_zz_399_};
  assign _zz_385_ = (_zz_400_ == _zz_401_);
  assign _zz_386_ = (1'b0);
  assign _zz_387_ = (_zz_402_ != (1'b0));
  assign _zz_388_ = (_zz_403_ != _zz_404_);
  assign _zz_389_ = {_zz_405_,{_zz_406_,_zz_407_}};
  assign _zz_390_ = (decode_INSTRUCTION & (32'b00000000000000000100000001100000));
  assign _zz_391_ = (32'b00000000000000000100000000100000);
  assign _zz_392_ = (decode_INSTRUCTION & (32'b00000010000000000000000001100000));
  assign _zz_393_ = (32'b00000000000000000000000000100000);
  assign _zz_394_ = (32'b00000000000000000111000000110100);
  assign _zz_395_ = (32'b00000010000000000111000001100100);
  assign _zz_396_ = (decode_INSTRUCTION & (32'b01000000000000000011000001010100));
  assign _zz_397_ = (32'b01000000000000000001000000010000);
  assign _zz_398_ = ((decode_INSTRUCTION & (32'b00000000000000000111000000110100)) == (32'b00000000000000000001000000010000));
  assign _zz_399_ = ((decode_INSTRUCTION & (32'b00000010000000000111000001010100)) == (32'b00000000000000000001000000010000));
  assign _zz_400_ = (decode_INSTRUCTION & (32'b00000000000000000000000000100000));
  assign _zz_401_ = (32'b00000000000000000000000000100000);
  assign _zz_402_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_403_ = ((decode_INSTRUCTION & _zz_408_) == (32'b00000000000000000010000000000000));
  assign _zz_404_ = (1'b0);
  assign _zz_405_ = ({_zz_409_,_zz_410_} != (2'b00));
  assign _zz_406_ = (_zz_411_ != (1'b0));
  assign _zz_407_ = {(_zz_412_ != _zz_413_),{_zz_414_,_zz_415_}};
  assign _zz_408_ = (32'b00000000000000000011000000000000);
  assign _zz_409_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000010100)) == (32'b00000000000000000110000000010000));
  assign _zz_410_ = ((decode_INSTRUCTION & (32'b00000000000000000101000000010100)) == (32'b00000000000000000100000000010000));
  assign _zz_411_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_412_ = _zz_103_;
  assign _zz_413_ = (1'b0);
  assign _zz_414_ = (((decode_INSTRUCTION & (32'b00000000000000000001000001001000)) == (32'b00000000000000000001000000001000)) != (1'b0));
  assign _zz_415_ = ({_zz_102_,{((decode_INSTRUCTION & _zz_416_) == (32'b00000000000000000001000000010000)),{(_zz_417_ == _zz_418_),{_zz_419_,{_zz_420_,_zz_421_}}}}} != (6'b000000));
  assign _zz_416_ = (32'b00000000000000000001000000010000);
  assign _zz_417_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_418_ = (32'b00000000000000000010000000010000);
  assign _zz_419_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000010000));
  assign _zz_420_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000001100)) == (32'b00000000000000000000000000000100));
  assign _zz_421_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000101000)) == (32'b00000000000000000000000000000000));
  assign _zz_422_ = (32'b00000000000000000001000001111111);
  assign _zz_423_ = (decode_INSTRUCTION & (32'b00000000000000000010000001111111));
  assign _zz_424_ = (32'b00000000000000000010000001110011);
  assign _zz_425_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001111111)) == (32'b00000000000000000100000001100011));
  assign _zz_426_ = ((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000010000000010011));
  assign _zz_427_ = {((decode_INSTRUCTION & (32'b00000000000000000110000000111111)) == (32'b00000000000000000000000000100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_428_) == (32'b00000000000000000000000000000011)),{(_zz_429_ == _zz_430_),{_zz_431_,{_zz_432_,_zz_433_}}}}}};
  assign _zz_428_ = (32'b00000000000000000101000001011111);
  assign _zz_429_ = (decode_INSTRUCTION & (32'b00000000000000000111000001111011));
  assign _zz_430_ = (32'b00000000000000000000000001100011);
  assign _zz_431_ = ((decode_INSTRUCTION & (32'b00000000000000000110000001111111)) == (32'b00000000000000000000000000001111));
  assign _zz_432_ = ((decode_INSTRUCTION & (32'b11111100000000000000000001111111)) == (32'b00000000000000000000000000110011));
  assign _zz_433_ = {((decode_INSTRUCTION & (32'b10111100000000000111000001111111)) == (32'b00000000000000000101000000010011)),{((decode_INSTRUCTION & (32'b11111100000000000011000001111111)) == (32'b00000000000000000001000000010011)),{((decode_INSTRUCTION & _zz_434_) == (32'b00000000000000000101000000110011)),{(_zz_435_ == _zz_436_),{_zz_437_,{_zz_438_,_zz_439_}}}}}};
  assign _zz_434_ = (32'b10111110000000000111000001111111);
  assign _zz_435_ = (decode_INSTRUCTION & (32'b10111110000000000111000001111111));
  assign _zz_436_ = (32'b00000000000000000000000000110011);
  assign _zz_437_ = ((decode_INSTRUCTION & (32'b11011111111111111111111111111111)) == (32'b00010000001000000000000001110011));
  assign _zz_438_ = ((decode_INSTRUCTION & (32'b11111111111011111111111111111111)) == (32'b00000000000000000000000001110011));
  assign _zz_439_ = ((decode_INSTRUCTION & (32'b11111111111111111111111111111111)) == (32'b00010000010100000000000001110011));
  always @ (posedge clk) begin
    if(_zz_45_) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_114_) begin
      _zz_172_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_114_) begin
      _zz_173_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  InstructionCache IBusCachedPlugin_cache ( 
    .io_flush(_zz_155_),
    .io_cpu_prefetch_isValid(_zz_156_),
    .io_cpu_prefetch_haltIt(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt),
    .io_cpu_prefetch_pc(IBusCachedPlugin_iBusRsp_stages_0_input_payload),
    .io_cpu_fetch_isValid(_zz_157_),
    .io_cpu_fetch_isStuck(_zz_158_),
    .io_cpu_fetch_isRemoved(IBusCachedPlugin_fetcherflushIt),
    .io_cpu_fetch_pc(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload),
    .io_cpu_fetch_data(IBusCachedPlugin_cache_io_cpu_fetch_data),
    .io_cpu_fetch_dataBypassValid(IBusCachedPlugin_s1_tightlyCoupledHit),
    .io_cpu_fetch_dataBypass(_zz_159_),
    .io_cpu_fetch_mmuBus_cmd_isValid(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid),
    .io_cpu_fetch_mmuBus_cmd_virtualAddress(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress),
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation),
    .io_cpu_fetch_mmuBus_rsp_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress),
    .io_cpu_fetch_mmuBus_rsp_isIoAccess(_zz_160_),
    .io_cpu_fetch_mmuBus_rsp_allowRead(_zz_161_),
    .io_cpu_fetch_mmuBus_rsp_allowWrite(_zz_162_),
    .io_cpu_fetch_mmuBus_rsp_allowExecute(_zz_163_),
    .io_cpu_fetch_mmuBus_rsp_exception(_zz_164_),
    .io_cpu_fetch_mmuBus_rsp_refilling(_zz_165_),
    .io_cpu_fetch_mmuBus_end(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end),
    .io_cpu_fetch_mmuBus_busy(_zz_166_),
    .io_cpu_fetch_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_cpu_fetch_cacheMiss(IBusCachedPlugin_cache_io_cpu_fetch_cacheMiss),
    .io_cpu_fetch_error(IBusCachedPlugin_cache_io_cpu_fetch_error),
    .io_cpu_fetch_mmuRefilling(IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling),
    .io_cpu_fetch_mmuException(IBusCachedPlugin_cache_io_cpu_fetch_mmuException),
    .io_cpu_fetch_isUser(_zz_167_),
    .io_cpu_fetch_haltIt(IBusCachedPlugin_cache_io_cpu_fetch_haltIt),
    .io_cpu_decode_isValid(_zz_168_),
    .io_cpu_decode_isStuck(_zz_169_),
    .io_cpu_decode_pc(_zz_170_),
    .io_cpu_decode_physicalAddress(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_cpu_decode_data(IBusCachedPlugin_cache_io_cpu_decode_data),
    .io_cpu_fill_valid(_zz_171_),
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
    case(_zz_278_)
      2'b00 : begin
        _zz_174_ = BranchPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_174_ = CsrPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_174_ = IBusCachedPlugin_redoBranch_payload;
      end
    endcase
  end

  always @(*) begin
    case(_zz_142_)
      2'b00 : begin
        _zz_175_ = DBusSimplePlugin_memoryExceptionPort_payload_code;
        _zz_176_ = DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
      end
      2'b01 : begin
        _zz_175_ = BranchPlugin_branchExceptionPort_payload_code;
        _zz_176_ = BranchPlugin_branchExceptionPort_payload_badAddr;
      end
      default : begin
        _zz_175_ = CsrPlugin_selfException_payload_code;
        _zz_176_ = CsrPlugin_selfException_payload_badAddr;
      end
    endcase
  end

  `ifndef SYNTHESIS
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
    case(_zz_1_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_1__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_1__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_1__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_1__string = "JALR";
      default : _zz_1__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_2__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_2__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_2__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_2__string = "JALR";
      default : _zz_2__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_3__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_3__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_3__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_3__string = "JALR";
      default : _zz_3__string = "????";
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
    case(_zz_4_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_4__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_4__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_4__string = "AND_1";
      default : _zz_4__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_5__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_5__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_5__string = "AND_1";
      default : _zz_5__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_6__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_6__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_6__string = "AND_1";
      default : _zz_6__string = "?????";
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
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_10__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_10__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_10__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_10__string = "SRA_1    ";
      default : _zz_10__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_11__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_11__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_11__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_11__string = "SRA_1    ";
      default : _zz_11__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_12__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_12__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_12__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_12__string = "SRA_1    ";
      default : _zz_12__string = "?????????";
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
    case(_zz_15_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_15__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_15__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_15__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_15__string = "URS1        ";
      default : _zz_15__string = "????????????";
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
    case(_zz_18_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_18__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_18__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_18__string = "BITWISE ";
      default : _zz_18__string = "????????";
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
    case(_zz_19_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_19__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_19__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_19__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_19__string = "PC ";
      default : _zz_19__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_20_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_20__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_20__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_20__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_20__string = "PC ";
      default : _zz_20__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_21__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_21__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_21__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_21__string = "PC ";
      default : _zz_21__string = "???";
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
    case(_zz_29_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_29__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_29__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_29__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_29__string = "EBREAK";
      default : _zz_29__string = "??????";
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
    case(_zz_31_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_31__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_31__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_31__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_31__string = "JALR";
      default : _zz_31__string = "????";
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
    case(_zz_33_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_33__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_33__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_33__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_33__string = "SRA_1    ";
      default : _zz_33__string = "?????????";
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
    case(_zz_37_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_37__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_37__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_37__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_37__string = "PC ";
      default : _zz_37__string = "???";
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
    case(_zz_39_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_39__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_39__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_39__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_39__string = "URS1        ";
      default : _zz_39__string = "????????????";
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
    case(_zz_42_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_42__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_42__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_42__string = "BITWISE ";
      default : _zz_42__string = "????????";
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
    case(_zz_44_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_44__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_44__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_44__string = "AND_1";
      default : _zz_44__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_52_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_52__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_52__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_52__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_52__string = "PC ";
      default : _zz_52__string = "???";
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
    case(_zz_55_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_55__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_55__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_55__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_55__string = "URS1        ";
      default : _zz_55__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_57_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_57__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_57__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_57__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_57__string = "JALR";
      default : _zz_57__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_60_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_60__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_60__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_60__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_60__string = "SRA_1    ";
      default : _zz_60__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_62_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_62__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_62__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_62__string = "AND_1";
      default : _zz_62__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_63_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_63__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_63__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_63__string = "BITWISE ";
      default : _zz_63__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_107_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_107__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_107__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_107__string = "BITWISE ";
      default : _zz_107__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_108_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_108__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_108__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_108__string = "AND_1";
      default : _zz_108__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_109_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_109__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_109__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_109__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_109__string = "SRA_1    ";
      default : _zz_109__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_110_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_110__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_110__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_110__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_110__string = "JALR";
      default : _zz_110__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_111_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_111__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_111__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_111__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_111__string = "URS1        ";
      default : _zz_111__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_112_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_112__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_112__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_112__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_112__string = "EBREAK";
      default : _zz_112__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_113_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_113__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_113__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_113__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_113__string = "PC ";
      default : _zz_113__string = "???";
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
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
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
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign decode_BRANCH_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign decode_CSR_WRITE_OPCODE = _zz_28_;
  assign decode_ALU_BITWISE_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign decode_MEMORY_ENABLE = _zz_59_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign decode_IS_CSR = _zz_50_;
  assign decode_ENV_CTRL = _zz_7_;
  assign _zz_8_ = _zz_9_;
  assign decode_MEMORY_STORE = _zz_61_;
  assign decode_IS_RS2_SIGNED = _zz_64_;
  assign decode_IS_DIV = _zz_56_;
  assign decode_SRC2_FORCE_ZERO = _zz_41_;
  assign decode_SHIFT_CTRL = _zz_10_;
  assign _zz_11_ = _zz_12_;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_76_;
  assign decode_SRC1_CTRL = _zz_13_;
  assign _zz_14_ = _zz_15_;
  assign decode_ALU_CTRL = _zz_16_;
  assign _zz_17_ = _zz_18_;
  assign decode_SRC2_CTRL = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign decode_IS_MUL = _zz_54_;
  assign decode_IS_RS1_SIGNED = _zz_51_;
  assign decode_SRC_LESS_UNSIGNED = _zz_48_;
  assign decode_CSR_READ_OPCODE = _zz_27_;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign execute_MUL_HH = _zz_23_;
  assign execute_MUL_LOW = _zz_22_;
  assign execute_MUL_HL = _zz_24_;
  assign execute_MUL_LH = _zz_25_;
  assign execute_MUL_LL = _zz_26_;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign execute_ENV_CTRL = _zz_29_;
  assign execute_BRANCH_CALC = _zz_30_;
  assign execute_BRANCH_DO = _zz_32_;
  assign execute_RS1 = _zz_47_;
  assign execute_BRANCH_CTRL = _zz_31_;
  assign execute_SHIFT_CTRL = _zz_33_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign execute_SRC2_CTRL = _zz_37_;
  assign execute_SRC1_CTRL = _zz_39_;
  assign decode_SRC_USE_SUB_LESS = _zz_58_;
  assign decode_SRC_ADD_ZERO = _zz_49_;
  assign execute_SRC_ADD_SUB = _zz_36_;
  assign execute_SRC_LESS = _zz_34_;
  assign execute_ALU_CTRL = _zz_42_;
  assign execute_SRC2 = _zz_38_;
  assign execute_SRC1 = _zz_40_;
  assign execute_ALU_BITWISE_CTRL = _zz_44_;
  always @ (*) begin
    _zz_45_ = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_45_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_66_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = _zz_67_;
  assign decode_INSTRUCTION_READY = 1'b1;
  always @ (*) begin
    _zz_68_ = execute_REGFILE_WRITE_DATA;
    if((execute_arbitration_isValid && execute_MEMORY_ENABLE))begin
      _zz_68_ = execute_DBusSimplePlugin_rspFormated;
    end
    if(_zz_177_)begin
      _zz_68_ = _zz_122_;
    end
    if(_zz_178_)begin
      _zz_68_ = execute_CsrPlugin_readData;
    end
    if((execute_arbitration_isValid && execute_IS_MUL))begin
      case(_zz_204_)
        2'b00 : begin
          _zz_68_ = _zz_250_;
        end
        default : begin
          _zz_68_ = _zz_252_;
        end
      endcase
    end
    if(_zz_179_)begin
      _zz_68_ = execute_DivPlugin_div_result;
    end
  end

  assign execute_MEMORY_ADDRESS_LOW = _zz_70_;
  assign execute_MEMORY_READ_DATA = _zz_69_;
  assign execute_REGFILE_WRITE_DATA = _zz_43_;
  assign execute_SRC_ADD = _zz_35_;
  assign execute_RS2 = _zz_46_;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = _zz_71_;
  assign decode_FLUSH_ALL = _zz_65_;
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected = _zz_72_;
    if(_zz_180_)begin
      IBusCachedPlugin_rsp_issueDetected = 1'b1;
    end
  end

  always @ (*) begin
    _zz_72_ = _zz_73_;
    if(_zz_181_)begin
      _zz_72_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_73_ = _zz_74_;
    if(_zz_182_)begin
      _zz_73_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_74_ = 1'b0;
    if(_zz_183_)begin
      _zz_74_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_75_ = decode_FORMAL_PC_NEXT;
    if(IBusCachedPlugin_redoBranch_valid)begin
      _zz_75_ = IBusCachedPlugin_redoBranch_payload;
    end
  end

  assign decode_PC = _zz_78_;
  assign decode_INSTRUCTION = _zz_77_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign decode_arbitration_haltItself = 1'b0;
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
    if(_zz_184_)begin
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
    if(_zz_184_)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_94_)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_MEMORY_STORE)) && ((! dBus_rsp_ready) || (! _zz_94_))))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_177_)begin
      if(_zz_185_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if(_zz_178_)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_179_)begin
      if(((! execute_DivPlugin_frontendOk) || (! execute_DivPlugin_div_done)))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(_zz_186_)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_186_)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_187_)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_188_)begin
      execute_arbitration_flushNext = 1'b1;
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
    if(_zz_187_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_188_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetcherflushIt = 1'b0;
    if(({execute_arbitration_flushNext,decode_arbitration_flushNext} != (2'b00)))begin
      IBusCachedPlugin_fetcherflushIt = 1'b1;
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
    if(_zz_187_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_188_)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(_zz_187_)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
    end
    if(_zz_188_)begin
      case(_zz_189_)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  assign CsrPlugin_forceMachineWire = 1'b0;
  assign CsrPlugin_allowInterrupts = 1'b1;
  assign CsrPlugin_allowException = 1'b1;
  assign IBusCachedPlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,IBusCachedPlugin_redoBranch_valid}} != (3'b000));
  assign _zz_79_ = {IBusCachedPlugin_redoBranch_valid,{CsrPlugin_jumpInterface_valid,BranchPlugin_jumpInterface_valid}};
  assign _zz_80_ = (_zz_79_ & (~ _zz_205_));
  assign _zz_81_ = _zz_80_[1];
  assign _zz_82_ = _zz_80_[2];
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_174_;
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
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_207_);
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

  assign _zz_83_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_83_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_83_);
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

  assign _zz_84_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready && _zz_84_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && _zz_84_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_85_;
  assign _zz_85_ = ((1'b0 && (! _zz_86_)) || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_86_ = _zz_87_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid = _zz_86_;
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
  assign IBusCachedPlugin_injector_decodeInput_valid = _zz_88_;
  assign IBusCachedPlugin_injector_decodeInput_payload_pc = _zz_89_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_error = _zz_90_;
  assign IBusCachedPlugin_injector_decodeInput_payload_rsp_inst = _zz_91_;
  assign IBusCachedPlugin_injector_decodeInput_payload_isRvc = _zz_92_;
  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = (IBusCachedPlugin_injector_decodeInput_valid && (! IBusCachedPlugin_injector_decodeRemoved));
  assign _zz_78_ = IBusCachedPlugin_injector_decodeInput_payload_pc;
  assign _zz_77_ = IBusCachedPlugin_injector_decodeInput_payload_rsp_inst;
  assign _zz_76_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_156_ = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_159_ = (32'b00000000000000000000000000000000);
  assign _zz_157_ = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_158_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_167_ = (CsrPlugin_privilege == (2'b00));
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_183_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_181_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_190_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b0;
    end
  end

  always @ (*) begin
    _zz_171_ = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_fetch_mmuRefilling));
    if(_zz_181_)begin
      _zz_171_ = 1'b1;
    end
    if(_zz_190_)begin
      _zz_171_ = 1'b0;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_182_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_180_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = (4'bxxxx);
    if(_zz_182_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b1100);
    end
    if(_zz_180_)begin
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
  assign _zz_163_ = 1'b1;
  assign _zz_161_ = 1'b1;
  assign _zz_162_ = 1'b1;
  assign _zz_160_ = 1'b0;
  assign _zz_164_ = 1'b0;
  assign _zz_165_ = 1'b0;
  assign _zz_166_ = 1'b0;
  assign _zz_155_ = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign _zz_71_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_94_));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_95_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_95_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_95_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_95_;
  assign _zz_70_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_96_ = (4'b0001);
      end
      2'b01 : begin
        _zz_96_ = (4'b0011);
      end
      default : begin
        _zz_96_ = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_96_ <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign _zz_69_ = dBus_rsp_data;
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
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_208_};
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

  assign _zz_97_ = (execute_DBusSimplePlugin_rspShifted[7] && (! execute_INSTRUCTION[14]));
  always @ (*) begin
    _zz_98_[31] = _zz_97_;
    _zz_98_[30] = _zz_97_;
    _zz_98_[29] = _zz_97_;
    _zz_98_[28] = _zz_97_;
    _zz_98_[27] = _zz_97_;
    _zz_98_[26] = _zz_97_;
    _zz_98_[25] = _zz_97_;
    _zz_98_[24] = _zz_97_;
    _zz_98_[23] = _zz_97_;
    _zz_98_[22] = _zz_97_;
    _zz_98_[21] = _zz_97_;
    _zz_98_[20] = _zz_97_;
    _zz_98_[19] = _zz_97_;
    _zz_98_[18] = _zz_97_;
    _zz_98_[17] = _zz_97_;
    _zz_98_[16] = _zz_97_;
    _zz_98_[15] = _zz_97_;
    _zz_98_[14] = _zz_97_;
    _zz_98_[13] = _zz_97_;
    _zz_98_[12] = _zz_97_;
    _zz_98_[11] = _zz_97_;
    _zz_98_[10] = _zz_97_;
    _zz_98_[9] = _zz_97_;
    _zz_98_[8] = _zz_97_;
    _zz_98_[7 : 0] = execute_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_99_ = (execute_DBusSimplePlugin_rspShifted[15] && (! execute_INSTRUCTION[14]));
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
    _zz_100_[15 : 0] = execute_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_202_)
      2'b00 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_98_;
      end
      2'b01 : begin
        execute_DBusSimplePlugin_rspFormated = _zz_100_;
      end
      default : begin
        execute_DBusSimplePlugin_rspFormated = execute_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_102_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_103_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_104_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000110000)) == (32'b00000000000000000000000000010000));
  assign _zz_105_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_106_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_101_ = {({(_zz_279_ == _zz_280_),{_zz_281_,{_zz_282_,_zz_283_}}} != (4'b0000)),{({_zz_284_,_zz_285_} != (2'b00)),{({_zz_286_,_zz_287_} != (5'b00000)),{(_zz_288_ != _zz_289_),{_zz_290_,{_zz_291_,_zz_292_}}}}}};
  assign _zz_67_ = ({((decode_INSTRUCTION & (32'b00000000000000000000000001011111)) == (32'b00000000000000000000000000010111)),{((decode_INSTRUCTION & (32'b00000000000000000000000001111111)) == (32'b00000000000000000000000001101111)),{((decode_INSTRUCTION & (32'b00000000000000000001000001101111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & _zz_422_) == (32'b00000000000000000001000001110011)),{(_zz_423_ == _zz_424_),{_zz_425_,{_zz_426_,_zz_427_}}}}}}} != (20'b00000000000000000000));
  assign _zz_66_ = _zz_209_[0];
  assign _zz_65_ = _zz_210_[0];
  assign _zz_64_ = _zz_211_[0];
  assign _zz_107_ = _zz_101_[4 : 3];
  assign _zz_63_ = _zz_107_;
  assign _zz_108_ = _zz_101_[6 : 5];
  assign _zz_62_ = _zz_108_;
  assign _zz_61_ = _zz_212_[0];
  assign _zz_109_ = _zz_101_[9 : 8];
  assign _zz_60_ = _zz_109_;
  assign _zz_59_ = _zz_213_[0];
  assign _zz_58_ = _zz_214_[0];
  assign _zz_110_ = _zz_101_[15 : 14];
  assign _zz_57_ = _zz_110_;
  assign _zz_56_ = _zz_215_[0];
  assign _zz_111_ = _zz_101_[19 : 18];
  assign _zz_55_ = _zz_111_;
  assign _zz_54_ = _zz_216_[0];
  assign _zz_112_ = _zz_101_[22 : 21];
  assign _zz_53_ = _zz_112_;
  assign _zz_113_ = _zz_101_[24 : 23];
  assign _zz_52_ = _zz_113_;
  assign _zz_51_ = _zz_217_[0];
  assign _zz_50_ = _zz_218_[0];
  assign _zz_49_ = _zz_219_[0];
  assign _zz_48_ = _zz_220_[0];
  assign decodeExceptionPort_valid = ((decode_arbitration_isValid && decode_INSTRUCTION_READY) && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = (4'b0010);
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign execute_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION[24 : 20];
  assign _zz_114_ = (! execute_arbitration_isStuck);
  assign execute_RegFilePlugin_rs1Data = _zz_172_;
  assign execute_RegFilePlugin_rs2Data = _zz_173_;
  assign _zz_47_ = execute_RegFilePlugin_rs1Data;
  assign _zz_46_ = execute_RegFilePlugin_rs2Data;
  assign lastStageRegFileWrite_valid = (execute_REGFILE_WRITE_VALID && execute_arbitration_isFiring);
  assign lastStageRegFileWrite_payload_address = execute_INSTRUCTION[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_68_;
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
        _zz_115_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_115_ = {31'd0, _zz_221_};
      end
      default : begin
        _zz_115_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_43_ = _zz_115_;
  assign _zz_41_ = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_116_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_116_ = {29'd0, _zz_222_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_116_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_116_ = {27'd0, _zz_223_};
      end
    endcase
  end

  assign _zz_40_ = _zz_116_;
  assign _zz_117_ = _zz_224_[11];
  always @ (*) begin
    _zz_118_[19] = _zz_117_;
    _zz_118_[18] = _zz_117_;
    _zz_118_[17] = _zz_117_;
    _zz_118_[16] = _zz_117_;
    _zz_118_[15] = _zz_117_;
    _zz_118_[14] = _zz_117_;
    _zz_118_[13] = _zz_117_;
    _zz_118_[12] = _zz_117_;
    _zz_118_[11] = _zz_117_;
    _zz_118_[10] = _zz_117_;
    _zz_118_[9] = _zz_117_;
    _zz_118_[8] = _zz_117_;
    _zz_118_[7] = _zz_117_;
    _zz_118_[6] = _zz_117_;
    _zz_118_[5] = _zz_117_;
    _zz_118_[4] = _zz_117_;
    _zz_118_[3] = _zz_117_;
    _zz_118_[2] = _zz_117_;
    _zz_118_[1] = _zz_117_;
    _zz_118_[0] = _zz_117_;
  end

  assign _zz_119_ = _zz_225_[11];
  always @ (*) begin
    _zz_120_[19] = _zz_119_;
    _zz_120_[18] = _zz_119_;
    _zz_120_[17] = _zz_119_;
    _zz_120_[16] = _zz_119_;
    _zz_120_[15] = _zz_119_;
    _zz_120_[14] = _zz_119_;
    _zz_120_[13] = _zz_119_;
    _zz_120_[12] = _zz_119_;
    _zz_120_[11] = _zz_119_;
    _zz_120_[10] = _zz_119_;
    _zz_120_[9] = _zz_119_;
    _zz_120_[8] = _zz_119_;
    _zz_120_[7] = _zz_119_;
    _zz_120_[6] = _zz_119_;
    _zz_120_[5] = _zz_119_;
    _zz_120_[4] = _zz_119_;
    _zz_120_[3] = _zz_119_;
    _zz_120_[2] = _zz_119_;
    _zz_120_[1] = _zz_119_;
    _zz_120_[0] = _zz_119_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_121_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_121_ = {_zz_118_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_121_ = {_zz_120_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_121_ = execute_PC;
      end
    endcase
  end

  assign _zz_38_ = _zz_121_;
  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_226_;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_36_ = execute_SrcPlugin_addSub;
  assign _zz_35_ = execute_SrcPlugin_addSub;
  assign _zz_34_ = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_shiftReg : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_122_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_122_ = _zz_233_;
      end
    endcase
  end

  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_123_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_123_ == (3'b000))) begin
        _zz_124_ = execute_BranchPlugin_eq;
    end else if((_zz_123_ == (3'b001))) begin
        _zz_124_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_123_ & (3'b101)) == (3'b101)))) begin
        _zz_124_ = (! execute_SRC_LESS);
    end else begin
        _zz_124_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_125_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_125_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_125_ = 1'b1;
      end
      default : begin
        _zz_125_ = _zz_124_;
      end
    endcase
  end

  assign _zz_32_ = _zz_125_;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_126_ = _zz_235_[19];
  always @ (*) begin
    _zz_127_[10] = _zz_126_;
    _zz_127_[9] = _zz_126_;
    _zz_127_[8] = _zz_126_;
    _zz_127_[7] = _zz_126_;
    _zz_127_[6] = _zz_126_;
    _zz_127_[5] = _zz_126_;
    _zz_127_[4] = _zz_126_;
    _zz_127_[3] = _zz_126_;
    _zz_127_[2] = _zz_126_;
    _zz_127_[1] = _zz_126_;
    _zz_127_[0] = _zz_126_;
  end

  assign _zz_128_ = _zz_236_[11];
  always @ (*) begin
    _zz_129_[19] = _zz_128_;
    _zz_129_[18] = _zz_128_;
    _zz_129_[17] = _zz_128_;
    _zz_129_[16] = _zz_128_;
    _zz_129_[15] = _zz_128_;
    _zz_129_[14] = _zz_128_;
    _zz_129_[13] = _zz_128_;
    _zz_129_[12] = _zz_128_;
    _zz_129_[11] = _zz_128_;
    _zz_129_[10] = _zz_128_;
    _zz_129_[9] = _zz_128_;
    _zz_129_[8] = _zz_128_;
    _zz_129_[7] = _zz_128_;
    _zz_129_[6] = _zz_128_;
    _zz_129_[5] = _zz_128_;
    _zz_129_[4] = _zz_128_;
    _zz_129_[3] = _zz_128_;
    _zz_129_[2] = _zz_128_;
    _zz_129_[1] = _zz_128_;
    _zz_129_[0] = _zz_128_;
  end

  assign _zz_130_ = _zz_237_[11];
  always @ (*) begin
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

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_132_ = {{_zz_127_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_132_ = {_zz_129_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_132_ = {{_zz_131_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_132_;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_30_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
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
  assign _zz_133_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_134_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_135_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b11);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_136_ = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_137_ = _zz_238_[0];
  assign _zz_138_ = {CsrPlugin_selfException_valid,{BranchPlugin_branchExceptionPort_valid,DBusSimplePlugin_memoryExceptionPort_valid}};
  assign _zz_139_ = (_zz_138_ & (~ _zz_240_));
  assign _zz_140_ = _zz_139_[1];
  assign _zz_141_ = _zz_139_[2];
  assign _zz_142_ = {_zz_141_,_zz_140_};
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_184_)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(_zz_186_)begin
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
  assign _zz_28_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_27_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
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
    if(_zz_191_)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(_zz_192_)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = (4'bxxxx);
    if(_zz_191_)begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = (4'b1000);
        end
        default : begin
          CsrPlugin_selfException_payload_code = (4'b1011);
        end
      endcase
    end
    if(_zz_192_)begin
      CsrPlugin_selfException_payload_code = (4'b0011);
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  always @ (*) begin
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_readData[31 : 0] = _zz_150_;
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
        execute_CsrPlugin_readData[31 : 0] = _zz_151_;
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
    case(_zz_203_)
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
    case(_zz_193_)
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
    case(_zz_193_)
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
  assign _zz_26_ = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_25_ = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign _zz_24_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign _zz_23_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign _zz_22_ = ($signed(_zz_241_) + $signed(_zz_249_));
  always @ (*) begin
    execute_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_179_)begin
      if(_zz_194_)begin
        execute_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_195_)begin
      execute_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign execute_DivPlugin_div_counter_willOverflowIfInc = (execute_DivPlugin_div_counter_value == (6'b100001));
  assign execute_DivPlugin_div_counter_willOverflow = (execute_DivPlugin_div_counter_willOverflowIfInc && execute_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(execute_DivPlugin_div_counter_willOverflow)begin
      execute_DivPlugin_div_counter_valueNext = (6'b000000);
    end else begin
      execute_DivPlugin_div_counter_valueNext = (execute_DivPlugin_div_counter_value + _zz_256_);
    end
    if(execute_DivPlugin_div_counter_willClear)begin
      execute_DivPlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_143_ = execute_DivPlugin_rs1[31 : 0];
  assign _zz_144_ = {execute_DivPlugin_accumulator[31 : 0],_zz_143_[31]};
  assign _zz_145_ = (_zz_144_ - _zz_257_);
  assign _zz_146_ = (execute_INSTRUCTION[13] ? execute_DivPlugin_accumulator[31 : 0] : execute_DivPlugin_rs1[31 : 0]);
  assign _zz_147_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_148_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_149_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_149_[31 : 0] = execute_RS1;
  end

  assign _zz_151_ = (_zz_150_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_151_ != (32'b00000000000000000000000000000000));
  assign _zz_21_ = decode_SRC2_CTRL;
  assign _zz_19_ = _zz_52_;
  assign _zz_37_ = decode_to_execute_SRC2_CTRL;
  assign _zz_18_ = decode_ALU_CTRL;
  assign _zz_16_ = _zz_63_;
  assign _zz_42_ = decode_to_execute_ALU_CTRL;
  assign _zz_15_ = decode_SRC1_CTRL;
  assign _zz_13_ = _zz_55_;
  assign _zz_39_ = decode_to_execute_SRC1_CTRL;
  assign _zz_12_ = decode_SHIFT_CTRL;
  assign _zz_10_ = _zz_60_;
  assign _zz_33_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_9_ = decode_ENV_CTRL;
  assign _zz_7_ = _zz_53_;
  assign _zz_29_ = decode_to_execute_ENV_CTRL;
  assign _zz_6_ = decode_ALU_BITWISE_CTRL;
  assign _zz_4_ = _zz_62_;
  assign _zz_44_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_3_ = decode_BRANCH_CTRL;
  assign _zz_1_ = _zz_57_;
  assign _zz_31_ = decode_to_execute_BRANCH_CTRL;
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
  assign iBusWishbone_ADR = {_zz_276_,_zz_152_};
  assign iBusWishbone_CTI = ((_zz_152_ == (3'b111)) ? (3'b111) : (3'b010));
  assign iBusWishbone_BTE = (2'b00);
  assign iBusWishbone_SEL = (4'b1111);
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    if(_zz_196_)begin
      iBusWishbone_CYC = 1'b1;
    end
  end

  always @ (*) begin
    iBusWishbone_STB = 1'b0;
    if(_zz_196_)begin
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_153_;
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
        _zz_154_ = (4'b0001);
      end
      2'b01 : begin
        _zz_154_ = (4'b0011);
      end
      default : begin
        _zz_154_ = (4'b1111);
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = _zz_277_[3:0];
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
      _zz_87_ <= 1'b0;
      _zz_88_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_93_;
      IBusCachedPlugin_rspCounter <= (32'b00000000000000000000000000000000);
      _zz_94_ <= 1'b0;
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
      _zz_150_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      _zz_152_ <= (3'b000);
      _zz_153_ <= 1'b0;
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
        _zz_87_ <= 1'b0;
      end
      if(_zz_85_)begin
        _zz_87_ <= IBusCachedPlugin_iBusRsp_stages_0_output_valid;
      end
      if(IBusCachedPlugin_iBusRsp_inputBeforeStage_ready)begin
        _zz_88_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_valid;
      end
      if(IBusCachedPlugin_fetcherflushIt)begin
        _zz_88_ <= 1'b0;
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
        _zz_94_ <= 1'b1;
      end
      if((! execute_arbitration_isStuck))begin
        _zz_94_ <= 1'b0;
      end
      if(_zz_177_)begin
        if(_zz_185_)begin
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
      if(_zz_197_)begin
        if(_zz_198_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_199_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_200_)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_187_)begin
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
      if(_zz_188_)begin
        case(_zz_189_)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= ({_zz_135_,{_zz_134_,_zz_133_}} != (3'b000));
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
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_150_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_270_[0];
            CsrPlugin_mstatus_MIE <= _zz_271_[0];
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
            CsrPlugin_mie_MEIE <= _zz_273_[0];
            CsrPlugin_mie_MTIE <= _zz_274_[0];
            CsrPlugin_mie_MSIE <= _zz_275_[0];
          end
        end
        12'b101110000010 : begin
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(_zz_196_)begin
        if(iBusWishbone_ACK)begin
          _zz_152_ <= (_zz_152_ + (3'b001));
        end
      end
      _zz_153_ <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if(_zz_201_)begin
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
      _zz_89_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_pc;
      _zz_90_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_error;
      _zz_91_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_inst;
      _zz_92_ <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_isRvc;
    end
    if(IBusCachedPlugin_injector_decodeInput_ready)begin
      IBusCachedPlugin_injector_formal_rawInDecode <= IBusCachedPlugin_iBusRsp_inputBeforeStage_payload_rsp_inst;
    end
    if(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if((! execute_arbitration_isStuckByOthers))begin
      execute_LightShifterPlugin_shiftReg <= _zz_68_;
    end
    if(_zz_177_)begin
      if(_zz_185_)begin
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
    if(_zz_184_)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_137_ ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_137_ ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(_zz_186_)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= _zz_175_;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= _zz_176_;
    end
    if(_zz_197_)begin
      if(_zz_198_)begin
        CsrPlugin_interrupt_code <= (4'b0111);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_199_)begin
        CsrPlugin_interrupt_code <= (4'b0011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_200_)begin
        CsrPlugin_interrupt_code <= (4'b1011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    if(_zz_187_)begin
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
    if(_zz_179_)begin
      if(_zz_194_)begin
        execute_DivPlugin_rs1[31 : 0] <= _zz_258_[31:0];
        execute_DivPlugin_accumulator[31 : 0] <= ((! _zz_145_[32]) ? _zz_259_ : _zz_260_);
        if((execute_DivPlugin_div_counter_value == (6'b100000)))begin
          execute_DivPlugin_div_result <= _zz_261_[31:0];
        end
      end
    end
    if(_zz_195_)begin
      execute_DivPlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      execute_DivPlugin_rs1 <= ((_zz_148_ ? (~ _zz_149_) : _zz_149_) + _zz_267_);
      execute_DivPlugin_rs2 <= ((_zz_147_ ? (~ execute_RS2) : execute_RS2) + _zz_269_);
      execute_DivPlugin_div_needRevert <= ((_zz_148_ ^ (_zz_147_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_20_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_17_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_14_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_75_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_11_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if(((! execute_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_execute)))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_8_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_5_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_2_;
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
          CsrPlugin_mip_MSIP <= _zz_272_[0];
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
    if(_zz_201_)begin
      dBus_cmd_halfPipe_regs_payload_wr <= dBus_cmd_payload_wr;
      dBus_cmd_halfPipe_regs_payload_address <= dBus_cmd_payload_address;
      dBus_cmd_halfPipe_regs_payload_data <= dBus_cmd_payload_data;
      dBus_cmd_halfPipe_regs_payload_size <= dBus_cmd_payload_size;
    end
  end

endmodule

