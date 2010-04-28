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
	 output reg [7:0] leds
    );

wire RxD_data_ready;
wire [7:0] RxD_data;
reg [1:0] inst = 0;
reg [3:0] state_LED = 0;
reg [29:0] slw_clk = 0;
reg leds_on = 0;
async_receiver receiver(.clk(clk),.RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));
strum_bar strum(.clk(clk),.inst(inst),.strum_b(strum_b),.strum_g(strum_g));
display LCD(.clk(clk),
//Answer to the Ultimate Question of Life, the Universe, and Everything


always@(posedge clk)
begin

	if(slw_clk <= 2700000)
		slw_clk = slw_clk + 1;
	else
		begin
		slw_clk = 0;
		leds_on = ~leds_on;
		state_LED = state_LED + 1;
		end
		
	//leds[7] = RxD_data_ready
	if (RxD_data_ready)
	begin 
		leds[7] = 1;
		case(RxD_data[2:0])
		3'b001:begin//	bass
				 bass = RxD_data[7:3];
				 if(RxD_data[7:3] > 0)
						inst[1]=1;
				 else
						inst[1]=0;
				 end 
		3'b010:drum = RxD_data[7:3];	//drum
		3'b100:begin// 	guitar
				 guitar = RxD_data[7:3];
				 if(RxD_data[7:3] > 0)
						inst[0]=1;
				 else
						inst[0]=0;
				 end 
		endcase
	end 
	
	else
	begin 
		leds[7] = 0;
	end 
	//Execute Order 66
	
	leds[6:0] = 0;
	
	case(btn)
	3'b100:begin
			 leds[4:0] = bass;
			 leds[5] = strum_b;
			 leds[6] = 0;
			 end
	3'b010:begin
			 leds[5:1] = drum;
			 leds[6] = 0;
			 end
	3'b001:begin
			 leds[4:0] = guitar;
			 leds[5] = strum_g;
			 leds[6] = 0;
			 end
	default:
		    begin
			 if(leds_on == 1)
			 begin
				case(state_LED)
				4'h0:	begin
						leds[6:0] = 7'b1000000;
						//state_LED = 4'h1;
						end
				4'h1:	begin
						leds[6:0] = 7'b1100000;
						//state_LED = 4'h2;
						end
				4'h2:	begin
						leds[6:0] = 7'b0110000;
						//state_LED = 4'h3;
						end
				4'h3:	begin
						leds[6:0] = 7'b0011000;
						//state_LED = 4'h4;
						end
				4'h4:	begin
						leds[6:0] = 7'b0001100;
						//state_LED = 4'h5;
						end
				4'h5:	begin
						leds[6:0] = 7'b0000110;
						//state_LED = 4'h6;
						end
				4'h6:	begin
						leds[6:0] = 7'b0000011;
						//state_LED = 4'h7;
						end
				4'h7:	begin
						leds[6:0] = 7'b0000001;
						//state_LED = 4'h8;
						end
				4'h8:	begin
						leds[6:0] = 7'b0000000;
						//state_LED = 4'h9;
						end
				4'h9:	begin
						leds[6:0] = 7'b0000001;
						//state_LED = 4'hA;
						end
				4'hA:	begin
						leds[6:0] = 7'b0000011;
						//state_LED = 4'hB;
						end
				4'hB:	begin
						leds[6:0] = 7'b0000110;
						//state_LED = 4'hC;
						end
				4'hC:	begin
						leds[6:0] = 7'b0001100;
						///state_LED = 4'hD;
						end
				4'hD:	begin
						leds[6:0] = 7'b0011000;
						//state_LED = 4'hE;
						end
				4'hE:	begin
						leds[6:0] = 7'b0110000;
						//state_LED = 4'hF;
						end
				4'hF:	begin
						leds[6:0] = 7'b1100000;
						//state_LED = 4'h0;
						end
				endcase
			end
			end
	endcase
end
endmodule
