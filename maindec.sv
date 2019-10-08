module maindec(input logic [5:0] op,funct,
    output logic memtoreg, memwrite,
    output logic branch, 
    output logic [1:0] alusrc,
    output logic regdst, regwrite,
    output logic jump,jr,
    output logic ne,
    output logic [2:0] aluop);

logic [12:0] controls;

assign {regwrite, regdst, alusrc, branch, memwrite,
        memtoreg, jump,jr, aluop, ne} = controls;


always_comb
if((op == 0) && (funct==6'b001000)) begin
       controls <= 13'b0100000010000; // jr
     end
else
begin
    case(op)
        6'b000000: controls <= 13'b1100000000100; // RTYPE
        6'b100011: controls <= 13'b1001001000000; // LW
        6'b101011: controls <= 13'b0001010000000; // SW
        6'b000100: controls <= 13'b0000100000010; // BEQ
        6'b001000: controls <= 13'b1001000000000; // ADDI
        6'b001101: controls <= 13'b1011000000110; // ORI
        6'b000010: controls <= 13'b0000000100000; // J
        6'b000101: controls <= 13'b0000100000011;  // BNQ
        6'b001111: controls <= 13'b1001000001000;  // LUI
	     	6'b001110: controls <= 13'b1001000001010;  // XORI
	     	6'b000110: controls <= 13'b0000100000100; // Blez	     	
	      6'b001010: controls <= 13'b1001000001100; //slti
	      
        default: controls <= 9'bxxxxxxxxxx; // illegal op
    endcase
    end
endmodule