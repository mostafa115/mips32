module slx(input logic [31:0] a,
           input logic [4:0] x,
            output logic [31:0] y);

// shift left by x

assign y = a<<x;
 


endmodule
