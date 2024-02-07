`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 08:08:30
// Design Name: 
// Module Name: up_down_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module up_down_counter(clk,rst,mode,data_out);
input clk,rst,mode;
output reg [3:0]data_out;
always@(posedge clk)
begin
    if (rst)
        data_out <= 4'd0;
    // Up Counter
    else if (mode)
        begin
            if (data_out == 4'b1000)
                data_out <= 4'd0;
            else
                data_out <= data_out + 4'b0001;
        end
    // Down Counter
    else
    begin
        data_out <= 4'b1000;
        if (data_out == 4'b0000)
            data_out <= 4'd8;
        else
            data_out <= data_out - 4'b0001;
    end
end
endmodule
