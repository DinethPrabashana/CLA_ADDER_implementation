module stimulus; 
  wire [3:0] SUM;
  wire C_OUT;
  reg [3:0] A, B;
  reg C_IN;
  wire [4:0] TSUM  = {C_OUT, SUM}; // Implicit assignment

  CLA cla(SUM, C_OUT, C_IN, A, B);

  initial begin
      // Display inputs A, B, outputs SUM, C_OUT, and TSUM
      $monitor($time, " A = %b B = %b, C_IN = %b, SUM = %b, C_OUT = %b, TSUM = %b", A, B, C_IN, SUM, C_OUT, TSUM);

      // Initialize inputs A, B, and C_IN
      A = 4'b0000; B = 4'b0000; C_IN = 1'b0;
      #5 A = 4'b0001; B = 4'b0001; C_IN = 1'b0;
      #5 A = 4'b0010; B = 4'b0010; C_IN = 1'b0;
      #5 A = 4'b0011; B = 4'b0011; C_IN = 1'b0;
      #5 A = 4'b0100; B = 4'b0100; C_IN = 1'b0;
      #5 A = 4'b0101; B = 4'b0101; C_IN = 1'b0;
      #5 A = 4'b0110; B = 4'b0110; C_IN = 1'b0;
      #5 A = 4'b0111; B = 4'b0111; C_IN = 1'b0;
      #5 A = 4'b1000; B = 4'b1000; C_IN = 1'b0;
      #5 A = 4'b1001; B = 4'b1001; C_IN = 1'b0;
      #5 A = 4'b1010; B = 4'b1010; C_IN = 1'b0;
      #5 A = 4'b1011; B = 4'b1011; C_IN = 1'b0;
      #5 A = 4'b1100; B = 4'b1100; C_IN = 1'b0;
      #5 A = 4'b1101; B = 4'b1101; C_IN = 1'b0;
      #5 A = 4'b1110; B = 4'b1110; C_IN = 1'b0;
      #5 A = 4'b1111; B = 4'b1111; C_IN = 1'b0;

      // Test with different carry-in values
      #5 A = 4'b0001; B = 4'b0001; C_IN = 1'b1;
      #5 A = 4'b0010; B = 4'b0010; C_IN = 1'b1;
      #5 A = 4'b0100; B = 4'b0100; C_IN = 1'b1;
      #5 A = 4'b1000; B = 4'b1000; C_IN = 1'b1;
  end
endmodule