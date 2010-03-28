`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:16 03/28/2010 
// Design Name: 
// Module Name:    instrument_main 
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
module instrument_main(
    input clk,
    output reg [7:0] bass,
    output reg [7:0] drum,
    input RxD
    );

wire RxD_data_ready;
wire [7:0] RxD_data;

async_receiver receiver(.clk(clk),.RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));

always@(posedge clk)
begin

	if (RxD_data_ready)
	begin
		bass <= RxD_data; //not sure how to distingush between bytes
		
		
	end


end

endmodule
