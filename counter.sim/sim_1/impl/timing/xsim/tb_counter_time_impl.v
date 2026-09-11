// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Tue Sep  8 17:10:15 2026
// Host        : DESKTOP-A0T26FQ running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/Homework_5/counter/counter.sim/sim_1/impl/timing/xsim/tb_counter_time_impl.v
// Design      : counter
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "c8e5f585" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module counter
   (clk,
    rst,
    load,
    data_in,
    en,
    up_down,
    count);
  input clk;
  input rst;
  input load;
  input [3:0]data_in;
  input en;
  input up_down;
  output [3:0]count;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [3:0]count;
  wire \count[3]_i_1_n_0 ;
  wire \count[3]_i_3_n_0 ;
  wire [3:0]count_OBUF;
  wire [3:0]data_in;
  wire [3:0]data_in_IBUF;
  wire en;
  wire en_IBUF;
  wire load;
  wire load_IBUF;
  wire [3:0]p_0_in;
  wire rst;
  wire rst_IBUF;
  wire up_down;
  wire up_down_IBUF;

initial begin
 $sdf_annotate("tb_counter_time_impl.sdf",,,,"tool_control");
end
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT3 #(
    .INIT(8'h8B)) 
    \count[0]_i_1 
       (.I0(data_in_IBUF[0]),
        .I1(load_IBUF),
        .I2(count_OBUF[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h8BB8B88B)) 
    \count[1]_i_1 
       (.I0(data_in_IBUF[1]),
        .I1(load_IBUF),
        .I2(count_OBUF[0]),
        .I3(up_down_IBUF),
        .I4(count_OBUF[1]),
        .O(p_0_in[1]));
  LUT6 #(
    .INIT(64'h8BBBB888BBB8888B)) 
    \count[2]_i_1 
       (.I0(data_in_IBUF[2]),
        .I1(load_IBUF),
        .I2(count_OBUF[0]),
        .I3(up_down_IBUF),
        .I4(count_OBUF[2]),
        .I5(count_OBUF[1]),
        .O(p_0_in[2]));
  LUT2 #(
    .INIT(4'hE)) 
    \count[3]_i_1 
       (.I0(en_IBUF),
        .I1(load_IBUF),
        .O(\count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8BBBB888BBB8888B)) 
    \count[3]_i_2 
       (.I0(data_in_IBUF[3]),
        .I1(load_IBUF),
        .I2(\count[3]_i_3_n_0 ),
        .I3(count_OBUF[1]),
        .I4(count_OBUF[3]),
        .I5(count_OBUF[2]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hD4)) 
    \count[3]_i_3 
       (.I0(count_OBUF[1]),
        .I1(up_down_IBUF),
        .I2(count_OBUF[0]),
        .O(\count[3]_i_3_n_0 ));
  OBUF \count_OBUF[0]_inst 
       (.I(count_OBUF[0]),
        .O(count[0]));
  OBUF \count_OBUF[1]_inst 
       (.I(count_OBUF[1]),
        .O(count[1]));
  OBUF \count_OBUF[2]_inst 
       (.I(count_OBUF[2]),
        .O(count[2]));
  OBUF \count_OBUF[3]_inst 
       (.I(count_OBUF[3]),
        .O(count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\count[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(p_0_in[0]),
        .Q(count_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\count[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(p_0_in[1]),
        .Q(count_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\count[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(p_0_in[2]),
        .Q(count_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\count[3]_i_1_n_0 ),
        .CLR(rst_IBUF),
        .D(p_0_in[3]),
        .Q(count_OBUF[3]));
  IBUF \data_in_IBUF[0]_inst 
       (.I(data_in[0]),
        .O(data_in_IBUF[0]));
  IBUF \data_in_IBUF[1]_inst 
       (.I(data_in[1]),
        .O(data_in_IBUF[1]));
  IBUF \data_in_IBUF[2]_inst 
       (.I(data_in[2]),
        .O(data_in_IBUF[2]));
  IBUF \data_in_IBUF[3]_inst 
       (.I(data_in[3]),
        .O(data_in_IBUF[3]));
  IBUF en_IBUF_inst
       (.I(en),
        .O(en_IBUF));
  IBUF load_IBUF_inst
       (.I(load),
        .O(load_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  IBUF up_down_IBUF_inst
       (.I(up_down),
        .O(up_down_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
