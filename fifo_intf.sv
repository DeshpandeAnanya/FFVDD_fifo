interface fifo_intf(input logic clk,rst);

logic wr_en, rd_en;  
logic [7:0] data_in;  
logic [7:0] data_op;     
logic empty, full;       

clocking bfm_cb @(posedge clk);
default input #1 output #1;
output wr_en, rd_en;
output data_in;                  
input data_op;                  
input empty,full;   
endclocking

clocking monitor_cb @(posedge clk);
default input #1 output #1;
input wr_en, rd_en;
input data_in;                  
input data_op;                  
input empty,full;   
endclocking

modport BFM (clocking bfm_cb, input clk,rst);
modport MONITOR (clocking monitor_cb, input clk, rst);
endinterface
