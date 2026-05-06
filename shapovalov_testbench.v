module test_sum7;

wire [6:0] Ain, Bin;
wire Ci;
wire [6:0] res_my, res_ref;
wire cm, cr;

reg [6:0] Ain_r, Bin_r;
reg Ci_r;

my_sum7 my_block (Ain, Bin, Ci, res_my, cm);
ref_sum7 ref_block (Ain, Bin, Ci, res_ref, cr);

assign Ain = Ain_r;
assign Bin = Bin_r;
assign Ci  = Ci_r;

initial
begin
    $display("-------------------------------------------------------------");
    $display(" Time |   Ain   |   Bin   | Ci |  MySum  Co | RefSum  Co ");
    $display("-------------------------------------------------------------");

    $monitor("%4t | %07b | %07b |  %b | %07b   %b | %07b   %b",
              $time, Ain, Bin, Ci, res_my, cm, res_ref, cr);

    #400 $finish;
end

// ТЕСТИ (без конфліктів!)
initial
begin
    // Тест 1
    Ain_r = 7'd1;  Bin_r = 7'd2;  Ci_r = 0;
    #50;

    // Тест 2
    Ain_r = 7'd10; Bin_r = 7'd15; Ci_r = 0;
    #50;

    // Тест 3
    Ain_r = 7'd3;  Bin_r = 7'd4;  Ci_r = 1;
    #50;

    // Тест 4
    Ain_r = 7'd25; Bin_r = 7'd15; Ci_r = 0;
    #50;

    // Тест 5 (переповнення)
    Ain_r = 7'b1111111; 
    Bin_r = 7'b0000001; 
    Ci_r  = 0;
    #50;

    // Тест 6 (переповнення через Ci)
    Ain_r = 7'b1111111; 
    Bin_r = 7'b0000000; 
    Ci_r  = 1;
end

endmodule
