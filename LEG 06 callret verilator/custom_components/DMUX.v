module DMUX (clk, rst, Input, Disable, \4 , \5 , \6 , \7 , \3 , \0 , \1 , \2 );
  parameter UUID = 0;
  parameter NAME = "";
  input wire clk;
  input wire rst;

  input  wire [7:0] Input;
  input  wire [0:0] Disable;
  output  wire [7:0] \4 ;
  output  wire [7:0] \5 ;
  output  wire [7:0] \6 ;
  output  wire [7:0] \7 ;
  output  wire [7:0] \3 ;
  output  wire [7:0] \0 ;
  output  wire [7:0] \1 ;
  output  wire [7:0] \2 ;

  TC_Splitter8 # (.UUID(64'd2501185698665852659 ^ UUID)) Splitter8_0 (.in(wire_11), .out0(wire_5), .out1(wire_2), .out2(wire_12), .out3(), .out4(), .out5(), .out6(), .out7());
  TC_Decoder3 # (.UUID(64'd3051034902902567548 ^ UUID)) Decoder3_1 (.dis(wire_0), .sel0(wire_5), .sel1(wire_2), .sel2(wire_12), .out0(wire_7), .out1(wire_6), .out2(wire_3), .out3(wire_9), .out4(wire_8), .out5(wire_10), .out6(wire_1), .out7(wire_4));
  TC_Switch # (.UUID(64'd1960722248148747699 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_2 (.en(wire_8), .in({{7{1'b0}}, wire_8 }), .out(\4 ));
  TC_Switch # (.UUID(64'd2600993165123882644 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_3 (.en(wire_10), .in({{7{1'b0}}, wire_10 }), .out(\5 ));
  TC_Switch # (.UUID(64'd852685245450736061 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_4 (.en(wire_1), .in({{7{1'b0}}, wire_1 }), .out(\6 ));
  TC_Switch # (.UUID(64'd7776040902842508 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_5 (.en(wire_4), .in({{7{1'b0}}, wire_4 }), .out(\7 ));
  TC_Switch # (.UUID(64'd3667068140080907017 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_6 (.en(wire_9), .in({{7{1'b0}}, wire_9 }), .out(\3 ));
  TC_Switch # (.UUID(64'd335594273342396056 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_7 (.en(wire_7), .in({{7{1'b0}}, wire_7 }), .out(\0 ));
  TC_Switch # (.UUID(64'd749364089815823233 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_8 (.en(wire_6), .in({{7{1'b0}}, wire_6 }), .out(\1 ));
  TC_Switch # (.UUID(64'd3324528204388307066 ^ UUID), .BIT_WIDTH(64'd8)) Output8z_9 (.en(wire_3), .in({{7{1'b0}}, wire_3 }), .out(\2 ));

  wire [0:0] wire_0;
  assign wire_0 = Disable;
  wire [0:0] wire_1;
  wire [0:0] wire_2;
  wire [0:0] wire_3;
  wire [0:0] wire_4;
  wire [0:0] wire_5;
  wire [0:0] wire_6;
  wire [0:0] wire_7;
  wire [0:0] wire_8;
  wire [0:0] wire_9;
  wire [0:0] wire_10;
  wire [7:0] wire_11;
  assign wire_11 = Input;
  wire [0:0] wire_12;

endmodule
