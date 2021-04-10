`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// The following module is the top module of the determinant code. 
//It incorporates a module that calculates the determinant of a 3x3 matrix
//The matrix comes from an outside source (E[R][C]). The third element of the 
// matrix is outputted onto LED. Note it is only the first 16 bits despite the 
// Element[0][2] being 32 bits wide. 
// The output is a 32 bit determinant. 
//////////////////////////////////////////////////////////////////////////////////


module DeterminantTopModule(clk, reset, SW, LED,
                             E00, E01, E02, 
                             E10, E11, E12, 
                             E20, E21, E22, 
                             determinant);

input clk, reset; 
input [2:0] SW; 
input [31:0] E00, E01, E02, 
             E10, E11, E12, 
             E20, E21, E22;
output  wire  [15:0] LED;
output wire [31:0] determinant;


CalcDeterminant one (.clk (clk), .reset(reset), .MatrixIn({E00, E01, E02, E10, E11, E12, E20, E21,E22}), 
                     .determinant(determinant));
assign LED = E02[15:0];
endmodule
