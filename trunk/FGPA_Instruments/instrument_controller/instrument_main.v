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
//  |    byte 1     |     |        byte 2        |
//  01234   56      7     89    10 11 12 13 14  15
//  Guitar  Drum1   0     Drum2      Bass       1
//
//////////////////////////////////////////////////////////////////////////////////
module instrument_main(
    input clk,
    output reg [4:0] bass,
    output reg [4:0] drum,
	 output reg [4:0] guitar,
    input RxD
    );

wire RxD_data_ready;
wire [7:0] RxD_data;
reg byte_number = 0;
reg [13:0] received_word = 0;
reg data_ready = 0;
reg [4:0] drum_data = 0;

async_receiver receiver(.clk(clk),.RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));

always@(posedge clk)
begin

	if (RxD_data_ready)
	begin
	
		if(RxD_data[7] == 0)
		begin
			received_word[6:0] <= RxD_data;
			data_ready <= 0;
		end
		
		if(RxD_data[15] == 1)
		begin
			received_word[14:8] <= RxD_data;
			data_ready <= 1;
		end
		
	end

end

always@(posedge data_ready) //bass - guitar
begin

	guitar <= received_word[4:0];
	bass <= received_word[14:10];
	
end

always@(posedge data_ready) //drums
begin

	case(drum_data)
	4'h0F:drum=5'b10001; //1110  foot_peddle,rest of the notes
	4'h0E:drum=5'b10010; //1101
	4'h0D:drum=5'b10100; //1011
	4'h0B:drum=5'b11000; //0111
	default:             //no foot peddle
		begin
		drum[4]=0;
		drum[3:0]=drum_data;
		end
	endcase
	
end

endmodule
