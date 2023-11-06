module ALUzmLEGzm8 (clk, rst, Input_1, Input_2, Opcode, Output);
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] Input_1;
  input  wire [7:0] Input_2;
  input  wire [7:0] Opcode;
  output  wire [7:0] Output;

  TC_Add # (.UUID(64'd4250169551099314035 ^ UUID), .BIT_WIDTH(64'd8)) Add8_0 (.in0(wire_1), .in1(wire_3), .ci(1'd0), .out(wire_11), .co());
  TC_Add # (.UUID(64'd4214626466768707408 ^ UUID), .BIT_WIDTH(64'd8)) Add8_1 (.in0(wire_1), .in1(wire_2), .ci(1'd0), .out(wire_10), .co());
  TC_Neg # (.UUID(64'd3863151335887383109 ^ UUID), .BIT_WIDTH(64'd8)) Neg8_2 (.in(wire_3), .out(wire_2));
  TC_And # (.UUID(64'd652542805796721446 ^ UUID), .BIT_WIDTH(64'd8)) And8_3 (.in0(wire_1), .in1(wire_3), .out(wire_6));
  TC_Or # (.UUID(64'd1282180742612238799 ^ UUID), .BIT_WIDTH(64'd8)) Or8_4 (.in0(wire_1), .in1(wire_3), .out(wire_9));
  TC_Xor # (.UUID(64'd4278215788491009670 ^ UUID), .BIT_WIDTH(64'd8)) Xor8_5 (.in0(wire_1), .in1(wire_3), .out(wire_7));
  TC_Not # (.UUID(64'd2782987108271841346 ^ UUID), .BIT_WIDTH(64'd8)) Not8_6 (.in(wire_1), .out(wire_8));
  TC_Shl # (.UUID(64'd3704472466523271709 ^ UUID), .BIT_WIDTH(64'd8)) Shl8_7 (.in(wire_1), .shift(wire_3), .out(wire_4));
  TC_Ashr # (.UUID(64'd3189331404849712971 ^ UUID), .BIT_WIDTH(64'd8)) Ashr8_8 (.in(wire_1), .shift(wire_3), .out(wire_5));
  MUXzm8i # (.UUID(64'd383135569880736254 ^ UUID)) MUXzm8i_9 (.clk(clk), .rst(rst), .\0 (wire_11), .\1 (wire_10), .\2 (wire_6), .\3 (wire_9), .\4 (wire_8), .\5 (wire_7), .\6 (wire_4), .\7 (wire_5), .Selector(wire_12), .Output(wire_0));

  wire [7:0] wire_0;
  assign Output = wire_0;
  wire [7:0] wire_1;
  assign wire_1 = Input_1;
  wire [7:0] wire_2;
  wire [7:0] wire_3;
  assign wire_3 = Input_2;
  wire [7:0] wire_4;
  wire [7:0] wire_5;
  wire [7:0] wire_6;
  wire [7:0] wire_7;
  wire [7:0] wire_8;
  wire [7:0] wire_9;
  wire [7:0] wire_10;
  wire [7:0] wire_11;
  wire [7:0] wire_12;
  assign wire_12 = Opcode;

endmodule
