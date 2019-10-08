module datapath(input logic clk, reset,
                input logic memtoreg, pcsrc,
                input logic [1:0] alusrc,
                input logic ne,
                input logic regdst,
                input logic regwrite, jump,jr,
                input logic [3:0] alucontrol,
                output logic zero,
                output logic [31:0] pc,
                input logic [31:0] instr,
                output logic [31:0] aluout, writedata,
                input logic [31:0] readdata);


    logic [4:0] writereg;
    logic [31:0] pcnext, pcnextbr, pcplus4, pcbranch,pcnextj;
    logic [31:0] signimm, signimmsh;
    logic [31:0] srca, srcb;
    logic [31:0] result;

    // next PC logic
    flopr #(32) pcreg(clk, reset, pcnext, pc);

    adder pcadd1(pc, 32'b100, pcplus4); //normal +4

    sl2 immsh(signimm, signimmsh); //jumb

    adder pcadd2(pcplus4, signimmsh, pcbranch); //branch or jumb

    mux2 #(32) pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
    mux2 #(32) pcmux(pcnextbr, {pcplus4[31:28],
                    instr[25:0], 2'b00}, jump, pcnextj);
    
    //jr mux
    mux2 #(32) pcjrmux(pcnextj, srca, jr, pcnext);

    // register file logic
    regfile rf(clk, regwrite, instr[25:21], instr[20:16],
                writereg, result, srca, writedata);

    mux2 #(5) wrmux(instr[20:16], instr[15:11],
                    regdst, writereg);
    mux2 #(32) resmux(aluout, readdata, memtoreg, result);

    signext se(instr[15:0], signimm); //extend sign

    logic [31:0] extimm;
    logic [31:0] zeroimm;
    extnext ex(instr[15:0], zeroimm);
    // ALU logic
    mux2 #(32) srcbmux(writedata, extimm, alusrc[0], srcb);
    mux2 #(32) extimux(signimm ,  zeroimm, alusrc[1], extimm);
    alu alu(srca, srcb, alucontrol,instr[10:6], aluout, zero);
endmodule