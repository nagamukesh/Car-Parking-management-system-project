//We choose path data such that there is only one unique input direction to each junction
// Eg. The only path to Junction3 is 1101, 11 at Junction1 and 01 at Junction2
// Junction3 can only recieve input from Junction2

//Block input will be given from the Button code

module Display(Block,PathData,NL1,SL1,EL1,WL1,NL2,SL2,EL2,WL2,NL3,SL3,EL3,WL3,NL4,SL4,EL4,WL4);

    input [2:0]Block;
    wire [1:0]InputDir;
    output [7:0]PathData;

    assign InputDir=2'b00;
    PathFinder m1(Block,PathData);

    output NL1,SL1,EL1,WL1,NL2,SL2,EL2,WL2,NL3,SL3,EL3,WL3,NL4,SL4,EL4,WL4;
   
    wire [1:0]InputDir2,InputDir3,InputDir4;
    wire [1:0]OutputDir1,OutputDir2;
    wire [7:0]NewPath1,NewPath2;
    wire [7:0]PathData2,PathData3,PathData4;
   
    Junction1 j1(InputDir,PathData,NL1,SL1,EL1,WL1,OutputDir1,NewPath1);
    assign InputDir2 = OutputDir1;
    assign PathData2[7] = NewPath1[7] && NL1;
    assign PathData2[6] = NewPath1[6] && NL1;
    assign PathData2[5:0] = NewPath1[5:0];
   
    Junction2 j2(InputDir2,PathData2,NL2,SL2,EL2,WL2,OutputDir2,NewPath2);
    assign InputDir3 = OutputDir2;
    assign PathData3[7] = NewPath2[7] && EL2;
    assign PathData3[6] = NewPath2[6] && EL2;
    assign PathData3[5:0] = NewPath2[5:0];
    assign InputDir4 = OutputDir2;
    assign PathData4[7] = NewPath2[7] && NL2;
    assign PathData4[6] = NewPath2[6] && NL2;
    assign PathData4[5:0] = NewPath2[5:0];
   
    Junction3 j3(InputDir3,PathData3,NL3,SL3,EL3,WL3);
    Junction4 j4(InputDir4,PathData4,NL4,SL4,EL4,WL4);
   
endmodule

//Multiplexer for each out index required for PathFinder
module mux1(a,i0,i1,i2,i3,i4,i5,i6,i7,o);

input [2:0]a;
input i0,i1,i2,i3,i4,i5,i6,i7;
output o;

assign o = (!a[2] && !a[1] && !a[0] && i0) ||
   (!a[2] && !a[1] && a[0] && i1) ||
   (!a[2] && a[1] && !a[0] && i2) ||
   (!a[2] && a[1] && a[0] && i3) ||
   (a[2] && !a[1] && !a[0] && i4) ||
   (a[2] && !a[1] && a[0] && i5) ||
   (a[2] && a[1] && !a[0] && i6) ||
   (a[2] && a[1] && a[0] && i7);

endmodule


module PathFinder(a,out);        //Like 8*1 mux

input [2:0]a;
output [7:0]out;
wire [7:0]a0,a1,a2,a3,a4,a5,a6,a7;

assign a0=8'b11111000;
assign a1=8'b11110000;
assign a2=8'b11010000;
assign a3=8'b11011100;
assign a4=8'b11000000;
assign a5=8'b11010000;
assign a6=8'b11010100;
assign a7=8'b00000000;

mux1 m7(a,a0[7],a1[7],a2[7],a3[7],a4[7],a5[7],a6[7],a7[7],out[7]);
mux1 m6(a,a0[6],a1[6],a2[6],a3[6],a4[6],a5[6],a6[6],a7[6],out[6]);
mux1 m5(a,a0[5],a1[5],a2[5],a3[5],a4[5],a5[5],a6[5],a7[5],out[5]);
mux1 m4(a,a0[4],a1[4],a2[4],a3[4],a4[4],a5[4],a6[4],a7[4],out[4]);
mux1 m3(a,a0[3],a1[3],a2[3],a3[3],a4[3],a5[3],a6[3],a7[3],out[3]);
mux1 m2(a,a0[2],a1[2],a2[2],a3[2],a4[2],a5[2],a6[2],a7[2],out[2]);
   
assign out[1]=1'b0;
assign out[0]=1'b0;


endmodule



module mux(a,b,c,d,sel,out);   // 4*1 mux

input a,b,c,d;
input [1:0]sel;
output out;

assign out = (!sel[1] && !sel[0] && a)
                || (!sel[1] && sel[0] && b)
                || (sel[1] && !sel[0] && c)
                || (sel[1] && sel[0] && d);

endmodule


