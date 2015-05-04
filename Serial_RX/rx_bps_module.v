module rx_bps_module(CLK,RSTn,Count_Sig,BPS_CLK);
input CLK;
input RSTn;
input Count_Sig;
output BPS_CLK;

/**********************/
reg [11:0] Count_BPS;

always @(posedge CLK or negedge RSTn)
if(!RSTn)
	Count_BPS <= 12'b0;
else if(Count_BPS == 12'd2082)
	Count_BPS <= 12'd0;
else if(Count_Sig)
	Count_BPS <= Count_BPS + 1'b1;
else
	Count_BPS <= 12'd0;
/**********************/

assign BPS_CLK = (Count_BPS == 12'd1041) ? 1'b1 : 1'b0;

/**********************/

endmodule
