module seq(input clk,reset,
          input din,
           output reg d_out);
  localparam s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
  reg [1:0]p_state,n_state;
  always @(posedge clk or posedge reset) begin
    if (reset)
      p_state<=s0;
    else
      p_state<=n_state;
  end
  
  always @(p_state or din) begin
    n_state=s0;
    d_out=1'b0;
    case (p_state)
      s0: begin if (din) n_state=s1;
        else n_state=s0; end
      
      s1: begin if (din) n_state=s1;
        else n_state=s2; end
      
      s2: begin if (din) n_state=s1;
        else n_state=s3; end
      
      s3: begin if (din) begin
        n_state=s1;
        d_out=1'b1;
      end
        else n_state=s0; end
      
      default:begin n_state=s0;
        d_out=1'b0;
      end
    endcase
  end
endmodule
