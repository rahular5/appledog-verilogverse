// testbench for 2x1 mux


module mux2_1_tb;
  
  reg I0,I1,s;
  wire y;
  mux2_1 dut(I0,I1,s,y);
  
  initial begin
    I0 = 1'b0; I1 = 1'b0; s = 1'b0;
    #5 I0 = 1'b0; I1 = 1'b0; s = 1'b1;
    #5 I0 = 1'b0; I1 = 1'b1; s = 1'b0;
    #5 I0 = 1'b0; I1 = 1'b1; s = 1'b1;
    #5 I0 = 1'b1; I1 = 1'b0; s = 1'b0;
    #5 I0 = 1'b1; I1 = 1'b0; s = 1'b1;
    #5 I0 = 1'b1; I1 = 1'b1; s = 1'b0;
    #5 I0 = 1'b1; I1 = 1'b1; s = 1'b1;
  end
  
  initial begin
    $monitor("simulationTime = %0t, I0 = %0b, I1 = %0b, s = %0b, y = %0b",$time,I0,I1,s,y);
    
  end
  
  initial begin
    $dumfile("dump.vcd");
    $dumpvars(0,mux2_1_tb);
  end
  
endmodule

