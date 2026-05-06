module my_sum7 (Ain, Bin, Ci, Sout, Co);

input [6:0] Ain, Bin;
input Ci;
output [6:0] Sout;
output Co;

wire [6:0] C;

bitsum b0(Ain[0], Bin[0], Sout[0], Ci, C[0]);
bitsum b1(Ain[1], Bin[1], Sout[1], C[0], C[1]);
bitsum b2(Ain[2], Bin[2], Sout[2], C[1], C[2]);
bitsum b3(Ain[3], Bin[3], Sout[3], C[2], C[3]);
bitsum b4(Ain[4], Bin[4], Sout[4], C[3], C[4]);
bitsum b5(Ain[5], Bin[5], Sout[5], C[4], C[5]);
bitsum b6(Ain[6], Bin[6], Sout[6], C[5], C[6]);

assign Co = C[6];

endmodule
