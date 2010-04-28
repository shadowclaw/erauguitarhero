`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:23 03/31/2010 
// Design Name: 
// Module Name:    strum_bar 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module strum_bar(
    input clk,
    input [2:0] inst,
    output reg strum_b = 0,
    output reg strum_g = 0,
	 output reg drum_foot = 0
    );
	 
reg [29:0] slw_clk_0 = 0;
reg [29:0] slw_clk_1 = 0;
reg [29:0] slw_clk_foot = 0;

always@(posedge clk)
begin
		//strum_g = inst[0];
		//strum_b = inst[1];
		//foot_GO = inst[2];
		
	if(strum_g != inst[0])	
	begin	
		if(slw_clk_0 < 1)  //500000 = 10ms
			slw_clk_0 = slw_clk_0 + 1; 
		else
			begin
				strum_g = inst[0];
				slw_clk_0 = 0;
			end
	end

	if(strum_b != inst[1])
	begin
		if(slw_clk_1 < 1)
			slw_clk_1 = slw_clk_1 + 1;
		else
			begin
				strum_b = inst[1];
				slw_clk_1 = 0;
			end
	end
	
	if(drum_foot != inst[2])
	begin
		if(slw_clk_foot <= 500000)  //500000 = 10ms
			slw_clk_foot = slw_clk_foot + 1; 
		else
			begin
				drum_foot = inst[2];
				slw_clk_foot = 0;
			end
	
	end
end
endmodule
