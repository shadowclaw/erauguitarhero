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
//  |   byte 1   |    |   byte 2   |    |   byte 3   |
//  012      34567    012      34567    012      34567
//  Bass ID   data    Drum ID   data    Guitar ID data
//  100       note    010  note,foot    001       note
//
//////////////////////////////////////////////////////////////////////////////////
module instrument_main(
    input clk,
	 input [2:0] btn,
	 input RxD,
    output reg [4:0] bass,
    output reg [4:0] drum,
	 output reg [4:0] guitar,
	 output strum_g,
	 output strum_b,
	 output reg [5:0] leds
    );

wire RxD_data_ready;
wire [7:0] RxD_data;
reg [1:0] inst = 0;

async_receiver receiver(.clk(clk),.RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));
strum_bar strum(.clk(clk),.inst(inst),.strum_b(strum_b),.strum_g(strum_g));//


//Answer to the Ultimate Question of Life, the Universe, and Everything
always@(posedge clk)
begin

	if (RxD_data_ready)
	begin
		case(RxD_data[2:0])
		3'b001:begin	//bass
				 bass = RxD_data[7:3];
				 if(RxD_data[7:3] > 0)
						inst[1]=1;
				 else
						inst[1]=0;
				 end
		3'b010:drum = RxD_data[7:3];	//drum
		3'b100:begin 	//guitar
				 guitar = RxD_data[7:3];
				 if(RxD_data[7:3] > 0)
						inst[0]=1;
				 else
						inst[0]=0;
				 end
		endcase
	end
	//Execute Order 66
	
	case(btn)
	3'b100:begin
			 leds[4:0] = bass;
			 leds[5] = strum_b;
			 end
	3'b010:leds[5:1] = drum;
	3'b001:begin
			 leds[4:0] = guitar;
			 leds[5] = strum_g;
			 end
	default:leds = 0;
	endcase
end
endmodule