module Junction1(InputDir,PathData,NL,SL,EL,WL,OutputDir,NewPath);
    input [1:0]InputDir;
    output [1:0]OutputDir;
    input [7:0]PathData;
    output [7:0]NewPath;
    output NL,SL,EL,WL;

    wire [1:0]dir;
    assign dir = PathData[7:6];

    wire dis;
    assign dis = dir[0] || dir[1];

    mux m1(!InputDir[1],!InputDir[0],InputDir[0],InputDir[1],dir,OutputDir[1]);
    mux m2(!InputDir[0],InputDir[1],!InputDir[1],InputDir[0],dir,OutputDir[0]);
   

    assign NL = dis && (!OutputDir[1] && !OutputDir[0]);
    assign SL = dis && (OutputDir[1] && OutputDir[0]);
    assign EL = dis && (OutputDir[1] && !OutputDir[0]);
    assign WL = dis && (!OutputDir[1] && OutputDir[0]);

    assign NewPath = PathData << 2;

endmodule

module Junction2(InputDir,PathData,NL,SL,EL,WL,OutputDir,NewPath);
    input [1:0]InputDir;
    output [1:0]OutputDir;
    input [7:0]PathData;
    output [7:0]NewPath;
    output NL,SL,EL,WL;

    wire [1:0]dir;
    assign dir = PathData[7:6];

    wire dis;
    assign dis = dir[0] || dir[1];

    mux m1(!InputDir[1],!InputDir[0],InputDir[0],InputDir[1],dir,OutputDir[1]);
    mux m2(!InputDir[0],InputDir[1],!InputDir[1],InputDir[0],dir,OutputDir[0]);
   

    assign NL = dis && (!OutputDir[1] && !OutputDir[0]);
    assign SL = dis && (OutputDir[1] && OutputDir[0]);
    assign EL = dis && (OutputDir[1] && !OutputDir[0]);
    assign WL = dis && (!OutputDir[1] && OutputDir[0]);

    assign NewPath = PathData << 2;

endmodule


module Junction3(InputDir,PathData,NL,SL,EL,WL);
    input [1:0]InputDir;
    output [1:0]OutputDir;
    input [7:0]PathData;
    output [7:0]NewPath;
    output NL,SL,EL,WL;

    wire [1:0]dir;
    assign dir = PathData[7:6];

    wire dis;
    assign dis = dir[0] || dir[1];
   
    mux m1(!InputDir[1],!InputDir[0],InputDir[0],InputDir[1],dir,OutputDir[1]);
    mux m2(!InputDir[0],InputDir[1],!InputDir[1],InputDir[0],dir,OutputDir[0]);
   

    assign NL = dis && (!OutputDir[1] && !OutputDir[0]);
    assign SL = dis && (OutputDir[1] && OutputDir[0]);
    assign EL = dis && (OutputDir[1] && !OutputDir[0]);
    assign WL = dis && (!OutputDir[1] && OutputDir[0]);

    assign NewPath = PathData << 2;


endmodule


module Junction4(InputDir,PathData,NL,SL,EL,WL);
    input [1:0]InputDir;
    output [1:0]OutputDir;
    input [7:0]PathData;
    output [7:0]NewPath;
    output NL,SL,EL,WL;

    wire [1:0]dir;
    assign dir = PathData[7:6];

    wire dis;
    assign dis = dir[0] || dir[1];

    mux m1(!InputDir[1],!InputDir[0],InputDir[0],InputDir[1],dir,OutputDir[1]);
    mux m2(!InputDir[0],InputDir[1],!InputDir[1],InputDir[0],dir,OutputDir[0]);
   

    assign NL = dis && (!OutputDir[1] && !OutputDir[0]);
    assign SL = dis && (OutputDir[1] && OutputDir[0]);
    assign EL = dis && (OutputDir[1] && !OutputDir[0]);
    assign WL = dis && (!OutputDir[1] && OutputDir[0]);

    assign NewPath = PathData << 2;


endmodule




module Display_tb;

    reg [2:0] Block;
wire [7:0] PathData;
    wire NL1, SL1, EL1, WL1;
    wire NL2, SL2, EL2, WL2;
    wire NL3, SL3, EL3, WL3;
    wire NL4, SL4, EL4, WL4;
   
    Display d1(Block,PathData,NL1,SL1,EL1,WL1,NL2,SL2,EL2,WL2,NL3,SL3,EL3,WL3,NL4,SL4,EL4,WL4);
   
    initial begin
        $dumpfile("Display.vcd");
        $dumpvars(0, Display_tb);

        $display("--------------------------------------------------------------------------------------------------------------------");
        $display("| Block | PathData | NL1 | SL1 | EL1 | WL1 | NL2 | SL2 | EL2 | WL2 | NL3 | SL3 | EL3 | WL3 | NL4 | SL4 | EL4 | WL4 |");
        $display("--------------------------------------------------------------------------------------------------------------------");
        $monitor("|  %b  | %b |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |  %b  |",
                 Block, PathData, NL1, SL1, EL1, WL1, NL2, SL2, EL2, WL2, NL3, SL3, EL3, WL3, NL4, SL4, EL4, WL4);
       
Block=3'b000;
        repeat(7)
    begin
    #10 Block= Block + 3'b001;
   end
       
       
        #1000 $display("--------------------------------------------------------------------------------------------------------------------");

    end
endmodule