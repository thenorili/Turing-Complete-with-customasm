module ALUzmLEGzm16 (clk, rst, Input_1, Input_2, Opcode, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] Input_1;
  input  wire [7:0] Input_2;
  input  wire [7:0] Opcode;
  output  wire [7:0] Output;

  TC_Mux # (.UUID(64'd4238753362049941924 ^ UUID), .BIT_WIDTH(64'd8)) Mux8_0 (.sel(wire_5), .in0(wire_2), .in1(wire_6), .out(wire_4));
  TC_Splitter8 # (.UUID(64'd2457792033157338613 ^ UUID)) Splitter8_1 (.in(wire_3), .out0(), .out1(), .out2(), .out3(wire_5), .out4(), .out5(), .out6(), .out7());
  ALUzmLEGzmMUL # (.UUID(64'd1870996894500321712 ^ UUID)) ALUzmLEGzmMUL_2 (.clk(clk), .rst(rst), .Input_1(wire_1), .Input_2(wire_0), .Opcode(wire_3), .Output(wire_6));
  ALUzmLEGzm8 # (.UUID(64'd3347289526515011932 ^ UUID)) ALUzmLEGzm8_3 (.clk(clk), .rst(rst), .Input_1(wire_1), .Input_2(wire_0), .Opcode(wire_3), .Output(wire_2));

  wire [7:0] wire_0;
  assign wire_0 = Input_2;
  wire [7:0] wire_1;
  assign wire_1 = Input_1;
  wire [7:0] wire_2;
  wire [7:0] wire_3;
  assign wire_3 = Opcode;
  wire [7:0] wire_4;
  assign Output = wire_4;
  wire [0:0] wire_5;
  wire [7:0] wire_6;

endmodule
