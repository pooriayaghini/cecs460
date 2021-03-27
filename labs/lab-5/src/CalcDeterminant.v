`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//The following code receives a 3x3 matrix and calculates its determinant. 
// Each element is assumed to be a vector of 5 bits. In additon, we assumed 
// all elements are non-negative integers. 
//Element[Row][Column]
// Element[0][0] - MatrixIn[44:40] 
// Element[0][1] - MatrixIn[39:35] 
// Element[0][2] - MatrixIn[34:30] 
// Element[1][0] - MatrixIn[29:25] 
// Element[1][1] - MatrixIn[24:20] 
// Element[1][2] - MatrixIn[19:15] 
// Element[2][0] - MatrixIn[14:10] 
// Element[2][1] - MatrixIn[9:5] 
// Element[2][2] - MatrixIn[4:0] 
//Determinant calculation: 
// X = E[0][0]*(E[1][1]*E[2][2] - E[2]E[1]*E[1][2])
// Y = E[0][1]*(E[1][0]*E[2][2] - E[2]E[0]*E[1][2])
// Z = E[0][2]*(E[1][0]*E[2][1] - E[2]E[0]*E[1][1])
// DET(M) = X-Y+Z
//////////////////////////////////////////////////////////////////////////////////


module CalcDeterminant(clk, reset, MatrixIn, determinant);

input clk, reset; 
input [44:0] MatrixIn; 
output reg [15:0] determinant; 
reg [15:0] X; 
reg [15:0] Y; 
reg [15:0] Z; 


always @(posedge reset, posedge clk) begin 
    if (reset) begin 
        determinant <= 16'b0;
    end 
    else begin //The determinant is calculated below 
    X <= MatrixIn[44:40]*((MatrixIn[24:20]*MatrixIn[4:0])- (MatrixIn[9:5]*MatrixIn[19:15]));
    Y <= MatrixIn[39:35]*((MatrixIn[29:25]*MatrixIn[4:0])-(MatrixIn[14:10]*MatrixIn[19:15]));
    Z <= MatrixIn[34:30]*((MatrixIn[29:25]*MatrixIn[9:5])-(MatrixIn[14:10]*MatrixIn[24:20]));
    determinant <= X-Y+Z;
    end
 end 
endmodule
