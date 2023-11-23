class fifo_cov;
fifo_trans trans = new();
covergroup cov_inst;
option.per_instance = 1;

ren:coverpoint trans.wr_en {bins wr_en = {0,1};}
wen: coverpoint trans.rd_en {bins rd_en = {0,1};}
full:coverpoint trans.full {bins buf_full = {0,1};}
empty: coverpoint trans.empty {bins buf_empty = {0,1};} 
bufin: coverpoint trans.data_in {bins buf_in = { [0: 2147483647]}; } 
bufout: coverpoint trans.data_op{bins buf_out = { [0: 2147483647]}; }  
endgroup
function new();
cov_inst = new;
endfunction
task main;
cov_inst. sample();
endtask
endclass
