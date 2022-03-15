/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module bool2_15 (
    input [15:0] a,
    input [15:0] b,
    input [3:0] alufn,
    output reg [15:0] alu
  );
  
  
  
  always @* begin
    
    case (alufn)
      4'h8: begin
        alu = a & b;
      end
      4'he: begin
        alu = a | b;
      end
      4'h6: begin
        alu = a ^ b;
      end
      4'ha: begin
        alu = a;
      end
      4'h1: begin
        alu = ~(a & b);
      end
      4'hf: begin
        alu = ~(a | b);
      end
      4'h7: begin
        alu = ~(a ^ b);
      end
      4'h4: begin
        alu = {~a[15+0-:1], a[0+14-:15]};
      end
      default: begin
        alu = 16'h0000;
      end
    endcase
  end
endmodule
