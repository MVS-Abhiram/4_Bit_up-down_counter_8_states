`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.02.2024 08:20:32
// Design Name: 
// Module Name: up_down_tb
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


module up_down_tb();
reg clk,rst,mode;
wire [3:0]data_out;
up_down_counter uut(clk,rst,mode,data_out);
// Clock Generation
initial begin
    clk = 1'b0;
    while(1)
    #5 clk = ~clk;
end
// Initialization Task
task initialize();
begin
    rst = 1'b1;
end
endtask
// Reset task
task reset();
begin
    @(negedge clk)
    rst = 1'b1;
    @(negedge clk)
    rst = 1'b0;
end
endtask
// task mode
task modein();
integer i;
begin
    for(i=0; i<9; i=i+1)
    begin
        @(negedge clk)
        mode = 1'b1;
        #5;
    end
end
endtask

initial begin
    initialize();
    reset();
    modein();
    #5 mode = 1'b0;
end
endmodule
