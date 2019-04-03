// Generator : SpinalHDL v1.3.2    git head : 41815ceafff4e72c2e3a3e1ff7e9ada5202a0d26
// Date      : 26/03/2019, 03:03:22
// Component : VexRiscv


`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10
`define AluBitwiseCtrlEnum_defaultEncoding_SRC1 2'b11

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

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

`define DataCacheCpuCmdKind_defaultEncoding_type [0:0]
`define DataCacheCpuCmdKind_defaultEncoding_MEMORY 1'b0
`define DataCacheCpuCmdKind_defaultEncoding_MANAGMENT 1'b1

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
  reg [21:0] _zz_12_;
  reg [31:0] _zz_13_;
  wire  _zz_14_;
  wire [0:0] _zz_15_;
  wire [0:0] _zz_16_;
  wire [21:0] _zz_17_;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  lineLoader_fire;
  reg  lineLoader_valid;
  reg [31:0] lineLoader_address;
  reg  lineLoader_hadError;
  reg [7:0] lineLoader_flushCounter;
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
  wire [6:0] lineLoader_write_tag_0_payload_address;
  wire  lineLoader_write_tag_0_payload_data_valid;
  wire  lineLoader_write_tag_0_payload_data_error;
  wire [19:0] lineLoader_write_tag_0_payload_data_address;
  wire  lineLoader_write_data_0_valid;
  wire [9:0] lineLoader_write_data_0_payload_address;
  wire [31:0] lineLoader_write_data_0_payload_data;
  wire  _zz_5_;
  wire [6:0] _zz_6_;
  wire  _zz_7_;
  wire  fetchStage_read_waysValues_0_tag_valid;
  wire  fetchStage_read_waysValues_0_tag_error;
  wire [19:0] fetchStage_read_waysValues_0_tag_address;
  wire [21:0] _zz_8_;
  wire [9:0] _zz_9_;
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
  reg [19:0] decodeStage_hit_tags_0_address;
  wire  decodeStage_hit_hits_0;
  wire  decodeStage_hit_valid;
  wire  decodeStage_hit_error;
  reg [31:0] _zz_11_;
  wire [31:0] decodeStage_hit_data;
  reg [31:0] decodeStage_hit_word;
  reg  io_cpu_fetch_dataBypassValid_regNextWhen;
  reg [31:0] io_cpu_fetch_dataBypass_regNextWhen;
  reg [21:0] ways_0_tags [0:127];
  reg [31:0] ways_0_datas [0:1023];
  assign _zz_14_ = (! lineLoader_flushCounter[7]);
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
  assign _zz_4_ = lineLoader_flushCounter[7];
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
  assign lineLoader_write_tag_0_valid = ((_zz_5_ && lineLoader_fire) || (! lineLoader_flushCounter[7]));
  assign lineLoader_write_tag_0_payload_address = (lineLoader_flushCounter[7] ? lineLoader_address[11 : 5] : lineLoader_flushCounter[6 : 0]);
  assign lineLoader_write_tag_0_payload_data_valid = lineLoader_flushCounter[7];
  assign lineLoader_write_tag_0_payload_data_error = (lineLoader_hadError || io_mem_rsp_payload_error);
  assign lineLoader_write_tag_0_payload_data_address = lineLoader_address[31 : 12];
  assign lineLoader_write_data_0_valid = (io_mem_rsp_valid && _zz_5_);
  assign lineLoader_write_data_0_payload_address = {lineLoader_address[11 : 5],lineLoader_wordIndex};
  assign lineLoader_write_data_0_payload_data = io_mem_rsp_payload_data;
  assign _zz_6_ = io_cpu_prefetch_pc[11 : 5];
  assign _zz_7_ = (! io_cpu_fetch_isStuck);
  assign _zz_8_ = _zz_12_;
  assign fetchStage_read_waysValues_0_tag_valid = _zz_15_[0];
  assign fetchStage_read_waysValues_0_tag_error = _zz_16_[0];
  assign fetchStage_read_waysValues_0_tag_address = _zz_8_[21 : 2];
  assign _zz_9_ = io_cpu_prefetch_pc[11 : 2];
  assign _zz_10_ = (! io_cpu_fetch_isStuck);
  assign fetchStage_read_waysValues_0_data = _zz_13_;
  assign io_cpu_fetch_data = (io_cpu_fetch_dataBypassValid ? io_cpu_fetch_dataBypass : fetchStage_read_waysValues_0_data[31 : 0]);
  assign io_cpu_fetch_mmuBus_cmd_isValid = io_cpu_fetch_isValid;
  assign io_cpu_fetch_mmuBus_cmd_virtualAddress = io_cpu_fetch_pc;
  assign io_cpu_fetch_mmuBus_cmd_bypassTranslation = 1'b0;
  assign io_cpu_fetch_mmuBus_end = ((! io_cpu_fetch_isStuck) || io_cpu_fetch_isRemoved);
  assign io_cpu_fetch_physicalAddress = io_cpu_fetch_mmuBus_rsp_physicalAddress;
  assign decodeStage_hit_hits_0 = (decodeStage_hit_tags_0_valid && (decodeStage_hit_tags_0_address == decodeStage_mmuRsp_physicalAddress[31 : 12]));
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
      lineLoader_flushCounter <= (8'b00000000);
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
        lineLoader_flushCounter <= (lineLoader_flushCounter + (8'b00000001));
      end
      if(io_flush_cmd_valid)begin
        if(io_flush_cmd_ready)begin
          lineLoader_flushCounter <= (8'b00000000);
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
    _zz_3_ <= lineLoader_flushCounter[7];
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

module DataCache (
      input   io_cpu_execute_isValid,
      input   io_cpu_execute_isStuck,
      input  `DataCacheCpuCmdKind_defaultEncoding_type io_cpu_execute_args_kind,
      input   io_cpu_execute_args_wr,
      input  [31:0] io_cpu_execute_args_address,
      input  [31:0] io_cpu_execute_args_data,
      input  [1:0] io_cpu_execute_args_size,
      input   io_cpu_execute_args_forceUncachedAccess,
      input   io_cpu_execute_args_clean,
      input   io_cpu_execute_args_invalidate,
      input   io_cpu_execute_args_way,
      input   io_cpu_memory_isValid,
      input   io_cpu_memory_isStuck,
      input   io_cpu_memory_isRemoved,
      output  io_cpu_memory_haltIt,
      output  io_cpu_memory_mmuBus_cmd_isValid,
      output [31:0] io_cpu_memory_mmuBus_cmd_virtualAddress,
      output  io_cpu_memory_mmuBus_cmd_bypassTranslation,
      input  [31:0] io_cpu_memory_mmuBus_rsp_physicalAddress,
      input   io_cpu_memory_mmuBus_rsp_isIoAccess,
      input   io_cpu_memory_mmuBus_rsp_allowRead,
      input   io_cpu_memory_mmuBus_rsp_allowWrite,
      input   io_cpu_memory_mmuBus_rsp_allowExecute,
      input   io_cpu_memory_mmuBus_rsp_allowUser,
      input   io_cpu_memory_mmuBus_rsp_miss,
      input   io_cpu_memory_mmuBus_rsp_hit,
      output  io_cpu_memory_mmuBus_end,
      input   io_cpu_writeBack_isValid,
      input   io_cpu_writeBack_isStuck,
      input   io_cpu_writeBack_isUser,
      output reg  io_cpu_writeBack_haltIt,
      output [31:0] io_cpu_writeBack_data,
      output reg  io_cpu_writeBack_mmuMiss,
      output reg  io_cpu_writeBack_illegalAccess,
      output reg  io_cpu_writeBack_unalignedAccess,
      output  io_cpu_writeBack_accessError,
      output [31:0] io_cpu_writeBack_badAddr,
      output reg  io_mem_cmd_valid,
      input   io_mem_cmd_ready,
      output reg  io_mem_cmd_payload_wr,
      output reg [31:0] io_mem_cmd_payload_address,
      output reg [31:0] io_mem_cmd_payload_data,
      output reg [3:0] io_mem_cmd_payload_mask,
      output reg [2:0] io_mem_cmd_payload_length,
      output reg  io_mem_cmd_payload_last,
      input   io_mem_rsp_valid,
      input  [31:0] io_mem_rsp_payload_data,
      input   io_mem_rsp_payload_error,
      input   clk,
      input   reset);
  reg [21:0] _zz_30_;
  reg [31:0] _zz_31_;
  reg [31:0] _zz_32_;
  wire  _zz_33_;
  wire  _zz_34_;
  wire  _zz_35_;
  wire  _zz_36_;
  wire  _zz_37_;
  wire  _zz_38_;
  wire  _zz_39_;
  wire [0:0] _zz_40_;
  wire [0:0] _zz_41_;
  wire [2:0] _zz_42_;
  wire [0:0] _zz_43_;
  wire [2:0] _zz_44_;
  wire [0:0] _zz_45_;
  wire [2:0] _zz_46_;
  wire [21:0] _zz_47_;
  reg  _zz_1_;
  reg  _zz_2_;
  reg  _zz_3_;
  wire  haltCpu;
  reg  tagsReadCmd_valid;
  reg [6:0] tagsReadCmd_payload;
  reg  tagsWriteCmd_valid;
  reg [6:0] tagsWriteCmd_payload_address;
  reg  tagsWriteCmd_payload_data_used;
  reg  tagsWriteCmd_payload_data_dirty;
  reg [19:0] tagsWriteCmd_payload_data_address;
  reg  tagsWriteLastCmd_valid;
  reg [6:0] tagsWriteLastCmd_payload_address;
  reg  tagsWriteLastCmd_payload_data_used;
  reg  tagsWriteLastCmd_payload_data_dirty;
  reg [19:0] tagsWriteLastCmd_payload_data_address;
  reg  dataReadCmd_valid;
  reg [9:0] dataReadCmd_payload;
  reg  dataWriteCmd_valid;
  reg [9:0] dataWriteCmd_payload_address;
  reg [31:0] dataWriteCmd_payload_data;
  reg [3:0] dataWriteCmd_payload_mask;
  reg [6:0] way_tagReadRspOneAddress;
  wire [21:0] _zz_4_;
  wire  _zz_5_;
  reg  tagsWriteCmd_valid_regNextWhen;
  reg [6:0] tagsWriteCmd_payload_address_regNextWhen;
  reg  tagsWriteCmd_payload_data_regNextWhen_used;
  reg  tagsWriteCmd_payload_data_regNextWhen_dirty;
  reg [19:0] tagsWriteCmd_payload_data_regNextWhen_address;
  wire  _zz_6_;
  wire  way_tagReadRspOne_used;
  wire  way_tagReadRspOne_dirty;
  wire [19:0] way_tagReadRspOne_address;
  reg  way_dataReadRspOneKeepAddress;
  reg [9:0] way_dataReadRspOneAddress;
  wire [31:0] way_dataReadRspOneWithoutBypass;
  wire  _zz_7_;
  wire  _zz_8_;
  reg  dataWriteCmd_valid_regNextWhen;
  reg [9:0] dataWriteCmd_payload_address_regNextWhen;
  reg [31:0] _zz_9_;
  reg [3:0] _zz_10_;
  reg [31:0] way_dataReadRspOne;
  wire  _zz_11_;
  wire  way_tagReadRspTwoEnable;
  wire  _zz_12_;
  wire  way_tagReadRspTwoRegIn_used;
  wire  way_tagReadRspTwoRegIn_dirty;
  wire [19:0] way_tagReadRspTwoRegIn_address;
  reg  way_tagReadRspTwo_used;
  reg  way_tagReadRspTwo_dirty;
  reg [19:0] way_tagReadRspTwo_address;
  wire  way_dataReadRspTwoEnable;
  reg [9:0] way_dataReadRspOneAddress_regNextWhen;
  wire  _zz_13_;
  wire  _zz_14_;
  reg [7:0] _zz_15_;
  reg [7:0] _zz_16_;
  reg [7:0] _zz_17_;
  reg [7:0] _zz_18_;
  wire [31:0] way_dataReadRspTwo;
  wire  cpuMemoryStageNeedReadData;
  reg  victim_requestIn_valid;
  wire  victim_requestIn_ready;
  reg [31:0] victim_requestIn_payload_address;
  wire  victim_requestIn_halfPipe_valid;
  reg  victim_requestIn_halfPipe_ready;
  wire [31:0] victim_requestIn_halfPipe_payload_address;
  reg  victim_requestIn_halfPipe_regs_valid;
  reg  victim_requestIn_halfPipe_regs_ready;
  reg [31:0] victim_requestIn_halfPipe_regs_payload_address;
  reg [3:0] victim_readLineCmdCounter;
  reg  victim_dataReadCmdOccure;
  reg  victim_dataReadRestored;
  reg [3:0] victim_readLineRspCounter;
  reg  victim_dataReadCmdOccure_delay_1;
  reg [3:0] victim_bufferReadCounter;
  wire  victim_bufferReadStream_valid;
  wire  victim_bufferReadStream_ready;
  wire [2:0] victim_bufferReadStream_payload;
  wire  _zz_19_;
  wire  _zz_20_;
  reg  _zz_21_;
  wire  victim_bufferReaded_valid;
  reg  victim_bufferReaded_ready;
  wire [31:0] victim_bufferReaded_payload;
  reg  _zz_22_;
  reg [31:0] _zz_23_;
  reg [2:0] victim_bufferReadedCounter;
  reg  victim_memCmdAlreadyUsed;
  wire  victim_counter_willIncrement;
  wire  victim_counter_willClear;
  reg [2:0] victim_counter_valueNext;
  reg [2:0] victim_counter_value;
  wire  victim_counter_willOverflowIfInc;
  wire  victim_counter_willOverflow;
  reg `DataCacheCpuCmdKind_defaultEncoding_type stageA_request_kind;
  reg  stageA_request_wr;
  reg [31:0] stageA_request_address;
  reg [31:0] stageA_request_data;
  reg [1:0] stageA_request_size;
  reg  stageA_request_forceUncachedAccess;
  reg  stageA_request_clean;
  reg  stageA_request_invalidate;
  reg  stageA_request_way;
  reg `DataCacheCpuCmdKind_defaultEncoding_type stageB_request_kind;
  reg  stageB_request_wr;
  reg [31:0] stageB_request_address;
  reg [31:0] stageB_request_data;
  reg [1:0] stageB_request_size;
  reg  stageB_request_forceUncachedAccess;
  reg  stageB_request_clean;
  reg  stageB_request_invalidate;
  reg  stageB_request_way;
  reg [31:0] stageB_mmuRsp_physicalAddress;
  reg  stageB_mmuRsp_isIoAccess;
  reg  stageB_mmuRsp_allowRead;
  reg  stageB_mmuRsp_allowWrite;
  reg  stageB_mmuRsp_allowExecute;
  reg  stageB_mmuRsp_allowUser;
  reg  stageB_mmuRsp_miss;
  reg  stageB_mmuRsp_hit;
  reg  stageB_waysHit;
  reg  stageB_loaderValid;
  reg  stageB_loaderReady;
  reg  stageB_loadingDone;
  reg  stageB_delayedIsStuck;
  reg  stageB_delayedWaysHitValid;
  reg  stageB_victimNotSent;
  reg  stageB_loadingNotDone;
  reg [3:0] _zz_24_;
  wire [3:0] stageB_writeMask;
  reg  stageB_hadMemRspErrorReg;
  wire  stageB_hadMemRspError;
  reg  stageB_bootEvicts_valid;
  wire [4:0] _zz_25_;
  wire  _zz_26_;
  wire  _zz_27_;
  reg  _zz_28_;
  wire [4:0] _zz_29_;
  reg  loader_valid;
  reg  loader_memCmdSent;
  reg  loader_counter_willIncrement;
  wire  loader_counter_willClear;
  reg [2:0] loader_counter_valueNext;
  reg [2:0] loader_counter_value;
  wire  loader_counter_willOverflowIfInc;
  wire  loader_counter_willOverflow;
  `ifndef SYNTHESIS
  reg [71:0] io_cpu_execute_args_kind_string;
  reg [71:0] stageA_request_kind_string;
  reg [71:0] stageB_request_kind_string;
  `endif

  reg [21:0] way_tags [0:127];
  reg [7:0] way_data_symbol0 [0:1023];
  reg [7:0] way_data_symbol1 [0:1023];
  reg [7:0] way_data_symbol2 [0:1023];
  reg [7:0] way_data_symbol3 [0:1023];
  reg [7:0] _zz_48_;
  reg [7:0] _zz_49_;
  reg [7:0] _zz_50_;
  reg [7:0] _zz_51_;
  reg [31:0] victim_buffer [0:7];
  assign _zz_33_ = (! victim_readLineCmdCounter[3]);
  assign _zz_34_ = ((! victim_memCmdAlreadyUsed) && io_mem_cmd_ready);
  assign _zz_35_ = (stageB_mmuRsp_physicalAddress[11 : 5] != (7'b1111111));
  assign _zz_36_ = (! victim_requestIn_halfPipe_valid);
  assign _zz_37_ = (! _zz_28_);
  assign _zz_38_ = (! victim_requestIn_halfPipe_regs_valid);
  assign _zz_39_ = (! io_cpu_writeBack_isStuck);
  assign _zz_40_ = _zz_4_[0 : 0];
  assign _zz_41_ = _zz_4_[1 : 1];
  assign _zz_42_ = victim_readLineRspCounter[2:0];
  assign _zz_43_ = victim_counter_willIncrement;
  assign _zz_44_ = {2'd0, _zz_43_};
  assign _zz_45_ = loader_counter_willIncrement;
  assign _zz_46_ = {2'd0, _zz_45_};
  assign _zz_47_ = {tagsWriteCmd_payload_data_address,{tagsWriteCmd_payload_data_dirty,tagsWriteCmd_payload_data_used}};
  always @ (posedge clk) begin
    if(_zz_3_) begin
      way_tags[tagsWriteCmd_payload_address] <= _zz_47_;
    end
  end

  always @ (posedge clk) begin
    if(tagsReadCmd_valid) begin
      _zz_30_ <= way_tags[tagsReadCmd_payload];
    end
  end

  always @ (*) begin
    _zz_31_ = {_zz_51_, _zz_50_, _zz_49_, _zz_48_};
  end
  always @ (posedge clk) begin
    if(dataWriteCmd_payload_mask[0] && _zz_2_) begin
      way_data_symbol0[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[7 : 0];
    end
    if(dataWriteCmd_payload_mask[1] && _zz_2_) begin
      way_data_symbol1[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[15 : 8];
    end
    if(dataWriteCmd_payload_mask[2] && _zz_2_) begin
      way_data_symbol2[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[23 : 16];
    end
    if(dataWriteCmd_payload_mask[3] && _zz_2_) begin
      way_data_symbol3[dataWriteCmd_payload_address] <= dataWriteCmd_payload_data[31 : 24];
    end
  end

  always @ (posedge clk) begin
    if(dataReadCmd_valid) begin
      _zz_48_ <= way_data_symbol0[dataReadCmd_payload];
      _zz_49_ <= way_data_symbol1[dataReadCmd_payload];
      _zz_50_ <= way_data_symbol2[dataReadCmd_payload];
      _zz_51_ <= way_data_symbol3[dataReadCmd_payload];
    end
  end

  always @ (posedge clk) begin
    if(_zz_1_) begin
      victim_buffer[_zz_42_] <= way_dataReadRspOneWithoutBypass;
    end
  end

  always @ (posedge clk) begin
    if(victim_bufferReadStream_ready) begin
      _zz_32_ <= victim_buffer[victim_bufferReadStream_payload];
    end
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(io_cpu_execute_args_kind)
      `DataCacheCpuCmdKind_defaultEncoding_MEMORY : io_cpu_execute_args_kind_string = "MEMORY   ";
      `DataCacheCpuCmdKind_defaultEncoding_MANAGMENT : io_cpu_execute_args_kind_string = "MANAGMENT";
      default : io_cpu_execute_args_kind_string = "?????????";
    endcase
  end
  always @(*) begin
    case(stageA_request_kind)
      `DataCacheCpuCmdKind_defaultEncoding_MEMORY : stageA_request_kind_string = "MEMORY   ";
      `DataCacheCpuCmdKind_defaultEncoding_MANAGMENT : stageA_request_kind_string = "MANAGMENT";
      default : stageA_request_kind_string = "?????????";
    endcase
  end
  always @(*) begin
    case(stageB_request_kind)
      `DataCacheCpuCmdKind_defaultEncoding_MEMORY : stageB_request_kind_string = "MEMORY   ";
      `DataCacheCpuCmdKind_defaultEncoding_MANAGMENT : stageB_request_kind_string = "MANAGMENT";
      default : stageB_request_kind_string = "?????????";
    endcase
  end
  `endif

  always @ (*) begin
    _zz_1_ = 1'b0;
    if(victim_dataReadCmdOccure_delay_1)begin
      _zz_1_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_2_ = 1'b0;
    if(dataWriteCmd_valid)begin
      _zz_2_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_3_ = 1'b0;
    if(tagsWriteCmd_valid)begin
      _zz_3_ = 1'b1;
    end
  end

  assign haltCpu = 1'b0;
  always @ (*) begin
    tagsReadCmd_valid = 1'b0;
    tagsReadCmd_payload = (7'bxxxxxxx);
    dataReadCmd_valid = 1'b0;
    dataReadCmd_payload = (10'bxxxxxxxxxx);
    way_dataReadRspOneKeepAddress = 1'b0;
    if((io_cpu_execute_isValid && (! io_cpu_execute_isStuck)))begin
      tagsReadCmd_valid = 1'b1;
      tagsReadCmd_payload = io_cpu_execute_args_address[11 : 5];
      dataReadCmd_valid = 1'b1;
      dataReadCmd_payload = io_cpu_execute_args_address[11 : 2];
    end
    victim_dataReadCmdOccure = 1'b0;
    if(victim_requestIn_halfPipe_valid)begin
      if(_zz_33_)begin
        victim_dataReadCmdOccure = 1'b1;
        dataReadCmd_valid = 1'b1;
        dataReadCmd_payload = {victim_requestIn_halfPipe_payload_address[11 : 5],victim_readLineCmdCounter[2 : 0]};
        way_dataReadRspOneKeepAddress = 1'b1;
      end else begin
        if(((! victim_dataReadRestored) && cpuMemoryStageNeedReadData))begin
          dataReadCmd_valid = 1'b1;
          dataReadCmd_payload = way_dataReadRspOneAddress;
        end
      end
    end
  end

  always @ (*) begin
    tagsWriteCmd_valid = 1'b0;
    tagsWriteCmd_payload_address = (7'bxxxxxxx);
    tagsWriteCmd_payload_data_used = 1'bx;
    tagsWriteCmd_payload_data_dirty = 1'bx;
    tagsWriteCmd_payload_data_address = (20'bxxxxxxxxxxxxxxxxxxxx);
    dataWriteCmd_valid = 1'b0;
    dataWriteCmd_payload_address = (10'bxxxxxxxxxx);
    dataWriteCmd_payload_data = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    dataWriteCmd_payload_mask = (4'bxxxx);
    io_mem_cmd_valid = 1'b0;
    io_mem_cmd_payload_wr = 1'bx;
    io_mem_cmd_payload_address = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    io_mem_cmd_payload_data = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    io_mem_cmd_payload_mask = (4'bxxxx);
    io_mem_cmd_payload_length = (3'bxxx);
    io_mem_cmd_payload_last = 1'bx;
    victim_requestIn_valid = 1'b0;
    victim_requestIn_payload_address = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    victim_requestIn_halfPipe_ready = 1'b0;
    victim_bufferReaded_ready = 1'b0;
    if(victim_bufferReaded_valid)begin
      io_mem_cmd_valid = 1'b1;
      io_mem_cmd_payload_wr = 1'b1;
      io_mem_cmd_payload_address = {victim_requestIn_halfPipe_payload_address[31 : 5],(5'b00000)};
      io_mem_cmd_payload_length = (3'b111);
      io_mem_cmd_payload_data = victim_bufferReaded_payload;
      io_mem_cmd_payload_mask = (4'b1111);
      io_mem_cmd_payload_last = (victim_bufferReadedCounter == (3'b111));
      if(_zz_34_)begin
        victim_bufferReaded_ready = 1'b1;
        if((victim_bufferReadedCounter == (3'b111)))begin
          victim_requestIn_halfPipe_ready = 1'b1;
        end
      end
    end
    stageB_loaderValid = 1'b0;
    io_cpu_writeBack_haltIt = io_cpu_writeBack_isValid;
    io_cpu_writeBack_mmuMiss = 1'b0;
    io_cpu_writeBack_illegalAccess = 1'b0;
    io_cpu_writeBack_unalignedAccess = 1'b0;
    if(stageB_bootEvicts_valid)begin
      tagsWriteCmd_valid = stageB_bootEvicts_valid;
      tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
      tagsWriteCmd_payload_data_used = 1'b0;
      if(_zz_35_)begin
        io_cpu_writeBack_haltIt = 1'b1;
      end
    end
    if(io_cpu_writeBack_isValid)begin
      io_cpu_writeBack_mmuMiss = stageB_mmuRsp_miss;
      case(stageB_request_kind)
        `DataCacheCpuCmdKind_defaultEncoding_MANAGMENT : begin
          if((stageB_delayedIsStuck && (! stageB_mmuRsp_miss)))begin
            if((stageB_delayedWaysHitValid || (stageB_request_way && way_tagReadRspTwo_used)))begin
              if((! (victim_requestIn_valid && (! victim_requestIn_ready))))begin
                io_cpu_writeBack_haltIt = 1'b0;
              end
              victim_requestIn_valid = (stageB_request_clean && way_tagReadRspTwo_dirty);
              tagsWriteCmd_valid = victim_requestIn_ready;
            end else begin
              io_cpu_writeBack_haltIt = 1'b0;
            end
          end
          victim_requestIn_payload_address = {{way_tagReadRspTwo_address,stageB_mmuRsp_physicalAddress[11 : 5]},_zz_25_};
          tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
          tagsWriteCmd_payload_data_used = (! stageB_request_invalidate);
          tagsWriteCmd_payload_data_dirty = (! stageB_request_clean);
        end
        default : begin
          io_cpu_writeBack_illegalAccess = _zz_26_;
          io_cpu_writeBack_unalignedAccess = _zz_27_;
          if((((1'b0 || (! stageB_mmuRsp_miss)) && (! _zz_26_)) && (! _zz_27_)))begin
            if((stageB_request_forceUncachedAccess || stageB_mmuRsp_isIoAccess))begin
              if(_zz_36_)begin
                io_mem_cmd_payload_wr = stageB_request_wr;
                io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 2],(2'b00)};
                io_mem_cmd_payload_mask = stageB_writeMask;
                io_mem_cmd_payload_data = stageB_request_data;
                io_mem_cmd_payload_length = (3'b000);
                io_mem_cmd_payload_last = 1'b1;
                if(_zz_37_)begin
                  io_mem_cmd_valid = 1'b1;
                end
                if((_zz_28_ && (io_mem_rsp_valid || stageB_request_wr)))begin
                  io_cpu_writeBack_haltIt = 1'b0;
                end
              end
            end else begin
              if((stageB_waysHit || (! stageB_loadingNotDone)))begin
                io_cpu_writeBack_haltIt = 1'b0;
                dataWriteCmd_valid = stageB_request_wr;
                dataWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 2];
                dataWriteCmd_payload_data = stageB_request_data;
                dataWriteCmd_payload_mask = stageB_writeMask;
                tagsWriteCmd_valid = ((! stageB_loadingNotDone) || stageB_request_wr);
                tagsWriteCmd_payload_address = stageB_mmuRsp_physicalAddress[11 : 5];
                tagsWriteCmd_payload_data_used = 1'b1;
                tagsWriteCmd_payload_data_dirty = stageB_request_wr;
                tagsWriteCmd_payload_data_address = stageB_mmuRsp_physicalAddress[31 : 12];
              end else begin
                stageB_loaderValid = (stageB_loadingNotDone && (! (stageB_victimNotSent && (victim_requestIn_halfPipe_valid && (! victim_requestIn_halfPipe_ready)))));
                victim_requestIn_valid = ((way_tagReadRspTwo_used && way_tagReadRspTwo_dirty) && stageB_victimNotSent);
                victim_requestIn_payload_address = {{way_tagReadRspTwo_address,stageB_mmuRsp_physicalAddress[11 : 5]},_zz_29_};
              end
            end
          end
        end
      endcase
    end
    if((loader_valid && (! loader_memCmdSent)))begin
      io_mem_cmd_valid = 1'b1;
      io_mem_cmd_payload_wr = 1'b0;
      io_mem_cmd_payload_address = {stageB_mmuRsp_physicalAddress[31 : 5],(5'b00000)};
      io_mem_cmd_payload_length = (3'b111);
      io_mem_cmd_payload_last = 1'b1;
    end
    loader_counter_willIncrement = 1'b0;
    if((loader_valid && io_mem_rsp_valid))begin
      dataWriteCmd_valid = 1'b1;
      dataWriteCmd_payload_address = {stageB_mmuRsp_physicalAddress[11 : 5],loader_counter_value};
      dataWriteCmd_payload_data = io_mem_rsp_payload_data;
      dataWriteCmd_payload_mask = (4'b1111);
      loader_counter_willIncrement = 1'b1;
    end
  end

  assign _zz_4_ = _zz_30_;
  assign _zz_5_ = (tagsReadCmd_valid || (tagsWriteCmd_valid && (tagsWriteCmd_payload_address == way_tagReadRspOneAddress)));
  assign _zz_6_ = (tagsWriteCmd_valid_regNextWhen && (tagsWriteCmd_payload_address_regNextWhen == way_tagReadRspOneAddress));
  assign way_tagReadRspOne_used = (_zz_6_ ? tagsWriteCmd_payload_data_regNextWhen_used : _zz_40_[0]);
  assign way_tagReadRspOne_dirty = (_zz_6_ ? tagsWriteCmd_payload_data_regNextWhen_dirty : _zz_41_[0]);
  assign way_tagReadRspOne_address = (_zz_6_ ? tagsWriteCmd_payload_data_regNextWhen_address : _zz_4_[21 : 2]);
  assign way_dataReadRspOneWithoutBypass = _zz_31_;
  assign _zz_7_ = (dataWriteCmd_valid && (dataWriteCmd_payload_address == way_dataReadRspOneAddress));
  assign _zz_8_ = (dataReadCmd_valid || _zz_7_);
  assign _zz_11_ = (dataWriteCmd_valid_regNextWhen && (dataWriteCmd_payload_address_regNextWhen == way_dataReadRspOneAddress));
  always @ (*) begin
    way_dataReadRspOne[7 : 0] = ((_zz_11_ && _zz_10_[0]) ? _zz_9_[7 : 0] : way_dataReadRspOneWithoutBypass[7 : 0]);
    way_dataReadRspOne[15 : 8] = ((_zz_11_ && _zz_10_[1]) ? _zz_9_[15 : 8] : way_dataReadRspOneWithoutBypass[15 : 8]);
    way_dataReadRspOne[23 : 16] = ((_zz_11_ && _zz_10_[2]) ? _zz_9_[23 : 16] : way_dataReadRspOneWithoutBypass[23 : 16]);
    way_dataReadRspOne[31 : 24] = ((_zz_11_ && _zz_10_[3]) ? _zz_9_[31 : 24] : way_dataReadRspOneWithoutBypass[31 : 24]);
  end

  assign way_tagReadRspTwoEnable = (! io_cpu_writeBack_isStuck);
  assign _zz_12_ = (tagsWriteCmd_valid && (tagsWriteCmd_payload_address == way_tagReadRspOneAddress));
  assign way_tagReadRspTwoRegIn_used = (_zz_12_ ? tagsWriteCmd_payload_data_used : way_tagReadRspOne_used);
  assign way_tagReadRspTwoRegIn_dirty = (_zz_12_ ? tagsWriteCmd_payload_data_dirty : way_tagReadRspOne_dirty);
  assign way_tagReadRspTwoRegIn_address = (_zz_12_ ? tagsWriteCmd_payload_data_address : way_tagReadRspOne_address);
  assign way_dataReadRspTwoEnable = (! io_cpu_writeBack_isStuck);
  assign _zz_13_ = (dataWriteCmd_valid && (way_dataReadRspOneAddress == dataWriteCmd_payload_address));
  assign _zz_14_ = (dataWriteCmd_valid && (way_dataReadRspOneAddress_regNextWhen == dataWriteCmd_payload_address));
  assign way_dataReadRspTwo = {_zz_18_,{_zz_17_,{_zz_16_,_zz_15_}}};
  assign victim_requestIn_halfPipe_valid = victim_requestIn_halfPipe_regs_valid;
  assign victim_requestIn_halfPipe_payload_address = victim_requestIn_halfPipe_regs_payload_address;
  assign victim_requestIn_ready = victim_requestIn_halfPipe_regs_ready;
  assign io_cpu_memory_haltIt = ((cpuMemoryStageNeedReadData && victim_requestIn_halfPipe_valid) && (! victim_dataReadRestored));
  assign victim_bufferReadStream_valid = (victim_bufferReadCounter < victim_readLineRspCounter);
  assign victim_bufferReadStream_payload = victim_bufferReadCounter[2:0];
  assign victim_bufferReadStream_ready = ((! _zz_19_) || _zz_20_);
  assign _zz_19_ = _zz_21_;
  assign _zz_20_ = ((1'b1 && (! victim_bufferReaded_valid)) || victim_bufferReaded_ready);
  assign victim_bufferReaded_valid = _zz_22_;
  assign victim_bufferReaded_payload = _zz_23_;
  always @ (*) begin
    victim_memCmdAlreadyUsed = 1'b0;
    if((loader_valid && (! loader_memCmdSent)))begin
      victim_memCmdAlreadyUsed = 1'b1;
    end
  end

  assign victim_counter_willIncrement = 1'b0;
  assign victim_counter_willClear = 1'b0;
  assign victim_counter_willOverflowIfInc = (victim_counter_value == (3'b111));
  assign victim_counter_willOverflow = (victim_counter_willOverflowIfInc && victim_counter_willIncrement);
  always @ (*) begin
    victim_counter_valueNext = (victim_counter_value + _zz_44_);
    if(victim_counter_willClear)begin
      victim_counter_valueNext = (3'b000);
    end
  end

  assign io_cpu_memory_mmuBus_cmd_isValid = (io_cpu_memory_isValid && (stageA_request_kind == `DataCacheCpuCmdKind_defaultEncoding_MEMORY));
  assign io_cpu_memory_mmuBus_cmd_virtualAddress = stageA_request_address;
  assign io_cpu_memory_mmuBus_cmd_bypassTranslation = stageA_request_way;
  assign io_cpu_memory_mmuBus_end = ((! io_cpu_memory_isStuck) || io_cpu_memory_isRemoved);
  assign cpuMemoryStageNeedReadData = ((io_cpu_memory_isValid && (stageA_request_kind == `DataCacheCpuCmdKind_defaultEncoding_MEMORY)) && (! stageA_request_wr));
  always @ (*) begin
    stageB_loaderReady = 1'b0;
    if(loader_counter_willOverflow)begin
      stageB_loaderReady = 1'b1;
    end
  end

  always @ (*) begin
    case(stageB_request_size)
      2'b00 : begin
        _zz_24_ = (4'b0001);
      end
      2'b01 : begin
        _zz_24_ = (4'b0011);
      end
      default : begin
        _zz_24_ = (4'b1111);
      end
    endcase
  end

  assign stageB_writeMask = (_zz_24_ <<< stageB_mmuRsp_physicalAddress[1 : 0]);
  assign stageB_hadMemRspError = ((io_mem_rsp_valid && io_mem_rsp_payload_error) || stageB_hadMemRspErrorReg);
  assign io_cpu_writeBack_accessError = (stageB_hadMemRspError && (! io_cpu_writeBack_haltIt));
  assign io_cpu_writeBack_badAddr = stageB_request_address;
  assign _zz_25_[4 : 0] = (5'b00000);
  assign _zz_26_ = (((stageB_request_wr && (! stageB_mmuRsp_allowWrite)) || ((! stageB_request_wr) && (! stageB_mmuRsp_allowRead))) || (io_cpu_writeBack_isUser && (! stageB_mmuRsp_allowUser)));
  assign _zz_27_ = (((stageB_request_size == (2'b10)) && (stageB_mmuRsp_physicalAddress[1 : 0] != (2'b00))) || ((stageB_request_size == (2'b01)) && (stageB_mmuRsp_physicalAddress[0 : 0] != (1'b0))));
  assign _zz_29_[4 : 0] = (5'b00000);
  assign io_cpu_writeBack_data = ((stageB_request_forceUncachedAccess || stageB_mmuRsp_isIoAccess) ? io_mem_rsp_payload_data : way_dataReadRspTwo);
  assign loader_counter_willClear = 1'b0;
  assign loader_counter_willOverflowIfInc = (loader_counter_value == (3'b111));
  assign loader_counter_willOverflow = (loader_counter_willOverflowIfInc && loader_counter_willIncrement);
  always @ (*) begin
    loader_counter_valueNext = (loader_counter_value + _zz_46_);
    if(loader_counter_willClear)begin
      loader_counter_valueNext = (3'b000);
    end
  end

  always @ (posedge clk) begin
    tagsWriteLastCmd_valid <= tagsWriteCmd_valid;
    tagsWriteLastCmd_payload_address <= tagsWriteCmd_payload_address;
    tagsWriteLastCmd_payload_data_used <= tagsWriteCmd_payload_data_used;
    tagsWriteLastCmd_payload_data_dirty <= tagsWriteCmd_payload_data_dirty;
    tagsWriteLastCmd_payload_data_address <= tagsWriteCmd_payload_data_address;
    if(tagsReadCmd_valid)begin
      way_tagReadRspOneAddress <= tagsReadCmd_payload;
    end
    if(_zz_5_)begin
      tagsWriteCmd_valid_regNextWhen <= tagsWriteCmd_valid;
    end
    if(_zz_5_)begin
      tagsWriteCmd_payload_address_regNextWhen <= tagsWriteCmd_payload_address;
    end
    if(_zz_5_)begin
      tagsWriteCmd_payload_data_regNextWhen_used <= tagsWriteCmd_payload_data_used;
      tagsWriteCmd_payload_data_regNextWhen_dirty <= tagsWriteCmd_payload_data_dirty;
      tagsWriteCmd_payload_data_regNextWhen_address <= tagsWriteCmd_payload_data_address;
    end
    if((dataReadCmd_valid && (! way_dataReadRspOneKeepAddress)))begin
      way_dataReadRspOneAddress <= dataReadCmd_payload;
    end
    if(_zz_8_)begin
      dataWriteCmd_valid_regNextWhen <= dataWriteCmd_valid;
    end
    if(_zz_8_)begin
      dataWriteCmd_payload_address_regNextWhen <= dataWriteCmd_payload_address;
    end
    if((_zz_7_ && dataWriteCmd_payload_mask[0]))begin
      _zz_10_[0] <= 1'b1;
    end
    if(dataReadCmd_valid)begin
      _zz_10_[0] <= dataWriteCmd_payload_mask[0];
    end
    if((dataReadCmd_valid || (_zz_7_ && dataWriteCmd_payload_mask[0])))begin
      _zz_9_[7 : 0] <= dataWriteCmd_payload_data[7 : 0];
    end
    if((_zz_7_ && dataWriteCmd_payload_mask[1]))begin
      _zz_10_[1] <= 1'b1;
    end
    if(dataReadCmd_valid)begin
      _zz_10_[1] <= dataWriteCmd_payload_mask[1];
    end
    if((dataReadCmd_valid || (_zz_7_ && dataWriteCmd_payload_mask[1])))begin
      _zz_9_[15 : 8] <= dataWriteCmd_payload_data[15 : 8];
    end
    if((_zz_7_ && dataWriteCmd_payload_mask[2]))begin
      _zz_10_[2] <= 1'b1;
    end
    if(dataReadCmd_valid)begin
      _zz_10_[2] <= dataWriteCmd_payload_mask[2];
    end
    if((dataReadCmd_valid || (_zz_7_ && dataWriteCmd_payload_mask[2])))begin
      _zz_9_[23 : 16] <= dataWriteCmd_payload_data[23 : 16];
    end
    if((_zz_7_ && dataWriteCmd_payload_mask[3]))begin
      _zz_10_[3] <= 1'b1;
    end
    if(dataReadCmd_valid)begin
      _zz_10_[3] <= dataWriteCmd_payload_mask[3];
    end
    if((dataReadCmd_valid || (_zz_7_ && dataWriteCmd_payload_mask[3])))begin
      _zz_9_[31 : 24] <= dataWriteCmd_payload_data[31 : 24];
    end
    if(way_tagReadRspTwoEnable)begin
      way_tagReadRspTwo_used <= way_tagReadRspTwoRegIn_used;
      way_tagReadRspTwo_dirty <= way_tagReadRspTwoRegIn_dirty;
      way_tagReadRspTwo_address <= way_tagReadRspTwoRegIn_address;
    end
    if(way_dataReadRspTwoEnable)begin
      way_dataReadRspOneAddress_regNextWhen <= way_dataReadRspOneAddress;
    end
    if((way_dataReadRspTwoEnable || (_zz_14_ && dataWriteCmd_payload_mask[0])))begin
      _zz_15_ <= (((! way_dataReadRspTwoEnable) || (_zz_13_ && dataWriteCmd_payload_mask[0])) ? dataWriteCmd_payload_data[7 : 0] : way_dataReadRspOne[7 : 0]);
    end
    if((way_dataReadRspTwoEnable || (_zz_14_ && dataWriteCmd_payload_mask[1])))begin
      _zz_16_ <= (((! way_dataReadRspTwoEnable) || (_zz_13_ && dataWriteCmd_payload_mask[1])) ? dataWriteCmd_payload_data[15 : 8] : way_dataReadRspOne[15 : 8]);
    end
    if((way_dataReadRspTwoEnable || (_zz_14_ && dataWriteCmd_payload_mask[2])))begin
      _zz_17_ <= (((! way_dataReadRspTwoEnable) || (_zz_13_ && dataWriteCmd_payload_mask[2])) ? dataWriteCmd_payload_data[23 : 16] : way_dataReadRspOne[23 : 16]);
    end
    if((way_dataReadRspTwoEnable || (_zz_14_ && dataWriteCmd_payload_mask[3])))begin
      _zz_18_ <= (((! way_dataReadRspTwoEnable) || (_zz_13_ && dataWriteCmd_payload_mask[3])) ? dataWriteCmd_payload_data[31 : 24] : way_dataReadRspOne[31 : 24]);
    end
    if(_zz_38_)begin
      victim_requestIn_halfPipe_regs_payload_address <= victim_requestIn_payload_address;
    end
    if(_zz_20_)begin
      _zz_23_ <= _zz_32_;
    end
    if((! io_cpu_memory_isStuck))begin
      stageA_request_kind <= io_cpu_execute_args_kind;
      stageA_request_wr <= io_cpu_execute_args_wr;
      stageA_request_address <= io_cpu_execute_args_address;
      stageA_request_data <= io_cpu_execute_args_data;
      stageA_request_size <= io_cpu_execute_args_size;
      stageA_request_forceUncachedAccess <= io_cpu_execute_args_forceUncachedAccess;
      stageA_request_clean <= io_cpu_execute_args_clean;
      stageA_request_invalidate <= io_cpu_execute_args_invalidate;
      stageA_request_way <= io_cpu_execute_args_way;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_request_kind <= stageA_request_kind;
      stageB_request_wr <= stageA_request_wr;
      stageB_request_address <= stageA_request_address;
      stageB_request_data <= stageA_request_data;
      stageB_request_size <= stageA_request_size;
      stageB_request_forceUncachedAccess <= stageA_request_forceUncachedAccess;
      stageB_request_clean <= stageA_request_clean;
      stageB_request_invalidate <= stageA_request_invalidate;
      stageB_request_way <= stageA_request_way;
    end
    if(_zz_39_)begin
      stageB_mmuRsp_isIoAccess <= io_cpu_memory_mmuBus_rsp_isIoAccess;
      stageB_mmuRsp_allowRead <= io_cpu_memory_mmuBus_rsp_allowRead;
      stageB_mmuRsp_allowWrite <= io_cpu_memory_mmuBus_rsp_allowWrite;
      stageB_mmuRsp_allowExecute <= io_cpu_memory_mmuBus_rsp_allowExecute;
      stageB_mmuRsp_allowUser <= io_cpu_memory_mmuBus_rsp_allowUser;
      stageB_mmuRsp_miss <= io_cpu_memory_mmuBus_rsp_miss;
      stageB_mmuRsp_hit <= io_cpu_memory_mmuBus_rsp_hit;
    end
    if((! io_cpu_writeBack_isStuck))begin
      stageB_waysHit <= (way_tagReadRspTwoRegIn_used && (io_cpu_memory_mmuBus_rsp_physicalAddress[31 : 12] == way_tagReadRspTwoRegIn_address));
    end
    stageB_delayedIsStuck <= io_cpu_writeBack_isStuck;
    stageB_delayedWaysHitValid <= stageB_waysHit;
    if(!(! ((io_cpu_writeBack_isValid && (! io_cpu_writeBack_haltIt)) && io_cpu_writeBack_isStuck))) begin
      $display("ERROR writeBack stuck by another plugin is not allowed");
    end
  end

  always @ (posedge clk) begin
    if(reset) begin
      victim_requestIn_halfPipe_regs_valid <= 1'b0;
      victim_requestIn_halfPipe_regs_ready <= 1'b1;
      victim_readLineCmdCounter <= (4'b0000);
      victim_dataReadRestored <= 1'b0;
      victim_readLineRspCounter <= (4'b0000);
      victim_dataReadCmdOccure_delay_1 <= 1'b0;
      victim_bufferReadCounter <= (4'b0000);
      _zz_21_ <= 1'b0;
      _zz_22_ <= 1'b0;
      victim_bufferReadedCounter <= (3'b000);
      victim_counter_value <= (3'b000);
      stageB_loadingDone <= 1'b0;
      stageB_victimNotSent <= 1'b0;
      stageB_loadingNotDone <= 1'b0;
      stageB_hadMemRspErrorReg <= 1'b0;
      stageB_bootEvicts_valid <= 1'b1;
      stageB_mmuRsp_physicalAddress <= (32'b00000000000000000000000000000000);
      loader_valid <= 1'b0;
      loader_memCmdSent <= 1'b0;
      loader_counter_value <= (3'b000);
    end else begin
      if(_zz_38_)begin
        victim_requestIn_halfPipe_regs_valid <= victim_requestIn_valid;
        victim_requestIn_halfPipe_regs_ready <= (! victim_requestIn_valid);
      end else begin
        victim_requestIn_halfPipe_regs_valid <= (! victim_requestIn_halfPipe_ready);
        victim_requestIn_halfPipe_regs_ready <= victim_requestIn_halfPipe_ready;
      end
      if(victim_requestIn_halfPipe_valid)begin
        if(_zz_33_)begin
          victim_readLineCmdCounter <= (victim_readLineCmdCounter + (4'b0001));
        end else begin
          victim_dataReadRestored <= 1'b1;
        end
      end
      if(victim_requestIn_halfPipe_ready)begin
        victim_dataReadRestored <= 1'b0;
      end
      victim_dataReadCmdOccure_delay_1 <= victim_dataReadCmdOccure;
      if(victim_dataReadCmdOccure_delay_1)begin
        victim_readLineRspCounter <= (victim_readLineRspCounter + (4'b0001));
      end
      if((victim_bufferReadStream_valid && victim_bufferReadStream_ready))begin
        victim_bufferReadCounter <= (victim_bufferReadCounter + (4'b0001));
      end
      if(_zz_20_)begin
        _zz_21_ <= 1'b0;
      end
      if(victim_bufferReadStream_ready)begin
        _zz_21_ <= victim_bufferReadStream_valid;
      end
      if(_zz_20_)begin
        _zz_22_ <= _zz_19_;
      end
      if(victim_bufferReaded_valid)begin
        if(_zz_34_)begin
          victim_bufferReadedCounter <= (victim_bufferReadedCounter + (3'b001));
        end
      end
      victim_counter_value <= victim_counter_valueNext;
      if(victim_requestIn_halfPipe_ready)begin
        victim_readLineCmdCounter[3] <= 1'b0;
        victim_readLineRspCounter[3] <= 1'b0;
        victim_bufferReadCounter[3] <= 1'b0;
      end
      if(_zz_39_)begin
        stageB_mmuRsp_physicalAddress <= io_cpu_memory_mmuBus_rsp_physicalAddress;
      end
      stageB_loadingDone <= (stageB_loaderValid && stageB_loaderReady);
      if(victim_requestIn_ready)begin
        stageB_victimNotSent <= 1'b0;
      end
      if((! io_cpu_memory_isStuck))begin
        stageB_victimNotSent <= 1'b1;
      end
      if(stageB_loaderReady)begin
        stageB_loadingNotDone <= 1'b0;
      end
      if((! io_cpu_memory_isStuck))begin
        stageB_loadingNotDone <= 1'b1;
      end
      stageB_hadMemRspErrorReg <= (stageB_hadMemRspError && io_cpu_writeBack_haltIt);
      if(stageB_bootEvicts_valid)begin
        if(_zz_35_)begin
          stageB_mmuRsp_physicalAddress[11 : 5] <= (stageB_mmuRsp_physicalAddress[11 : 5] + (7'b0000001));
        end else begin
          stageB_bootEvicts_valid <= 1'b0;
        end
      end
      loader_valid <= stageB_loaderValid;
      if((loader_valid && io_mem_cmd_ready))begin
        loader_memCmdSent <= 1'b1;
      end
      loader_counter_value <= loader_counter_valueNext;
      if(loader_counter_willOverflow)begin
        loader_memCmdSent <= 1'b0;
        loader_valid <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(reset) begin
      _zz_28_ <= 1'b0;
    end else begin
      if(_zz_36_)begin
        if(_zz_37_)begin
          if(io_mem_cmd_ready)begin
            _zz_28_ <= 1'b1;
          end
        end
      end
      if((! io_cpu_writeBack_isStuck))begin
        _zz_28_ <= 1'b0;
      end
    end
  end

endmodule

module VexRiscv (
      input  [31:0] externalResetVector,
      input   timerInterrupt,
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
      output [3:0] dBusWishbone_SEL,
      input   dBusWishbone_ERR,
      output [1:0] dBusWishbone_BTE,
      output [2:0] dBusWishbone_CTI,
      input   clk,
      input   reset);
  reg  _zz_206_;
  wire  _zz_207_;
  wire  _zz_208_;
  wire  _zz_209_;
  wire  _zz_210_;
  wire [31:0] _zz_211_;
  wire  _zz_212_;
  wire  _zz_213_;
  wire  _zz_214_;
  wire  _zz_215_;
  wire  _zz_216_;
  wire  _zz_217_;
  wire  _zz_218_;
  wire  _zz_219_;
  wire  _zz_220_;
  wire  _zz_221_;
  wire  _zz_222_;
  wire `DataCacheCpuCmdKind_defaultEncoding_type _zz_223_;
  wire [31:0] _zz_224_;
  wire  _zz_225_;
  wire  _zz_226_;
  wire  _zz_227_;
  wire  _zz_228_;
  wire  _zz_229_;
  wire  _zz_230_;
  wire  _zz_231_;
  wire  _zz_232_;
  wire  _zz_233_;
  wire  _zz_234_;
  wire  _zz_235_;
  wire  _zz_236_;
  wire  _zz_237_;
  wire  _zz_238_;
  reg [31:0] _zz_239_;
  reg [31:0] _zz_240_;
  reg [31:0] _zz_241_;
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
  wire  dataCache_1__io_cpu_memory_haltIt;
  wire  dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  wire [31:0] dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  wire  dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
  wire  dataCache_1__io_cpu_memory_mmuBus_end;
  wire  dataCache_1__io_cpu_writeBack_haltIt;
  wire [31:0] dataCache_1__io_cpu_writeBack_data;
  wire  dataCache_1__io_cpu_writeBack_mmuMiss;
  wire  dataCache_1__io_cpu_writeBack_illegalAccess;
  wire  dataCache_1__io_cpu_writeBack_unalignedAccess;
  wire  dataCache_1__io_cpu_writeBack_accessError;
  wire [31:0] dataCache_1__io_cpu_writeBack_badAddr;
  wire  dataCache_1__io_mem_cmd_valid;
  wire  dataCache_1__io_mem_cmd_payload_wr;
  wire [31:0] dataCache_1__io_mem_cmd_payload_address;
  wire [31:0] dataCache_1__io_mem_cmd_payload_data;
  wire [3:0] dataCache_1__io_mem_cmd_payload_mask;
  wire [2:0] dataCache_1__io_mem_cmd_payload_length;
  wire  dataCache_1__io_mem_cmd_payload_last;
  wire  _zz_242_;
  wire  _zz_243_;
  wire  _zz_244_;
  wire  _zz_245_;
  wire  _zz_246_;
  wire  _zz_247_;
  wire  _zz_248_;
  wire [1:0] _zz_249_;
  wire [1:0] _zz_250_;
  wire  _zz_251_;
  wire [1:0] _zz_252_;
  wire [1:0] _zz_253_;
  wire [3:0] _zz_254_;
  wire [2:0] _zz_255_;
  wire [31:0] _zz_256_;
  wire [11:0] _zz_257_;
  wire [31:0] _zz_258_;
  wire [19:0] _zz_259_;
  wire [11:0] _zz_260_;
  wire [2:0] _zz_261_;
  wire [2:0] _zz_262_;
  wire [0:0] _zz_263_;
  wire [0:0] _zz_264_;
  wire [0:0] _zz_265_;
  wire [0:0] _zz_266_;
  wire [0:0] _zz_267_;
  wire [0:0] _zz_268_;
  wire [0:0] _zz_269_;
  wire [0:0] _zz_270_;
  wire [0:0] _zz_271_;
  wire [0:0] _zz_272_;
  wire [0:0] _zz_273_;
  wire [0:0] _zz_274_;
  wire [0:0] _zz_275_;
  wire [0:0] _zz_276_;
  wire [0:0] _zz_277_;
  wire [0:0] _zz_278_;
  wire [0:0] _zz_279_;
  wire [2:0] _zz_280_;
  wire [4:0] _zz_281_;
  wire [11:0] _zz_282_;
  wire [11:0] _zz_283_;
  wire [31:0] _zz_284_;
  wire [31:0] _zz_285_;
  wire [31:0] _zz_286_;
  wire [31:0] _zz_287_;
  wire [1:0] _zz_288_;
  wire [31:0] _zz_289_;
  wire [1:0] _zz_290_;
  wire [1:0] _zz_291_;
  wire [32:0] _zz_292_;
  wire [31:0] _zz_293_;
  wire [32:0] _zz_294_;
  wire [11:0] _zz_295_;
  wire [19:0] _zz_296_;
  wire [11:0] _zz_297_;
  wire [31:0] _zz_298_;
  wire [31:0] _zz_299_;
  wire [31:0] _zz_300_;
  wire [11:0] _zz_301_;
  wire [19:0] _zz_302_;
  wire [11:0] _zz_303_;
  wire [2:0] _zz_304_;
  wire [1:0] _zz_305_;
  wire [1:0] _zz_306_;
  wire [51:0] _zz_307_;
  wire [51:0] _zz_308_;
  wire [51:0] _zz_309_;
  wire [32:0] _zz_310_;
  wire [51:0] _zz_311_;
  wire [49:0] _zz_312_;
  wire [51:0] _zz_313_;
  wire [49:0] _zz_314_;
  wire [51:0] _zz_315_;
  wire [65:0] _zz_316_;
  wire [65:0] _zz_317_;
  wire [31:0] _zz_318_;
  wire [31:0] _zz_319_;
  wire [0:0] _zz_320_;
  wire [5:0] _zz_321_;
  wire [32:0] _zz_322_;
  wire [32:0] _zz_323_;
  wire [31:0] _zz_324_;
  wire [31:0] _zz_325_;
  wire [32:0] _zz_326_;
  wire [32:0] _zz_327_;
  wire [32:0] _zz_328_;
  wire [0:0] _zz_329_;
  wire [32:0] _zz_330_;
  wire [0:0] _zz_331_;
  wire [32:0] _zz_332_;
  wire [0:0] _zz_333_;
  wire [31:0] _zz_334_;
  wire [0:0] _zz_335_;
  wire [0:0] _zz_336_;
  wire [0:0] _zz_337_;
  wire [0:0] _zz_338_;
  wire [0:0] _zz_339_;
  wire [0:0] _zz_340_;
  wire [26:0] _zz_341_;
  wire  _zz_342_;
  wire  _zz_343_;
  wire [1:0] _zz_344_;
  wire [0:0] _zz_345_;
  wire [7:0] _zz_346_;
  wire  _zz_347_;
  wire [0:0] _zz_348_;
  wire [0:0] _zz_349_;
  wire [31:0] _zz_350_;
  wire  _zz_351_;
  wire  _zz_352_;
  wire [0:0] _zz_353_;
  wire [1:0] _zz_354_;
  wire [1:0] _zz_355_;
  wire [1:0] _zz_356_;
  wire  _zz_357_;
  wire [0:0] _zz_358_;
  wire [25:0] _zz_359_;
  wire [31:0] _zz_360_;
  wire [31:0] _zz_361_;
  wire [31:0] _zz_362_;
  wire [31:0] _zz_363_;
  wire [31:0] _zz_364_;
  wire [31:0] _zz_365_;
  wire [31:0] _zz_366_;
  wire [31:0] _zz_367_;
  wire [31:0] _zz_368_;
  wire [31:0] _zz_369_;
  wire [31:0] _zz_370_;
  wire [0:0] _zz_371_;
  wire [0:0] _zz_372_;
  wire [1:0] _zz_373_;
  wire [1:0] _zz_374_;
  wire  _zz_375_;
  wire [0:0] _zz_376_;
  wire [22:0] _zz_377_;
  wire [31:0] _zz_378_;
  wire [31:0] _zz_379_;
  wire [31:0] _zz_380_;
  wire [0:0] _zz_381_;
  wire [3:0] _zz_382_;
  wire [0:0] _zz_383_;
  wire [0:0] _zz_384_;
  wire [0:0] _zz_385_;
  wire [0:0] _zz_386_;
  wire  _zz_387_;
  wire [0:0] _zz_388_;
  wire [19:0] _zz_389_;
  wire [31:0] _zz_390_;
  wire [31:0] _zz_391_;
  wire [31:0] _zz_392_;
  wire  _zz_393_;
  wire [0:0] _zz_394_;
  wire [0:0] _zz_395_;
  wire [31:0] _zz_396_;
  wire  _zz_397_;
  wire  _zz_398_;
  wire  _zz_399_;
  wire [0:0] _zz_400_;
  wire [0:0] _zz_401_;
  wire  _zz_402_;
  wire [0:0] _zz_403_;
  wire [16:0] _zz_404_;
  wire [31:0] _zz_405_;
  wire [31:0] _zz_406_;
  wire [0:0] _zz_407_;
  wire [1:0] _zz_408_;
  wire [1:0] _zz_409_;
  wire [1:0] _zz_410_;
  wire  _zz_411_;
  wire [0:0] _zz_412_;
  wire [13:0] _zz_413_;
  wire [31:0] _zz_414_;
  wire [31:0] _zz_415_;
  wire [31:0] _zz_416_;
  wire  _zz_417_;
  wire [0:0] _zz_418_;
  wire [0:0] _zz_419_;
  wire  _zz_420_;
  wire [4:0] _zz_421_;
  wire [4:0] _zz_422_;
  wire  _zz_423_;
  wire [0:0] _zz_424_;
  wire [9:0] _zz_425_;
  wire [31:0] _zz_426_;
  wire [31:0] _zz_427_;
  wire  _zz_428_;
  wire [0:0] _zz_429_;
  wire [1:0] _zz_430_;
  wire  _zz_431_;
  wire  _zz_432_;
  wire [0:0] _zz_433_;
  wire [1:0] _zz_434_;
  wire [4:0] _zz_435_;
  wire [4:0] _zz_436_;
  wire  _zz_437_;
  wire [0:0] _zz_438_;
  wire [6:0] _zz_439_;
  wire [31:0] _zz_440_;
  wire [31:0] _zz_441_;
  wire [31:0] _zz_442_;
  wire  _zz_443_;
  wire  _zz_444_;
  wire [31:0] _zz_445_;
  wire [31:0] _zz_446_;
  wire [31:0] _zz_447_;
  wire [31:0] _zz_448_;
  wire  _zz_449_;
  wire  _zz_450_;
  wire  _zz_451_;
  wire [0:0] _zz_452_;
  wire [2:0] _zz_453_;
  wire [0:0] _zz_454_;
  wire [1:0] _zz_455_;
  wire [4:0] _zz_456_;
  wire [4:0] _zz_457_;
  wire  _zz_458_;
  wire [0:0] _zz_459_;
  wire [4:0] _zz_460_;
  wire [31:0] _zz_461_;
  wire [31:0] _zz_462_;
  wire [31:0] _zz_463_;
  wire [31:0] _zz_464_;
  wire [31:0] _zz_465_;
  wire  _zz_466_;
  wire [0:0] _zz_467_;
  wire [0:0] _zz_468_;
  wire [31:0] _zz_469_;
  wire [31:0] _zz_470_;
  wire  _zz_471_;
  wire  _zz_472_;
  wire  _zz_473_;
  wire [0:0] _zz_474_;
  wire [2:0] _zz_475_;
  wire [0:0] _zz_476_;
  wire [0:0] _zz_477_;
  wire [0:0] _zz_478_;
  wire [0:0] _zz_479_;
  wire  _zz_480_;
  wire [0:0] _zz_481_;
  wire [2:0] _zz_482_;
  wire [31:0] _zz_483_;
  wire [31:0] _zz_484_;
  wire [31:0] _zz_485_;
  wire [31:0] _zz_486_;
  wire [31:0] _zz_487_;
  wire [31:0] _zz_488_;
  wire [31:0] _zz_489_;
  wire [31:0] _zz_490_;
  wire [31:0] _zz_491_;
  wire [31:0] _zz_492_;
  wire  _zz_493_;
  wire [0:0] _zz_494_;
  wire [0:0] _zz_495_;
  wire [31:0] _zz_496_;
  wire [31:0] _zz_497_;
  wire [31:0] _zz_498_;
  wire [31:0] _zz_499_;
  wire [31:0] _zz_500_;
  wire [31:0] _zz_501_;
  wire  _zz_502_;
  wire [2:0] _zz_503_;
  wire [2:0] _zz_504_;
  wire  _zz_505_;
  wire [0:0] _zz_506_;
  wire [0:0] _zz_507_;
  wire [31:0] _zz_508_;
  wire  _zz_509_;
  wire  _zz_510_;
  wire [0:0] _zz_511_;
  wire [0:0] _zz_512_;
  wire [0:0] _zz_513_;
  wire [0:0] _zz_514_;
  wire  _zz_515_;
  wire  _zz_516_;
  wire  _zz_517_;
  wire  _zz_518_;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_1_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_2_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_3_;
  wire  decode_CSR_READ_OPCODE;
  wire  execute_FLUSH_ALL;
  wire  decode_FLUSH_ALL;
  wire  decode_RS2_USE;
  wire  execute_BYPASSABLE_MEMORY_STAGE;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire  decode_IS_CSR;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  decode_CSR_WRITE_OPCODE;
  wire  execute_REGFILE_WRITE_VALID;
  wire [31:0] execute_MUL_LL;
  wire  decode_MEMORY_ENABLE;
  wire [51:0] memory_MUL_LOW;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_4_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_5_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_6_;
  wire  decode_SRC_USE_SUB_LESS;
  wire [31:0] writeBack_REGFILE_WRITE_DATA;
  wire [31:0] memory_REGFILE_WRITE_DATA;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  wire [31:0] memory_PC;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_7_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_8_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_9_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_10_;
  wire `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_11_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_12_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_13_;
  wire  decode_RS1_USE;
  wire  decode_IS_DIV;
  wire  memory_MEMORY_WR;
  wire  decode_MEMORY_WR;
  wire [33:0] execute_MUL_LH;
  wire  decode_MEMORY_MANAGMENT;
  wire [33:0] execute_MUL_HL;
  wire  memory_IS_MUL;
  wire  execute_IS_MUL;
  wire  decode_IS_MUL;
  wire  decode_PREDICTION_HAD_BRANCHED2;
  wire [33:0] memory_MUL_HH;
  wire [33:0] execute_MUL_HH;
  wire  decode_IS_RS2_SIGNED;
  wire [31:0] execute_SHIFT_RIGHT;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_14_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_15_;
  wire `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_16_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_17_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_18_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_19_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_20_;
  wire  decode_IS_RS1_SIGNED;
  wire `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_21_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_22_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_23_;
  wire `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_24_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_25_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_26_;
  wire  execute_RS2_USE;
  wire  execute_RS1_USE;
  wire  memory_REGFILE_WRITE_VALID;
  wire  memory_BYPASSABLE_MEMORY_STAGE;
  wire  writeBack_REGFILE_WRITE_VALID;
  wire  execute_IS_RS1_SIGNED;
  wire  execute_IS_DIV;
  wire  execute_IS_RS2_SIGNED;
  wire [31:0] memory_INSTRUCTION;
  wire  memory_IS_DIV;
  wire  writeBack_IS_MUL;
  wire [33:0] writeBack_MUL_HH;
  wire [51:0] writeBack_MUL_LOW;
  wire [33:0] memory_MUL_HL;
  wire [33:0] memory_MUL_LH;
  wire [31:0] memory_MUL_LL;
  wire [51:0] _zz_27_;
  wire [33:0] _zz_28_;
  wire [33:0] _zz_29_;
  wire [33:0] _zz_30_;
  wire [31:0] _zz_31_;
  reg [31:0] _zz_32_;
  wire  execute_CSR_READ_OPCODE;
  wire  execute_CSR_WRITE_OPCODE;
  wire  execute_IS_CSR;
  wire `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_33_;
  wire `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_34_;
  wire  _zz_35_;
  wire  _zz_36_;
  wire `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_37_;
  wire  execute_IS_FENCEI;
  reg [31:0] _zz_38_;
  wire [31:0] execute_BRANCH_CALC;
  wire  execute_BRANCH_DO;
  wire [31:0] _zz_39_;
  wire [31:0] execute_PC;
  wire  execute_PREDICTION_HAD_BRANCHED2;
  wire  _zz_40_;
  wire [31:0] execute_RS1;
  wire  execute_BRANCH_COND_RESULT;
  wire `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_41_;
  wire  _zz_42_;
  wire  decode_IS_FENCEI;
  wire  _zz_43_;
  wire [31:0] memory_SHIFT_RIGHT;
  reg [31:0] _zz_44_;
  wire `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_45_;
  wire [31:0] _zz_46_;
  wire `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_47_;
  wire  _zz_48_;
  wire [31:0] _zz_49_;
  wire [31:0] _zz_50_;
  wire  execute_SRC_LESS_UNSIGNED;
  wire  execute_SRC_USE_SUB_LESS;
  wire [31:0] _zz_51_;
  wire `Src2CtrlEnum_defaultEncoding_type execute_SRC2_CTRL;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_52_;
  wire [31:0] _zz_53_;
  wire `Src1CtrlEnum_defaultEncoding_type execute_SRC1_CTRL;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_54_;
  wire [31:0] _zz_55_;
  wire [31:0] execute_SRC_ADD_SUB;
  wire  execute_SRC_LESS;
  wire `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire `AluCtrlEnum_defaultEncoding_type _zz_56_;
  wire [31:0] _zz_57_;
  wire [31:0] execute_SRC2;
  wire [31:0] execute_SRC1;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_58_;
  wire [31:0] _zz_59_;
  wire  _zz_60_;
  reg  _zz_61_;
  wire [31:0] _zz_62_;
  wire [31:0] _zz_63_;
  reg  decode_REGFILE_WRITE_VALID;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_64_;
  wire  _zz_65_;
  wire  _zz_66_;
  wire  _zz_67_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_68_;
  wire  _zz_69_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_70_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_71_;
  wire  _zz_72_;
  wire  _zz_73_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_74_;
  wire  _zz_75_;
  wire  _zz_76_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_77_;
  wire  _zz_78_;
  wire  _zz_79_;
  wire  _zz_80_;
  wire  _zz_81_;
  wire  _zz_82_;
  wire  _zz_83_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_84_;
  wire  _zz_85_;
  wire  _zz_86_;
  reg [31:0] _zz_87_;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire  writeBack_MEMORY_WR;
  wire  writeBack_MEMORY_ENABLE;
  wire  memory_MEMORY_ENABLE;
  wire [1:0] _zz_88_;
  wire  execute_MEMORY_MANAGMENT;
  wire [31:0] execute_RS2;
  wire [31:0] execute_SRC_ADD;
  wire  execute_MEMORY_WR;
  wire  execute_MEMORY_ENABLE;
  wire [31:0] execute_INSTRUCTION;
  wire  memory_FLUSH_ALL;
  reg  IBusCachedPlugin_rsp_issueDetected;
  wire `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_89_;
  reg [31:0] _zz_90_;
  reg [31:0] _zz_91_;
  wire [31:0] _zz_92_;
  wire [31:0] _zz_93_;
  wire [31:0] _zz_94_;
  wire [31:0] writeBack_PC /* verilator public */ ;
  wire [31:0] writeBack_INSTRUCTION /* verilator public */ ;
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
  reg  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  wire  execute_arbitration_flushAll;
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
  reg  writeBack_arbitration_haltItself;
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
  reg  _zz_95_;
  wire  _zz_96_;
  wire  _zz_97_;
  wire [31:0] _zz_98_;
  wire  _zz_99_;
  wire  _zz_100_;
  wire [31:0] _zz_101_;
  wire [31:0] _zz_102_;
  wire [31:0] _zz_103_;
  wire  writeBack_exception_agregat_valid;
  reg [3:0] writeBack_exception_agregat_payload_code;
  wire [31:0] writeBack_exception_agregat_payload_badAddr;
  wire  _zz_104_;
  wire [31:0] _zz_105_;
  reg  _zz_106_;
  reg  _zz_107_;
  reg [31:0] _zz_108_;
  wire  externalInterrupt;
  wire  contextSwitching;
  reg [1:0] CsrPlugin_privilege;
  reg  _zz_109_;
  reg [3:0] _zz_110_;
  wire  IBusCachedPlugin_jump_pcLoad_valid;
  wire [31:0] IBusCachedPlugin_jump_pcLoad_payload;
  wire [3:0] _zz_111_;
  wire [3:0] _zz_112_;
  wire  _zz_113_;
  wire  _zz_114_;
  wire  _zz_115_;
  wire  IBusCachedPlugin_fetchPc_preOutput_valid;
  wire  IBusCachedPlugin_fetchPc_preOutput_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_preOutput_payload;
  wire  _zz_116_;
  wire  IBusCachedPlugin_fetchPc_output_valid;
  wire  IBusCachedPlugin_fetchPc_output_ready;
  wire [31:0] IBusCachedPlugin_fetchPc_output_payload;
  reg [31:0] IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg  IBusCachedPlugin_fetchPc_inc;
  reg  IBusCachedPlugin_fetchPc_propagatePc;
  reg [31:0] IBusCachedPlugin_fetchPc_pc;
  reg  IBusCachedPlugin_fetchPc_samplePcNext;
  reg  _zz_117_;
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
  wire  _zz_118_;
  wire  _zz_119_;
  wire  _zz_120_;
  wire  _zz_121_;
  wire  _zz_122_;
  reg  _zz_123_;
  wire  _zz_124_;
  reg  _zz_125_;
  reg [31:0] _zz_126_;
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
  wire  _zz_127_;
  reg [18:0] _zz_128_;
  wire  _zz_129_;
  reg [10:0] _zz_130_;
  wire  _zz_131_;
  reg [18:0] _zz_132_;
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
  wire [3:0] dBus_cmd_payload_mask;
  wire [2:0] dBus_cmd_payload_length;
  wire  dBus_cmd_payload_last;
  wire  dBus_rsp_valid;
  wire [31:0] dBus_rsp_payload_data;
  wire  dBus_rsp_payload_error;
  wire [1:0] execute_DBusCachedPlugin_size;
  reg [31:0] _zz_133_;
  reg [31:0] writeBack_DBusCachedPlugin_rspShifted;
  wire  _zz_134_;
  reg [31:0] _zz_135_;
  wire  _zz_136_;
  reg [31:0] _zz_137_;
  reg [31:0] writeBack_DBusCachedPlugin_rspFormated;
  wire [31:0] _zz_138_;
  wire  _zz_139_;
  wire  _zz_140_;
  wire  _zz_141_;
  wire  _zz_142_;
  wire  _zz_143_;
  wire  _zz_144_;
  wire  _zz_145_;
  wire `Src2CtrlEnum_defaultEncoding_type _zz_146_;
  wire `ShiftCtrlEnum_defaultEncoding_type _zz_147_;
  wire `Src1CtrlEnum_defaultEncoding_type _zz_148_;
  wire `AluCtrlEnum_defaultEncoding_type _zz_149_;
  wire `BranchCtrlEnum_defaultEncoding_type _zz_150_;
  wire `AluBitwiseCtrlEnum_defaultEncoding_type _zz_151_;
  wire `EnvCtrlEnum_defaultEncoding_type _zz_152_;
  wire [31:0] execute_RegFilePlugin_srcInstruction;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress1;
  wire [4:0] execute_RegFilePlugin_regFileReadAddress2;
  wire [31:0] execute_RegFilePlugin_rs1Data;
  wire [31:0] execute_RegFilePlugin_rs2Data;
  wire  writeBack_RegFilePlugin_regFileWrite_valid /* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address /* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data /* verilator public */ ;
  reg [31:0] execute_IntAluPlugin_bitwise;
  reg [31:0] _zz_153_;
  reg [31:0] _zz_154_;
  wire  _zz_155_;
  reg [19:0] _zz_156_;
  wire  _zz_157_;
  reg [19:0] _zz_158_;
  reg [31:0] _zz_159_;
  wire [31:0] execute_SrcPlugin_addSub;
  wire  execute_SrcPlugin_less;
  wire [4:0] execute_FullBarrelShifterPlugin_amplitude;
  reg [31:0] _zz_160_;
  wire [31:0] execute_FullBarrelShifterPlugin_reversed;
  reg [31:0] _zz_161_;
  wire  execute_BranchPlugin_eq;
  wire [2:0] _zz_162_;
  reg  _zz_163_;
  reg  _zz_164_;
  wire  _zz_165_;
  reg [19:0] _zz_166_;
  wire  _zz_167_;
  reg [10:0] _zz_168_;
  wire  _zz_169_;
  reg [18:0] _zz_170_;
  reg  _zz_171_;
  wire  execute_BranchPlugin_missAlignedTarget;
  reg [31:0] execute_BranchPlugin_branch_src1;
  reg [31:0] execute_BranchPlugin_branch_src2;
  wire  _zz_172_;
  reg [19:0] _zz_173_;
  wire  _zz_174_;
  reg [10:0] _zz_175_;
  wire  _zz_176_;
  reg [18:0] _zz_177_;
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
  wire  _zz_178_;
  wire  _zz_179_;
  wire  _zz_180_;
  wire  CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg  CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
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
  wire [1:0] _zz_181_;
  wire  _zz_182_;
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
  wire [65:0] writeBack_MulPlugin_result;
  reg [32:0] memory_DivPlugin_rs1;
  reg [31:0] memory_DivPlugin_rs2;
  reg [64:0] memory_DivPlugin_accumulator;
  reg  memory_DivPlugin_div_needRevert;
  reg  memory_DivPlugin_div_counter_willIncrement;
  reg  memory_DivPlugin_div_counter_willClear;
  reg [5:0] memory_DivPlugin_div_counter_valueNext;
  reg [5:0] memory_DivPlugin_div_counter_value;
  wire  memory_DivPlugin_div_counter_willOverflowIfInc;
  wire  memory_DivPlugin_div_counter_willOverflow;
  reg  memory_DivPlugin_div_done;
  reg [31:0] memory_DivPlugin_div_result;
  wire [31:0] _zz_183_;
  wire [32:0] _zz_184_;
  wire [32:0] _zz_185_;
  wire [31:0] _zz_186_;
  wire  _zz_187_;
  wire  _zz_188_;
  reg [32:0] _zz_189_;
  reg  _zz_190_;
  reg  _zz_191_;
  wire  _zz_192_;
  reg  _zz_193_;
  reg [4:0] _zz_194_;
  reg [31:0] _zz_195_;
  reg [31:0] externalInterruptArray_regNext;
  wire [31:0] _zz_196_;
  reg `Src1CtrlEnum_defaultEncoding_type decode_to_execute_SRC1_CTRL;
  reg [31:0] decode_to_execute_INSTRUCTION;
  reg [31:0] execute_to_memory_INSTRUCTION;
  reg [31:0] memory_to_writeBack_INSTRUCTION;
  reg `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg  decode_to_execute_IS_RS1_SIGNED;
  reg `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg [31:0] execute_to_memory_SHIFT_RIGHT;
  reg  decode_to_execute_IS_RS2_SIGNED;
  reg [33:0] execute_to_memory_MUL_HH;
  reg [33:0] memory_to_writeBack_MUL_HH;
  reg  decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg  decode_to_execute_IS_MUL;
  reg  execute_to_memory_IS_MUL;
  reg  memory_to_writeBack_IS_MUL;
  reg [33:0] execute_to_memory_MUL_HL;
  reg  decode_to_execute_MEMORY_MANAGMENT;
  reg [33:0] execute_to_memory_MUL_LH;
  reg  decode_to_execute_MEMORY_WR;
  reg  execute_to_memory_MEMORY_WR;
  reg  memory_to_writeBack_MEMORY_WR;
  reg  decode_to_execute_IS_DIV;
  reg  execute_to_memory_IS_DIV;
  reg  decode_to_execute_RS1_USE;
  reg `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg [31:0] decode_to_execute_PC;
  reg [31:0] execute_to_memory_PC;
  reg [31:0] memory_to_writeBack_PC;
  reg [31:0] execute_to_memory_REGFILE_WRITE_DATA;
  reg [31:0] memory_to_writeBack_REGFILE_WRITE_DATA;
  reg  decode_to_execute_SRC_USE_SUB_LESS;
  reg `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg [51:0] memory_to_writeBack_MUL_LOW;
  reg  decode_to_execute_MEMORY_ENABLE;
  reg  execute_to_memory_MEMORY_ENABLE;
  reg  memory_to_writeBack_MEMORY_ENABLE;
  reg [31:0] execute_to_memory_MUL_LL;
  reg  decode_to_execute_REGFILE_WRITE_VALID;
  reg  execute_to_memory_REGFILE_WRITE_VALID;
  reg  memory_to_writeBack_REGFILE_WRITE_VALID;
  reg  decode_to_execute_IS_FENCEI;
  reg  decode_to_execute_CSR_WRITE_OPCODE;
  reg  decode_to_execute_SRC_LESS_UNSIGNED;
  reg  decode_to_execute_IS_CSR;
  reg [31:0] decode_to_execute_FORMAL_PC_NEXT;
  reg [31:0] execute_to_memory_FORMAL_PC_NEXT;
  reg [31:0] memory_to_writeBack_FORMAL_PC_NEXT;
  reg  decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg  decode_to_execute_RS2_USE;
  reg  decode_to_execute_FLUSH_ALL;
  reg  execute_to_memory_FLUSH_ALL;
  reg  decode_to_execute_CSR_READ_OPCODE;
  reg `Src2CtrlEnum_defaultEncoding_type decode_to_execute_SRC2_CTRL;
  reg [1:0] execute_to_memory_MEMORY_ADDRESS_LOW;
  reg [1:0] memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg [2:0] _zz_197_;
  reg  _zz_198_;
  reg [31:0] iBusWishbone_DAT_MISO_regNext;
  reg [2:0] _zz_199_;
  wire  _zz_200_;
  wire  _zz_201_;
  wire  _zz_202_;
  wire  _zz_203_;
  wire  _zz_204_;
  reg  _zz_205_;
  reg [31:0] dBusWishbone_DAT_MISO_regNext;
  `ifndef SYNTHESIS
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_1__string;
  reg [23:0] _zz_2__string;
  reg [23:0] _zz_3__string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_4__string;
  reg [39:0] _zz_5__string;
  reg [39:0] _zz_6__string;
  reg [47:0] _zz_7__string;
  reg [47:0] _zz_8__string;
  reg [47:0] _zz_9__string;
  reg [47:0] _zz_10__string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_11__string;
  reg [47:0] _zz_12__string;
  reg [47:0] _zz_13__string;
  reg [71:0] _zz_14__string;
  reg [71:0] _zz_15__string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_16__string;
  reg [71:0] _zz_17__string;
  reg [71:0] _zz_18__string;
  reg [31:0] _zz_19__string;
  reg [31:0] _zz_20__string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_21__string;
  reg [63:0] _zz_22__string;
  reg [63:0] _zz_23__string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_24__string;
  reg [95:0] _zz_25__string;
  reg [95:0] _zz_26__string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_33__string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_34__string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_37__string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_41__string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_45__string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_47__string;
  reg [23:0] execute_SRC2_CTRL_string;
  reg [23:0] _zz_52__string;
  reg [95:0] execute_SRC1_CTRL_string;
  reg [95:0] _zz_54__string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_56__string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_58__string;
  reg [47:0] _zz_64__string;
  reg [39:0] _zz_68__string;
  reg [31:0] _zz_70__string;
  reg [63:0] _zz_71__string;
  reg [95:0] _zz_74__string;
  reg [71:0] _zz_77__string;
  reg [23:0] _zz_84__string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_89__string;
  reg [23:0] _zz_146__string;
  reg [71:0] _zz_147__string;
  reg [95:0] _zz_148__string;
  reg [63:0] _zz_149__string;
  reg [31:0] _zz_150__string;
  reg [39:0] _zz_151__string;
  reg [47:0] _zz_152__string;
  reg [95:0] decode_to_execute_SRC1_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [23:0] decode_to_execute_SRC2_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;
  assign _zz_242_ = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_243_ = (! memory_DivPlugin_div_done);
  assign _zz_244_ = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_245_ = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_246_ = (IBusCachedPlugin_fetchPc_preOutput_valid && IBusCachedPlugin_fetchPc_preOutput_ready);
  assign _zz_247_ = (! memory_arbitration_isStuck);
  assign _zz_248_ = (iBus_cmd_valid || (_zz_197_ != (3'b000)));
  assign _zz_249_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_250_ = writeBack_INSTRUCTION[29 : 28];
  assign _zz_251_ = execute_INSTRUCTION[13];
  assign _zz_252_ = execute_INSTRUCTION[13 : 12];
  assign _zz_253_ = writeBack_INSTRUCTION[13 : 12];
  assign _zz_254_ = (_zz_111_ - (4'b0001));
  assign _zz_255_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign _zz_256_ = {29'd0, _zz_255_};
  assign _zz_257_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_258_ = {{_zz_128_,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_259_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_260_ = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_261_ = (writeBack_MEMORY_WR ? (3'b111) : (3'b101));
  assign _zz_262_ = (writeBack_MEMORY_WR ? (3'b110) : (3'b100));
  assign _zz_263_ = _zz_138_[0 : 0];
  assign _zz_264_ = _zz_138_[1 : 1];
  assign _zz_265_ = _zz_138_[4 : 4];
  assign _zz_266_ = _zz_138_[5 : 5];
  assign _zz_267_ = _zz_138_[6 : 6];
  assign _zz_268_ = _zz_138_[7 : 7];
  assign _zz_269_ = _zz_138_[8 : 8];
  assign _zz_270_ = _zz_138_[9 : 9];
  assign _zz_271_ = _zz_138_[13 : 13];
  assign _zz_272_ = _zz_138_[14 : 14];
  assign _zz_273_ = _zz_138_[18 : 18];
  assign _zz_274_ = _zz_138_[19 : 19];
  assign _zz_275_ = _zz_138_[24 : 24];
  assign _zz_276_ = _zz_138_[27 : 27];
  assign _zz_277_ = _zz_138_[28 : 28];
  assign _zz_278_ = _zz_138_[29 : 29];
  assign _zz_279_ = execute_SRC_LESS;
  assign _zz_280_ = (3'b100);
  assign _zz_281_ = execute_INSTRUCTION[19 : 15];
  assign _zz_282_ = execute_INSTRUCTION[31 : 20];
  assign _zz_283_ = {execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]};
  assign _zz_284_ = ($signed(_zz_285_) + $signed(_zz_289_));
  assign _zz_285_ = ($signed(_zz_286_) + $signed(_zz_287_));
  assign _zz_286_ = execute_SRC1;
  assign _zz_287_ = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_288_ = (execute_SRC_USE_SUB_LESS ? _zz_290_ : _zz_291_);
  assign _zz_289_ = {{30{_zz_288_[1]}}, _zz_288_};
  assign _zz_290_ = (2'b01);
  assign _zz_291_ = (2'b00);
  assign _zz_292_ = ($signed(_zz_294_) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_293_ = _zz_292_[31 : 0];
  assign _zz_294_ = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_295_ = execute_INSTRUCTION[31 : 20];
  assign _zz_296_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_297_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_298_ = {_zz_166_,execute_INSTRUCTION[31 : 20]};
  assign _zz_299_ = {{_zz_168_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
  assign _zz_300_ = {{_zz_170_,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_301_ = execute_INSTRUCTION[31 : 20];
  assign _zz_302_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_303_ = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_304_ = (3'b100);
  assign _zz_305_ = (_zz_181_ & (~ _zz_306_));
  assign _zz_306_ = (_zz_181_ - (2'b01));
  assign _zz_307_ = ($signed(_zz_308_) + $signed(_zz_313_));
  assign _zz_308_ = ($signed(_zz_309_) + $signed(_zz_311_));
  assign _zz_309_ = (52'b0000000000000000000000000000000000000000000000000000);
  assign _zz_310_ = {1'b0,memory_MUL_LL};
  assign _zz_311_ = {{19{_zz_310_[32]}}, _zz_310_};
  assign _zz_312_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_313_ = {{2{_zz_312_[49]}}, _zz_312_};
  assign _zz_314_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_315_ = {{2{_zz_314_[49]}}, _zz_314_};
  assign _zz_316_ = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_317_ = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_318_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_319_ = writeBack_MulPlugin_result[63 : 32];
  assign _zz_320_ = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_321_ = {5'd0, _zz_320_};
  assign _zz_322_ = {1'd0, memory_DivPlugin_rs2};
  assign _zz_323_ = {_zz_183_,(! _zz_185_[32])};
  assign _zz_324_ = _zz_185_[31:0];
  assign _zz_325_ = _zz_184_[31:0];
  assign _zz_326_ = _zz_327_;
  assign _zz_327_ = _zz_328_;
  assign _zz_328_ = ({1'b0,(memory_DivPlugin_div_needRevert ? (~ _zz_186_) : _zz_186_)} + _zz_330_);
  assign _zz_329_ = memory_DivPlugin_div_needRevert;
  assign _zz_330_ = {32'd0, _zz_329_};
  assign _zz_331_ = _zz_188_;
  assign _zz_332_ = {32'd0, _zz_331_};
  assign _zz_333_ = _zz_187_;
  assign _zz_334_ = {31'd0, _zz_333_};
  assign _zz_335_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_336_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_337_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_338_ = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_339_ = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_340_ = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_341_ = (iBus_cmd_payload_address >>> 5);
  assign _zz_342_ = 1'b1;
  assign _zz_343_ = 1'b1;
  assign _zz_344_ = {_zz_115_,_zz_114_};
  assign _zz_345_ = decode_INSTRUCTION[31];
  assign _zz_346_ = decode_INSTRUCTION[19 : 12];
  assign _zz_347_ = decode_INSTRUCTION[20];
  assign _zz_348_ = decode_INSTRUCTION[31];
  assign _zz_349_ = decode_INSTRUCTION[7];
  assign _zz_350_ = (32'b00010000000000000011000001010000);
  assign _zz_351_ = ((decode_INSTRUCTION & (32'b00010000000100000011000001010000)) == (32'b00000000000100000000000001010000));
  assign _zz_352_ = ((decode_INSTRUCTION & (32'b00010000010000000011000001010000)) == (32'b00010000000000000000000001010000));
  assign _zz_353_ = ((decode_INSTRUCTION & _zz_360_) == (32'b00000000000000000000000001000000));
  assign _zz_354_ = {(_zz_361_ == _zz_362_),(_zz_363_ == _zz_364_)};
  assign _zz_355_ = {(_zz_365_ == _zz_366_),(_zz_367_ == _zz_368_)};
  assign _zz_356_ = (2'b00);
  assign _zz_357_ = ((_zz_369_ == _zz_370_) != (1'b0));
  assign _zz_358_ = ({_zz_371_,_zz_372_} != (2'b00));
  assign _zz_359_ = {(_zz_373_ != _zz_374_),{_zz_375_,{_zz_376_,_zz_377_}}};
  assign _zz_360_ = (32'b00000000000000000000000001000100);
  assign _zz_361_ = (decode_INSTRUCTION & (32'b01000000000000000000000000110000));
  assign _zz_362_ = (32'b01000000000000000000000000110000);
  assign _zz_363_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010100));
  assign _zz_364_ = (32'b00000000000000000010000000010000);
  assign _zz_365_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_366_ = (32'b00000000000000000010000000000000);
  assign _zz_367_ = (decode_INSTRUCTION & (32'b00000000000000000101000000000000));
  assign _zz_368_ = (32'b00000000000000000001000000000000);
  assign _zz_369_ = (decode_INSTRUCTION & (32'b00000000000000000000000000001000));
  assign _zz_370_ = (32'b00000000000000000000000000001000);
  assign _zz_371_ = ((decode_INSTRUCTION & _zz_378_) == (32'b00000000000000000001000000000000));
  assign _zz_372_ = _zz_142_;
  assign _zz_373_ = {_zz_142_,(_zz_379_ == _zz_380_)};
  assign _zz_374_ = (2'b00);
  assign _zz_375_ = ({_zz_141_,{_zz_381_,_zz_382_}} != (6'b000000));
  assign _zz_376_ = ({_zz_383_,_zz_384_} != (2'b00));
  assign _zz_377_ = {(_zz_385_ != _zz_386_),{_zz_387_,{_zz_388_,_zz_389_}}};
  assign _zz_378_ = (32'b00000000000000000001000000000000);
  assign _zz_379_ = (decode_INSTRUCTION & (32'b00000000000000000011000000000000));
  assign _zz_380_ = (32'b00000000000000000010000000000000);
  assign _zz_381_ = ((decode_INSTRUCTION & _zz_390_) == (32'b00000000000000000001000000010000));
  assign _zz_382_ = {(_zz_391_ == _zz_392_),{_zz_393_,{_zz_394_,_zz_395_}}};
  assign _zz_383_ = _zz_141_;
  assign _zz_384_ = _zz_145_;
  assign _zz_385_ = ((decode_INSTRUCTION & _zz_396_) == (32'b00000000000000000000000001000000));
  assign _zz_386_ = (1'b0);
  assign _zz_387_ = ({_zz_397_,_zz_398_} != (2'b00));
  assign _zz_388_ = (_zz_399_ != (1'b0));
  assign _zz_389_ = {(_zz_400_ != _zz_401_),{_zz_402_,{_zz_403_,_zz_404_}}};
  assign _zz_390_ = (32'b00000000000000000001000000010000);
  assign _zz_391_ = (decode_INSTRUCTION & (32'b00000000000000000010000000010000));
  assign _zz_392_ = (32'b00000000000000000010000000010000);
  assign _zz_393_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000010000));
  assign _zz_394_ = _zz_140_;
  assign _zz_395_ = ((decode_INSTRUCTION & _zz_405_) == (32'b00000000000000000000000000000100));
  assign _zz_396_ = (32'b00000000000000000000000001011000);
  assign _zz_397_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100100));
  assign _zz_398_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000010100)) == (32'b00000000000000000100000000010000));
  assign _zz_399_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000010100)) == (32'b00000000000000000010000000010000));
  assign _zz_400_ = ((decode_INSTRUCTION & _zz_406_) == (32'b00000000000000000000000000001000));
  assign _zz_401_ = (1'b0);
  assign _zz_402_ = (_zz_143_ != (1'b0));
  assign _zz_403_ = ({_zz_407_,_zz_408_} != (3'b000));
  assign _zz_404_ = {(_zz_409_ != _zz_410_),{_zz_411_,{_zz_412_,_zz_413_}}};
  assign _zz_405_ = (32'b00000000000000000101000000000100);
  assign _zz_406_ = (32'b00000000000000000001000001001000);
  assign _zz_407_ = _zz_141_;
  assign _zz_408_ = {_zz_144_,_zz_145_};
  assign _zz_409_ = {_zz_144_,((decode_INSTRUCTION & _zz_414_) == (32'b00000000000000000000000000000100))};
  assign _zz_410_ = (2'b00);
  assign _zz_411_ = ({(_zz_415_ == _zz_416_),{_zz_417_,{_zz_418_,_zz_419_}}} != (4'b0000));
  assign _zz_412_ = (_zz_143_ != (1'b0));
  assign _zz_413_ = {(_zz_420_ != (1'b0)),{(_zz_421_ != _zz_422_),{_zz_423_,{_zz_424_,_zz_425_}}}};
  assign _zz_414_ = (32'b00000000000000000000000001001100);
  assign _zz_415_ = (decode_INSTRUCTION & (32'b00000000000000000000000001010000));
  assign _zz_416_ = (32'b00000000000000000000000001000000);
  assign _zz_417_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000011000)) == (32'b00000000000000000100000000000000));
  assign _zz_418_ = ((decode_INSTRUCTION & _zz_426_) == (32'b00000000000000000000000000000000));
  assign _zz_419_ = ((decode_INSTRUCTION & _zz_427_) == (32'b00000000000000000000000001000000));
  assign _zz_420_ = ((decode_INSTRUCTION & (32'b00000010000000000100000001110100)) == (32'b00000010000000000000000000110000));
  assign _zz_421_ = {_zz_142_,{_zz_428_,{_zz_429_,_zz_430_}}};
  assign _zz_422_ = (5'b00000);
  assign _zz_423_ = ({_zz_431_,_zz_432_} != (2'b00));
  assign _zz_424_ = ({_zz_433_,_zz_434_} != (3'b000));
  assign _zz_425_ = {(_zz_435_ != _zz_436_),{_zz_437_,{_zz_438_,_zz_439_}}};
  assign _zz_426_ = (32'b00000000000000000100000000110000);
  assign _zz_427_ = (32'b00000000010000000011000001000000);
  assign _zz_428_ = ((decode_INSTRUCTION & _zz_440_) == (32'b00000000000000000010000000010000));
  assign _zz_429_ = (_zz_441_ == _zz_442_);
  assign _zz_430_ = {_zz_443_,_zz_444_};
  assign _zz_431_ = ((decode_INSTRUCTION & _zz_445_) == (32'b00000000000000000101000000010000));
  assign _zz_432_ = ((decode_INSTRUCTION & _zz_446_) == (32'b00000000000000000101000000100000));
  assign _zz_433_ = (_zz_447_ == _zz_448_);
  assign _zz_434_ = {_zz_449_,_zz_450_};
  assign _zz_435_ = {_zz_451_,{_zz_452_,_zz_453_}};
  assign _zz_436_ = (5'b00000);
  assign _zz_437_ = ({_zz_454_,_zz_455_} != (3'b000));
  assign _zz_438_ = (_zz_456_ != _zz_457_);
  assign _zz_439_ = {_zz_458_,{_zz_459_,_zz_460_}};
  assign _zz_440_ = (32'b00000000000000000010000000110000);
  assign _zz_441_ = (decode_INSTRUCTION & (32'b00000000000000000001000000110000));
  assign _zz_442_ = (32'b00000000000000000000000000010000);
  assign _zz_443_ = ((decode_INSTRUCTION & _zz_461_) == (32'b00000000000000000010000000100000));
  assign _zz_444_ = ((decode_INSTRUCTION & _zz_462_) == (32'b00000000000000000000000000100000));
  assign _zz_445_ = (32'b00000000000000000111000000110100);
  assign _zz_446_ = (32'b00000010000000000111000001100100);
  assign _zz_447_ = (decode_INSTRUCTION & (32'b01000000000000000011000001010100));
  assign _zz_448_ = (32'b01000000000000000001000000010000);
  assign _zz_449_ = ((decode_INSTRUCTION & _zz_463_) == (32'b00000000000000000001000000010000));
  assign _zz_450_ = ((decode_INSTRUCTION & _zz_464_) == (32'b00000000000000000001000000010000));
  assign _zz_451_ = ((decode_INSTRUCTION & _zz_465_) == (32'b00000000000000000000000001000000));
  assign _zz_452_ = _zz_142_;
  assign _zz_453_ = {_zz_466_,{_zz_467_,_zz_468_}};
  assign _zz_454_ = (_zz_469_ == _zz_470_);
  assign _zz_455_ = {_zz_471_,_zz_472_};
  assign _zz_456_ = {_zz_473_,{_zz_474_,_zz_475_}};
  assign _zz_457_ = (5'b00000);
  assign _zz_458_ = ({_zz_476_,_zz_477_} != (2'b00));
  assign _zz_459_ = (_zz_478_ != _zz_479_);
  assign _zz_460_ = {_zz_480_,{_zz_481_,_zz_482_}};
  assign _zz_461_ = (32'b00000010000000000010000001100000);
  assign _zz_462_ = (32'b00000010000000000011000000100000);
  assign _zz_463_ = (32'b00000000000000000111000000110100);
  assign _zz_464_ = (32'b00000010000000000111000001010100);
  assign _zz_465_ = (32'b00000000000000000000000001000000);
  assign _zz_466_ = ((decode_INSTRUCTION & _zz_483_) == (32'b00000000000000000100000000100000));
  assign _zz_467_ = (_zz_484_ == _zz_485_);
  assign _zz_468_ = (_zz_486_ == _zz_487_);
  assign _zz_469_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110100));
  assign _zz_470_ = (32'b00000000000000000000000000100000);
  assign _zz_471_ = ((decode_INSTRUCTION & _zz_488_) == (32'b00000000000000000000000000100000));
  assign _zz_472_ = ((decode_INSTRUCTION & _zz_489_) == (32'b00000000000000000101000000001000));
  assign _zz_473_ = ((decode_INSTRUCTION & _zz_490_) == (32'b00000000000000000000000000000000));
  assign _zz_474_ = (_zz_491_ == _zz_492_);
  assign _zz_475_ = {_zz_493_,{_zz_494_,_zz_495_}};
  assign _zz_476_ = (_zz_496_ == _zz_497_);
  assign _zz_477_ = (_zz_498_ == _zz_499_);
  assign _zz_478_ = (_zz_500_ == _zz_501_);
  assign _zz_479_ = (1'b0);
  assign _zz_480_ = (_zz_502_ != (1'b0));
  assign _zz_481_ = (_zz_503_ != _zz_504_);
  assign _zz_482_ = {_zz_505_,{_zz_506_,_zz_507_}};
  assign _zz_483_ = (32'b00000000000000000100000000100000);
  assign _zz_484_ = (decode_INSTRUCTION & (32'b00000000000000000000000000110000));
  assign _zz_485_ = (32'b00000000000000000000000000010000);
  assign _zz_486_ = (decode_INSTRUCTION & (32'b00000010000000000000000000100000));
  assign _zz_487_ = (32'b00000000000000000000000000100000);
  assign _zz_488_ = (32'b00000000000000000000000001100100);
  assign _zz_489_ = (32'b00000000000000000101000001001000);
  assign _zz_490_ = (32'b00000000000000000000000001000100);
  assign _zz_491_ = (decode_INSTRUCTION & (32'b00000000000000000000000000011000));
  assign _zz_492_ = (32'b00000000000000000000000000000000);
  assign _zz_493_ = ((decode_INSTRUCTION & (32'b00000000000000000110000000000100)) == (32'b00000000000000000010000000000000));
  assign _zz_494_ = ((decode_INSTRUCTION & _zz_508_) == (32'b00000000000000000001000000000000));
  assign _zz_495_ = _zz_139_;
  assign _zz_496_ = (decode_INSTRUCTION & (32'b00000000000000000001000001010000));
  assign _zz_497_ = (32'b00000000000000000001000001010000);
  assign _zz_498_ = (decode_INSTRUCTION & (32'b00000000000000000010000001010000));
  assign _zz_499_ = (32'b00000000000000000010000001010000);
  assign _zz_500_ = (decode_INSTRUCTION & (32'b00000010000000000100000001100100));
  assign _zz_501_ = (32'b00000010000000000100000000100000);
  assign _zz_502_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000100000));
  assign _zz_503_ = {_zz_141_,{_zz_509_,_zz_510_}};
  assign _zz_504_ = (3'b000);
  assign _zz_505_ = ({_zz_141_,{_zz_511_,_zz_512_}} != (3'b000));
  assign _zz_506_ = ({_zz_513_,_zz_514_} != (2'b00));
  assign _zz_507_ = (_zz_515_ != (1'b0));
  assign _zz_508_ = (32'b00000000000000000101000000000100);
  assign _zz_509_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000001100)) == (32'b00000000000000000000000000000100));
  assign _zz_510_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001110000)) == (32'b00000000000000000000000000100000));
  assign _zz_511_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_512_ = _zz_140_;
  assign _zz_513_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001011000)) == (32'b00000000000000000000000000000000));
  assign _zz_514_ = _zz_139_;
  assign _zz_515_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001001000)) == (32'b00000000000000000000000000001000));
  assign _zz_516_ = execute_INSTRUCTION[31];
  assign _zz_517_ = execute_INSTRUCTION[31];
  assign _zz_518_ = execute_INSTRUCTION[7];
  always @ (posedge clk) begin
    if(_zz_61_) begin
      RegFilePlugin_regFile[writeBack_RegFilePlugin_regFileWrite_payload_address] <= writeBack_RegFilePlugin_regFileWrite_payload_data;
    end
  end

  always @ (posedge clk) begin
    if(_zz_342_) begin
      _zz_239_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_343_) begin
      _zz_240_ <= RegFilePlugin_regFile[execute_RegFilePlugin_regFileReadAddress2];
    end
  end

  InstructionCache IBusCachedPlugin_cache ( 
    .io_flush_cmd_valid(_zz_206_),
    .io_flush_cmd_ready(IBusCachedPlugin_cache_io_flush_cmd_ready),
    .io_flush_rsp(IBusCachedPlugin_cache_io_flush_rsp),
    .io_cpu_prefetch_isValid(_zz_207_),
    .io_cpu_prefetch_haltIt(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt),
    .io_cpu_prefetch_pc(IBusCachedPlugin_iBusRsp_stages_0_input_payload),
    .io_cpu_fetch_isValid(_zz_208_),
    .io_cpu_fetch_isStuck(_zz_209_),
    .io_cpu_fetch_isRemoved(_zz_210_),
    .io_cpu_fetch_pc(IBusCachedPlugin_iBusRsp_stages_1_input_payload),
    .io_cpu_fetch_data(IBusCachedPlugin_cache_io_cpu_fetch_data),
    .io_cpu_fetch_dataBypassValid(IBusCachedPlugin_s1_tightlyCoupledHit),
    .io_cpu_fetch_dataBypass(_zz_211_),
    .io_cpu_fetch_mmuBus_cmd_isValid(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid),
    .io_cpu_fetch_mmuBus_cmd_virtualAddress(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress),
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation),
    .io_cpu_fetch_mmuBus_rsp_physicalAddress(_zz_102_),
    .io_cpu_fetch_mmuBus_rsp_isIoAccess(_zz_212_),
    .io_cpu_fetch_mmuBus_rsp_allowRead(_zz_213_),
    .io_cpu_fetch_mmuBus_rsp_allowWrite(_zz_214_),
    .io_cpu_fetch_mmuBus_rsp_allowExecute(_zz_215_),
    .io_cpu_fetch_mmuBus_rsp_allowUser(_zz_216_),
    .io_cpu_fetch_mmuBus_rsp_miss(_zz_217_),
    .io_cpu_fetch_mmuBus_rsp_hit(_zz_218_),
    .io_cpu_fetch_mmuBus_end(IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end),
    .io_cpu_fetch_physicalAddress(IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress),
    .io_cpu_decode_isValid(_zz_219_),
    .io_cpu_decode_isStuck(_zz_220_),
    .io_cpu_decode_pc(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload),
    .io_cpu_decode_physicalAddress(IBusCachedPlugin_cache_io_cpu_decode_physicalAddress),
    .io_cpu_decode_data(IBusCachedPlugin_cache_io_cpu_decode_data),
    .io_cpu_decode_cacheMiss(IBusCachedPlugin_cache_io_cpu_decode_cacheMiss),
    .io_cpu_decode_error(IBusCachedPlugin_cache_io_cpu_decode_error),
    .io_cpu_decode_mmuMiss(IBusCachedPlugin_cache_io_cpu_decode_mmuMiss),
    .io_cpu_decode_illegalAccess(IBusCachedPlugin_cache_io_cpu_decode_illegalAccess),
    .io_cpu_decode_isUser(_zz_221_),
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
  DataCache dataCache_1_ ( 
    .io_cpu_execute_isValid(_zz_222_),
    .io_cpu_execute_isStuck(execute_arbitration_isStuck),
    .io_cpu_execute_args_kind(_zz_223_),
    .io_cpu_execute_args_wr(execute_MEMORY_WR),
    .io_cpu_execute_args_address(_zz_224_),
    .io_cpu_execute_args_data(_zz_133_),
    .io_cpu_execute_args_size(execute_DBusCachedPlugin_size),
    .io_cpu_execute_args_forceUncachedAccess(_zz_225_),
    .io_cpu_execute_args_clean(_zz_226_),
    .io_cpu_execute_args_invalidate(_zz_227_),
    .io_cpu_execute_args_way(_zz_228_),
    .io_cpu_memory_isValid(_zz_229_),
    .io_cpu_memory_isStuck(memory_arbitration_isStuck),
    .io_cpu_memory_isRemoved(memory_arbitration_removeIt),
    .io_cpu_memory_haltIt(dataCache_1__io_cpu_memory_haltIt),
    .io_cpu_memory_mmuBus_cmd_isValid(dataCache_1__io_cpu_memory_mmuBus_cmd_isValid),
    .io_cpu_memory_mmuBus_cmd_virtualAddress(dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress),
    .io_cpu_memory_mmuBus_cmd_bypassTranslation(dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation),
    .io_cpu_memory_mmuBus_rsp_physicalAddress(_zz_103_),
    .io_cpu_memory_mmuBus_rsp_isIoAccess(_zz_230_),
    .io_cpu_memory_mmuBus_rsp_allowRead(_zz_231_),
    .io_cpu_memory_mmuBus_rsp_allowWrite(_zz_232_),
    .io_cpu_memory_mmuBus_rsp_allowExecute(_zz_233_),
    .io_cpu_memory_mmuBus_rsp_allowUser(_zz_234_),
    .io_cpu_memory_mmuBus_rsp_miss(_zz_235_),
    .io_cpu_memory_mmuBus_rsp_hit(_zz_236_),
    .io_cpu_memory_mmuBus_end(dataCache_1__io_cpu_memory_mmuBus_end),
    .io_cpu_writeBack_isValid(_zz_237_),
    .io_cpu_writeBack_isStuck(writeBack_arbitration_isStuck),
    .io_cpu_writeBack_isUser(_zz_238_),
    .io_cpu_writeBack_haltIt(dataCache_1__io_cpu_writeBack_haltIt),
    .io_cpu_writeBack_data(dataCache_1__io_cpu_writeBack_data),
    .io_cpu_writeBack_mmuMiss(dataCache_1__io_cpu_writeBack_mmuMiss),
    .io_cpu_writeBack_illegalAccess(dataCache_1__io_cpu_writeBack_illegalAccess),
    .io_cpu_writeBack_unalignedAccess(dataCache_1__io_cpu_writeBack_unalignedAccess),
    .io_cpu_writeBack_accessError(dataCache_1__io_cpu_writeBack_accessError),
    .io_cpu_writeBack_badAddr(dataCache_1__io_cpu_writeBack_badAddr),
    .io_mem_cmd_valid(dataCache_1__io_mem_cmd_valid),
    .io_mem_cmd_ready(dBus_cmd_ready),
    .io_mem_cmd_payload_wr(dataCache_1__io_mem_cmd_payload_wr),
    .io_mem_cmd_payload_address(dataCache_1__io_mem_cmd_payload_address),
    .io_mem_cmd_payload_data(dataCache_1__io_mem_cmd_payload_data),
    .io_mem_cmd_payload_mask(dataCache_1__io_mem_cmd_payload_mask),
    .io_mem_cmd_payload_length(dataCache_1__io_mem_cmd_payload_length),
    .io_mem_cmd_payload_last(dataCache_1__io_mem_cmd_payload_last),
    .io_mem_rsp_valid(dBus_rsp_valid),
    .io_mem_rsp_payload_data(dBus_rsp_payload_data),
    .io_mem_rsp_payload_error(dBus_rsp_payload_error),
    .clk(clk),
    .reset(reset) 
  );
  always @(*) begin
    case(_zz_344_)
      2'b00 : begin
        _zz_241_ = _zz_108_;
      end
      2'b01 : begin
        _zz_241_ = _zz_105_;
      end
      2'b10 : begin
        _zz_241_ = _zz_101_;
      end
      default : begin
        _zz_241_ = _zz_98_;
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
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : decode_ALU_BITWISE_CTRL_string = "SRC1 ";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_4_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_4__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_4__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_4__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_4__string = "SRC1 ";
      default : _zz_4__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_5__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_5__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_5__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_5__string = "SRC1 ";
      default : _zz_5__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_6__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_6__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_6__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_6__string = "SRC1 ";
      default : _zz_6__string = "?????";
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
    case(_zz_14_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_14__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_14__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_14__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_14__string = "SRA_1    ";
      default : _zz_14__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_15__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_15__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_15__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_15__string = "SRA_1    ";
      default : _zz_15__string = "?????????";
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
    case(_zz_16_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_16__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_16__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_16__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_16__string = "SRA_1    ";
      default : _zz_16__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_17__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_17__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_17__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_17__string = "SRA_1    ";
      default : _zz_17__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_18__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_18__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_18__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_18__string = "SRA_1    ";
      default : _zz_18__string = "?????????";
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
    case(_zz_20_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_20__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_20__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_20__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_20__string = "JALR";
      default : _zz_20__string = "????";
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
    case(_zz_21_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_21__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_21__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_21__string = "BITWISE ";
      default : _zz_21__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_22_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_22__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_22__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_22__string = "BITWISE ";
      default : _zz_22__string = "????????";
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
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
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
    case(_zz_26_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_26__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_26__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_26__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_26__string = "URS1        ";
      default : _zz_26__string = "????????????";
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
    case(_zz_33_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_33__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_33__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_33__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_33__string = "EBREAK";
      default : _zz_33__string = "??????";
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
    case(_zz_34_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_34__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_34__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_34__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_34__string = "EBREAK";
      default : _zz_34__string = "??????";
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
    case(_zz_37_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_37__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_37__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_37__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_37__string = "EBREAK";
      default : _zz_37__string = "??????";
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
    case(_zz_41_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_41__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_41__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_41__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_41__string = "JALR";
      default : _zz_41__string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_45_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_45__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_45__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_45__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_45__string = "SRA_1    ";
      default : _zz_45__string = "?????????";
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
    case(_zz_47_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_47__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_47__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_47__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_47__string = "SRA_1    ";
      default : _zz_47__string = "?????????";
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
    case(_zz_52_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_52__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_52__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_52__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_52__string = "PC ";
      default : _zz_52__string = "???";
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
    case(_zz_54_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_54__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_54__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_54__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_54__string = "URS1        ";
      default : _zz_54__string = "????????????";
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
    case(_zz_56_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_56__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_56__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_56__string = "BITWISE ";
      default : _zz_56__string = "????????";
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
    case(_zz_58_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_58__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_58__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_58__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_58__string = "SRC1 ";
      default : _zz_58__string = "?????";
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
    case(_zz_68_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_68__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_68__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_68__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_68__string = "SRC1 ";
      default : _zz_68__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_70_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_70__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_70__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_70__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_70__string = "JALR";
      default : _zz_70__string = "????";
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
    case(_zz_74_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_74__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_74__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_74__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_74__string = "URS1        ";
      default : _zz_74__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_77_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_77__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_77__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_77__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_77__string = "SRA_1    ";
      default : _zz_77__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_84_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_84__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_84__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_84__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_84__string = "PC ";
      default : _zz_84__string = "???";
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
    case(_zz_89_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_89__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_89__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_89__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_89__string = "JALR";
      default : _zz_89__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_146_)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_146__string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_146__string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_146__string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_146__string = "PC ";
      default : _zz_146__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_147_)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_147__string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_147__string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_147__string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_147__string = "SRA_1    ";
      default : _zz_147__string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_148_)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_148__string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_148__string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_148__string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_148__string = "URS1        ";
      default : _zz_148__string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_149_)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_149__string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_149__string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_149__string = "BITWISE ";
      default : _zz_149__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_150_)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_150__string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_150__string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_150__string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_150__string = "JALR";
      default : _zz_150__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_151_)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_151__string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_151__string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_151__string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : _zz_151__string = "SRC1 ";
      default : _zz_151__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_152_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_152__string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_152__string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_152__string = "ECALL ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_152__string = "EBREAK";
      default : _zz_152__string = "??????";
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
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
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
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_SRC1 : decode_to_execute_ALU_BITWISE_CTRL_string = "SRC1 ";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
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

  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_88_;
  assign decode_SRC2_CTRL = _zz_1_;
  assign _zz_2_ = _zz_3_;
  assign decode_CSR_READ_OPCODE = _zz_35_;
  assign execute_FLUSH_ALL = decode_to_execute_FLUSH_ALL;
  assign decode_FLUSH_ALL = _zz_72_;
  assign decode_RS2_USE = _zz_79_;
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_78_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = _zz_92_;
  assign decode_IS_CSR = _zz_81_;
  assign decode_SRC_LESS_UNSIGNED = _zz_66_;
  assign decode_CSR_WRITE_OPCODE = _zz_36_;
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_MUL_LL = _zz_31_;
  assign decode_MEMORY_ENABLE = _zz_85_;
  assign memory_MUL_LOW = _zz_27_;
  assign decode_ALU_BITWISE_CTRL = _zz_4_;
  assign _zz_5_ = _zz_6_;
  assign decode_SRC_USE_SUB_LESS = _zz_65_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_57_;
  assign memory_PC = execute_to_memory_PC;
  assign _zz_7_ = _zz_8_;
  assign _zz_9_ = _zz_10_;
  assign decode_ENV_CTRL = _zz_11_;
  assign _zz_12_ = _zz_13_;
  assign decode_RS1_USE = _zz_80_;
  assign decode_IS_DIV = _zz_82_;
  assign memory_MEMORY_WR = execute_to_memory_MEMORY_WR;
  assign decode_MEMORY_WR = _zz_83_;
  assign execute_MUL_LH = _zz_30_;
  assign decode_MEMORY_MANAGMENT = _zz_67_;
  assign execute_MUL_HL = _zz_29_;
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_76_;
  assign decode_PREDICTION_HAD_BRANCHED2 = _zz_43_;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = _zz_28_;
  assign decode_IS_RS2_SIGNED = _zz_73_;
  assign execute_SHIFT_RIGHT = _zz_46_;
  assign _zz_14_ = _zz_15_;
  assign decode_SHIFT_CTRL = _zz_16_;
  assign _zz_17_ = _zz_18_;
  assign _zz_19_ = _zz_20_;
  assign decode_IS_RS1_SIGNED = _zz_75_;
  assign decode_ALU_CTRL = _zz_21_;
  assign _zz_22_ = _zz_23_;
  assign decode_SRC1_CTRL = _zz_24_;
  assign _zz_25_ = _zz_26_;
  assign execute_RS2_USE = decode_to_execute_RS2_USE;
  assign execute_RS1_USE = decode_to_execute_RS1_USE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  always @ (*) begin
    _zz_32_ = execute_REGFILE_WRITE_DATA;
    execute_arbitration_haltItself = 1'b0;
    if((execute_arbitration_isValid && execute_IS_CSR))begin
      _zz_32_ = execute_CsrPlugin_readData;
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_33_;
  assign execute_ENV_CTRL = _zz_34_;
  assign writeBack_ENV_CTRL = _zz_37_;
  assign execute_IS_FENCEI = decode_to_execute_IS_FENCEI;
  always @ (*) begin
    _zz_38_ = decode_INSTRUCTION;
    if(decode_IS_FENCEI)begin
      _zz_38_[12] = 1'b0;
      _zz_38_[22] = 1'b1;
    end
  end

  assign execute_BRANCH_CALC = _zz_39_;
  assign execute_BRANCH_DO = _zz_40_;
  assign execute_PC = decode_to_execute_PC;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_RS1 = _zz_63_;
  assign execute_BRANCH_COND_RESULT = _zz_42_;
  assign execute_BRANCH_CTRL = _zz_41_;
  assign decode_IS_FENCEI = _zz_86_;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_44_ = memory_REGFILE_WRITE_DATA;
    memory_arbitration_haltItself = 1'b0;
    _zz_206_ = 1'b0;
    if((memory_arbitration_isValid && memory_FLUSH_ALL))begin
      _zz_206_ = 1'b1;
      if((! IBusCachedPlugin_cache_io_flush_cmd_ready))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
    if(dataCache_1__io_cpu_memory_haltIt)begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(((dataCache_1__io_cpu_memory_mmuBus_cmd_isValid && (! 1'b1)) && (! 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_44_ = _zz_161_;
      end
      `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
        _zz_44_ = memory_SHIFT_RIGHT;
      end
      default : begin
      end
    endcase
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_242_)begin
      if(_zz_243_)begin
        memory_arbitration_haltItself = 1'b1;
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
      _zz_44_ = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_45_;
  assign execute_SHIFT_CTRL = _zz_47_;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_51_ = execute_PC;
  assign execute_SRC2_CTRL = _zz_52_;
  assign execute_SRC1_CTRL = _zz_54_;
  assign execute_SRC_ADD_SUB = _zz_50_;
  assign execute_SRC_LESS = _zz_48_;
  assign execute_ALU_CTRL = _zz_56_;
  assign execute_SRC2 = _zz_53_;
  assign execute_SRC1 = _zz_55_;
  assign execute_ALU_BITWISE_CTRL = _zz_58_;
  assign _zz_59_ = writeBack_INSTRUCTION;
  assign _zz_60_ = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_61_ = 1'b0;
    if(writeBack_RegFilePlugin_regFileWrite_valid)begin
      _zz_61_ = 1'b1;
    end
  end

  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_69_;
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_87_ = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_87_ = writeBack_DBusCachedPlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_253_)
        2'b00 : begin
          _zz_87_ = _zz_318_;
        end
        default : begin
          _zz_87_ = _zz_319_;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_WR = memory_to_writeBack_MEMORY_WR;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_MEMORY_MANAGMENT;
  assign execute_RS2 = _zz_62_;
  assign execute_SRC_ADD = _zz_49_;
  assign execute_MEMORY_WR = decode_to_execute_MEMORY_WR;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign memory_FLUSH_ALL = execute_to_memory_FLUSH_ALL;
  always @ (*) begin
    IBusCachedPlugin_rsp_issueDetected = 1'b0;
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(((_zz_219_ && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! 1'b0)))begin
      IBusCachedPlugin_rsp_issueDetected = 1'b1;
      IBusCachedPlugin_rsp_redoFetch = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  assign decode_BRANCH_CTRL = _zz_89_;
  always @ (*) begin
    _zz_90_ = execute_FORMAL_PC_NEXT;
    if(_zz_104_)begin
      _zz_90_ = _zz_105_;
    end
  end

  always @ (*) begin
    _zz_91_ = decode_FORMAL_PC_NEXT;
    if(_zz_97_)begin
      _zz_91_ = _zz_98_;
    end
    if(_zz_100_)begin
      _zz_91_ = _zz_101_;
    end
  end

  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  assign decode_PC = _zz_94_;
  assign decode_INSTRUCTION = _zz_93_;
  assign decode_arbitration_haltItself = 1'b0;
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
    if(_zz_104_)begin
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
    if(((execute_arbitration_isValid && execute_IS_FENCEI) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00))))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if((execute_arbitration_isValid && (_zz_190_ || _zz_191_)))begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  assign execute_arbitration_flushAll = 1'b0;
  assign execute_arbitration_redoIt = 1'b0;
  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_flushAll = 1'b0;
    writeBack_arbitration_removeIt = 1'b0;
    _zz_107_ = 1'b0;
    _zz_108_ = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_exception_agregat_valid)begin
      memory_arbitration_flushAll = 1'b1;
      writeBack_arbitration_removeIt = 1'b1;
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(_zz_244_)begin
      _zz_107_ = 1'b1;
      _zz_108_ = {CsrPlugin_mtvec_base,(2'b00)};
      memory_arbitration_flushAll = 1'b1;
    end
    if(_zz_245_)begin
      _zz_108_ = CsrPlugin_mepc;
      _zz_107_ = 1'b1;
      memory_arbitration_flushAll = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_redoIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(dataCache_1__io_cpu_writeBack_haltIt)begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  assign writeBack_arbitration_flushAll = 1'b0;
  assign writeBack_arbitration_redoIt = 1'b0;
  always @ (*) begin
    _zz_95_ = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode}}} != (4'b0000)))begin
      _zz_95_ = 1'b1;
    end
  end

  assign _zz_96_ = 1'b0;
  assign IBusCachedPlugin_jump_pcLoad_valid = ({_zz_107_,{_zz_104_,{_zz_100_,_zz_97_}}} != (4'b0000));
  assign _zz_111_ = {_zz_97_,{_zz_100_,{_zz_104_,_zz_107_}}};
  assign _zz_112_ = (_zz_111_ & (~ _zz_254_));
  assign _zz_113_ = _zz_112_[3];
  assign _zz_114_ = (_zz_112_[1] || _zz_113_);
  assign _zz_115_ = (_zz_112_[2] || _zz_113_);
  assign IBusCachedPlugin_jump_pcLoad_payload = _zz_241_;
  assign _zz_116_ = (! _zz_95_);
  assign IBusCachedPlugin_fetchPc_output_valid = (IBusCachedPlugin_fetchPc_preOutput_valid && _zz_116_);
  assign IBusCachedPlugin_fetchPc_preOutput_ready = (IBusCachedPlugin_fetchPc_output_ready && _zz_116_);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_preOutput_payload;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_propagatePc = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid && IBusCachedPlugin_iBusRsp_stages_1_input_ready))begin
      IBusCachedPlugin_fetchPc_propagatePc = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_256_);
    IBusCachedPlugin_fetchPc_samplePcNext = 1'b0;
    if(IBusCachedPlugin_fetchPc_propagatePc)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    if(_zz_246_)begin
      IBusCachedPlugin_fetchPc_samplePcNext = 1'b1;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
    IBusCachedPlugin_fetchPc_pc[1] = 1'b0;
  end

  assign IBusCachedPlugin_fetchPc_preOutput_valid = _zz_117_;
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

  assign _zz_118_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_118_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_118_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(((IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid && (! 1'b1)) && (! 1'b0)))begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_119_ = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_119_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_119_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b0;
    if((IBusCachedPlugin_rsp_issueDetected || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt = 1'b1;
    end
  end

  assign _zz_120_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_halt);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready && _zz_120_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && _zz_120_);
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = _zz_121_;
  assign _zz_121_ = ((1'b0 && (! _zz_122_)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_122_ = _zz_123_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_122_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = IBusCachedPlugin_fetchPc_pcReg;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_124_)) || IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_124_ = _zz_125_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid = _zz_124_;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload = _zz_126_;
  assign IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
  assign IBusCachedPlugin_iBusRsp_decodeInput_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = (IBusCachedPlugin_iBusRsp_decodeInput_valid && (! IBusCachedPlugin_injector_decodeRemoved));
  assign _zz_94_ = IBusCachedPlugin_iBusRsp_decodeInput_payload_pc;
  assign _zz_93_ = IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_inst;
  assign _zz_92_ = (decode_PC + (32'b00000000000000000000000000000100));
  assign _zz_127_ = _zz_257_[11];
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

  assign _zz_99_ = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_258_[31]));
  assign _zz_97_ = (_zz_99_ && decode_arbitration_isFiring);
  assign _zz_129_ = _zz_259_[19];
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

  assign _zz_131_ = _zz_260_[11];
  always @ (*) begin
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

  assign _zz_98_ = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_130_,{{{_zz_345_,_zz_346_},_zz_347_},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_132_,{{{_zz_348_,_zz_349_},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_207_ = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign _zz_210_ = (IBusCachedPlugin_jump_pcLoad_valid || _zz_96_);
  assign _zz_211_ = (32'b00000000000000000000000000000000);
  assign _zz_208_ = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_209_ = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_219_ = (IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_220_ = (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready);
  assign _zz_221_ = (CsrPlugin_privilege == (2'b00));
  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign _zz_100_ = IBusCachedPlugin_rsp_redoFetch;
  assign _zz_101_ = IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_payload;
  assign IBusCachedPlugin_iBusRsp_decodeInput_valid = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_valid;
  assign IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_ready = IBusCachedPlugin_iBusRsp_decodeInput_ready;
  assign IBusCachedPlugin_iBusRsp_decodeInput_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
  assign IBusCachedPlugin_iBusRsp_decodeInput_payload_pc = IBusCachedPlugin_iBusRsp_cacheRspArbitration_output_payload;
  assign _zz_212_ = _zz_102_[31];
  assign _zz_213_ = 1'b1;
  assign _zz_214_ = 1'b1;
  assign _zz_215_ = 1'b1;
  assign _zz_216_ = 1'b1;
  assign _zz_217_ = 1'b0;
  assign _zz_218_ = 1'b1;
  assign dBus_cmd_valid = dataCache_1__io_mem_cmd_valid;
  assign dBus_cmd_payload_wr = dataCache_1__io_mem_cmd_payload_wr;
  assign dBus_cmd_payload_address = dataCache_1__io_mem_cmd_payload_address;
  assign dBus_cmd_payload_data = dataCache_1__io_mem_cmd_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1__io_mem_cmd_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1__io_mem_cmd_payload_length;
  assign dBus_cmd_payload_last = dataCache_1__io_mem_cmd_payload_last;
  assign execute_DBusCachedPlugin_size = execute_INSTRUCTION[13 : 12];
  assign _zz_222_ = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign _zz_224_ = execute_SRC_ADD;
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_133_ = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_133_ = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_133_ = execute_RS2[31 : 0];
      end
    endcase
  end

  assign _zz_225_ = 1'b0;
  assign _zz_223_ = (execute_MEMORY_MANAGMENT ? `DataCacheCpuCmdKind_defaultEncoding_MANAGMENT : `DataCacheCpuCmdKind_defaultEncoding_MEMORY);
  assign _zz_226_ = execute_INSTRUCTION[28];
  assign _zz_227_ = execute_INSTRUCTION[29];
  assign _zz_228_ = execute_INSTRUCTION[30];
  assign _zz_88_ = _zz_224_[1 : 0];
  assign _zz_229_ = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  assign _zz_230_ = _zz_103_[31];
  assign _zz_231_ = 1'b1;
  assign _zz_232_ = 1'b1;
  assign _zz_233_ = 1'b1;
  assign _zz_234_ = 1'b1;
  assign _zz_235_ = 1'b0;
  assign _zz_236_ = 1'b1;
  assign _zz_237_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_238_ = (CsrPlugin_privilege == (2'b00));
  assign writeBack_exception_agregat_valid = (((dataCache_1__io_cpu_writeBack_mmuMiss || dataCache_1__io_cpu_writeBack_accessError) || dataCache_1__io_cpu_writeBack_illegalAccess) || dataCache_1__io_cpu_writeBack_unalignedAccess);
  assign writeBack_exception_agregat_payload_badAddr = dataCache_1__io_cpu_writeBack_badAddr;
  always @ (*) begin
    writeBack_exception_agregat_payload_code = (4'bxxxx);
    if((dataCache_1__io_cpu_writeBack_illegalAccess || dataCache_1__io_cpu_writeBack_accessError))begin
      writeBack_exception_agregat_payload_code = {1'd0, _zz_261_};
    end
    if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
      writeBack_exception_agregat_payload_code = {1'd0, _zz_262_};
    end
    if(dataCache_1__io_cpu_writeBack_mmuMiss)begin
      writeBack_exception_agregat_payload_code = (4'b1101);
    end
  end

  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1__io_cpu_writeBack_data;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_134_ = (writeBack_DBusCachedPlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
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
    _zz_135_[15] = _zz_134_;
    _zz_135_[14] = _zz_134_;
    _zz_135_[13] = _zz_134_;
    _zz_135_[12] = _zz_134_;
    _zz_135_[11] = _zz_134_;
    _zz_135_[10] = _zz_134_;
    _zz_135_[9] = _zz_134_;
    _zz_135_[8] = _zz_134_;
    _zz_135_[7 : 0] = writeBack_DBusCachedPlugin_rspShifted[7 : 0];
  end

  assign _zz_136_ = (writeBack_DBusCachedPlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_137_[31] = _zz_136_;
    _zz_137_[30] = _zz_136_;
    _zz_137_[29] = _zz_136_;
    _zz_137_[28] = _zz_136_;
    _zz_137_[27] = _zz_136_;
    _zz_137_[26] = _zz_136_;
    _zz_137_[25] = _zz_136_;
    _zz_137_[24] = _zz_136_;
    _zz_137_[23] = _zz_136_;
    _zz_137_[22] = _zz_136_;
    _zz_137_[21] = _zz_136_;
    _zz_137_[20] = _zz_136_;
    _zz_137_[19] = _zz_136_;
    _zz_137_[18] = _zz_136_;
    _zz_137_[17] = _zz_136_;
    _zz_137_[16] = _zz_136_;
    _zz_137_[15 : 0] = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_249_)
      2'b00 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_135_;
      end
      2'b01 : begin
        writeBack_DBusCachedPlugin_rspFormated = _zz_137_;
      end
      default : begin
        writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
      end
    endcase
  end

  assign _zz_102_ = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  assign _zz_103_ = dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  assign _zz_139_ = ((decode_INSTRUCTION & (32'b00000000000000000101000001010000)) == (32'b00000000000000000101000000000000));
  assign _zz_140_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000101000)) == (32'b00000000000000000000000000000000));
  assign _zz_141_ = ((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001001000));
  assign _zz_142_ = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _zz_143_ = ((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000000000000000000));
  assign _zz_144_ = ((decode_INSTRUCTION & (32'b00000000000000000100000001010000)) == (32'b00000000000000000100000001010000));
  assign _zz_145_ = ((decode_INSTRUCTION & (32'b00000000000000000100000000010100)) == (32'b00000000000000000000000000000100));
  assign _zz_138_ = {(((decode_INSTRUCTION & _zz_350_) == (32'b00000000000000000000000001010000)) != (1'b0)),{({_zz_351_,_zz_352_} != (2'b00)),{({_zz_353_,_zz_354_} != (3'b000)),{(_zz_355_ != _zz_356_),{_zz_357_,{_zz_358_,_zz_359_}}}}}};
  assign _zz_86_ = _zz_263_[0];
  assign _zz_85_ = _zz_264_[0];
  assign _zz_146_ = _zz_138_[3 : 2];
  assign _zz_84_ = _zz_146_;
  assign _zz_83_ = _zz_265_[0];
  assign _zz_82_ = _zz_266_[0];
  assign _zz_81_ = _zz_267_[0];
  assign _zz_80_ = _zz_268_[0];
  assign _zz_79_ = _zz_269_[0];
  assign _zz_78_ = _zz_270_[0];
  assign _zz_147_ = _zz_138_[11 : 10];
  assign _zz_77_ = _zz_147_;
  assign _zz_76_ = _zz_271_[0];
  assign _zz_75_ = _zz_272_[0];
  assign _zz_148_ = _zz_138_[17 : 16];
  assign _zz_74_ = _zz_148_;
  assign _zz_73_ = _zz_273_[0];
  assign _zz_72_ = _zz_274_[0];
  assign _zz_149_ = _zz_138_[21 : 20];
  assign _zz_71_ = _zz_149_;
  assign _zz_150_ = _zz_138_[23 : 22];
  assign _zz_70_ = _zz_150_;
  assign _zz_69_ = _zz_275_[0];
  assign _zz_151_ = _zz_138_[26 : 25];
  assign _zz_68_ = _zz_151_;
  assign _zz_67_ = _zz_276_[0];
  assign _zz_66_ = _zz_277_[0];
  assign _zz_65_ = _zz_278_[0];
  assign _zz_152_ = _zz_138_[31 : 30];
  assign _zz_64_ = _zz_152_;
  assign execute_RegFilePlugin_srcInstruction = (execute_arbitration_isStuck ? execute_INSTRUCTION : decode_INSTRUCTION);
  assign execute_RegFilePlugin_regFileReadAddress1 = execute_RegFilePlugin_srcInstruction[19 : 15];
  assign execute_RegFilePlugin_regFileReadAddress2 = execute_RegFilePlugin_srcInstruction[24 : 20];
  assign execute_RegFilePlugin_rs1Data = _zz_239_;
  assign execute_RegFilePlugin_rs2Data = _zz_240_;
  assign _zz_63_ = execute_RegFilePlugin_rs1Data;
  assign _zz_62_ = execute_RegFilePlugin_rs2Data;
  assign writeBack_RegFilePlugin_regFileWrite_valid = (_zz_60_ && writeBack_arbitration_isFiring);
  assign writeBack_RegFilePlugin_regFileWrite_payload_address = _zz_59_[11 : 7];
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _zz_87_;
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
        _zz_153_ = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_153_ = {31'd0, _zz_279_};
      end
      default : begin
        _zz_153_ = execute_SRC_ADD_SUB;
      end
    endcase
  end

  assign _zz_57_ = _zz_153_;
  always @ (*) begin
    case(execute_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_154_ = execute_RS1;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_154_ = {29'd0, _zz_280_};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_154_ = {execute_INSTRUCTION[31 : 12],(12'b000000000000)};
      end
      default : begin
        _zz_154_ = {27'd0, _zz_281_};
      end
    endcase
  end

  assign _zz_55_ = _zz_154_;
  assign _zz_155_ = _zz_282_[11];
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

  assign _zz_157_ = _zz_283_[11];
  always @ (*) begin
    _zz_158_[19] = _zz_157_;
    _zz_158_[18] = _zz_157_;
    _zz_158_[17] = _zz_157_;
    _zz_158_[16] = _zz_157_;
    _zz_158_[15] = _zz_157_;
    _zz_158_[14] = _zz_157_;
    _zz_158_[13] = _zz_157_;
    _zz_158_[12] = _zz_157_;
    _zz_158_[11] = _zz_157_;
    _zz_158_[10] = _zz_157_;
    _zz_158_[9] = _zz_157_;
    _zz_158_[8] = _zz_157_;
    _zz_158_[7] = _zz_157_;
    _zz_158_[6] = _zz_157_;
    _zz_158_[5] = _zz_157_;
    _zz_158_[4] = _zz_157_;
    _zz_158_[3] = _zz_157_;
    _zz_158_[2] = _zz_157_;
    _zz_158_[1] = _zz_157_;
    _zz_158_[0] = _zz_157_;
  end

  always @ (*) begin
    case(execute_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_159_ = execute_RS2;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_159_ = {_zz_156_,execute_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_159_ = {_zz_158_,{execute_INSTRUCTION[31 : 25],execute_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_159_ = _zz_51_;
      end
    endcase
  end

  assign _zz_53_ = _zz_159_;
  assign execute_SrcPlugin_addSub = _zz_284_;
  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _zz_50_ = execute_SrcPlugin_addSub;
  assign _zz_49_ = execute_SrcPlugin_addSub;
  assign _zz_48_ = execute_SrcPlugin_less;
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_160_[0] = execute_SRC1[31];
    _zz_160_[1] = execute_SRC1[30];
    _zz_160_[2] = execute_SRC1[29];
    _zz_160_[3] = execute_SRC1[28];
    _zz_160_[4] = execute_SRC1[27];
    _zz_160_[5] = execute_SRC1[26];
    _zz_160_[6] = execute_SRC1[25];
    _zz_160_[7] = execute_SRC1[24];
    _zz_160_[8] = execute_SRC1[23];
    _zz_160_[9] = execute_SRC1[22];
    _zz_160_[10] = execute_SRC1[21];
    _zz_160_[11] = execute_SRC1[20];
    _zz_160_[12] = execute_SRC1[19];
    _zz_160_[13] = execute_SRC1[18];
    _zz_160_[14] = execute_SRC1[17];
    _zz_160_[15] = execute_SRC1[16];
    _zz_160_[16] = execute_SRC1[15];
    _zz_160_[17] = execute_SRC1[14];
    _zz_160_[18] = execute_SRC1[13];
    _zz_160_[19] = execute_SRC1[12];
    _zz_160_[20] = execute_SRC1[11];
    _zz_160_[21] = execute_SRC1[10];
    _zz_160_[22] = execute_SRC1[9];
    _zz_160_[23] = execute_SRC1[8];
    _zz_160_[24] = execute_SRC1[7];
    _zz_160_[25] = execute_SRC1[6];
    _zz_160_[26] = execute_SRC1[5];
    _zz_160_[27] = execute_SRC1[4];
    _zz_160_[28] = execute_SRC1[3];
    _zz_160_[29] = execute_SRC1[2];
    _zz_160_[30] = execute_SRC1[1];
    _zz_160_[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_160_ : execute_SRC1);
  assign _zz_46_ = _zz_293_;
  always @ (*) begin
    _zz_161_[0] = memory_SHIFT_RIGHT[31];
    _zz_161_[1] = memory_SHIFT_RIGHT[30];
    _zz_161_[2] = memory_SHIFT_RIGHT[29];
    _zz_161_[3] = memory_SHIFT_RIGHT[28];
    _zz_161_[4] = memory_SHIFT_RIGHT[27];
    _zz_161_[5] = memory_SHIFT_RIGHT[26];
    _zz_161_[6] = memory_SHIFT_RIGHT[25];
    _zz_161_[7] = memory_SHIFT_RIGHT[24];
    _zz_161_[8] = memory_SHIFT_RIGHT[23];
    _zz_161_[9] = memory_SHIFT_RIGHT[22];
    _zz_161_[10] = memory_SHIFT_RIGHT[21];
    _zz_161_[11] = memory_SHIFT_RIGHT[20];
    _zz_161_[12] = memory_SHIFT_RIGHT[19];
    _zz_161_[13] = memory_SHIFT_RIGHT[18];
    _zz_161_[14] = memory_SHIFT_RIGHT[17];
    _zz_161_[15] = memory_SHIFT_RIGHT[16];
    _zz_161_[16] = memory_SHIFT_RIGHT[15];
    _zz_161_[17] = memory_SHIFT_RIGHT[14];
    _zz_161_[18] = memory_SHIFT_RIGHT[13];
    _zz_161_[19] = memory_SHIFT_RIGHT[12];
    _zz_161_[20] = memory_SHIFT_RIGHT[11];
    _zz_161_[21] = memory_SHIFT_RIGHT[10];
    _zz_161_[22] = memory_SHIFT_RIGHT[9];
    _zz_161_[23] = memory_SHIFT_RIGHT[8];
    _zz_161_[24] = memory_SHIFT_RIGHT[7];
    _zz_161_[25] = memory_SHIFT_RIGHT[6];
    _zz_161_[26] = memory_SHIFT_RIGHT[5];
    _zz_161_[27] = memory_SHIFT_RIGHT[4];
    _zz_161_[28] = memory_SHIFT_RIGHT[3];
    _zz_161_[29] = memory_SHIFT_RIGHT[2];
    _zz_161_[30] = memory_SHIFT_RIGHT[1];
    _zz_161_[31] = memory_SHIFT_RIGHT[0];
  end

  assign _zz_43_ = (_zz_99_ && (! decode_IS_FENCEI));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_162_ = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_162_ == (3'b000))) begin
        _zz_163_ = execute_BranchPlugin_eq;
    end else if((_zz_162_ == (3'b001))) begin
        _zz_163_ = (! execute_BranchPlugin_eq);
    end else if((((_zz_162_ & (3'b101)) == (3'b101)))) begin
        _zz_163_ = (! execute_SRC_LESS);
    end else begin
        _zz_163_ = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_164_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_164_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_164_ = 1'b1;
      end
      default : begin
        _zz_164_ = _zz_163_;
      end
    endcase
  end

  assign _zz_42_ = _zz_164_;
  assign _zz_165_ = _zz_295_[11];
  always @ (*) begin
    _zz_166_[19] = _zz_165_;
    _zz_166_[18] = _zz_165_;
    _zz_166_[17] = _zz_165_;
    _zz_166_[16] = _zz_165_;
    _zz_166_[15] = _zz_165_;
    _zz_166_[14] = _zz_165_;
    _zz_166_[13] = _zz_165_;
    _zz_166_[12] = _zz_165_;
    _zz_166_[11] = _zz_165_;
    _zz_166_[10] = _zz_165_;
    _zz_166_[9] = _zz_165_;
    _zz_166_[8] = _zz_165_;
    _zz_166_[7] = _zz_165_;
    _zz_166_[6] = _zz_165_;
    _zz_166_[5] = _zz_165_;
    _zz_166_[4] = _zz_165_;
    _zz_166_[3] = _zz_165_;
    _zz_166_[2] = _zz_165_;
    _zz_166_[1] = _zz_165_;
    _zz_166_[0] = _zz_165_;
  end

  assign _zz_167_ = _zz_296_[19];
  always @ (*) begin
    _zz_168_[10] = _zz_167_;
    _zz_168_[9] = _zz_167_;
    _zz_168_[8] = _zz_167_;
    _zz_168_[7] = _zz_167_;
    _zz_168_[6] = _zz_167_;
    _zz_168_[5] = _zz_167_;
    _zz_168_[4] = _zz_167_;
    _zz_168_[3] = _zz_167_;
    _zz_168_[2] = _zz_167_;
    _zz_168_[1] = _zz_167_;
    _zz_168_[0] = _zz_167_;
  end

  assign _zz_169_ = _zz_297_[11];
  always @ (*) begin
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

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_171_ = (_zz_298_[1] ^ execute_RS1[1]);
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_171_ = _zz_299_[1];
      end
      default : begin
        _zz_171_ = _zz_300_[1];
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = (execute_BRANCH_COND_RESULT && _zz_171_);
  assign _zz_40_ = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
        execute_BranchPlugin_branch_src2 = {_zz_173_,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_175_,{{{_zz_516_,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_177_,{{{_zz_517_,_zz_518_},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if((execute_PREDICTION_HAD_BRANCHED2 && (! execute_BranchPlugin_missAlignedTarget)))begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_304_};
        end
      end
    endcase
  end

  assign _zz_172_ = _zz_301_[11];
  always @ (*) begin
    _zz_173_[19] = _zz_172_;
    _zz_173_[18] = _zz_172_;
    _zz_173_[17] = _zz_172_;
    _zz_173_[16] = _zz_172_;
    _zz_173_[15] = _zz_172_;
    _zz_173_[14] = _zz_172_;
    _zz_173_[13] = _zz_172_;
    _zz_173_[12] = _zz_172_;
    _zz_173_[11] = _zz_172_;
    _zz_173_[10] = _zz_172_;
    _zz_173_[9] = _zz_172_;
    _zz_173_[8] = _zz_172_;
    _zz_173_[7] = _zz_172_;
    _zz_173_[6] = _zz_172_;
    _zz_173_[5] = _zz_172_;
    _zz_173_[4] = _zz_172_;
    _zz_173_[3] = _zz_172_;
    _zz_173_[2] = _zz_172_;
    _zz_173_[1] = _zz_172_;
    _zz_173_[0] = _zz_172_;
  end

  assign _zz_174_ = _zz_302_[19];
  always @ (*) begin
    _zz_175_[10] = _zz_174_;
    _zz_175_[9] = _zz_174_;
    _zz_175_[8] = _zz_174_;
    _zz_175_[7] = _zz_174_;
    _zz_175_[6] = _zz_174_;
    _zz_175_[5] = _zz_174_;
    _zz_175_[4] = _zz_174_;
    _zz_175_[3] = _zz_174_;
    _zz_175_[2] = _zz_174_;
    _zz_175_[1] = _zz_174_;
    _zz_175_[0] = _zz_174_;
  end

  assign _zz_176_ = _zz_303_[11];
  always @ (*) begin
    _zz_177_[18] = _zz_176_;
    _zz_177_[17] = _zz_176_;
    _zz_177_[16] = _zz_176_;
    _zz_177_[15] = _zz_176_;
    _zz_177_[14] = _zz_176_;
    _zz_177_[13] = _zz_176_;
    _zz_177_[12] = _zz_176_;
    _zz_177_[11] = _zz_176_;
    _zz_177_[10] = _zz_176_;
    _zz_177_[9] = _zz_176_;
    _zz_177_[8] = _zz_176_;
    _zz_177_[7] = _zz_176_;
    _zz_177_[6] = _zz_176_;
    _zz_177_[5] = _zz_176_;
    _zz_177_[4] = _zz_176_;
    _zz_177_[3] = _zz_176_;
    _zz_177_[2] = _zz_176_;
    _zz_177_[1] = _zz_176_;
    _zz_177_[0] = _zz_176_;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _zz_39_ = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign _zz_104_ = ((execute_arbitration_isValid && (! execute_arbitration_isStuckByOthers)) && execute_BRANCH_DO);
  assign _zz_105_ = execute_BRANCH_CALC;
  always @ (*) begin
    _zz_106_ = (execute_arbitration_isValid && (execute_BRANCH_DO && execute_BRANCH_CALC[1]));
    if(execute_arbitration_isStuckByOthers)begin
      _zz_106_ = 1'b0;
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = (26'b00000000000000000000000000);
  assign CsrPlugin_medeleg = (32'b00000000000000000000000000000000);
  assign CsrPlugin_mideleg = (32'b00000000000000000000000000000000);
  assign _zz_178_ = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_179_ = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_180_ = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode = 1'b0;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = (2'b11);
  assign execute_exception_agregat_valid = ({_zz_109_,_zz_106_} != (2'b00));
  assign _zz_181_ = {_zz_109_,_zz_106_};
  assign _zz_182_ = _zz_305_[0];
  assign execute_exception_agregat_payload_code = (_zz_182_ ? (4'b0000) : _zz_110_);
  assign execute_exception_agregat_payload_badAddr = (_zz_182_ ? execute_BRANCH_CALC : (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx));
  assign CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_interrupt = 1'b0;
    CsrPlugin_interruptCode = (4'bxxxx);
    if(CsrPlugin_mstatus_MIE)begin
      if(({_zz_180_,{_zz_179_,_zz_178_}} != (3'b000)))begin
        CsrPlugin_interrupt = 1'b1;
      end
      if(_zz_178_)begin
        CsrPlugin_interruptCode = (4'b0111);
      end
      if(_zz_179_)begin
        CsrPlugin_interruptCode = (4'b0011);
      end
      if(_zz_180_)begin
        CsrPlugin_interruptCode = (4'b1011);
      end
    end
    if((! 1'b1))begin
      CsrPlugin_interrupt = 1'b0;
    end
  end

  assign CsrPlugin_interruptTargetPrivilege = (2'b11);
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && 1'b1);
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

  assign contextSwitching = _zz_107_;
  assign _zz_36_ = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == (5'b00000))) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == (5'b00000)))));
  assign _zz_35_ = (decode_INSTRUCTION[13 : 7] != (7'b0100000));
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    execute_CsrPlugin_readData = (32'b00000000000000000000000000000000);
    case(execute_CsrPlugin_csrAddress)
      12'b101111000000 : begin
        execute_CsrPlugin_illegalAccess = 1'b0;
        execute_CsrPlugin_readData[31 : 0] = _zz_195_;
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
      12'b110011000000 : begin
        if(execute_CSR_READ_OPCODE)begin
          execute_CsrPlugin_illegalAccess = 1'b0;
        end
        execute_CsrPlugin_readData[12 : 0] = (13'b1000000000000);
        execute_CsrPlugin_readData[25 : 20] = (6'b100000);
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
        execute_CsrPlugin_readData[31 : 0] = _zz_196_;
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
    _zz_109_ = 1'b0;
    _zz_110_ = (4'bxxxx);
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL)))begin
      _zz_109_ = 1'b1;
      _zz_110_ = (4'b1011);
    end
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK)))begin
      _zz_109_ = 1'b1;
      _zz_110_ = (4'b0011);
    end
  end

  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  always @ (*) begin
    case(_zz_251_)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readData & (~ execute_SRC1)) : (execute_CsrPlugin_readData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign execute_MulPlugin_a = execute_SRC1;
  assign execute_MulPlugin_b = execute_SRC2;
  always @ (*) begin
    case(_zz_252_)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
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
  assign _zz_31_ = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign _zz_30_ = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign _zz_29_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign _zz_28_ = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign _zz_27_ = ($signed(_zz_307_) + $signed(_zz_315_));
  assign writeBack_MulPlugin_result = ($signed(_zz_316_) + $signed(_zz_317_));
  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_247_)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == (6'b100001));
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = (6'b000000);
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_321_);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = (6'b000000);
    end
  end

  assign _zz_183_ = memory_DivPlugin_rs1[31 : 0];
  assign _zz_184_ = {memory_DivPlugin_accumulator[31 : 0],_zz_183_[31]};
  assign _zz_185_ = (_zz_184_ - _zz_322_);
  assign _zz_186_ = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_187_ = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_188_ = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_189_[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_189_[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    _zz_190_ = 1'b0;
    _zz_191_ = 1'b0;
    if(_zz_193_)begin
      if((_zz_194_ == execute_INSTRUCTION[19 : 15]))begin
        _zz_190_ = 1'b1;
      end
      if((_zz_194_ == execute_INSTRUCTION[24 : 20]))begin
        _zz_191_ = 1'b1;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! 1'b1)))begin
        if((writeBack_INSTRUCTION[11 : 7] == execute_INSTRUCTION[19 : 15]))begin
          _zz_190_ = 1'b1;
        end
        if((writeBack_INSTRUCTION[11 : 7] == execute_INSTRUCTION[24 : 20]))begin
          _zz_191_ = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_REGFILE_WRITE_VALID))begin
      if((1'b1 || (! memory_BYPASSABLE_MEMORY_STAGE)))begin
        if((memory_INSTRUCTION[11 : 7] == execute_INSTRUCTION[19 : 15]))begin
          _zz_190_ = 1'b1;
        end
        if((memory_INSTRUCTION[11 : 7] == execute_INSTRUCTION[24 : 20]))begin
          _zz_191_ = 1'b1;
        end
      end
    end
    if((! execute_RS1_USE))begin
      _zz_190_ = 1'b0;
    end
    if((! execute_RS2_USE))begin
      _zz_191_ = 1'b0;
    end
  end

  assign _zz_192_ = (_zz_60_ && writeBack_arbitration_isFiring);
  assign _zz_196_ = (_zz_195_ & externalInterruptArray_regNext);
  assign externalInterrupt = (_zz_196_ != (32'b00000000000000000000000000000000));
  assign _zz_26_ = decode_SRC1_CTRL;
  assign _zz_24_ = _zz_74_;
  assign _zz_54_ = decode_to_execute_SRC1_CTRL;
  assign _zz_23_ = decode_ALU_CTRL;
  assign _zz_21_ = _zz_71_;
  assign _zz_56_ = decode_to_execute_ALU_CTRL;
  assign _zz_20_ = decode_BRANCH_CTRL;
  assign _zz_89_ = _zz_70_;
  assign _zz_41_ = decode_to_execute_BRANCH_CTRL;
  assign _zz_18_ = decode_SHIFT_CTRL;
  assign _zz_15_ = execute_SHIFT_CTRL;
  assign _zz_16_ = _zz_77_;
  assign _zz_47_ = decode_to_execute_SHIFT_CTRL;
  assign _zz_45_ = execute_to_memory_SHIFT_CTRL;
  assign _zz_13_ = decode_ENV_CTRL;
  assign _zz_10_ = execute_ENV_CTRL;
  assign _zz_8_ = memory_ENV_CTRL;
  assign _zz_11_ = _zz_64_;
  assign _zz_34_ = decode_to_execute_ENV_CTRL;
  assign _zz_33_ = execute_to_memory_ENV_CTRL;
  assign _zz_37_ = memory_to_writeBack_ENV_CTRL;
  assign _zz_6_ = decode_ALU_BITWISE_CTRL;
  assign _zz_4_ = _zz_68_;
  assign _zz_58_ = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_3_ = decode_SRC2_CTRL;
  assign _zz_1_ = _zz_84_;
  assign _zz_52_ = decode_to_execute_SRC2_CTRL;
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
  assign iBusWishbone_ADR = {_zz_341_,_zz_197_};
  assign iBusWishbone_CTI = ((_zz_197_ == (3'b111)) ? (3'b111) : (3'b010));
  assign iBusWishbone_BTE = (2'b00);
  assign iBusWishbone_SEL = (4'b1111);
  assign iBusWishbone_WE = 1'b0;
  assign iBusWishbone_DAT_MOSI = (32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
  always @ (*) begin
    iBusWishbone_CYC = 1'b0;
    iBusWishbone_STB = 1'b0;
    if(_zz_248_)begin
      iBusWishbone_CYC = 1'b1;
      iBusWishbone_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWishbone_ACK);
  assign iBus_rsp_valid = _zz_198_;
  assign iBus_rsp_payload_data = iBusWishbone_DAT_MISO_regNext;
  assign iBus_rsp_payload_error = 1'b0;
  assign _zz_204_ = (dBus_cmd_payload_length != (3'b000));
  assign _zz_200_ = dBus_cmd_valid;
  assign _zz_202_ = dBus_cmd_payload_wr;
  assign _zz_203_ = (_zz_199_ == dBus_cmd_payload_length);
  assign dBus_cmd_ready = (_zz_201_ && (_zz_202_ || _zz_203_));
  assign dBusWishbone_ADR = ((_zz_204_ ? {{dBus_cmd_payload_address[31 : 5],_zz_199_},(2'b00)} : {dBus_cmd_payload_address[31 : 2],(2'b00)}) >>> 2);
  assign dBusWishbone_CTI = (_zz_204_ ? (_zz_203_ ? (3'b111) : (3'b010)) : (3'b000));
  assign dBusWishbone_BTE = (2'b00);
  assign dBusWishbone_SEL = (_zz_202_ ? dBus_cmd_payload_mask : (4'b1111));
  assign dBusWishbone_WE = _zz_202_;
  assign dBusWishbone_DAT_MOSI = dBus_cmd_payload_data;
  assign _zz_201_ = (_zz_200_ && dBusWishbone_ACK);
  assign dBusWishbone_CYC = _zz_200_;
  assign dBusWishbone_STB = _zz_200_;
  assign dBus_rsp_valid = _zz_205_;
  assign dBus_rsp_payload_data = dBusWishbone_DAT_MISO_regNext;
  assign dBus_rsp_payload_error = 1'b0;
  always @ (posedge clk) begin
    if(reset) begin
      CsrPlugin_privilege <= (2'b11);
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_117_ <= 1'b0;
      _zz_123_ <= 1'b0;
      _zz_125_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
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
      memory_DivPlugin_div_counter_value <= (6'b000000);
      _zz_193_ <= 1'b0;
      _zz_195_ <= (32'b00000000000000000000000000000000);
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_197_ <= (3'b000);
      _zz_198_ <= 1'b0;
      _zz_199_ <= (3'b000);
      _zz_205_ <= 1'b0;
    end else begin
      if(IBusCachedPlugin_fetchPc_propagatePc)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusCachedPlugin_jump_pcLoad_valid)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if(_zz_246_)begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_samplePcNext)begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      _zz_117_ <= 1'b1;
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        _zz_123_ <= 1'b0;
      end
      if(_zz_121_)begin
        _zz_123_ <= IBusCachedPlugin_iBusRsp_stages_0_output_valid;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_125_ <= IBusCachedPlugin_iBusRsp_stages_1_output_valid;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        _zz_125_ <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b1;
      end
      if((IBusCachedPlugin_jump_pcLoad_valid || _zz_96_))begin
        IBusCachedPlugin_injector_decodeRemoved <= 1'b0;
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
      if(_zz_244_)begin
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
      if(_zz_245_)begin
        case(_zz_250_)
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
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      _zz_193_ <= _zz_192_;
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
      case(execute_CsrPlugin_csrAddress)
        12'b101111000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            _zz_195_ <= execute_CsrPlugin_writeData[31 : 0];
          end
        end
        12'b001100000000 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
            CsrPlugin_mstatus_MPIE <= _zz_335_[0];
            CsrPlugin_mstatus_MIE <= _zz_336_[0];
          end
        end
        12'b001101000001 : begin
        end
        12'b001100000101 : begin
        end
        12'b001101000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mip_MSIP <= _zz_337_[0];
          end
        end
        12'b110011000000 : begin
        end
        12'b001101000011 : begin
        end
        12'b111111000000 : begin
        end
        12'b001101000000 : begin
        end
        12'b001100000100 : begin
          if(execute_CsrPlugin_writeEnable)begin
            CsrPlugin_mie_MEIE <= _zz_338_[0];
            CsrPlugin_mie_MTIE <= _zz_339_[0];
            CsrPlugin_mie_MSIE <= _zz_340_[0];
          end
        end
        12'b001101000010 : begin
        end
        default : begin
        end
      endcase
      if(_zz_248_)begin
        if(iBusWishbone_ACK)begin
          _zz_197_ <= (_zz_197_ + (3'b001));
        end
      end
      _zz_198_ <= (iBusWishbone_CYC && iBusWishbone_ACK);
      if((_zz_200_ && _zz_201_))begin
        _zz_199_ <= (_zz_199_ + (3'b001));
        if(_zz_203_)begin
          _zz_199_ <= (3'b000);
        end
      end
      _zz_205_ <= ((_zz_200_ && (! dBusWishbone_WE)) && dBusWishbone_ACK);
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_126_ <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_cacheRspArbitration_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + (64'b0000000000000000000000000000000000000000000000000000000000000001));
    end
    if(execute_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= execute_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= execute_exception_agregat_payload_badAddr;
    end
    if(writeBack_exception_agregat_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= writeBack_exception_agregat_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= writeBack_exception_agregat_payload_badAddr;
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
    if(_zz_244_)begin
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
    if((memory_DivPlugin_div_counter_value == (6'b100000)))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_242_)begin
      if(_zz_243_)begin
        memory_DivPlugin_rs1[31 : 0] <= _zz_323_[31:0];
        memory_DivPlugin_accumulator[31 : 0] <= ((! _zz_185_[32]) ? _zz_324_ : _zz_325_);
        if((memory_DivPlugin_div_counter_value == (6'b100000)))begin
          memory_DivPlugin_div_result <= _zz_326_[31:0];
        end
      end
    end
    if(_zz_247_)begin
      memory_DivPlugin_accumulator <= (65'b00000000000000000000000000000000000000000000000000000000000000000);
      memory_DivPlugin_rs1 <= ((_zz_188_ ? (~ _zz_189_) : _zz_189_) + _zz_332_);
      memory_DivPlugin_rs2 <= ((_zz_187_ ? (~ execute_RS2) : execute_RS2) + _zz_334_);
      memory_DivPlugin_div_needRevert <= ((_zz_188_ ^ (_zz_187_ && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == (32'b00000000000000000000000000000000)) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    if(_zz_192_)begin
      _zz_194_ <= _zz_59_[11 : 7];
    end
    externalInterruptArray_regNext <= externalInterruptArray;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1_CTRL <= _zz_25_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= _zz_38_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_22_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_19_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_17_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_14_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_MANAGMENT <= decode_MEMORY_MANAGMENT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_WR <= decode_MEMORY_WR;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_WR <= execute_MEMORY_WR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_WR <= memory_MEMORY_WR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1_USE <= decode_RS1_USE;
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
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_51_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_32_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_44_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_5_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
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
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
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
      decode_to_execute_IS_FENCEI <= decode_IS_FENCEI;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_91_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= _zz_90_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= memory_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2_USE <= decode_RS2_USE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FLUSH_ALL <= decode_FLUSH_ALL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FLUSH_ALL <= execute_FLUSH_ALL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_CTRL <= _zz_2_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
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
      12'b110011000000 : begin
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
    dBusWishbone_DAT_MISO_regNext <= dBusWishbone_DAT_MISO;
  end

endmodule

