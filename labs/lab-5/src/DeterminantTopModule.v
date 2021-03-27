`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// The following module is the top module of the determinant code. 
//It connects modiules GenerateMatrices.v and CalcDeterminant.v. It outputs the 
//Leds onto the the board. 
//////////////////////////////////////////////////////////////////////////////////


module DeterminantTopModule(clk, reset, SW, leds);

input clk, reset; 
input [2:0] SW; 
output  wire  [15:0] leds;
wire [44:0] selectedMatrix; 

GenerateMatrices zero(.clk(clk), .reset(reset), .SW(SW), .OutMatrix(selectedMatrix));
CalcDeterminant one (.clk (clk), .reset(reset), .MatrixIn(selectedMatrix), .determinant(leds));

endmodule
