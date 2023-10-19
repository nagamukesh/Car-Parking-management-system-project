module mux(a,b,c,d,sel,out);   // 4*1 mux

input a,b,c,d;
input [1:0]sel;
output out;

assign out = (!sel[1] && !sel[0] && a)
                || (!sel[1] && sel[0] && b)
                || (sel[1] && !sel[0] && c)
                || (sel[1] && sel[0] && d);

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


module Junction4_tb;

    reg [1:0] InputDir;
    reg [7:0] PathData;
    wire NL, SL, EL, WL;
    wire [1:0] OutputDir;

    Junction4 uut (InputDir,PathData,NL,SL,EL,WL);


    initial begin
        $dumpfile("Junction4.vcd");
        $dumpvars(0, Junction4_tb);

        $display("--------------------------------------------------");
        $display("| InputDir | PathData    | NL  | SL  | EL  | WL  |");
        $display("--------------------------------------------------");
        $monitor("|    %b    |   %b  |  %b  |  %b  |  %b  |  %b  |",
                 InputDir, PathData, NL, SL, EL, WL);

        
        InputDir = 2'b00;
        PathData = 8'b00000000;
        #10 PathData = 8'b01000000;
        #20 PathData = 8'b10000000;
        #30 PathData = 8'b11000000;
        
        #40
        InputDir = 2'b11;
        PathData = 8'b00000000;
        #50 PathData = 8'b01000000;
        #60 PathData = 8'b10000000;
        #70 PathData = 8'b11000000;
        
        #80
        InputDir = 2'b01;
        PathData = 8'b00000000;
        #90 PathData = 8'b01000000;
        #100 PathData = 8'b10000000;
        #110 PathData = 8'b11000000;
        
        #120
        InputDir = 2'b10;
        PathData = 8'b00000000;
        #130 PathData = 8'b01000000;
        #140 PathData = 8'b10000000;
        #150 PathData = 8'b11000000;
        
        #1000 $display("--------------------------------------------------");

    end
endmodule