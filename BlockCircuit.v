module dflipflop (input D, input CKT, output reg Q);
    always @(posedge CKT) begin
        Q <= D;
    end
endmodule

module block (input D1, input D2, input D3, input CKT1, input CKT2, input CKT3, output Q1, output Q2, output Q3, output Free);
    wire Q1_wire, Q2_wire, Q3_wire;
    
    dflipflop s1 (.D(D1), .CKT(CKT1), .Q(Q1_wire));
    dflipflop s2 (.D(D2), .CKT(CKT2), .Q(Q2_wire));
    dflipflop s3 (.D(D3), .CKT(CKT3), .Q(Q3_wire));
    
    assign Q1 = Q1_wire;
    assign Q2 = Q2_wire;
    assign Q3 = Q3_wire;

    nand m1(Free, Q1,Q2,Q3);
endmodule


module block_tb;

reg D1,D2,D3,CKT1=0,CKT2=0,CKT3=0;
wire Q1,Q2,Q3,free;
block d(D1,D2,D3,CKT1,CKT2,CKT3,Q1,Q2,Q3,free);

always begin
    CKT1=~CKT1;
    #10;
end

always begin
    CKT2=~CKT2;
    #20;
end

always begin
    CKT3=~CKT3;
    #30;
end

initial begin
    $dumpfile("block.vcd");
    $dumpvars(0,block_tb);
end
initial begin
    $display("|Q1 |Q2 |Q3 |Free?|");
    $monitor("| %b | %b | %b |  %b  |",Q1,Q2,Q3,free);
    D1=1'b0;D2=1'b0;D3=1'b0;
    
    #20 D1=1'b1;
    #40 D2=1'b1;
    #60 D3=1'b1;
    #80 D1=1'b0;
    #100 D1=1'b1;
    #120 D1=1'b0;
    #140 D3=1'b0;
    #160 D2=1'b0;
end

initial #5000 $finish;
    
endmodule