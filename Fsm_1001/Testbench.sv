module tb;
  reg clk,reset,din;
  wire d_out;
  seq u1(.clk(clk),.reset(reset),.din(din),.d_out(d_out));
  always #5 clk=~clk;
  initial begin
    $monitor("reset=%0b\tdin=%b\tP_state=%b\td_out=%b",reset,din,u1.p_state,d_out);
    clk=0;
    reset=1;
    #1;
    reset=0;
    #1;
    @(posedge clk) din=1; 
    @(posedge clk) din=0;
    @(posedge clk) din=1;
    @(posedge clk) din=1;
    @(posedge clk) din=0;
    @(posedge clk) din=0;
    @(posedge clk) din=0;
    @(posedge clk) din=1;
    @(posedge clk) din=0;
    @(posedge clk) din=0;
    @(posedge clk) din=1;
    #30;
    $display("Test done");
    #200 $finish;
  end
endmodule
