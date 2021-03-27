`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//The following line of code generates the values of the matrices and 
// allows the user to select the matrice they would like to send via the 
// switches (SW)
//////////////////////////////////////////////////////////////////////////////////


module GenerateMatrices(clk, reset, SW, OutMatrix);

input clk, reset; 
input wire [2:0] SW; //The switches 
//3x3 matrix element has 5 elements, so 9*5 = 45. We need a vector of size 4
output reg [44:0] OutMatrix; //The matrix that will be outputted
//The four matrices 
reg signed [4:0]A[2:0][2:0];//DET(A) = 0 
reg signed [4:0]B[2:0][2:0];// DET(B) = 1 
reg signed [4:0]C[2:0][2:0];// DET(C) = 1540
reg signed [4:0]D[2:0][2:0];// DET(D) = -2380
reg signed [4:0]O[2:0][2:0];//The matrix to assign based on the switch

//Behavorial block 
always @ (posedge reset, posedge clk) begin 
    if (reset) begin
        //Initialize matrix A 
        A[0][0] <= 0; 
        A[0][1] <= 0;
        A[0][2] <= 0; 
        
        A[1][0] <= 0;
        A[1][1] <= 0; 
        A[1][2] <= 0;
        
        A[2][0] <= 0; 
        A[2][1] <= 0;
        A[2][2] <= 0; 
        
        //Initialize matrix B 
        B[0][0] <= 1; 
        B[0][1] <= 0;
        B[0][2] <= 0; 
        
        B[1][0] <= 0;
        B[1][1] <= 1; 
        B[1][2] <= 0;
        
        B[2][0] <= 0; 
        B[2][1] <= 0;
        B[2][2] <= 1; 

        //Initialize matrix C 
        C[0][0] <= 16; 
        C[0][1] <= 21;
        C[0][2] <= 23; 
        
        C[1][0] <= 20;
        C[1][1] <= 0; 
        C[1][2] <= 20;
        
        C[2][0] <= 12; 
        C[2][1] <= 29;
        C[2][2] <= 18; 
        
        //Initialize matrix D 
        D[0][0] <= 16; 
        D[0][1] <= 21;
        D[0][2] <= 23; 
        
        D[1][0] <= 20;
        D[1][1] <= 0; 
        D[1][2] <= 20;
        
        D[2][0] <= 12; 
        D[2][1] <= 1;
        D[2][2] <= 18; 
        
        OutMatrix <= 45'b0;
       end   
      else begin 
        //Assigns the matrix to ouptut based on the switch value (try with case statement)
        if (SW == 3'b000) 
            OutMatrix <= {A[0][0],A[0][1],A[0][2],A[1][0],A[1][1],A[1][2], A[2][0],A[2][1],A[2][2]};
        else if (SW == 3'b001)
            OutMatrix <= {B[0][0],B[0][1],B[0][2],B[1][0],B[1][1],B[1][2], B[2][0],B[2][1],B[2][2]};
        else if (SW == 3'b010) 
            OutMatrix <= {C[0][0],C[0][1],C[0][2],C[1][0],C[1][1],C[1][2], C[2][0],C[2][1],C[2][2]};
        else if (SW == 3'b011)
            OutMatrix <= {D[0][0],D[0][1],D[0][2],D[1][0],D[1][1],D[1][2], D[2][0],D[2][1],D[2][2]};
        else 
            OutMatrix <= {A[0][0],A[0][1],A[0][2],A[1][0],A[1][1],A[1][2], A[2][0],A[2][1],A[2][2]};
     end
end 
endmodule
