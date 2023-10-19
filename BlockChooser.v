//NOTE: Input B7 will be XOR of all sensors(clocks) present for each slot
//The output block number will be the button number which is pressed last (when slot is empty, which is handled in logisim)
//Bk is actually is button pressed & if free slot is available(from BlockCircuit code)
//Note, simulation may not seem perfect since it is not that very feasible to simulate buttons through veriolog

module dflipflop (input D, input CKT, output reg Q);
    always @(posedge CKT) begin
        Q <= D;
    end
endmodule

module PriorityEncoder(i,y);
    input [7:0]i;
    output [2:0]y;

    assign y[2]=i[4] | i[5] | i[6] | i[7];
    assign y[1]=i[2] | i[3] | i[6] | i[7];
    assign y[0]=i[1] | i[3] | i[5] | i[7];

endmodule

module BlockChooser(B,F);
    input [7:0]B;
    wire CKT;
    wire [7:0]W;
    output [2:0]F;

    or O1(CKT,B[0],B[1],B[2],B[3],B[4],B[5],B[6],B[7]);
    
    dflipflop s0 (.D(B[0]), .CKT(CKT), .Q(W[0]));
    dflipflop s1 (.D(B[1]), .CKT(CKT), .Q(W[1]));
    dflipflop s2 (.D(B[2]), .CKT(CKT), .Q(W[2]));
    dflipflop s3 (.D(B[3]), .CKT(CKT), .Q(W[3]));
    dflipflop s4 (.D(B[4]), .CKT(CKT), .Q(W[4]));
    dflipflop s5 (.D(B[5]), .CKT(CKT), .Q(W[5]));
    dflipflop s6 (.D(B[6]), .CKT(CKT), .Q(W[6]));
    dflipflop s7 (.D(B[7]), .CKT(CKT), .Q(W[7]));
    
    PriorityEncoder p1(B,F);

endmodule


module BlockChooser_tb;

reg [7:0]B;
wire [2:0]F;

BlockChooser b1(B,F);

initial begin
    $dumpfile("BlockChooser.vcd");
    $dumpvars(0,BlockChooser_tb);
end
initial begin
    $display("|B0 |B1 |B2 |B3 |B4 |B5 |B6 |B7 | BlockNumber |");
    $monitor("| %b | %b | %b | %b | %b | %b | %b | %b |     %b     |",B[0],B[1],B[2],B[3],B[4],B[5],B[6],B[7],F);
    
    //Let B and be something intially
    B=8'b10000000;
    
    //let Button 5 be pressed now
    #110 B=8'b00100000;
    //button is released now

    //For a while no button is pressed 
    //But still, path to block 5 is shown

    //When car is parked, button 7 will get activated
    //Can be understood from logisim code
    //When car is entering, only 1 out of the 21 sensors(clocks) is 1 (odd parity, so xor gives 1 as output)
    //So the xor part will give output 1 which is button 7 
    //So button 7 is pressed technically
    //Once the car is parked
    //That sensor(clock) will return 0  
    //So xor of all will become 0 again, as 0 sensors are 1 (0 is even parity, so xor gives 0 as output)
    //So button is released again
    //And path to block 7, empty path is shown
    #170 B=8'b10000000;

    //let Button 1 be pressed now
    #210 B=8'b00000010;
    //button is released now
    
    //For a while no button is pressed 
    //But still, path to block 1 is shown

    //When car is parked, button 7 will get activated
    //Can be understood from logisim code
    //When car is entering, only 1 out of the 21 sensors(clocks) is 1 (odd parity, so xor gives 1 as output)
    //So the xor part will give output 1 which is button 7 
    //So button 7 is pressed technically
    //Once the car is parked
    //That sensor(clock) will return 0  
    //So xor of all will become 0 again, as 0 sensors are 1 (0 is even parity, so xor gives 0 as output)
    //So button is released again
    //And path to block 7, empty path is shown
    #270 B=8'b10000000;

end

initial #10000 $finish;
    
endmodule