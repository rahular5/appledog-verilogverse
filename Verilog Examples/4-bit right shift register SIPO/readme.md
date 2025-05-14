## Behavioural code for 4-bit right shift register SIPO
```
module shift_register_sipo(SI, clk, rst, PO);
    input SI , clk, rst;
    output reg [3:0]PO;
    
    always@(posedge clk or posedge rst) begin
        if(rst)
            PO <= 4'b0000;
        else
            PO <= {SI, PO[3:1]};
    end
endmodule

```
## Testbench for for 4-bit right shift register SIPO
```

module tb();
    reg SI , clk, rst;
    wire [3:0]PO;
    
    shift_register_sipo dut (SI, clk, rst, PO);
    
    always #5 clk <= ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        SI = 0;
        #12 rst = 0;
        #12 SI = 1;
        #12 SI = 1;
        #12 SI = 1;
        #12 SI = 1;
        #12 SI = 0;
        #12 SI = 0;
        #12 SI = 0;
        #12 SI = 0;
        #200 $finish;
    end
    
    initial begin
        $monitor(" SI %b | PO %b ",SI,PO);
    end
    
endmodule
```
## Output
```
 SI 0 | PO 0000 
 SI 1 | PO 0000 
 SI 1 | PO 1000 
 SI 1 | PO 1100 
 SI 1 | PO 1110 
 SI 1 | PO 1111 
 SI 0 | PO 1111 
 SI 0 | PO 0111 
 SI 0 | PO 0011 
 SI 0 | PO 0001 
 SI 0 | PO 0000
```
