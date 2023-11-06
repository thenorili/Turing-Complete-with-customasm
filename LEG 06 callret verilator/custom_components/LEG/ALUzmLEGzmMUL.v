module ALUzmLEGzmMUL (clk, rst, Input_1, Input_2, Opcode, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] Input_1;
  input  wire [7:0] Input_2;
  input  wire [7:0] Opcode;
  output  wire [7:0] Output;

  TC_Mul # (.UUID(64'd3605654244292291860 ^ UUID), .BIT_WIDTH(64'd8)) Mul8_0 (.in0(wire_0), .in1(wire_1), .out0(wire_4), .out1());
  TC_Mul # (.UUID(64'd1537731936897442385 ^ UUID), .BIT_WIDTH(64'd8)) Mul8_1 (.in0(wire_0), .in1(wire_1), .out0(), .out1(wire_2));
  MUXzm8i # (.UUID(64'd383135569880736254 ^ UUID)) MUXzm8i_2 (.clk(clk), .rst(rst), .\0 (wire_4), .\1 (wire_2), .\2 (8'd0), .\3 (8'd0), .\4 (8'd0), .\5 (8'd0), .\6 (8'd0), .\7 (8'd0), .Selector(wire_5), .Output(wire_3));

  wire [7:0] wire_0;
  assign wire_0 = Input_1;
  wire [7:0] wire_1;
  assign wire_1 = Input_2;
  wire [7:0] wire_2;
  wire [7:0] wire_3;
  assign Output = wire_3;
  wire [7:0] wire_4;
  wire [7:0] wire_5;
  assign wire_5 = Opcode;

endmodule
