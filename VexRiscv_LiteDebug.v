// Generator : SpinalHDL v1.3.2    git head : 41815ceafff4e72c2e3a3e1ff7e9ada5202a0d26
// Date      : 26/03/2019, 03:03:50
// Component : VexRiscv


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

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

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b11

module InstructionCache (
      input   io_flush_cmd_valid,
      output  io_flush_cmd_ready,
      output  io_flush_rsp,
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
      input   io_cpu_fetch_mmuBus_rsp_allowUser,
      input   io_cpu_fetch_mmuBus_rsp_miss,
      input   io_cpu_fetch_mmuBus_rsp_hit,
      output  io_cpu_fetch_mmuBus_end,
      output [31:0] io_cpu_fetch_physicalAddress,
      input   io_cpu_decode_isValid,
      input   io_cpu_decode_isStuck,
      input  [31:0] io_cpu_decode_pc,
      output [31:0] io_cpu_decode_physicalAddress,
      output [31:0] io_cpu_decode_data,
      output  io_cpu_decode_cacheMiss,
      output  io_cpu_decode_error,
      output  io_cpu_decode_mmuMiss,
      output  io_cpu_decode_illegalAccess,
      input   io_cpu_decode_isUser,
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
  reg [22:0] _zz_12_;
  reg [31:0] _zz_13_;
  wire  _zz_14_;
  wire [0:0] _zz_15_;
  wire [0:0] _zz_16_;
  wire [22:0] _zz_17_;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  lineLoader_fire;
  reg  lineLoader_valid;
  reg [31:0] lineLoader_address;
  reg  lineLoader_hadError;
  reg [6:0] lineLoader_flushCounter;
  reg  _zz_3_;
  reg  lineLoader_flushFromInterface;
  wire  _zz_4_;
  reg  _zz_4__regNext;
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
  wire  _zz_5_;
  wire [5:0] _zz_6_;
  wire  _zz_7_;
  wire  fetchStage_read_waysValues_0_tag_valid;
  wire  fetchStage_read_waysValues_0_tag_error;
  wire [20:0] fetchStage_read_waysValues_0_tag_address;
  wire [22:0] _zz_8_;
  wire [8:0] _zz_9_;
  wire  _zz_10_;
  wire [31:0] fetchStage_read_waysValues_0_data;
  reg [31:0] decodeStage_mmuRsp_physicalAddress;
  reg  decodeStage_mmuRsp_isIoAccess;
  reg  decodeStage_mmuRsp_allowRead;
  reg  decodeStage_mmuRsp_allowWrite;
  reg  decodeStage_mmuRsp_allowExecute;
  reg  decodeStage_mmuRsp_allowUser;
  reg  decodeStage_mmuRsp_miss;
  reg  decodeStage_mmuRsp_hit;
  reg  decodeStage_hit_tags_0_valid;
  reg  decodeStage_hit_tags_0_error;
  reg [20:0] decodeStage_hit_tags_0_address;
  wire  decodeStage_hit_hits_0;
  wire  decodeStage_hit_valid;
  wire  decodeStage_hit_error;
  reg [31:0] _zz_11_;
  wire [31:0] decodeStage_hit_data;
  reg [31:0] decodeStage_hit_word;
  reg  io_cpu_fetch_dataBypassValid_regNextWhen;
  reg [31:0] io_cpu_fetch_dataBypass_regNextWhen;
  reg [22:0] ways_0_tags [0:63];
  reg [31:0] ways_0_datas [0:511];
  assign _zz_14_ = (! lineLoader_flushCounter[6]);
  assign _zz_15_ = _zz_8_[0 : 0];
  assign _zz_16_ = _zz_8_[1 : 1];
  assign _zz_17_ = {lineLoader_write_tag_0_payload_data_address,{lineLoader_write_tag_0_payload_data_error,lineLoader_write_tag_0_payload_data_valid}};
  always @ (posedge clk) begin
    if(_zz_2_) begin
      ways_0_tags[lineLoader_write_tag_0_payload_address] <= _zz_17_;
    end
  end

  always @ (posedge clk) begin
    if(_zz_7_) begin
      _zz_12_ <= ways_0_tags[_zz_6_];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1_) begin
      ways_0_datas[lineLoader_write_data_0_payload_address] <= lineLoader_write_data_0_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_10_) begin
      _zz_13_ <= ways_0_datas[_zz_9_];
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

  always @ (*) begin
    io_cpu_prefetch_haltIt = 1'b0;
    if(lineLoader_valid)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(_zz_14_)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if((! _zz_3_))begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
    if(io_flush_cmd_valid)begin
      io_cpu_prefetch_haltIt = 1'b1;
    end
  end

  always @ (*) begin
    lineLoader_fire = 1'b0;
    if(io_mem_rsp_valid)begin
      if((lineLoader_wordIndex == (3'b111)))begin
        lineLoader_fire = 1'b1;
      end
    end
  end

  assign io_flush_cmd_ready = (! (lineLoader_valid || io_cpu_fetch_isValid));
  assign _zz_4_ = lineLoader_flushCounter[6];
  assign io_flush_rsp = ((_zz_4_ && (! _zz_4__regNext)) && lineLoader_flushFromInterface);
  assign io_mem_cmd_valid = (lineLoader_valid && (! lineLoader_cmdSent));
  assign io_mem_cmd_payload_address = {lineLoader_address[31 : 5],(5'b00000)};
  assign io_mem_cmd_payload_size = (3'b101);
  always @ (*) begin
    lineLoader_wayToAllocate_willIncrement = 1'b0;
    if(lineLoader_fire)begin
      lineLoader_wayToAllocate_willIncrement = 1'b1;
    end
  end

  assign lineLoader_wayToAllocate_willClear = 1'b0;
  assign lineLoader_wayToAllocate_willOverflowIfInc = 1'b1;
  assign lineLoader_wayToAllocate_willOverflow = (lineLoader_wayToAllocate_willOverflowIfInc && lineLoader_wayToAllocate_willIncrement);
  assign _zz_5_ = 1'b1;
  assign lineLoader_write_tag_0_valid = ((_zz_5_ && lineLoader_fire) || (! lineLoader_flushCounter[6]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[6] ? lineLoader_address[10 : 5] : lineLoader_flushCounter[5 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[6];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 11];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && _zz_5_);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[10 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_6_ = io_cpu_prefetch_pc[10 : 5];
  assign _zz_7_ = (! io_cpu_fetch_isStuck);
  assign _zz_8_ = _zz_12_;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_15_[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_16_[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_8_[22 : 2];
  assign _zz_9_ = io_cpu_prefetch_pc[10 : 2];
  assign _zz_10_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_0_data = _zz_13_;
  assign io_cpu_fetch_data = (io_cpu_fetch_dataBypassValid ? io_cpu_fetch_dataBypass : fetchStage_read_waysValues_0_data[31 : 0]);
  assign io_cpu_fetch_mmuBus_cmd_isValid = io_cpu_fetch_isValid;
  assign io_cpu_fetch_mmuBus_cmd_virtualAddress = io_cpu_fetch_pc;
  assign io_cpu_fetch_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_fetch_mmuBus_end = ((! io_cpu_fetch_isStuck) || io_cpu_fetch_isRemoved);
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuBus_rsp_physicalAddress;
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 11]));
  assign decodeStage_hit_valid = (decodeStage_hit_hits_0 != (1'b0));
  assign decodeStage_hit_error = decodeStage_hit_tags_0_error;
  assign decodeStage_hit_data = _zz_11_;
  always @ (*) begin
    decodeStage_hit_word = decodeStage_hit_data[31 : 0];
    if(io_cpu_fetch_dataBypassValid_regNextWhen)begin
      decodeStage_hit_word = io_cpu_fetch_dataBypass_regNextWhen;
    end
  end

  assign io_cpu_decode_data = decodeStage_hit_word;
  assign io_cpu_decode_cacheMiss = (! decodeStage_hit_valid);
  assign io_cpu_decode_error = decodeStage_hit_error;
  assign io_cpu_decode_mmuMiss = decodeStage_mmuRsp_miss;
  assign io_cpu_decode_illegalAccess = ((! decodeStage_mmuRsp_allowExecute) || (io_cpu_decode_isUser && (! decodeStage_mmuRsp_allowUser)));
  assign io_cpu_decode_physicalAddress = decodeStage_mmuRsp_physicalAddress;
  always @ (posedge clk) begin
    if(reset) begin
      lineLoader_valid <= 1'b0;
      lineLoader_hadError <= 1'b0;
      lineLoader_flushCounter <= (7'b0000000);
      lineLoader_flushFromInterface <= 1'b0;
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
      if(_zz_14_)begin
        lineLoader_flushCounter <= (lineLoader_flushCounter + (7'b0000001));
      end
      if(io_flush_cmd_valid)begin
        if(io_flush_cmd_ready)begin
          lineLoader_flushCounter <= (7'b0000000);
          lineLoader_flushFromInterface <= 1'b1;
        end
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
    _zz_3_ <= lineLoader_flushCounter[6];
    _zz_4__regNext <= _zz_4_;
    if((! io_cpu_decode_isStuck))begin
      decodeStage_mmuRsp_physicalAddress <= io_cpu_fetch_mmuBus_rsp_physicalAddress;
      decodeStage_mmuRsp_isIoAccess <= io_cpu_fetch_mmuBus_rsp_isIoAccess;
      decodeStage_mmuRsp_allowRead <= io_cpu_fetch_mmuBus_rsp_allowRead;
      decodeStage_mmuRsp_allowWrite <= io_cpu_fetch_mmuBus_rsp_allowWrite;
      decodeStage_mmuRsp_allowExecute <= io_cpu_fetch_mmuBus_rsp_allowExecute;
      decodeStage_mmuRsp_allowUser <= io_cpu_fetch_mmuBus_rsp_allowUser;
      decodeStage_mmuRsp_miss <= io_cpu_fetch_mmuBus_rsp_miss;
      decodeStage_mmuRsp_hit <= io_cpu_fetch_mmuBus_rsp_hit;
    end
    if((! io_cpu_decode_isStuck))begin
      decodeStage_hit_tags_0_valid <= fetchStage_read_waysValues_0_tag_valid;
      decodeStage_hit_tags_0_error <= fetchStage_read_waysValues_0_tag_error;
      decodeStage_hit_tags_0_address <= fetchStage_read_waysValues_0_tag_address;
    end
    if((! io_cpu_decode_isStuck))begin
      _zz_11_ <= fetchStage_read_waysValues_0_data;
    end
    if((! io_cpu_decode_isStuck))begin
      io_cpu_fetch_dataBypassValid_regNextWhen <= io_cpu_fetch_dataBypassValid;
    end
  end

  always @ (posedge clk) begin
    if((! io_cpu_decode_isStuck))begin
      io_cpu_fetch_dataBypass_regNextWhen <= io_cpu_fetch_dataBypass;
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
  reg  _zz_200_;
  wire  _zz_201_;
  wire  _zz_202_;
  wire  _zz_203_;
  wire  _zz_204_;
  wire [31:0] _zz_205_;
  wire  _zz_206_;
  wire  _zz_207_;
  wire  _zz_208_;
  wire  _zz_209_;
  wire  _zz_210_;
  wire  _zz_211_;
  wire  _zz_212_;
  wire  _zz_213_;
  wire  _zz_214_;
  wire  _zz_215_;
  reg [31:0] _zz_216_;
  reg [31:0] _zz_217_;
  reg [31:0] _zz_218_;
  wire  IBusCachedPlugin_cache_io_flush_cmd_ready;
  wire  IBusCachedPlugin_cache_io_flush_rsp;
  wire  IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  wire  IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  wire  IBusCachedPlugin_cache_io_cpu_decode_error;
  wire  IBusCachedPlugin_cache_io_cpu_decode_mmuMiss;
  wire  IBusCachedPlugin_cache_io_cpu_decode_illegalAccess;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_decode_data;
  wire  IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire [31:0] IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire  IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire [31:0] IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire [2:0] IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire  _zz_219_;
  wire  _zz_220_;
  wire  _zz_221_;
  wire  _zz_222_;
  wire  _zz_223_;
  wire  _zz_224_;
  wire  _zz_225_;
  wire  _zz_226_;
  wire  _zz_227_;
  wire  _zz_228_;
  wire  _zz_229_;
  wire  _zz_230_;
  wire  _zz_231_;
  wire [5:0] _zz_232_;
  wire  _zz_233_;
  wire  _zz_234_;
  wire [1:0] _zz_235_;
  wire [1:0] _zz_236_;
  wire  _zz_237_;
  wire [3:0] _zz_238_;
  wire [2:0] _zz_239_;
  wire [31:0] _zz_240_;
  wire [11:0] _zz_241_;
  wire [31:0] _zz_242_;
  wire [19:0] _zz_243_;
  wire [11:0] _zz_244_;
  wire [2:0] _zz_245_;
  wire [0:0] _zz_246_;
  wire [0:0] _zz_247_;
  wire [0:0] _zz_248_;
  wire [0:0] _zz_249_;
  wire [0:0] _zz_250_;
  wire [0:0] _zz_251_;
  wire [0:0] _zz_252_;
  wire [0:0] _zz_253_;
  wire [0:0] _zz_254_;
  wire [0:0] _zz_255_;
  wire [0:0] _zz_256_;
  wire [0:0] _zz_257_;
  wire [0:0] _zz_258_;
  wire [0:0] _zz_259_;
  wire [0:0] _zz_260_;
  wire [0:0] _zz_261_;
  wire [2:0] _zz_262_;
  wire [4:0] _zz_263_;
  wire [11:0] _zz_264_;
  wire [11:0] _zz_265_;
  wire [31:0] _zz_266_;
  wire [31:0] _zz_267_;
  wire [31:0] _zz_268_;
  wire [31:0] _zz_269_;
  wire [1:0] _zz_270_;
  wire [31:0] _zz_271_;
  wire [1:0] _zz_272_;
  wire [1:0] _zz_273_;
  wire [31:0] _zz_274_;
  wire [32:0] _zz_275_;
  wire [11:0] _zz_276_;
  wire [19:0] _zz_277_;
  wire [11:0] _zz_278_;
  wire [31:0] _zz_279_;
  wire [31:0] _zz_280_;
  wire [31:0] _zz_281_;
  wire [11:0] _zz_282_;
  wire [19:0] _zz_283_;
  wire [11:0] _zz_284_;
  wire [2:0] _zz_285_;
  wire [1:0] _zz_286_;
  wire [1:0] _zz_287_;
  wire [0:0] _zz_288_;
  wire [5:0] _zz_289_;
  wire [33:0] _zz_290_;
  wire [32:0] _zz_291_;
  wire [33:0] _zz_292_;
  wire [32:0] _zz_293_;
  wire [33:0] _zz_294_;
  wire [32:0] _zz_295_;
  wire [0:0] _zz_296_;
  wire [5:0] _zz_297_;
  wire [32:0] _zz_298_;
  wire [32:0] _zz_299_;
  wire [31:0] _zz_300_;
  wire [31:0] _zz_301_;
  wire [32:0] _zz_302_;
  wire [32:0] _zz_303_;
  wire [32:0] _zz_304_;
  wire [0:0] _zz_305_;
  wire [32:0] _zz_306_;
  wire [0:0] _zz_307_;
  wire [32:0] _zz_308_;
  wire [0:0] _zz_309_;
  wire [31:0] _zz_310_;
  wire [0:0] _zz_311_;
  wire [0:0] _zz_312_;
  wire [0:0] _zz_313_;
  wire [0:0] _zz_314_;
  wire [0:0] _zz_315_;
  wire [0:0] _zz_316_;
  wire [0:0] _zz_317_;
  wire [0:0] _zz_318_;
  wire [30:0] _zz_319_;
  wire [30:0] _zz_320_;
  wire [30:0] _zz_321_;
  wire [30:0] _zz_322_;
  wire [30:0] _zz_323_;
  wire [30:0] _zz_324_;
  wire [30:0] _zz_325_;
  wire [30:0] _zz_326_;
  wire [0:0] _zz_327_;
  wire [0:0] _zz_328_;
  wire [0:0] _zz_329_;
  wire [0:0] _zz_330_;
  wire [0:0] _zz_331_;
  wire [0:0] _zz_332_;
  wire [26:0] _zz_333_;
  wire [6:0] _zz_334_;
  wire  _zz_335_;
  wire  _zz_336_;
  wire [1:0] _zz_337_;
  wire [0:0] _zz_338_;
  wire [7:0] _zz_339_;
  wire  _zz_340_;
  wire [0:0] _zz_341_;
  wire [0:0] _zz_342_;
  wire [31:0] _zz_343_;
  wire  _zz_344_;
  wire [0:0] _zz_345_;
  wire [0:0] _zz_346_;
  wire [0:0] _zz_347_;
  wire [0:0] _zz_348_;
  wire [2:0] _zz_349_;
  wire [2:0] _zz_350_;
  wire  _zz_351_;
  wire [0:0] _zz_352_;
  wire [24:0] _zz_353_;
  wire [31:0] _zz_354_;
  wire [31:0] _zz_355_;
  wire [31:0] _zz_356_;
  wire [31:0] _zz_357_;
  wire [31:0] _zz_358_;
  wire [31:0] _zz_359_;
  wire  _zz_360_;
  wire  _zz_361_;
  wire [31:0] _zz_362_;
  wire [31:0] _zz_363_;
  wire [0:0] _zz_364_;
  wire [1:0] _zz_365_;
  wire [1:0] _zz_366_;
  wire [1:0] _zz_367_;
  wire  _zz_368_;
  wire [0:0] _zz_369_;
  wire [21:0] _zz_370_;
  wire [31:0] _zz_371_;
  wire [31:0] _zz_372_;
  wire [31:0] _zz_373_;
  wire [31:0] _zz_374_;
  wire [31:0] _zz_375_;
  wire [31:0] _zz_376_;
  wire [31:0] _zz_377_;
  wire [31:0] _zz_378_;
  wire [31:0] _zz_379_;
  wire [31:0] _zz_380_;
  wire [0:0] _zz_381_;
  wire [0:0] _zz_382_;
  wire [0:0] _zz_383_;
  wire [0:0] _zz_384_;
  wire  _zz_385_;
  wire [0:0] _zz_386_;
  wire [18:0] _zz_387_;
  wire [31:0] _zz_388_;
  wire [31:0] _zz_389_;
  wire [31:0] _zz_390_;
  wire [31:0] _zz_391_;
  wire [31:0] _zz_392_;
  wire [0:0] _zz_393_;
  wire [0:0] _zz_394_;
  wire [1:0] _zz_395_;
  wire [1:0] _zz_396_;
  wire  _zz_397_;
  wire [0:0] _zz_398_;
  wire [15:0] _zz_399_;
  wire [31:0] _zz_400_;
  wire [31:0] _zz_401_;
  wire [0:0] _zz_402_;
  wire [0:0] _zz_403_;
  wire [0:0] _zz_404_;
  wire [1:0] _zz_405_;
  wire [1:0] _zz_406_;
  wire [1:0] _zz_407_;
  wire  _zz_408_;
  wire [0:0] _zz_409_;
  wire [11:0] _zz_410_;
  wire [31:0] _zz_411_;
  wire [31:0] _zz_412_;
  wire [31:0] _zz_413_;
  wire  _zz_414_;
  wire [0:0] _zz_415_;
  wire [0:0] _zz_416_;
  wire [0:0] _zz_417_;
  wire [0:0] _zz_418_;
  wire  _zz_419_;
  wire [0:0] _zz_420_;
  wire [8:0] _zz_421_;
  wire [31:0] _zz_422_;
  wire [31:0] _zz_423_;
  wire  _zz_424_;
  wire [0:0] _zz_425_;
  wire [1:0] _zz_426_;
  wire [0:0] _zz_427_;
  wire [1:0] _zz_428_;
  wire [0:0] _zz_429_;
  wire [0:0] _zz_430_;
  wire  _zz_431_;
  wire [0:0] _zz_432_;
  wire [5:0] _zz_433_;
  wire [31:0] _zz_434_;
  wire [31:0] _zz_435_;
  wire [31:0] _zz_436_;
  wire  _zz_437_;
  wire  _zz_438_;
  wire [31:0] _zz_439_;
  wire [31:0] _zz_440_;
  wire  _zz_441_;
  wire  _zz_442_;
  wire [31:0] _zz_443_;
  wire [31:0] _zz_444_;
  wire [0:0] _zz_445_;
  wire [0:0] _zz_446_;
  wire [0:0] _zz_447_;
  wire [0:0] _zz_448_;
  wire  _zz_449_;
  wire [0:0] _zz_450_;
  wire [3:0] _zz_451_;
  wire [31:0] _zz_452_;
  wire [31:0] _zz_453_;
  wire [31:0] _zz_454_;
  wire [31:0] _zz_455_;
  wire [31:0] _zz_456_;
  wire [31:0] _zz_457_;
  wire [31:0] _zz_458_;
  wire [31:0] _zz_459_;
  wire [31:0] _zz_460_;
  wire [31:0] _zz_461_;
  wire [5:0] _zz_462_;
  wire [5:0] _zz_463_;
  wire  _zz_464_;
  wire [0:0] _zz_465_;
  wire [1:0] _zz_466_;
  wire [31:0] _zz_467_;
  wire [31:0] _zz_468_;
  wire  _zz_469_;
  wire [0:0] _zz_470_;
  wire [1:0] _zz_471_;
  wire [31:0] _zz_472_;
  wire [31:0] _zz_473_;
  wire  _zz_474_;
  wire [0:0] _zz_475_;
  wire [2:0] _zz_476_;
  wire  _zz_477_;
  wire [31:0] _zz_478_;
  wire [31:0] _zz_479_;
  wire [31:0] _zz_480_;
  wire [31:0] _zz_481_;
  wire [31:0] _zz_482_;
  wire [31:0] _zz_483_;
  wire [31:0] _zz_484_;
  wire [31:0] _zz_485_;
  wire  _zz_486_;
  wire  _zz_487_;
  wire  _zz_488_;
  wire  _zz_489_;
  wire  _zz_490_;
  wire  _zz_491_;
  wire  _zz_492_;
  wire  _zz_493_;
  wire [31:0] memory_PC;
  wire  execute_FLUSH_ALL;
  wire  decode_FLUSH_ALL;
  wire  decode_IS_RS1_SIGNED;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_1_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_2_;
  wire  decode_IS_CSR;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire  execute_REGFILE_WRITE_VALID;
  wire [31:0] memory_MEMORY_READ_DATA;
  wire  decode_SRC_USE_SUB_LESS;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_3_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_4_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_5_;
  wire  decode_CSR_WRITE_OPCODE;
  wire  decode_PREDICTION_HAD_BRANCHED2;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_6_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_7_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_8_;
  wire  decode_IS_MUL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_9_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_10_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_11_;
  wire  decode_IS_DIV;
  wire  decode_CSR_READ_OPCODE;
  wire  decode_MEMORY_ENABLE;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire  decode_DO_EBREAK;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_12_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_13_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_14_;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire  decode_RS1_USE;
  wire  decode_RS2_USE;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_15_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_16_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_17_;
  wire  decode_IS_RS2_SIGNED;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_18_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_19_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_20_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_21_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_22_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_23_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_24_;
  wire  execute_DO_EBREAK;
  wire  decode_IS_EBREAK;
  wire  _zz_25_;
  wire  execute_RS2_USE;
  wire  execute_RS1_USE;
  wire  memory_REGFILE_WRITE_VALID;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  wire  execute_IS_RS1_SIGNED;
  wire  execute_IS_DIV;
  wire  execute_IS_MUL;
  wire  execute_IS_RS2_SIGNED;
  wire  memory_IS_DIV;
  reg [31:0] _zz_26_;
  wire  memory_IS_MUL;
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
  wire [31:0] execute_BRANCH_CALC;
  wire  execute_BRANCH_DO;
  wire [31:0] _zz_33_;
  wire [31:0] execute_PC;
  wire  execute_PREDICTION_HAD_BRANCHED2;
  wire  _zz_34_;
  wire [31:0] execute_RS1;
  wire  execute_BRANCH_COND_RESULT;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_35_;
  wire  _zz_36_;
  wire  decode_IS_FENCEI;
  wire  _zz_37_;
  reg [31:0] _zz_38_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_39_;
  wire  _zz_40_;
  wire [31:0] _zz_41_;
  wire [31:0] _zz_42_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_43_;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_44_;
  wire [31:0] _zz_45_;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_46_;
  wire [31:0] _zz_47_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_48_;
  wire [31:0] _zz_49_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_50_;
  wire [31:0] _zz_51_;
  wire  _zz_52_;
  reg  _zz_53_;
  wire [31:0] _zz_54_;
  wire [31:0] _zz_55_;
  reg  decode_REGFILE_WRITE_VALID;
  wire  _zz_56_;
  wire  _zz_57_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_58_;
  wire  _zz_59_;
  wire  _zz_60_;
  wire  _zz_61_;
  wire  _zz_62_;
  wire  _zz_63_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_64_;
  wire  _zz_65_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_66_;
  wire  _zz_67_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_68_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_69_;
  wire  _zz_70_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_71_;
  wire  _zz_72_;
  wire  _zz_73_;
  wire  _zz_74_;
  wire  _zz_75_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_76_;
  wire  _zz_77_;
  reg [31:0] _zz_78_;
  wire  writeBack_MEMORY_ENABLE;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [31:0] writeBack_MEMORY_READ_DATA;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire  memory_ALIGNEMENT_FAULT;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_MEMORY_ENABLE;
  wire [31:0] _zz_79_;
  wire [1:0] _zz_80_;
  wire [31:0] execute_RS2;
  wire [31:0] execute_SRC_ADD;
  wire [31:0] execute_INSTRUCTION;
  wire  execute_ALIGNEMENT_FAULT;
  wire  execute_MEMORY_ENABLE;
  wire  _zz_81_;
  wire  memory_FLUSH_ALL;
  reg  IBusCachedPlugin_rsp_issueDetected;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_82_;
  reg [31:0] _zz_83_;
  reg [31:0] _zz_84_;
  wire [31:0] _zz_85_;
  wire [31:0] _zz_86_;
  wire [31:0] _zz_87_;
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
  reg  _zz_88_;
  reg  _zz_89_;
  reg  _zz_90_;
  wire  _zz_91_;
  wire [31:0] _zz_92_;
  wire  _zz_93_;
  wire  _zz_94_;
  wire [31:0] _zz_95_;
  wire [31:0] _zz_96_;
  reg  memory_exception_agregat_valid;
  wire [3:0] memory_exception_agregat_payload_code;
  wire [31:0] memory_exception_agregat_payload_badAddr;
  wire  _zz_97_;
  wire [31:0] _zz_98_;
  reg  _zz_99_;
  reg  _zz_100_;
  reg [31:0] _zz_101_;
  wire  externalInterrupt;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  _zz_102_;
  reg [3:0] _zz_103_;
  reg  _zz_104_;
  reg  _zz_105_;
  reg  _zz_106_;
  reg  _zz_107_;
  wire  IBusCachedPlugin_jump_pcLoad_valid;
  wire [31:0] IBusCachedPlugin_jump_pcLoad_payload;
  wire [3:0] _zz_108_;
  wire [3:0] _zz_109_;
  wire  _zz_110_;
  wire  _zz_111_;
  wire  _zz_112_;
  wire  IBusCachedPlugin_fetchPc_preOutput_valid;
  wire  IBusCachedPlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_preOutput_payload;
  wire  _zz_113_;
  wire  IBusCachedPlugin_fetchPc_output_valid;
  wire  IBusCachedPlugin_fetchPc_output_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_output_payload;
  reg [31:0] IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusCachedPlugin_fetchPc_inc;
  reg  IBusCachedPlugin_fetchPc_propagatePc;
  reg [31:0] IBusCachedPlugin_fetchPc_pc;
  reg  IBusCachedPlugin_fetchPc_samplePcNext;
  reg  _zz_114_;
  wire  IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire  IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg  IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire  IBusCachedPlugin_iBusRsp_stages_0_inputSample;
  wire  IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire  IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire  IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg  IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire  IBusCachedPlugin_iBusRsp_stages_1_inputSample;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  reg  IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt;
  wire  IBusCachedPlugin_iBusRsp_cacheRspArbitration_inputSample;
  wire  _zz_115_;
  wire  _zz_116_;
  wire  _zz_117_;
  wire  _zz_118_;
  wire  _zz_119_;
  reg  _zz_120_;
  wire  _zz_121_;
  reg  _zz_122_;
  reg [31:0] _zz_123_;
  wire  IBusCachedPlugin_iBusRsp_readyForError;
  wire  IBusCachedPlugin_iBusRsp_decodeInput_valid;
  wire  IBusCachedPlugin_iBusRsp_decodeInput_ready;
  wire [31:0] IBusCachedPlugin_iBusRsp_decodeInput_payload_pc;
  wire  IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_error;
  wire [31:0] IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_inst;
  wire  IBusCachedPlugin_iBusRsp_decodeInput_payload_isRvc;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg  IBusCachedPlugin_injector_nextPcCalc_valids_4;
  reg  IBusCachedPlugin_injector_decodeRemoved;
  wire  _zz_124_;
  reg [18:0] _zz_125_;
  wire  _zz_126_;
  reg [10:0] _zz_127_;
  wire  _zz_128_;
  reg [18:0] _zz_129_;
  wire  iBus_cmd_valid;
  wire  iBus_cmd_ready;
  reg [31:0] iBus_cmd_payload_address;
  wire [2:0] iBus_cmd_payload_size;
  wire  iBus_rsp_valid;
  wire [31:0] iBus_rsp_payload_data;
  wire  iBus_rsp_payload_error;
  wire  IBusCachedPlugin_s0_tightlyCoupledHit;
  reg  IBusCachedPlugin_s1_tightlyCoupledHit;
  reg  IBusCachedPlugin_s2_tightlyCoupledHit;
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
  wire  execute_DBusSimplePlugin_cmdSent;
  reg [31:0] _zz_130_;
  reg [3:0] _zz_131_;
  wire [3:0] execute_DBusSimplePlugin_formalMask;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  wire  _zz_132_;
  reg [31:0] _zz_133_;
  wire  _zz_134_;
  reg [31:0] _zz_135_;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  wire [30:0] _zz_136_;
  wire  _zz_137_;
  wire  _zz_138_;
  wire  _zz_139_;
  wire  _zz_140_;
  wire  _zz_141_;
  wire  _zz_142_;
  wire  _zz_143_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_144_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_145_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_146_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_147_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_148_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_149_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_150_;
  wire [31:0] execute_RegFilePlugin_srcInstruction;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_151_;
  reg [31:0] _zz_152_;
  wire  _zz_153_;
  reg [19:0] _zz_154_;
  wire  _zz_155_;
  reg [19:0] _zz_156_;
  reg [31:0] _zz_157_;
  wire [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  reg  execute_LightShifterPlugin_isActive;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire  execute_LightShifterPlugin_done;
  reg [31:0] _zz_158_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_159_;
  reg  _zz_160_;
  reg  _zz_161_;
  wire  _zz_162_;
  reg [19:0] _zz_163_;
  wire  _zz_164_;
  reg [10:0] _zz_165_;
  wire  _zz_166_;
  reg [18:0] _zz_167_;
  reg  _zz_168_;
  wire  execute_BranchPlugin_missAlignedTarget;
  reg [31:0] execute_BranchPlugin_branch_src1;
  reg [31:0] execute_BranchPlugin_branch_src2;
  wire  _zz_169_;
  reg [19:0] _zz_170_;
  wire  _zz_171_;
  reg [10:0] _zz_172_;
  wire  _zz_173_;
  reg [18:0] _zz_174_;
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
  wire  _zz_175_;
  wire  _zz_176_;
  wire  _zz_177_;
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
  wire [1:0] _zz_178_;
  wire  _zz_179_;
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
  reg [32:0] memory_MulDivIterativePlugin_rs1;
  reg [31:0] memory_MulDivIterativePlugin_rs2;
  reg [64:0] memory_MulDivIterativePlugin_accumulator;
  reg  memory_MulDivIterativePlugin_mul_counter_willIncrement;
  reg  memory_MulDivIterativePlugin_mul_counter_willClear;
  reg [5:0] memory_MulDivIterativePlugin_mul_counter_valueNext;
  reg [5:0] memory_MulDivIterativePlugin_mul_counter_value;
  wire  memory_MulDivIterativePlugin_mul_willOverflowIfInc;
  wire  memory_MulDivIterativePlugin_mul_counter_willOverflow;
  reg  memory_MulDivIterativePlugin_div_needRevert;
  reg  memory_MulDivIterativePlugin_div_counter_willIncrement;
  reg  memory_MulDivIterativePlugin_div_counter_willClear;
  reg [5:0] memory_MulDivIterativePlugin_div_counter_valueNext;
  reg [5:0] memory_MulDivIterativePlugin_div_counter_value;
  wire  memory_MulDivIterativePlugin_div_counter_willOverflowIfInc;
  wire  memory_MulDivIterativePlugin_div_counter_willOverflow;
  reg  memory_MulDivIterativePlugin_div_done;
  reg [31:0] memory_MulDivIterativePlugin_div_result;
  wire [31:0] _zz_180_;
  wire [32:0] _zz_181_;
  wire [32:0] _zz_182_;
  wire [31:0] _zz_183_;
  wire  _zz_184_;
  wire  _zz_185_;
  reg [32:0] _zz_186_;
  reg  _zz_187_;
  reg  _zz_188_;
  wire  _zz_189_;
  reg  _zz_190_;
  reg [4:0] _zz_191_;
  reg [31:0] _zz_192_;
  reg [31:0] externalInterruptArray_regNext;
  wire [31:0] _zz_193_;
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
  reg  _zz_194_;
  reg  DebugPlugin_resetIt_regNext;
  reg  execute_to_memory_ALIGNEMENT_FAULT;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg  decode_to_execute_RS2_USE;
  reg  decode_to_execute_RS1_USE;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_DO_EBREAK;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg  decode_to_execute_IS_DIV;
  reg  execute_to_memory_IS_DIV;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg  decode_to_execute_IS_MUL;
  reg  execute_to_memory_IS_MUL;
  reg  decode_to_execute_IS_FENCEI;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg  decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg [31:0] memory_to_writeBack_MEMORY_READ_DATA;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg  decode_to_execute_IS_CSR;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg  decode_to_execute_FLUSH_ALL;
  reg  execute_to_memory_FLUSH_ALL;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg [2:0] _zz_195_;
  reg [31:0] _zz_196_;
  reg [2:0] _zz_197_;
  reg  _zz_198_;
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
  reg [3:0] _zz_199_;
  `ifndef SYNTHESIS
  reg [31:0] _zz_1__string;
  reg [31:0] _zz_2__string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_3__string;
  reg [23:0] _zz_4__string;
  reg [23:0] _zz_5__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_6__string;
  reg [71:0] _zz_7__string;
  reg [71:0] _zz_8__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_9__string;
  reg [39:0] _zz_10__string;
  reg [39:0] _zz_11__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_12__string;
  reg [63:0] _zz_13__string;
  reg [63:0] _zz_14__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_15__string;
  reg [95:0] _zz_16__string;
  reg [95:0] _zz_17__string;
  reg [47:0] _zz_18__string;
  reg [47:0] _zz_19__string;
  reg [47:0] _zz_20__string;
  reg [47:0] _zz_21__string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_22__string;
  reg [47:0] _zz_23__string;
  reg [47:0] _zz_24__string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_27__string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_28__string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_31__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_35__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_39__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_44__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_46__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_48__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_50__string;
  reg [71:0] _zz_58__string;
  reg [47:0] _zz_64__string;
  reg [39:0] _zz_66__string;
  reg [95:0] _zz_68__string;
  reg [31:0] _zz_69__string;
  reg [63:0] _zz_71__string;
  reg [23:0] _zz_76__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_82__string;
  reg [23:0] _zz_144__string;
  reg [63:0] _zz_145__string;
  reg [31:0] _zz_146__string;
  reg [95:0] _zz_147__string;
  reg [39:0] _zz_148__string;
  reg [47:0] _zz_149__string;
  reg [71:0] _zz_150__string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_219_ = (memory_arbitration_isValid && memory_IS_MUL);
  assign _zz_220_ = (! memory_MulDivIterativePlugin_mul_willOverflowIfInc);
  assign _zz_221_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_222_ = (! memory_MulDivIterativePlugin_div_done);
  assign _zz_223_ = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _zz_224_ = (! execute_arbitration_isStuckByOthers);
  assign _zz_225_ = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_226_ = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign _zz_227_ = (DebugPlugin_stepIt && _zz_90_);
  assign _zz_228_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_229_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_230_ = (IBusCachedPlugin_fetchPc_preOutput_valid && IBusCachedPlugin_fetchPc_preOutput_ready);
  assign _zz_231_ = (! memory_arbitration_isStuck);
  assign _zz_232_ = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_233_ = (iBus_cmd_valid || (_zz_197_ != (3'b000)));
  assign _zz_234_ = (! dBus_cmd_halfPipe_regs_valid);
  assign _zz_235_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_236_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_237_ = execute_INSTRUCTION[13];
  assign _zz_238_ = (_zz_108_ - (4'b0001));
  assign _zz_239_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign _zz_240_ = {29'd0, _zz_239_};
  assign _zz_241_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_242_ = {{_zz_125_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_243_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_244_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_245_ = (memory_INSTRUCTION[5] ? (3'b110) : (3'b100));
  assign _zz_246_ = _zz_136_[0 : 0];
  assign _zz_247_ = _zz_136_[4 : 4];
  assign _zz_248_ = _zz_136_[5 : 5];
  assign _zz_249_ = _zz_136_[6 : 6];
  assign _zz_250_ = _zz_136_[7 : 7];
  assign _zz_251_ = _zz_136_[10 : 10];
  assign _zz_252_ = _zz_136_[15 : 15];
  assign _zz_253_ = _zz_136_[18 : 18];
  assign _zz_254_ = _zz_136_[21 : 21];
  assign _zz_255_ = _zz_136_[22 : 22];
  assign _zz_256_ = _zz_136_[23 : 23];
  assign _zz_257_ = _zz_136_[24 : 24];
  assign _zz_258_ = _zz_136_[26 : 26];
  assign _zz_259_ = _zz_136_[29 : 29];
  assign _zz_260_ = _zz_136_[30 : 30];
  assign _zz_261_ = execute_SRC_LESS;
  assign _zz_262_ = (3'b100);
  assign _zz_263_ = execute_INSTRUCTION[19 : 15];
  assign _zz_264_ = execute_INSTRUCTION[31 : 20];
  assign _zz_265_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_266_ = ($signed(_zz_267_) + $signed(_zz_271_));
  assign _zz_267_ = ($signed(_zz_268_) + $signed(_zz_269_));
  assign _zz_268_ = execute_SRC1;
  assign _zz_269_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_270_ = (execute_SRC_USE_SUB_LESS ? _zz_272_ : _zz_273_);
  assign _zz_271_ = {{30{_zz_270_[1]}}, _zz_270_};
  assign _zz_272_ = (2'b01);
  assign _zz_273_ = (2'b00);
  assign _zz_274_ = (_zz_275_ >>> 1);
  assign _zz_275_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_276_ = execute_INSTRUCTION[31 : 20];
  assign _zz_277_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_278_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_279_ = {_zz_163_,execute_INSTRUCTION[31 : 20]};
  assign _zz_280_ = {{_zz_165_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_281_ = {{_zz_167_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_282_ = execute_INSTRUCTION[31 : 20];
  assign _zz_283_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_284_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_285_ = (3'b100);
  assign _zz_286_ = (_zz_178_ & (~ _zz_287_));
  assign _zz_287_ = (_zz_178_ - (2'b01));
  assign _zz_288_ = memory_MulDivIterativePlugin_mul_counter_willIncrement;
  assign _zz_289_ = {5'd0, _zz_288_};
  assign _zz_290_ = (_zz_292_ + _zz_294_);
  assign _zz_291_ = (memory_MulDivIterativePlugin_rs2[0] ? memory_MulDivIterativePlugin_rs1 : (33'b000000000000000000000000000000000));
  assign _zz_292_ = {{1{_zz_291_[32]}}, _zz_291_};
  assign _zz_293_ = _zz_295_;
  assign _zz_294_ = {{1{_zz_293_[32]}}, _zz_293_};
  assign _zz_295_ = (memory_MulDivIterativePlugin_accumulator >>> 32);
  assign _zz_296_ = memory_MulDivIterativePlugin_div_counter_willIncrement;
  assign _zz_297_ = {5'd0, _zz_296_};
  assign _zz_298_ = {1'd0, memory_MulDivIterativePlugin_rs2};
  assign _zz_299_ = {_zz_180_,(! _zz_182_[32])};
  assign _zz_300_ = _zz_182_[31:0];
  assign _zz_301_ = _zz_181_[31:0];
  assign _zz_302_ = _zz_303_;
  assign _zz_303_ = _zz_304_;
  assign _zz_304_ = ({1'b0,(memory_MulDivIterativePlugin_div_needRevert ? (~ _zz_183_) : _zz_183_)} + _zz_306_);
  assign _zz_305_ = memory_MulDivIterativePlugin_div_needRevert;
  assign _zz_306_ = {32'd0, _zz_305_};
  assign _zz_307_ = _zz_185_;
  assign _zz_308_ = {32'd0, _zz_307_};
  assign _zz_309_ = _zz_184_;
  assign _zz_310_ = {31'd0, _zz_309_};
  assign _zz_311_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_312_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_313_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_314_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_315_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_316_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_317_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_318_ = debug_bus_cmd_payload_data[0 : 0];
  assign _zz_319_ = (decode_PC >>> 1);
  assign _zz_320_ = (decode_PC >>> 1);
  assign _zz_321_ = (decode_PC >>> 1);
  assign _zz_322_ = (decode_PC >>> 1);
  assign _zz_323_ = (decode_PC >>> 1);
  assign _zz_324_ = (decode_PC >>> 1);
  assign _zz_325_ = (decode_PC >>> 1);
  assign _zz_326_ = (decode_PC >>> 1);
  assign _zz_327_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_328_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_329_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_330_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_331_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_332_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_333_ = (iBus_cmd_payload_address >>> 5);
  assign _zz_334_ = ({3'd0,_zz_199_} <<< dBus_cmd_halfPipe_payload_address[1 : 0]);
  assign _zz_335_ = 1'b1;
  assign _zz_336_ = 1'b1;
  assign _zz_337_ = {_zz_112_,_zz_111_};
  assign _zz_338_ = decode_INSTRUCTION[31];
  assign _zz_339_ = decode_INSTRUCTION[19 : 12];
  assign _zz_340_ = decode_INSTRUCTION[20];
  assign _zz_341_ = decode_INSTRUCTION[31];
  assign _zz_342_ = decode_INSTRUCTION[7];
  assign _zz_343_ = (32'b00000000000000000100000001001000);
  assign _zz_344_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000001000000));
  assign _zz_345_ = ((decode_INSTRUCTION & _zz_354_) == (32'b01000000000000000000000000110000));
  assign _zz_346_ = ((decode_INSTRUCTION & _zz_355_) == (32'b00000000000000000010000000010000));
  assign _zz_347_ = ((decode_INSTRUCTION & _zz_356_) == (32'b00000000000000000101000000010000));
  assign _zz_348_ = ((decode_INSTRUCTION & _zz_357_) == (32'b00000000000000000101000000100000));
  assign _zz_349_ = {(_zz_358_ == _zz_359_),{_zz_360_,_zz_361_}};
  assign _zz_350_ = (3'b000);
  assign _zz_351_ = ((_zz_362_ == _zz_363_) != (1'b0));
  assign _zz_352_ = ({_zz_364_,_zz_365_} != (3'b000));
  assign _zz_353_ = {(_zz_366_ != _zz_367_),{_zz_368_,{_zz_369_,_zz_370_}}};
  assign _zz_354_ = (32'b01000000000000000000000000110000);
  assign _zz_355_ = (32'b00000000000000000010000000010100);
  assign _zz_356_ = (32'b00000000000000000111000000110100);
  assign _zz_357_ = (32'b00000010000000000111000001100100);
  assign _zz_358_ = (decode_INSTRUCTION & (32'b01000000000000000011000001010100));
  assign _zz_359_ = (32'b01000000000000000001000000010000);
  assign _zz_360_ = ((decode_INSTRUCTION & (32'b00000000000000000111000000110100)) == (32'b00000000000000000001000000010000));
  assign _zz_361_ = ((decode_INSTRUCTION & (32'b00000010000000000111000001010100)) == (32'b00000000000000000001000000010000));
  assign _zz_362_ = (decode_INSTRUCTION & (32'b00000010000000000100000001100100));
  assign _zz_363_ = (32'b00000010000000000100000000100000);
  assign _zz_364_ = _zz_137_;
  assign _zz_365_ = {(_zz_371_ == _zz_372_),(_zz_373_ == _zz_374_)};
  assign _zz_366_ = {(_zz_375_ == _zz_376_),(_zz_377_ == _zz_378_)};
  assign _zz_367_ = (2'b00);
  assign _zz_368_ = ((_zz_379_ == _zz_380_) != (1'b0));
  assign _zz_369_ = ({_zz_381_,_zz_382_} != (2'b00));
  assign _zz_370_ = {(_zz_383_ != _zz_384_),{_zz_385_,{_zz_386_,_zz_387_}}};
  assign _zz_371_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110000));
  assign _zz_372_ = (32'b00000000000000000000000000010000);
  assign _zz_373_ = (decode_INSTRUCTION & (32'b00000010000000000000000001100000));
  assign _zz_374_ = (32'b00000000000000000000000000100000);
  assign _zz_375_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_376_ = (32'b00000000000000000010000000000000);
  assign _zz_377_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_378_ = (32'b00000000000000000001000000000000);
  assign _zz_379_ = (decode_INSTRUCTION & (32'b00000010000000000100000001110100));
  assign _zz_380_ = (32'b00000010000000000000000000110000);
  assign _zz_381_ = ((decode_INSTRUCTION & _zz_388_) == (32'b00000000000000000000000000100000));
  assign _zz_382_ = ((decode_INSTRUCTION & _zz_389_) == (32'b00000000000000000000000000100000));
  assign _zz_383_ = ((decode_INSTRUCTION & _zz_390_) == (32'b00000000000000000000000000000000));
  assign _zz_384_ = (1'b0);
  assign _zz_385_ = ((_zz_391_ == _zz_392_) != (1'b0));
  assign _zz_386_ = ({_zz_393_,_zz_394_} != (2'b00));
  assign _zz_387_ = {(_zz_395_ != _zz_396_),{_zz_397_,{_zz_398_,_zz_399_}}};
  assign _zz_388_ = (32'b00000000000000000000000000110100);
  assign _zz_389_ = (32'b00000000000000000000000001100100);
  assign _zz_390_ = (32'b00000000000000000000000001011000);
  assign _zz_391_ = (decode_INSTRUCTION & (32'b00010000000000000011000001010000));
  assign _zz_392_ = (32'b00000000000000000000000001010000);
  assign _zz_393_ = _zz_139_;
  assign _zz_394_ = ((decode_INSTRUCTION & (32'b00010000010000000011000001010000)) == (32'b00010000000000000000000001010000));
  assign _zz_395_ = {_zz_143_,_zz_141_};
  assign _zz_396_ = (2'b00);
  assign _zz_397_ = ({(_zz_400_ == _zz_401_),_zz_137_} != (2'b00));
  assign _zz_398_ = ({_zz_137_,{_zz_402_,_zz_403_}} != (3'b000));
  assign _zz_399_ = {({_zz_404_,_zz_405_} != (3'b000)),{(_zz_406_ != _zz_407_),{_zz_408_,{_zz_409_,_zz_410_}}}};
  assign _zz_400_ = (decode_INSTRUCTION & (32'b00000000000000000001000000000000));
  assign _zz_401_ = (32'b00000000000000000001000000000000);
  assign _zz_402_ = ((decode_INSTRUCTION & _zz_411_) == (32'b00000000000000000001000000000000));
  assign _zz_403_ = _zz_142_;
  assign _zz_404_ = _zz_143_;
  assign _zz_405_ = {_zz_142_,_zz_141_};
  assign _zz_406_ = {(_zz_412_ == _zz_413_),_zz_140_};
  assign _zz_407_ = (2'b00);
  assign _zz_408_ = ({_zz_414_,_zz_140_} != (2'b00));
  assign _zz_409_ = ({_zz_415_,_zz_416_} != (2'b00));
  assign _zz_410_ = {(_zz_417_ != _zz_418_),{_zz_419_,{_zz_420_,_zz_421_}}};
  assign _zz_411_ = (32'b00000000000000000011000000000000);
  assign _zz_412_ = (decode_INSTRUCTION & (32'b00000000000000000000000000010100));
  assign _zz_413_ = (32'b00000000000000000000000000000100);
  assign _zz_414_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000000000100));
  assign _zz_415_ = _zz_138_;
  assign _zz_416_ = ((decode_INSTRUCTION & _zz_422_) == (32'b00000000000000000000000000000100));
  assign _zz_417_ = ((decode_INSTRUCTION & _zz_423_) == (32'b00000000000000000000000001000000));
  assign _zz_418_ = (1'b0);
  assign _zz_419_ = ({_zz_424_,{_zz_425_,_zz_426_}} != (4'b0000));
  assign _zz_420_ = ({_zz_427_,_zz_428_} != (3'b000));
  assign _zz_421_ = {(_zz_429_ != _zz_430_),{_zz_431_,{_zz_432_,_zz_433_}}};
  assign _zz_422_ = (32'b00000000000000000100000000010100);
  assign _zz_423_ = (32'b00000000000000000000000001011000);
  assign _zz_424_ = ((decode_INSTRUCTION & _zz_434_) == (32'b00000000000000000000000000000000));
  assign _zz_425_ = (_zz_435_ == _zz_436_);
  assign _zz_426_ = {_zz_437_,_zz_438_};
  assign _zz_427_ = (_zz_439_ == _zz_440_);
  assign _zz_428_ = {_zz_441_,_zz_442_};
  assign _zz_429_ = (_zz_443_ == _zz_444_);
  assign _zz_430_ = (1'b0);
  assign _zz_431_ = ({_zz_445_,_zz_446_} != (2'b00));
  assign _zz_432_ = (_zz_447_ != _zz_448_);
  assign _zz_433_ = {_zz_449_,{_zz_450_,_zz_451_}};
  assign _zz_434_ = (32'b00000000000000000000000001000100);
  assign _zz_435_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign _zz_436_ = (32'b00000000000000000000000000000000);
  assign _zz_437_ = ((decode_INSTRUCTION & _zz_452_) == (32'b00000000000000000010000000000000));
  assign _zz_438_ = ((decode_INSTRUCTION & _zz_453_) == (32'b00000000000000000001000000000000));
  assign _zz_439_ = (decode_INSTRUCTION & (32'b00000000000000000000000001100100));
  assign _zz_440_ = (32'b00000000000000000000000000100100);
  assign _zz_441_ = ((decode_INSTRUCTION & _zz_454_) == (32'b00000000000000000100000000010000));
  assign _zz_442_ = ((decode_INSTRUCTION & _zz_455_) == (32'b00000000000000000001000000010000));
  assign _zz_443_ = (decode_INSTRUCTION & (32'b00000000000000000110000000010100));
  assign _zz_444_ = (32'b00000000000000000010000000010000);
  assign _zz_445_ = (_zz_456_ == _zz_457_);
  assign _zz_446_ = (_zz_458_ == _zz_459_);
  assign _zz_447_ = (_zz_460_ == _zz_461_);
  assign _zz_448_ = (1'b0);
  assign _zz_449_ = (_zz_139_ != (1'b0));
  assign _zz_450_ = (_zz_462_ != _zz_463_);
  assign _zz_451_ = {_zz_464_,{_zz_465_,_zz_466_}};
  assign _zz_452_ = (32'b00000000000000000110000000000100);
  assign _zz_453_ = (32'b00000000000000000101000000000100);
  assign _zz_454_ = (32'b00000000000000000100000000010100);
  assign _zz_455_ = (32'b00000000000000000011000000010100);
  assign _zz_456_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_457_ = (32'b00000000000000000001000001010000);
  assign _zz_458_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_459_ = (32'b00000000000000000010000001010000);
  assign _zz_460_ = (decode_INSTRUCTION & (32'b00000000000000000001000001001000));
  assign _zz_461_ = (32'b00000000000000000000000000001000);
  assign _zz_462_ = {_zz_138_,{(_zz_467_ == _zz_468_),{_zz_469_,{_zz_470_,_zz_471_}}}};
  assign _zz_463_ = (6'b000000);
  assign _zz_464_ = ({_zz_137_,(_zz_472_ == _zz_473_)} != (2'b00));
  assign _zz_465_ = ({_zz_137_,_zz_474_} != (2'b00));
  assign _zz_466_ = {({_zz_475_,_zz_476_} != (4'b0000)),(_zz_477_ != (1'b0))};
  assign _zz_467_ = (decode_INSTRUCTION & (32'b00000000000000000001000000010000));
  assign _zz_468_ = (32'b00000000000000000001000000010000);
  assign _zz_469_ = ((decode_INSTRUCTION & (32'b00000000000000000010000000010000)) == (32'b00000000000000000010000000010000));
  assign _zz_470_ = ((decode_INSTRUCTION & _zz_478_) == (32'b00000000000000000000000000010000));
  assign _zz_471_ = {(_zz_479_ == _zz_480_),(_zz_481_ == _zz_482_)};
  assign _zz_472_ = (decode_INSTRUCTION & (32'b00000000000000000000000001110000));
  assign _zz_473_ = (32'b00000000000000000000000000100000);
  assign _zz_474_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _zz_475_ = ((decode_INSTRUCTION & _zz_483_) == (32'b00000000000000000000000001000000));
  assign _zz_476_ = {(_zz_484_ == _zz_485_),{_zz_486_,_zz_487_}};
  assign _zz_477_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000010000)) == (32'b00000000000000000000000000010000));
  assign _zz_478_ = (32'b00000000000000000000000001010000);
  assign _zz_479_ = (decode_INSTRUCTION & (32'b00000000000000000000000000101000));
  assign _zz_480_ = (32'b00000000000000000000000000000000);
  assign _zz_481_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000100));
  assign _zz_482_ = (32'b00000000000000000000000000000100);
  assign _zz_483_ = (32'b00000000000000000000000001010000);
  assign _zz_484_ = (decode_INSTRUCTION & (32'b00000000000000000100000000011000));
  assign _zz_485_ = (32'b00000000000000000100000000000000);
  assign _zz_486_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000110000)) == (32'b00000000000000000000000000000000));
  assign _zz_487_ = ((decode_INSTRUCTION & (32'b00000000010000000011000001000000)) == (32'b00000000000000000000000001000000));
  assign _zz_488_ = execute_INSTRUCTION[31];
  assign _zz_489_ = execute_INSTRUCTION[31];
  assign _zz_490_ = execute_INSTRUCTION[7];
  assign _zz_491_ = ((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_319_))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_320_)));
  assign _zz_492_ = (DebugPlugin_hardwareBreakpoints_2_valid && (DebugPlugin_hardwareBreakpoints_2_pc == _zz_321_));
  assign _zz_493_ = (DebugPlugin_hardwareBreakpoints_3_pc == _zz_322_);
  always @ (posedge clk) begin
    if(_zz_53_) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_335_) begin
      _zz_216_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_336_) begin
      _zz_217_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  InstructionCache IBusCachedPlugin_cache ( 
    .io_flush_cmd_valid(_zz_200_),
    .io_flush_cmd_ready(IBusCachedPlugin_cache_io_flush_cmd_ready),
    .io_flush_rsp(IBusCachedPlugin_cache_io_flush_rsp),
    .io_cpu_prefetch_isValid(_zz_201_),
    .io_cpu_prefetch_haltIt(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt),
    .io_cpu_prefetch_pc(IBusCachedPlugin_iBusRsp_stages_0_input_payload),
    .io_cpu_fetch_isValid(_zz_202_),
    .io_cpu_fetch_isStuck(_zz_203_),
    .io_cpu_fetch_isRemoved(_zz_204_),
    .io_cpu_fetch_pc(IBusCachedPlugin_iBusRsp_stages_1_input_payload),
    .io_cpu_fetch_data(IBusCachedPlugin_cache_io_cpu_fetch_data),
    .io_cpu_fetch_dataBypassValid(IBusCachedPlugin_s1_tightlyCoupledHit),
    .io_cpu_fetch_dataBypass(_zz_205_),
    .io_cpu_fetch_mmuBus_cmd_isValid(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid),
    .io_cpu_fetch_mmuBus_cmd_virtualAddress(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress),
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation),
    .io_cpu_fetch_mmuBus_rsp_physicalAddress(_zz_96_),
    .io_cpu_fetch_mmuBus_rsp_isIoAccess(_zz_206_),
    .io_cpu_fetch_mmuBus_rsp_allowRead(_zz_207_),
    .io_cpu_fetch_mmuBus_rsp_allowWrite(_zz_208_),
    .io_cpu_fetch_mmuBus_rsp_allowExecute(_zz_209_),
    .io_cpu_fetch_mmuBus_rsp_allowUser(_zz_210_),
    .io_cpu_fetch_mmuBus_rsp_miss(_zz_211_),
    .io_cpu_fetch_mmuBus_rsp_hit(_zz_212_),
    .io_cpu_fetch_mmuBus_end(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end),
    .io_cpu_fetch_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_cpu_decode_isValid(_zz_213_),
    .io_cpu_decode_isStuck(_zz_214_),
    .io_cpu_decode_pc(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload),
    .io_cpu_decode_physicalAddress(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_cpu_decode_data(IBusCachedPlugin_cache_io_cpu_decode_data),
    .io_cpu_decode_cacheMiss(IBusCachedPlugin_cache_io_cpu_decode_cacheMiss),
    .io_cpu_decode_error(IBusCachedPlugin_cache_io_cpu_decode_error),
    .io_cpu_decode_mmuMiss(IBusCachedPlugin_cache_io_cpu_decode_mmuMiss),
    .io_cpu_decode_illegalAccess(IBusCachedPlugin_cache_io_cpu_decode_illegalAccess),
    .io_cpu_decode_isUser(_zz_215_),
    .io_cpu_fill_valid(IBusCachedPlugin_rsp_redoFetch),
    .io_cpu_fill_payload(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
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
    case(_zz_337_)
      2'b00 : begin
        _zz_218_ = _zz_101_;
      end
      2'b01 : begin
        _zz_218_ = _zz_98_;
      end
      2'b10 : begin
        _zz_218_ = _zz_95_;
      end
      default : begin
        _zz_218_ = _zz_92_;
      end
    endcase
  end

  `ifndef SYNTHESIS
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
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
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
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
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
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_12__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_12__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_12__string = "BITWISE ";
      default : _zz_12__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_13__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_13__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_13__string = "BITWISE ";
      default : _zz_13__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_14__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_14__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_14__string = "BITWISE ";
      default : _zz_14__string = "????????";
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
    case(_zz_15_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_15__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_15__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_15__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_15__string = "URS1        ";
      default : _zz_15__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_16__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_16__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_16__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_16__string = "URS1        ";
      default : _zz_16__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_17__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_17__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_17__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_17__string = "URS1        ";
      default : _zz_17__string = "????????????";
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
    case(_zz_21_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_21__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_21__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_21__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_21__string = "EBREAK";
      default : _zz_21__string = "??????";
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
    case(_zz_22_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_22__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_22__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_22__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_22__string = "EBREAK";
      default : _zz_22__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_23_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_23__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_23__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_23__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_23__string = "EBREAK";
      default : _zz_23__string = "??????";
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
    case(_zz_35_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_35__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_35__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_35__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_35__string = "JALR";
      default : _zz_35__string = "????";
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
    case(_zz_39_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_39__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_39__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_39__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_39__string = "SRA_1    ";
      default : _zz_39__string = "?????????";
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
    case(_zz_44_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_44__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_44__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_44__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_44__string = "PC ";
      default : _zz_44__string = "???";
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
    case(_zz_46_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_46__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_46__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_46__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_46__string = "URS1        ";
      default : _zz_46__string = "????????????";
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
    case(_zz_48_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_48__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_48__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_48__string = "BITWISE ";
      default : _zz_48__string = "????????";
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
    case(_zz_50_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_50__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_50__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_50__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_50__string = "SRC1 ";
      default : _zz_50__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_58_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_58__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_58__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_58__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_58__string = "SRA_1    ";
      default : _zz_58__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_64_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_64__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_64__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_64__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_64__string = "EBREAK";
      default : _zz_64__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_66_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_66__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_66__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_66__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_66__string = "SRC1 ";
      default : _zz_66__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_68_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_68__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_68__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_68__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_68__string = "URS1        ";
      default : _zz_68__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_69_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_69__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_69__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_69__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_69__string = "JALR";
      default : _zz_69__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_71_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_71__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_71__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_71__string = "BITWISE ";
      default : _zz_71__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_76_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_76__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_76__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_76__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_76__string = "PC ";
      default : _zz_76__string = "???";
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
    case(_zz_82_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_82__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_82__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_82__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_82__string = "JALR";
      default : _zz_82__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_144_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_144__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_144__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_144__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_144__string = "PC ";
      default : _zz_144__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_145_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_145__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_145__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_145__string = "BITWISE ";
      default : _zz_145__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_146_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_146__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_146__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_146__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_146__string = "JALR";
      default : _zz_146__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_147_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_147__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_147__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_147__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_147__string = "URS1        ";
      default : _zz_147__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_148_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_148__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_148__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_148__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_148__string = "SRC1 ";
      default : _zz_148__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_149_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_149__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_149__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_149__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_149__string = "EBREAK";
      default : _zz_149__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_150_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_150__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_150__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_150__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_150__string = "SRA_1    ";
      default : _zz_150__string = "?????????";
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
    case(decode_to_execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_to_execute_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_to_execute_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_to_execute_SRC1_CTRL_string = "URS1        ";
      default : decode_to_execute_SRC1_CTRL_string = "????????????";
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
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : decode_to_execute_ALU_BITWISE_CTRL_string = "SRC1 ";
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
    case(decode_to_execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_to_execute_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_to_execute_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_to_execute_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_to_execute_SRC2_CTRL_string = "PC ";
      default : decode_to_execute_SRC2_CTRL_string = "???";
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

  assign memory_PC = execute_to_memory_PC;
  assign execute_FLUSH_ALL = decode_to_execute_FLUSH_ALL;
  assign decode_FLUSH_ALL = _zz_73_;
  assign decode_IS_RS1_SIGNED = _zz_67_;
  assign _zz_1_ = _zz_2_;
  assign decode_IS_CSR = _zz_72_;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_80_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign memory_MEMORY_READ_DATA = _zz_79_;
  assign decode_SRC_USE_SUB_LESS = _zz_57_;
  assign decode_SRC2_CTRL = _zz_3_;
  assign _zz_4_ = _zz_5_;
  assign decode_CSR_WRITE_OPCODE = _zz_30_;
  assign decode_PREDICTION_HAD_BRANCHED2 = _zz_37_;
  assign decode_SHIFT_CTRL = _zz_6_;
  assign _zz_7_ = _zz_8_;
  assign decode_IS_MUL = _zz_61_;
  assign decode_ALU_BITWISE_CTRL = _zz_9_;
  assign _zz_10_ = _zz_11_;
  assign decode_IS_DIV = _zz_59_;
  assign decode_CSR_READ_OPCODE = _zz_29_;
  assign decode_MEMORY_ENABLE = _zz_63_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_85_;
  assign decode_DO_EBREAK = _zz_25_;
  assign decode_SRC_LESS_UNSIGNED = _zz_60_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_77_;
  assign decode_ALU_CTRL = _zz_12_;
  assign _zz_13_ = _zz_14_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_49_;
  assign decode_RS1_USE = _zz_70_;
  assign decode_RS2_USE = _zz_62_;
  assign decode_SRC1_CTRL = _zz_15_;
  assign _zz_16_ = _zz_17_;
  assign decode_IS_RS2_SIGNED = _zz_65_;
  assign _zz_18_ = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign decode_ENV_CTRL = _zz_22_;
  assign _zz_23_ = _zz_24_;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_74_;
  assign execute_RS2_USE = decode_to_execute_RS2_USE;
  assign execute_RS1_USE = decode_to_execute_RS1_USE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  always @ (*) begin
    _zz_26_ = memory_REGFILE_WRITE_DATA;
    memory_arbitration_haltItself = 1'b0;
    _zz_200_ = 1'b0;
    if((memory_arbitration_isValid && memory_FLUSH_ALL))begin
      _zz_200_ = 1'b1;
      if((! IBusCachedPlugin_cache_io_flush_cmd_ready))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_INSTRUCTION[5])) && (! dBus_rsp_ready)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b0;
    if(_zz_219_)begin
      if(_zz_220_)begin
        memory_arbitration_haltItself = 1'b1;
        memory_MulDivIterativePlugin_mul_counter_willIncrement = 1'b1;
      end
      _zz_26_ = ((memory_INSTRUCTION[13 : 12] == (2'b00)) ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_accumulator[63 : 32]);
    end
    memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b0;
    if(_zz_221_)begin
      if(_zz_222_)begin
        memory_arbitration_haltItself = 1'b1;
        memory_MulDivIterativePlugin_div_counter_willIncrement = 1'b1;
      end
      _zz_26_ = memory_MulDivIterativePlugin_div_result;
    end
  end

  assign memory_IS_MUL = execute_to_memory_IS_MUL;
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

  assign execute_BRANCH_CALC = _zz_33_;
  assign execute_BRANCH_DO = _zz_34_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_RS1 = _zz_55_;
  assign execute_BRANCH_COND_RESULT = _zz_36_;
  assign execute_BRANCH_CTRL = _zz_35_;
  assign decode_IS_FENCEI = _zz_56_;
  always @ (*) begin
    _zz_38_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_ALIGNEMENT_FAULT)) && (! execute_DBusSimplePlugin_cmdSent)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_223_)begin
      _zz_38_ = _zz_158_;
      if(_zz_224_)begin
        if(! execute_LightShifterPlugin_done) begin
          execute_arbitration_haltItself = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_38_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_SHIFT_CTRL = _zz_39_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_43_ = execute_PC;
  assign execute_SRC2_CTRL = _zz_44_;
  assign execute_SRC1_CTRL = _zz_46_;
  assign execute_SRC_ADD_SUB = _zz_42_;
  assign execute_SRC_LESS = _zz_40_;
  assign execute_ALU_CTRL = _zz_48_;
  assign execute_SRC2 = _zz_45_;
  assign execute_SRC1 = _zz_47_;
  assign execute_ALU_BITWISE_CTRL = _zz_50_;
  assign _zz_51_ = writeBack_INSTRUCTION;
  assign _zz_52_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_53_ = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      _zz_53_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_75_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_78_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_78_ = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_RS2 = _zz_54_;
  assign execute_SRC_ADD = _zz_41_;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_ALIGNEMENT_FAULT = _zz_81_;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign memory_FLUSH_ALL = execute_to_memory_FLUSH_ALL;
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected = 1'b0;
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(((_zz_213_ && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! 1'b0)))begin
      IBusCachedPlugin_rsp_issueDetected = 1'b1;
      IBusCachedPlugin_rsp_redoFetch = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  assign decode_BRANCH_CTRL = _zz_82_;
  always @ (*) begin
    _zz_83_ = execute_FORMAL_PC_NEXT;
    if(_zz_97_)begin
      _zz_83_ = _zz_98_;
    end
  end

  always @ (*) begin
    _zz_84_ = decode_FORMAL_PC_NEXT;
    if(_zz_91_)begin
      _zz_84_ = _zz_92_;
    end
    if(_zz_94_)begin
      _zz_84_ = _zz_95_;
    end
  end

  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_PC = _zz_87_;
  always @ (*) begin
    decode_INSTRUCTION = _zz_86_;
    if((_zz_195_ != (3'b000)))begin
      decode_INSTRUCTION = _zz_196_;
    end
  end

  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    decode_arbitration_isValid = (IBusCachedPlugin_iBusRsp_decodeInput_valid && (! IBusCachedPlugin_injector_decodeRemoved));
    _zz_107_ = 1'b0;
    case(_zz_195_)
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
        _zz_107_ = 1'b1;
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
    if(_zz_97_)begin
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
    _zz_88_ = 1'b0;
    _zz_89_ = 1'b0;
    if(((execute_arbitration_isValid && execute_IS_FENCEI) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00))))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode}}} != (4'b0000)))begin
      _zz_88_ = 1'b1;
    end
    if((execute_arbitration_isValid && (_zz_187_ || _zz_188_)))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if(_zz_225_)begin
      execute_arbitration_haltByOther = 1'b1;
      if(_zz_226_)begin
        _zz_89_ = 1'b1;
        _zz_88_ = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      _zz_88_ = 1'b1;
    end
    if(_zz_227_)begin
      _zz_88_ = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushAll = 1'b0;
    if(memory_exception_agregat_valid)begin
      execute_arbitration_flushAll = 1'b1;
    end
    if(_zz_225_)begin
      if(_zz_226_)begin
        execute_arbitration_flushAll = 1'b1;
      end
    end
  end

  assign execute_arbitration_redoIt = 1'b0;
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
    _zz_100_ = 1'b0;
    _zz_101_ = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    if(_zz_228_)begin
      _zz_100_ = 1'b1;
      _zz_101_ = {CsrPlugin_mtvec_base,(2'b00)};
      memory_arbitration_flushAll = 1'b1;
    end
    if(_zz_229_)begin
      _zz_101_ = CsrPlugin_mepc;
      _zz_100_ = 1'b1;
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
    _zz_90_ = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid))begin
      _zz_90_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_104_ = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      _zz_104_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_105_ = 1'b1;
    if(DebugPlugin_haltIt)begin
      _zz_105_ = 1'b0;
    end
  end

  assign IBusCachedPlugin_jump_pcLoad_valid = ({_zz_100_,{_zz_97_,{_zz_94_,_zz_91_}}} != (4'b0000));
  assign _zz_108_ = {_zz_91_,{_zz_94_,{_zz_97_,_zz_100_}}};
  assign _zz_109_ = (_zz_108_ & (~ _zz_238_));
  assign _zz_110_ = _zz_109_[3];
  assign _zz_111_ = (_zz_109_[1] || _zz_110_);
  assign _zz_112_ = (_zz_109_[2] || _zz_110_);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_218_;
  assign _zz_113_ = (! _zz_88_);
  assign IBusCachedPlugin_fetchPc_output_valid = (IBusCachedPlugin_fetchPc_preOutput_valid && _zz_113_);
  assign IBusCachedPlugin_fetchPc_preOutput_ready = (IBusCachedPlugin_fetchPc_output_ready && _zz_113_);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_preOutput_payload;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_propagatePc = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid && IBusCachedPlugin_iBusRsp_stages_1_input_ready))begin
      IBusCachedPlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_240_);
    IBusCachedPlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusCachedPlugin_fetchPc_propagatePc)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    if(_zz_230_)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusCachedPlugin_fetchPc_preOutput_valid = _zz_114_;
  assign IBusCachedPlugin_fetchPc_preOutput_payload = IBusCachedPlugin_fetchPc_pc;
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

  assign _zz_115_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_115_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_115_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(((IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid && (! 1'b1)) && (! 1'b0)))begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_116_ = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_116_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_116_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b1;
    end
  end

  assign _zz_117_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready && _zz_117_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && _zz_117_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_118_;
  assign _zz_118_ = ((1'b0 && (! _zz_119_)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_119_ = _zz_120_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_119_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_121_)) || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_121_ = _zz_122_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid = _zz_121_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload = _zz_123_;
  assign IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
  assign IBusCachedPlugin_iBusRsp_decodeInput_ready = (! decode_arbitration_isStuck);
  assign _zz_87_ = IBusCachedPlugin_iBusRsp_decodeInput_payload_pc;
  assign _zz_86_ = IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_inst;
  assign _zz_85_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign _zz_124_ = _zz_241_[11];
  always @ (*) begin
    _zz_125_[18] = _zz_124_;
    _zz_125_[17] = _zz_124_;
    _zz_125_[16] = _zz_124_;
    _zz_125_[15] = _zz_124_;
    _zz_125_[14] = _zz_124_;
    _zz_125_[13] = _zz_124_;
    _zz_125_[12] = _zz_124_;
    _zz_125_[11] = _zz_124_;
    _zz_125_[10] = _zz_124_;
    _zz_125_[9] = _zz_124_;
    _zz_125_[8] = _zz_124_;
    _zz_125_[7] = _zz_124_;
    _zz_125_[6] = _zz_124_;
    _zz_125_[5] = _zz_124_;
    _zz_125_[4] = _zz_124_;
    _zz_125_[3] = _zz_124_;
    _zz_125_[2] = _zz_124_;
    _zz_125_[1] = _zz_124_;
    _zz_125_[0] = _zz_124_;
  end

  assign _zz_93_ = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_242_[31]));
  assign _zz_91_ = (_zz_93_ && decode_arbitration_isFiring);
  assign _zz_126_ = _zz_243_[19];
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

  assign _zz_128_ = _zz_244_[11];
  always @ (*) begin
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

  assign _zz_92_ = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_127_,{{{_zz_338_,_zz_339_},_zz_340_},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_129_,{{{_zz_341_,_zz_342_},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_201_ = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_204_ = (IBusCachedPlugin_jump_pcLoad_valid || _zz_89_);
  assign _zz_205_ = (32'b00000000000000000000000000000000);
  assign _zz_202_ = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_203_ = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_213_ = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_214_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_215_ = (CsrPlugin_privilege == (2'b00));
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign _zz_94_ = IBusCachedPlugin_rsp_redoFetch;
  assign _zz_95_ = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_decodeInput_valid = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready = IBusCachedPlugin_iBusRsp_decodeInput_ready;
  assign IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_decodeInput_payload_pc = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  assign _zz_206_ = _zz_96_[31];
  assign _zz_207_ = 1'b1;
  assign _zz_208_ = 1'b1;
  assign _zz_209_ = 1'b1;
  assign _zz_210_ = 1'b1;
  assign _zz_211_ = 1'b0;
  assign _zz_212_ = 1'b1;
  assign execute_DBusSimplePlugin_cmdSent = 1'b0;
  assign _zz_81_ = (((dBus_cmd_payload_size == (2'b10)) && (dBus_cmd_payload_address[1 : 0] != (2'b00))) || ((dBus_cmd_payload_size == (2'b01)) && (dBus_cmd_payload_address[0 : 0] != (1'b0))));
  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_ALIGNEMENT_FAULT)) && (! execute_DBusSimplePlugin_cmdSent));
  assign dBus_cmd_payload_wr = execute_INSTRUCTION[5];
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_130_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_130_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_130_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_130_;
  assign _zz_80_ = dBus_cmd_payload_address[1 : 0];
  always @ (*) begin
    case(dBus_cmd_payload_size)
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

  assign execute_DBusSimplePlugin_formalMask = (_zz_131_ <<< dBus_cmd_payload_address[1 : 0]);
  assign _zz_79_ = dBus_rsp_data;
  assign memory_exception_agregat_payload_code = {1'd0, _zz_245_};
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

  assign _zz_132_ = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_133_[31] = _zz_132_;
    _zz_133_[30] = _zz_132_;
    _zz_133_[29] = _zz_132_;
    _zz_133_[28] = _zz_132_;
    _zz_133_[27] = _zz_132_;
    _zz_133_[26] = _zz_132_;
    _zz_133_[25] = _zz_132_;
    _zz_133_[24] = _zz_132_;
    _zz_133_[23] = _zz_132_;
    _zz_133_[22] = _zz_132_;
    _zz_133_[21] = _zz_132_;
    _zz_133_[20] = _zz_132_;
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
    _zz_133_[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_134_ = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_135_[31] = _zz_134_;
    _zz_135_[30] = _zz_134_;
    _zz_135_[29] = _zz_134_;
    _zz_135_[28] = _zz_134_;
    _zz_135_[27] = _zz_134_;
    _zz_135_[26] = _zz_134_;
    _zz_135_[25] = _zz_134_;
    _zz_135_[24] = _zz_134_;
    _zz_135_[23] = _zz_134_;
    _zz_135_[22] = _zz_134_;
    _zz_135_[21] = _zz_134_;
    _zz_135_[20] = _zz_134_;
    _zz_135_[19] = _zz_134_;
    _zz_135_[18] = _zz_134_;
    _zz_135_[17] = _zz_134_;
    _zz_135_[16] = _zz_134_;
    _zz_135_[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_235_)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_133_;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_135_;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_96_ = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  assign _zz_137_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_138_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_139_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign _zz_140_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_141_ = ((decode_INSTRUCTION & (32'b00000000000000000111000000000000)) == (32'b00000000000000000001000000000000));
  assign _zz_142_ = ((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000010000000000000));
  assign _zz_143_ = ((decode_INSTRUCTION & (32'b00000000000000000101000000000000)) == (32'b00000000000000000100000000000000));
  assign _zz_136_ = {(((decode_INSTRUCTION & _zz_343_) == (32'b00000000000000000000000000001000)) != (1'b0)),{({_zz_344_,{_zz_345_,_zz_346_}} != (3'b000)),{({_zz_347_,_zz_348_} != (2'b00)),{(_zz_349_ != _zz_350_),{_zz_351_,{_zz_352_,_zz_353_}}}}}};
  assign _zz_77_ = _zz_246_[0];
  assign _zz_144_ = _zz_136_[3 : 2];
  assign _zz_76_ = _zz_144_;
  assign _zz_75_ = _zz_247_[0];
  assign _zz_74_ = _zz_248_[0];
  assign _zz_73_ = _zz_249_[0];
  assign _zz_72_ = _zz_250_[0];
  assign _zz_145_ = _zz_136_[9 : 8];
  assign _zz_71_ = _zz_145_;
  assign _zz_70_ = _zz_251_[0];
  assign _zz_146_ = _zz_136_[12 : 11];
  assign _zz_69_ = _zz_146_;
  assign _zz_147_ = _zz_136_[14 : 13];
  assign _zz_68_ = _zz_147_;
  assign _zz_67_ = _zz_252_[0];
  assign _zz_148_ = _zz_136_[17 : 16];
  assign _zz_66_ = _zz_148_;
  assign _zz_65_ = _zz_253_[0];
  assign _zz_149_ = _zz_136_[20 : 19];
  assign _zz_64_ = _zz_149_;
  assign _zz_63_ = _zz_254_[0];
  assign _zz_62_ = _zz_255_[0];
  assign _zz_61_ = _zz_256_[0];
  assign _zz_60_ = _zz_257_[0];
  assign _zz_59_ = _zz_258_[0];
  assign _zz_150_ = _zz_136_[28 : 27];
  assign _zz_58_ = _zz_150_;
  assign _zz_57_ = _zz_259_[0];
  assign _zz_56_ = _zz_260_[0];
  assign execute_RegFilePlugin_srcInstruction = (execute_arbitration_isStuck ? execute_INSTRUCTION : decode_INSTRUCTION);
  assign execute_RegFilePlugin_regFileReadAddress1 = execute_RegFilePlugin_srcInstruction[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = execute_RegFilePlugin_srcInstruction[24 : 20];
  assign execute_RegFilePlugin_rs1Data = _zz_216_;
  assign execute_RegFilePlugin_rs2Data = _zz_217_;
  assign _zz_55_ = execute_RegFilePlugin_rs1Data;
  assign _zz_54_ = execute_RegFilePlugin_rs2Data;
  assign writeBack_RegFilePlugin_regFileWrite_valid = (_zz_52_ && writeBack_arbitration_isFiring);
  assign writeBack_RegFilePlugin_regFileWrite_payload_address = _zz_51_[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _zz_78_;
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
        _zz_151_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_151_ = {31'd0, _zz_261_};
      end
      default : begin
        _zz_151_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_49_ = _zz_151_;
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_152_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_152_ = {29'd0, _zz_262_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_152_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_152_ = {27'd0, _zz_263_};
      end
    endcase
  end

  assign _zz_47_ = _zz_152_;
  assign _zz_153_ = _zz_264_[11];
  always @ (*) begin
    _zz_154_[19] = _zz_153_;
    _zz_154_[18] = _zz_153_;
    _zz_154_[17] = _zz_153_;
    _zz_154_[16] = _zz_153_;
    _zz_154_[15] = _zz_153_;
    _zz_154_[14] = _zz_153_;
    _zz_154_[13] = _zz_153_;
    _zz_154_[12] = _zz_153_;
    _zz_154_[11] = _zz_153_;
    _zz_154_[10] = _zz_153_;
    _zz_154_[9] = _zz_153_;
    _zz_154_[8] = _zz_153_;
    _zz_154_[7] = _zz_153_;
    _zz_154_[6] = _zz_153_;
    _zz_154_[5] = _zz_153_;
    _zz_154_[4] = _zz_153_;
    _zz_154_[3] = _zz_153_;
    _zz_154_[2] = _zz_153_;
    _zz_154_[1] = _zz_153_;
    _zz_154_[0] = _zz_153_;
  end

  assign _zz_155_ = _zz_265_[11];
  always @ (*) begin
    _zz_156_[19] = _zz_155_;
    _zz_156_[18] = _zz_155_;
    _zz_156_[17] = _zz_155_;
    _zz_156_[16] = _zz_155_;
    _zz_156_[15] = _zz_155_;
    _zz_156_[14] = _zz_155_;
    _zz_156_[13] = _zz_155_;
    _zz_156_[12] = _zz_155_;
    _zz_156_[11] = _zz_155_;
    _zz_156_[10] = _zz_155_;
    _zz_156_[9] = _zz_155_;
    _zz_156_[8] = _zz_155_;
    _zz_156_[7] = _zz_155_;
    _zz_156_[6] = _zz_155_;
    _zz_156_[5] = _zz_155_;
    _zz_156_[4] = _zz_155_;
    _zz_156_[3] = _zz_155_;
    _zz_156_[2] = _zz_155_;
    _zz_156_[1] = _zz_155_;
    _zz_156_[0] = _zz_155_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_157_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_157_ = {_zz_154_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_157_ = {_zz_156_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_157_ = _zz_43_;
      end
    endcase
  end

  assign _zz_45_ = _zz_157_;
  assign execute_SrcPlugin_addSub = _zz_266_;
  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_42_ = execute_SrcPlugin_addSub;
  assign _zz_41_ = execute_SrcPlugin_addSub;
  assign _zz_40_ = execute_SrcPlugin_less;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == (4'b0000));
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_158_ = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_158_ = _zz_274_;
      end
    endcase
  end

  assign _zz_37_ = (_zz_93_ && (! decode_IS_FENCEI));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_159_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_159_ == (3'b000))) begin
        _zz_160_ = execute_BranchPlugin_eq;
    end else if((_zz_159_ == (3'b001))) begin
        _zz_160_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_159_ & (3'b101)) == (3'b101)))) begin
        _zz_160_ = (! execute_SRC_LESS);
    end else begin
        _zz_160_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_161_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_161_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_161_ = 1'b1;
      end
      default : begin
        _zz_161_ = _zz_160_;
      end
    endcase
  end

  assign _zz_36_ = _zz_161_;
  assign _zz_162_ = _zz_276_[11];
  always @ (*) begin
    _zz_163_[19] = _zz_162_;
    _zz_163_[18] = _zz_162_;
    _zz_163_[17] = _zz_162_;
    _zz_163_[16] = _zz_162_;
    _zz_163_[15] = _zz_162_;
    _zz_163_[14] = _zz_162_;
    _zz_163_[13] = _zz_162_;
    _zz_163_[12] = _zz_162_;
    _zz_163_[11] = _zz_162_;
    _zz_163_[10] = _zz_162_;
    _zz_163_[9] = _zz_162_;
    _zz_163_[8] = _zz_162_;
    _zz_163_[7] = _zz_162_;
    _zz_163_[6] = _zz_162_;
    _zz_163_[5] = _zz_162_;
    _zz_163_[4] = _zz_162_;
    _zz_163_[3] = _zz_162_;
    _zz_163_[2] = _zz_162_;
    _zz_163_[1] = _zz_162_;
    _zz_163_[0] = _zz_162_;
  end

  assign _zz_164_ = _zz_277_[19];
  always @ (*) begin
    _zz_165_[10] = _zz_164_;
    _zz_165_[9] = _zz_164_;
    _zz_165_[8] = _zz_164_;
    _zz_165_[7] = _zz_164_;
    _zz_165_[6] = _zz_164_;
    _zz_165_[5] = _zz_164_;
    _zz_165_[4] = _zz_164_;
    _zz_165_[3] = _zz_164_;
    _zz_165_[2] = _zz_164_;
    _zz_165_[1] = _zz_164_;
    _zz_165_[0] = _zz_164_;
  end

  assign _zz_166_ = _zz_278_[11];
  always @ (*) begin
    _zz_167_[18] = _zz_166_;
    _zz_167_[17] = _zz_166_;
    _zz_167_[16] = _zz_166_;
    _zz_167_[15] = _zz_166_;
    _zz_167_[14] = _zz_166_;
    _zz_167_[13] = _zz_166_;
    _zz_167_[12] = _zz_166_;
    _zz_167_[11] = _zz_166_;
    _zz_167_[10] = _zz_166_;
    _zz_167_[9] = _zz_166_;
    _zz_167_[8] = _zz_166_;
    _zz_167_[7] = _zz_166_;
    _zz_167_[6] = _zz_166_;
    _zz_167_[5] = _zz_166_;
    _zz_167_[4] = _zz_166_;
    _zz_167_[3] = _zz_166_;
    _zz_167_[2] = _zz_166_;
    _zz_167_[1] = _zz_166_;
    _zz_167_[0] = _zz_166_;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_168_ = (_zz_279_[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_168_ = _zz_280_[1];
      end
      default : begin
        _zz_168_ = _zz_281_[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_168_);
  assign _zz_34_ = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
        execute_BranchPlugin_branch_src2 = {_zz_170_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_172_,{{{_zz_488_,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_174_,{{{_zz_489_,_zz_490_},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if((execute_PREDICTION_HAD_BRANCHED2 && (! execute_BranchPlugin_missAlignedTarget)))begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_285_};
        end
      end
    endcase
  end

  assign _zz_169_ = _zz_282_[11];
  always @ (*) begin
    _zz_170_[19] = _zz_169_;
    _zz_170_[18] = _zz_169_;
    _zz_170_[17] = _zz_169_;
    _zz_170_[16] = _zz_169_;
    _zz_170_[15] = _zz_169_;
    _zz_170_[14] = _zz_169_;
    _zz_170_[13] = _zz_169_;
    _zz_170_[12] = _zz_169_;
    _zz_170_[11] = _zz_169_;
    _zz_170_[10] = _zz_169_;
    _zz_170_[9] = _zz_169_;
    _zz_170_[8] = _zz_169_;
    _zz_170_[7] = _zz_169_;
    _zz_170_[6] = _zz_169_;
    _zz_170_[5] = _zz_169_;
    _zz_170_[4] = _zz_169_;
    _zz_170_[3] = _zz_169_;
    _zz_170_[2] = _zz_169_;
    _zz_170_[1] = _zz_169_;
    _zz_170_[0] = _zz_169_;
  end

  assign _zz_171_ = _zz_283_[19];
  always @ (*) begin
    _zz_172_[10] = _zz_171_;
    _zz_172_[9] = _zz_171_;
    _zz_172_[8] = _zz_171_;
    _zz_172_[7] = _zz_171_;
    _zz_172_[6] = _zz_171_;
    _zz_172_[5] = _zz_171_;
    _zz_172_[4] = _zz_171_;
    _zz_172_[3] = _zz_171_;
    _zz_172_[2] = _zz_171_;
    _zz_172_[1] = _zz_171_;
    _zz_172_[0] = _zz_171_;
  end

  assign _zz_173_ = _zz_284_[11];
  always @ (*) begin
    _zz_174_[18] = _zz_173_;
    _zz_174_[17] = _zz_173_;
    _zz_174_[16] = _zz_173_;
    _zz_174_[15] = _zz_173_;
    _zz_174_[14] = _zz_173_;
    _zz_174_[13] = _zz_173_;
    _zz_174_[12] = _zz_173_;
    _zz_174_[11] = _zz_173_;
    _zz_174_[10] = _zz_173_;
    _zz_174_[9] = _zz_173_;
    _zz_174_[8] = _zz_173_;
    _zz_174_[7] = _zz_173_;
    _zz_174_[6] = _zz_173_;
    _zz_174_[5] = _zz_173_;
    _zz_174_[4] = _zz_173_;
    _zz_174_[3] = _zz_173_;
    _zz_174_[2] = _zz_173_;
    _zz_174_[1] = _zz_173_;
    _zz_174_[0] = _zz_173_;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_33_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign _zz_97_ = ((execute_arbitration_isValid && (! execute_arbitration_isStuckByOthers)) && execute_BRANCH_DO);
  assign _zz_98_ = execute_BRANCH_CALC;
  always @ (*) begin
    _zz_99_ = (execute_arbitration_isValid && (execute_BRANCH_DO && execute_BRANCH_CALC[1]));
    if(execute_arbitration_isStuckByOthers)begin
      _zz_99_ = 1'b0;
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign CsrPlugin_medeleg = (32'b00000000000000000000000000000000);
  assign CsrPlugin_mideleg = (32'b00000000000000000000000000000000);
  assign _zz_175_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_176_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_177_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode = 1'b0;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = (2'b11);
  assign execute_exception_agregat_valid = ({_zz_102_,_zz_99_} != (2'b00));
  assign _zz_178_ = {_zz_102_,_zz_99_};
  assign _zz_179_ = _zz_286_[0];
  assign execute_exception_agregat_payload_code = (_zz_179_ ? (4'b0000) : _zz_103_);
  assign execute_exception_agregat_payload_badAddr = (_zz_179_ ? execute_BRANCH_CALC : (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx));
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
      if(({_zz_177_,{_zz_176_,_zz_175_}} != (3'b000)))begin
        CsrPlugin_interrupt = 1'b1;
      end
      if(_zz_175_)begin
        CsrPlugin_interruptCode = (4'b0111);
      end
      if(_zz_176_)begin
        CsrPlugin_interruptCode = (4'b0011);
      end
      if(_zz_177_)begin
        CsrPlugin_interruptCode = (4'b1011);
      end
    end
    if((! _zz_104_))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_interruptTargetPrivilege = (2'b11);
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && _zz_105_);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = ((! ({writeBack_arbitration_isValid,{memory_arbitration_isValid,execute_arbitration_isValid}} != (3'b000))) && IBusCachedPlugin_injector_nextPcCalc_valids_4);
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

  assign contextSwitching = _zz_100_;
  assign _zz_30_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_29_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = _zz_192_;
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
        execute_CsrPlugin_readData[31 : 0] = _zz_193_;
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
    _zz_102_ = 1'b0;
    _zz_103_ = (4'bxxxx);
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL)))begin
      _zz_102_ = 1'b1;
      _zz_103_ = (4'b1011);
    end
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK)))begin
      _zz_102_ = 1'b1;
      _zz_103_ = (4'b0011);
    end
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  always @ (*) begin
    case(_zz_237_)
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
    memory_MulDivIterativePlugin_mul_counter_willClear = 1'b0;
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_mul_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_mul_willOverflowIfInc = (memory_MulDivIterativePlugin_mul_counter_value == (6'b100000));
  assign memory_MulDivIterativePlugin_mul_counter_willOverflow = (memory_MulDivIterativePlugin_mul_willOverflowIfInc && memory_MulDivIterativePlugin_mul_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_mul_counter_willOverflow)begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = (6'b000000);
    end else begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = (memory_MulDivIterativePlugin_mul_counter_value + _zz_289_);
    end
    if(memory_MulDivIterativePlugin_mul_counter_willClear)begin
      memory_MulDivIterativePlugin_mul_counter_valueNext = (6'b000000);
    end
  end

  always @ (*) begin
    memory_MulDivIterativePlugin_div_counter_willClear = 1'b0;
    if(_zz_231_)begin
      memory_MulDivIterativePlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_MulDivIterativePlugin_div_counter_willOverflowIfInc = (memory_MulDivIterativePlugin_div_counter_value == (6'b100001));
  assign memory_MulDivIterativePlugin_div_counter_willOverflow = (memory_MulDivIterativePlugin_div_counter_willOverflowIfInc && memory_MulDivIterativePlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_MulDivIterativePlugin_div_counter_willOverflow)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (6'b000000);
    end else begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (memory_MulDivIterativePlugin_div_counter_value + _zz_297_);
    end
    if(memory_MulDivIterativePlugin_div_counter_willClear)begin
      memory_MulDivIterativePlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_180_ = memory_MulDivIterativePlugin_rs1[31 : 0];
  assign _zz_181_ = {memory_MulDivIterativePlugin_accumulator[31 : 0],_zz_180_[31]};
  assign _zz_182_ = (_zz_181_ - _zz_298_);
  assign _zz_183_ = (memory_INSTRUCTION[13] ? memory_MulDivIterativePlugin_accumulator[31 : 0] : memory_MulDivIterativePlugin_rs1[31 : 0]);
  assign _zz_184_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_185_ = ((execute_IS_MUL && _zz_184_) || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_186_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_186_[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    _zz_187_ = 1'b0;
    _zz_188_ = 1'b0;
    if(_zz_190_)begin
      if((_zz_191_ == execute_INSTRUCTION[19 : 15]))begin
        _zz_187_ = 1'b1;
      end
      if((_zz_191_ == execute_INSTRUCTION[24 : 20]))begin
        _zz_188_ = 1'b1;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! 1'b1)))begin
        if((writeBack_INSTRUCTION[11 : 7] == execute_INSTRUCTION[19 : 15]))begin
          _zz_187_ = 1'b1;
        end
        if((writeBack_INSTRUCTION[11 : 7] == execute_INSTRUCTION[24 : 20]))begin
          _zz_188_ = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if((memory_INSTRUCTION[11 : 7] == execute_INSTRUCTION[19 : 15]))begin
          _zz_187_ = 1'b1;
        end
        if((memory_INSTRUCTION[11 : 7] == execute_INSTRUCTION[24 : 20]))begin
          _zz_188_ = 1'b1;
        end
      end
    end
    if((! execute_RS1_USE))begin
      _zz_187_ = 1'b0;
    end
    if((! execute_RS2_USE))begin
      _zz_188_ = 1'b0;
    end
  end

  assign _zz_189_ = (_zz_52_ && writeBack_arbitration_isFiring);
  assign _zz_193_ = (_zz_192_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_193_ != (32'b00000000000000000000000000000000));
  assign DebugPlugin_isPipBusy = (DebugPlugin_isPipActive || DebugPlugin_isPipActive_regNext);
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    _zz_106_ = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_232_)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            _zz_106_ = 1'b1;
            debug_bus_cmd_ready = _zz_107_;
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
    if((! _zz_194_))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign _zz_25_ = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || ((((((_zz_491_ || _zz_492_) || (DebugPlugin_hardwareBreakpoints_3_valid && _zz_493_)) || (DebugPlugin_hardwareBreakpoints_4_valid && (DebugPlugin_hardwareBreakpoints_4_pc == _zz_323_))) || (DebugPlugin_hardwareBreakpoints_5_valid && (DebugPlugin_hardwareBreakpoints_5_pc == _zz_324_))) || (DebugPlugin_hardwareBreakpoints_6_valid && (DebugPlugin_hardwareBreakpoints_6_pc == _zz_325_))) || (DebugPlugin_hardwareBreakpoints_7_valid && (DebugPlugin_hardwareBreakpoints_7_pc == _zz_326_)))));
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_24_ = decode_ENV_CTRL;
  assign _zz_21_ = execute_ENV_CTRL;
  assign _zz_19_ = memory_ENV_CTRL;
  assign _zz_22_ = _zz_64_;
  assign _zz_28_ = decode_to_execute_ENV_CTRL;
  assign _zz_27_ = execute_to_memory_ENV_CTRL;
  assign _zz_31_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_17_ = decode_SRC1_CTRL;
  assign _zz_15_ = _zz_68_;
  assign _zz_46_ = decode_to_execute_SRC1_CTRL;
  assign _zz_14_ = decode_ALU_CTRL;
  assign _zz_12_ = _zz_71_;
  assign _zz_48_ = decode_to_execute_ALU_CTRL;
  assign _zz_11_ = decode_ALU_BITWISE_CTRL;
  assign _zz_9_ = _zz_66_;
  assign _zz_50_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_8_ = decode_SHIFT_CTRL;
  assign _zz_6_ = _zz_58_;
  assign _zz_39_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_5_ = decode_SRC2_CTRL;
  assign _zz_3_ = _zz_76_;
  assign _zz_44_ = decode_to_execute_SRC2_CTRL;
  assign _zz_2_ = decode_BRANCH_CTRL;
  assign _zz_82_ = _zz_69_;
  assign _zz_35_ = decode_to_execute_BRANCH_CTRL;
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
  assign iBusWishbone_ADR = {_zz_333_,_zz_197_};
  assign iBusWishbone_CTI = ((_zz_197_ == (3'b111)) ? (3'b111) : (3'b010));
  assign iBusWishbone_BTE = (2'b00);
  assign iBusWishbone_SEL = (4'b1111);
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    iBusWishbone_STB = 1'b0;
    if(_zz_233_)begin
      iBusWishbone_CYC = 1'b1;
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_198_;
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
        _zz_199_ = (4'b0001);
      end
      2'b01 : begin
        _zz_199_ = (4'b0011);
      end
      default : begin
        _zz_199_ = (4'b1111);
      end
    endcase
  end

  always @ (*) begin
    dBusWishbone_SEL = _zz_334_[3:0];
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
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_114_ <= 1'b0;
      _zz_120_ <= 1'b0;
      _zz_122_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
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
      memory_MulDivIterativePlugin_mul_counter_value <= (6'b000000);
      memory_MulDivIterativePlugin_div_counter_value <= (6'b000000);
      _zz_190_ <= 1'b0;
      _zz_192_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_195_ <= (3'b000);
      _zz_197_ <= (3'b000);
      _zz_198_ <= 1'b0;
      dBus_cmd_halfPipe_regs_valid <= 1'b0;
      dBus_cmd_halfPipe_regs_ready <= 1'b1;
    end else begin
      if(IBusCachedPlugin_fetchPc_propagatePc)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_jump_pcLoad_valid)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_230_)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_samplePcNext)begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      _zz_114_ <= 1'b1;
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        _zz_120_ <= 1'b0;
      end
      if(_zz_118_)begin
        _zz_120_ <= IBusCachedPlugin_iBusRsp_stages_0_output_valid;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_122_ <= IBusCachedPlugin_iBusRsp_stages_1_output_valid;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        _zz_122_ <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_89_))begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
      end
      if(_zz_223_)begin
        if(_zz_224_)begin
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
      if(_zz_228_)begin
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
      if(_zz_229_)begin
        case(_zz_236_)
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
      memory_MulDivIterativePlugin_mul_counter_value <= memory_MulDivIterativePlugin_mul_counter_valueNext;
      memory_MulDivIterativePlugin_div_counter_value <= memory_MulDivIterativePlugin_div_counter_valueNext;
      _zz_190_ <= _zz_189_;
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
      case(_zz_195_)
        3'b000 : begin
          if(_zz_106_)begin
            _zz_195_ <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_195_ <= (3'b010);
        end
        3'b010 : begin
          _zz_195_ <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_195_ <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_195_ <= (3'b000);
        end
        default : begin
        end
      endcase
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_192_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_327_[0];
            CsrPlugin_mstatus_MIE <= _zz_328_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000101 : begin
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mip_MSIP <= _zz_329_[0];
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
            CsrPlugin_mie_MEIE <= _zz_330_[0];
            CsrPlugin_mie_MTIE <= _zz_331_[0];
            CsrPlugin_mie_MSIE <= _zz_332_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(_zz_233_)begin
        if(iBusWishbone_ACK)begin
          _zz_197_ <= (_zz_197_ + (3'b001));
        end
      end
      _zz_198_ <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if(_zz_234_)begin
        dBus_cmd_halfPipe_regs_valid <= dBus_cmd_valid;
        dBus_cmd_halfPipe_regs_ready <= (! dBus_cmd_valid);
      end else begin
        dBus_cmd_halfPipe_regs_valid <= (! dBus_cmd_halfPipe_ready);
        dBus_cmd_halfPipe_regs_ready <= dBus_cmd_halfPipe_ready;
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_123_ <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_INSTRUCTION[5])) && writeBack_arbitration_isStuck))) begin
      $display("ERROR DBusSimplePlugin doesn't allow writeback stage stall when read happend");
    end
    if(_zz_223_)begin
      if(_zz_224_)begin
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
    if(_zz_228_)begin
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
    if(_zz_219_)begin
      if(_zz_220_)begin
        memory_MulDivIterativePlugin_rs2 <= (memory_MulDivIterativePlugin_rs2 >>> 1);
        memory_MulDivIterativePlugin_accumulator <= ({_zz_290_,memory_MulDivIterativePlugin_accumulator[31 : 0]} >>> 1);
      end
    end
    if((memory_MulDivIterativePlugin_div_counter_value == (6'b100000)))begin
      memory_MulDivIterativePlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MulDivIterativePlugin_div_done <= 1'b0;
    end
    if(_zz_221_)begin
      if(_zz_222_)begin
        memory_MulDivIterativePlugin_rs1[31 : 0] <= _zz_299_[31:0];
        memory_MulDivIterativePlugin_accumulator[31 : 0] <= ((! _zz_182_[32]) ? _zz_300_ : _zz_301_);
        if((memory_MulDivIterativePlugin_div_counter_value == (6'b100000)))begin
          memory_MulDivIterativePlugin_div_result <= _zz_302_[31:0];
        end
      end
    end
    if(_zz_231_)begin
      memory_MulDivIterativePlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      memory_MulDivIterativePlugin_rs1 <= ((_zz_185_ ? (~ _zz_186_) : _zz_186_) + _zz_308_);
      memory_MulDivIterativePlugin_rs2 <= ((_zz_184_ ? (~ execute_RS2) : execute_RS2) + _zz_310_);
      memory_MulDivIterativePlugin_div_needRevert <= ((_zz_185_ ^ (_zz_184_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    if(_zz_189_)begin
      _zz_191_ <= _zz_51_[11 : 7];
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_23_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_20_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_18_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_16_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2_USE <= decode_RS2_USE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1_USE <= decode_RS1_USE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_38_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_26_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_13_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_84_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_83_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= memory_FORMAL_PC_NEXT;
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
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
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
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_10_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_FENCEI <= decode_IS_FENCEI;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_7_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_4_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
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
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_1_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FLUSH_ALL <= decode_FLUSH_ALL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FLUSH_ALL <= execute_FLUSH_ALL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_43_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
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
    iBusWishbone_DAT_MISO_regNext <= iBusWishbone_DAT_MISO;
    if(_zz_234_)begin
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
      DebugPlugin_busReadDataReg <= _zz_78_;
    end
    _zz_194_ <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid)begin
      case(_zz_232_)
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
    if(_zz_225_)begin
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
        case(_zz_232_)
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
              DebugPlugin_hardwareBreakpoints_0_valid <= _zz_311_[0];
            end
          end
          6'b010001 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_1_valid <= _zz_312_[0];
            end
          end
          6'b010010 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_2_valid <= _zz_313_[0];
            end
          end
          6'b010011 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_3_valid <= _zz_314_[0];
            end
          end
          6'b010100 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_4_valid <= _zz_315_[0];
            end
          end
          6'b010101 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_5_valid <= _zz_316_[0];
            end
          end
          6'b010110 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_6_valid <= _zz_317_[0];
            end
          end
          6'b010111 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_hardwareBreakpoints_7_valid <= _zz_318_[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_225_)begin
        if(_zz_226_)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_227_)begin
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
    _zz_196_ <= debug_bus_cmd_payload_data;
  end

endmodule

