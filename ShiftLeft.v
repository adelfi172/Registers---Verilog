/* ***************************************************************************************
 * Module Name: ShiftLeft (Logical Shift Left Register)
 * Description: Implements a logical shift left register that shifts the input data
 *              to the left by one bit position. This module performs a logical shift,
 *              meaning it shifts zeros into the left significant bit regardless of the
 *              sign of the original number. It is particularly useful for bit manipulation
 *              tasks where arithmetic considerations are not required.
 *
 * Author: Pereira, Rodrigo
 * Creation Date: 06/05/2024
 * Revision: Version 1.0
 *
 * Inputs:
 *     clk_i    - System clock.
 *     rst_i    - Reset signal that resets the register.
 *     data_i 	- Input data to be shifted.
 *
 * Outputs:
 *     data_o 	- Output data after shifting left.
 * 
 * Parameter:
 *     N 		- Parameterizable N size
 *
 * Notes:
 *	   This shift register does not preserve the sign bit, making it suitable for 
 *	   unsigned binary numbers.
 *     This module is useful for testing and rapid prototyping in embedded systems.
 * *************************************************************************************/
module ShiftLeft
#(parameter N = 8)
(
	clk_i, 
	rst_i, 
	data_i, 
	data_o
);

input wire clk_i;
input wire rst_i;
input wire [N-1:0] data_i;

output wire [N-1:0] data_o;
reg [N-1:0] shift_reg;

always @(posedge clk_i or posedge rst_i) 
begin
    if (rst_i) shift_reg <= {N-1{1'b0}};
    else shift_reg <= data_i << 1; // Shift left operation
end

assign data_o = shift_reg;

endmodule
