/* This is a carry look-ahead adder
   This is Datalevel modeled with Verilog HDL */
module CLA(sum, c_out, c_in, a, b);
  input [3:0] a, b ;
  input c_in ;
  output [3:0] sum ;
  output c_out ;
  // Internal nets 
  wire p0, p1, p2, p3 ;
  wire g0, g1, g2, g3 ;

  // Generate the propagate and generate signals
  assign p0 = a[0]^b[0], p1 = a[1]^b[1], p2 = a[2]^b[2], p3 = a[3]^b[3] ;
  assign g0 = a[0]&b[0], g1 = a[1]&b[1], g2 = a[2]&b[2], g3 = a[3]&b[3] ;

  // Calculate the sum bits using the propagate and generate signals
  assign sum[0] = p0^c_in, sum[1] = p1^((p0&c_in)|g0), sum[2] = p2^((p1&p0&c_in)|(p1&g0)|g1), sum[3] = p3^((p2&p1&p0&c_in)|(p2&p1&g0)|(p2&g1)|g2) ;

  // Calculate the carry out using the generate signals
  assign c_out = (p3&((p2&p1&p0&c_in)|(p2&p1&g0)|(g1&p2)|g2))|g3 ;
endmodule

module stimulus; 
  wire [3:0] SUM ;
  wire C_OUT ;
  reg [3:0] A, B ;
  reg C_IN ;
  wire [4:0] TSUM  = {C_OUT, SUM} ; // Implicit assignment
  CLA  cla(SUM, C_OUT, C_IN, A, B);
  initial 
  begin 
      // Initialize inputs A, B, and C_IN
      A = 4'b0011 ;
      B = 4'b0011 ;
      C_IN = 1'b0 ;
      // Display inputs A, B, outputs SUM, C_OUT, and TSUM
      $monitor($time, " A = %b B = %b, SUM = %b, C_OUT = %b     TSUM = %b", A, B, SUM, C_OUT, TSUM);
      // Change inputs after 5 time units
      #5 A = 4'b1000; B = 4'b1000;
  end 
endmodule