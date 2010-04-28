`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:17:13 03/19/2010 
// Design Name: 
// Module Name:    LCD 
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
module LCD(
    input clk,
	 input [3:0] an0,
	 input [3:0] an1,
	 input [3:0] an2,
	 input [3:0] an3,
    output reg [7:0] CATHODE,
    output reg [3:0] ANODE
    );
reg [29:0] slw_clk = 0;
reg [1:0] i = 0;
always@(posedge clk)
begin
	if(slw_clk <= 50000)
	   slw_clk = slw_clk + 1;
	else
	   begin
		slw_clk = 0;
		
		case(i)
		2'b0:ANODE = 4'b0111;
		2'b1:ANODE = 4'b1011;
		2'b10:ANODE = 4'b1101;
		2'b11:ANODE = 4'b1110;
		endcase
		
		case(i)
		2'b0:begin
			  case(an0)
			  4'h0:CATHODE = 8'b11000000;//0
			  4'h1:CATHODE = 8'b10000111;//t
			  4'h2:CATHODE = 8'b10100100;//2
			  4'h3:CATHODE = 8'b10110000;//3
			  4'h4:CATHODE = 8'b10001100;//P
			  endcase
			  end
			  
		2'b1:begin
			  case(an1)
			  4'h0:CATHODE = 8'b11000000;//0
			  4'h1:CATHODE = 8'b11111001;//e
			  4'h2:CATHODE = 8'b10000110;//2
			  4'h3:CATHODE = 8'b11000111;//L
			  4'h4:CATHODE = 8'b11000111;//4
			  endcase
			  end	
			  
		2'b10:begin
			  case(an2)
			  4'h0:CATHODE = 8'b11000000;//0
			  4'h1:CATHODE = 8'b11111001;//1
			  4'h2:CATHODE = 8'b10001000;//A
			  4'h3:CATHODE = 8'b10010010;//s
			  4'h4:CATHODE = 8'b10011001;//4
			  endcase
			  end
			  
		2'b11:begin
			  case(an3)
			  4'h0:CATHODE = 8'b11000000;//0
			  4'h1:CATHODE = 8'b10010001;//Y
			  4'h2:CATHODE = 8'b10100100;//2
			  4'h3:CATHODE = 8'b10110000;//3
			  4'h4:CATHODE = 8'b10000111;//t
			  endcase
			  end
		endcase
		
		i = i + 1;
		
		end

end

endmodule
