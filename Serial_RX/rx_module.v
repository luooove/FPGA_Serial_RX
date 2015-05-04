module rx_module(CLK,RSTn,RX_Pin_In,RX_En_Sig,
					  RX_Done_Sig,RX_Data
						);
input CLK;
input RSTn;
input RX_Pin_In;
input RX_En_Sig;

output [7:0] RX_Data;
output RX_Done_Sig;

/*************************************/

wire H2L_Sig;

detect_module U1
(
	.CLK(CLK),
	.RSTn(RSTn),
	.RX_Pin_In(RX_Pin_In), // input - from top
	.H2L_Sig(H2L_Sig)      //output - to U3
);

/*************************************/
wire BPS_CLK;

rx_bps_module U2
(
	.CLK(CLK),
	.RSTn(RSTn),
	.Count_Sig(Count_Sig),  //input - from U3
	.BPS_CLK(BPS_CLK)       //output - to U3
);


/*************************************/
wire Count_Sig;

rx_control_module U3
(
	.CLK(CLK),
	.RSTn(RSTn),
	
	.H2L_Sig(H2L_Sig),
	.RX_En_Sig(RX_En_Sig),
	.RX_Pin_In(RX_Pin_In),
	.BPS_CLK(BPS_CLK),
	
	.Count_Sig(Count_Sig),
	.RX_Data(RX_Data),
	.RX_Done_Sig(RX_Done_Sig)
	
);


/*************************************/						
endmodule

