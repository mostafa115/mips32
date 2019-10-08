module mux2 #(parameter WIDTH = 8)
  (input logic [WIDTH-1:0] d0, d1,
   input logic s, output logic [WIDTH-1:0] y);
   
 assign y = s ? d1 : d0;
 
endmodule


module mux3 #(parameter WIDTH = 8)
  (input logic [WIDTH-1:0] d0, d1,d2,
   input logic [1:0]s, output logic [WIDTH-1:0] y);
 always_comb
  case(s)
         2'b00 : y <= d0;
         2'b01 : y <= d1;
         2'b11 : y <= d2;
         default : y <= {31{1'bx}} ;
endcase
endmodule