`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//The following code receives a 3x3 matrix and calculates its determinant. 
// Each element is assumed to be a vector of 32 bits. In additon, we assumed 
// all elements are integers. 
//Element[Row][Column]
// Element[0][0] - MatrixIn[287:256] 
// Element[0][1] - MatrixIn[255:224] 
// Element[0][2] - MatrixIn[223:192] 
// Element[1][0] - MatrixIn[191:160] 
// Element[1][1] - MatrixIn[159:128] 
// Element[1][2] - MatrixIn[127:96] 
// Element[2][0] - MatrixIn[95:64] 
// Element[2][1] - MatrixIn[63:32] 
// Element[2][2] - MatrixIn[31:0] 
//Determinant calculation: 
// X = E[0][0]*(E[1][1]*E[2][2] - E[2]E[1]*E[1][2])
// Y = E[0][1]*(E[1][0]*E[2][2] - E[2]E[0]*E[1][2])
// Z = E[0][2]*(E[1][0]*E[2][1] - E[2]E[0]*E[1][1])
// DET(M) = X-Y+Z
//////////////////////////////////////////////////////////////////////////////////


module CalcDeterminant(clk, reset, MatrixIn, determinant);

input clk, reset; 
input [287:0] MatrixIn; 
output reg [31:0] determinant; 
reg [31:0] X; 
reg [31:0] Y; 
reg [31:0] Z; 


always @(posedge reset, posedge clk) begin 
    if (reset) begin 
        determinant <= 16'b0;
    end 
    else begin //The determinant is calculated below 
    X <= MatrixIn[287:256]*((MatrixIn[159:128]*MatrixIn[31:0])- (MatrixIn[63:32]*MatrixIn[127:96]));
    Y <= MatrixIn[255:224]*((MatrixIn[191:160]*MatrixIn[31:0])-(MatrixIn[95:64]*MatrixIn[127:96]));
    Z <= MatrixIn[223:192]*((MatrixIn[191:160]*MatrixIn[63:32])-(MatrixIn[95:64]*MatrixIn[159:128]));
    determinant <= X-Y+Z;
    end
 end 
endmodule
