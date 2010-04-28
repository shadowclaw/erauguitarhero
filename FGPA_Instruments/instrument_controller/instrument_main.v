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
	 input [7:0] sw,
    output reg [4:0] bass,
    output reg [3:0] drum,
	 output reg [4:0] guitar,
	 output strum_g,
	 output strum_b,
	 output drum_foot,
	 output reg [7:0] leds,
	 output [7:0] CATHODE,
	 output [3:0] ANODE
    );

wire RxD_data_ready;
wire [7:0] RxD_data;
reg [2:0] inst = 0;
reg [3:0] state_LED = 0;
reg [29:0] slw_clk = 0;
reg [29:0] slw_clk_foot = 0;
reg leds_on = 0;
reg [3:0] an0;
reg [3:0] an1;
reg [3:0] an2;
reg [3:0] an3;
async_receiver receiver(.clk(clk),.RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));
strum_bar strum(.clk(clk),.inst(inst),.strum_b(strum_b),.strum_g(strum_g),.drum_foot(drum_foot));
LCD display(.clk(clk),.an0(an0),.an1(an1),.an2(an2),.an3(an3),.CATHODE(CATHODE),.ANODE(ANODE));
//Answer to the Ultimate Question of Life, the Universe, and Everything + 1


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
		
	
		
	if (sw[7] == 1)
	begin
		leds[7] = 0;
		an0 = 1;
		an1 = 2;
		an2 = 3;
		an3 = 4;
	
		case(btn)
		3'b100:	begin
					bass = sw[4:0];
					if(sw[4:0] > 0)
						inst[1]=1;
					else
						inst[1]=0;
					end
		3'b010:	begin
					drum = sw[4:1];
					inst[2] = sw[5];
					end
		3'b001:	begin
					guitar = sw[4:0];
					if(sw[4:0] > 0)
						inst[0]=1;
					else
						inst[0]=0;
					end
		default: begin
					bass = 0;
					inst = 0;
					drum = 0;
					guitar = 0;
					end
		endcase
	end
	else
	begin
		an0 = 4;
		an1 = 3;
		an2 = 2;
		an3 = 1;
		
		if (RxD_data_ready)
		begin 
			leds[7] = ~leds[7];
			case(RxD_data[2:0])
			3'b001:	begin//	bass
						bass = RxD_data[7:3];
						if(RxD_data[7:3] > 0)
							inst[1]=1;
						else
							inst[1]=0;
						end 
			3'b010:	begin
							drum = RxD_data[6:3];//drum
							if(RxD_data[7] == 1)  
								inst[2] = 1;
							else
								inst[2] = 0;
						end
			3'b100:	begin// 	guitar
						guitar = RxD_data[7:3];
						if(RxD_data[7:3] > 0)
							inst[0]=1;
						else
							inst[0]=0;
						end 
			endcase
		end 
	end
	//Execute Order 66'ish
	
	leds[6:0] = 0;
	
	case(btn)
	3'b100:begin
			 leds[4:0] = bass;
			 leds[5] = strum_b;
			 leds[6] = 0;
			 end
	3'b010:begin
			 leds[4:1] = drum;
			 leds[5] = drum_foot;
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
						end
				4'h1:	begin
						leds[6:0] = 7'b1100000;
						end
				4'h2:	begin
						leds[6:0] = 7'b0110000;
						end
				4'h3:	begin
						leds[6:0] = 7'b0011000;
						end
				4'h4:	begin
						leds[6:0] = 7'b0001100;
						end
				4'h5:	begin
						leds[6:0] = 7'b0000110;
						end
				4'h6:	begin
						leds[6:0] = 7'b0000011;
						end
				4'h7:	begin
						leds[6:0] = 7'b0000001;
						end
				4'h8:	begin
						leds[6:0] = 7'b0000000;
						end
				4'h9:	begin
						leds[6:0] = 7'b0000001;
						end
				4'hA:	begin
						leds[6:0] = 7'b0000011;
						end
				4'hB:	begin
						leds[6:0] = 7'b0000110;
						end
				4'hC:	begin
						leds[6:0] = 7'b0001100;
						end
				4'hD:	begin
						leds[6:0] = 7'b0011000;
						end
				4'hE:	begin
						leds[6:0] = 7'b0110000;
						end
				4'hF:	begin
						leds[6:0] = 7'b1100000;
						end
				endcase
			end
			end
	endcase
end
endmodule
