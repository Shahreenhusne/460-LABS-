module problem2_18101134( i0, i1, i2, i3, i4, i5, i6, i7, s1, s2, s3, f0,f1,f2);

input [2:0] i0, i1, i2, i3, i4, i5, i6, i7;
input s1, s2, s3;
output [2:0] f0,f1,f2;

mux4to1 mux1 ( i0, i1, i2, i3, s1, s2, f0);
mux4to1 mux2 ( i4, i5, i6, i7, s1, s2, f1);
mux2to1 mux3 ( f0, f1, s3, f2);

endmodule


module mux4to1(in1, in2, in3, in4, s1, s2, f);
input [2:0]in1, in2, in3, in4;
input s1, s2;
output reg[2:0] f;

always @(in1, in2, in3, in4, s1, s2)
  begin
    if (s1==0 && s2==0)
        f=in1;
    else if (s1==0 && s2==1)
        f=in2;
    else if (s1==1 && s2==0)
        f=in3;
    else
        f=in4;
    end 
endmodule

module mux2to1(f0, f1, s3, f);

input [2:0] f0, f1;
input s3;
output  reg [2:0] f;

always @(f0, f1, s3)
	begin
		if(s3 == 0)
			f = f0;
		else    
			f = f1;
    end

endmodule