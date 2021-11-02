/*module mux4(input wire i0,i1,i2,i3, input wire [1:0] j, output reg out);

always @(i0,i1,i2,i3,j)
begin
case (j)
2'b00: out = i0;
2'b01: out = i1;
2'b10: out = i2;
2'b11: out = i3;
default: out = 2'bXX;
endcase
end
endmodule
*/
module mux4x1(input wire i0,i1,i2,i3, input wire s1, s0, output wire o);
	wire t0, t1;
	mux2x1 mux2_0 (i0, i1, s1, t0);
    mux2x1 mux2_1 (i2, i3, s1, t1);
    mux2x1 mux2_2 (t0, t1, s0, o);
endmodule

module dff(input wire clk, reset, load, input wire [3:0] in, output wire [3:0] reg_in);
dfrl _f0(clk, reset, load, in[0], reg_in[0]);
dfrl _f1(clk, reset, load, in[1], reg_in[1]);
dfrl _f2(clk, reset, load, in[2], reg_in[2]);
dfrl _f3(clk, reset, load, in[3], reg_in[3]);
endmodule

module mux(input wire [3:0] reg_in, input wire j1, j0, output wire [3:0] o);
wire [3:0] _inv;
invert _i0(reg_in[0], _inv[0]);
invert _i1(reg_in[1], _inv[1]);
invert _i2(reg_in[2], _inv[2]);
invert _i3(reg_in[3], _inv[3]);

mux4x1 _mux0(reg_in[0], _inv[0], reg_in[1], 1'b0, j1, j0, o[0]);
mux4x1 _mux1(reg_in[1], _inv[1], reg_in[2], reg_in[0], j1, j0, o[1]);
mux4x1 _mux2(reg_in[2], _inv[2], reg_in[3], reg_in[1], j1, j0, o[2]);
mux4x1 _mux3(reg_in[3], _inv[3], 1'b0, reg_in[2], j1, j0, o[3]);	
endmodule


module register_4bit(input wire clk,reset,load, input wire [3:0] i, input wire [1:0] j, output wire [3:0] o);

wire [3:0] out;

mux m_0(i, j[0], j[1], out);

dff d_0(clk, reset, load, out, o);

endmodule