class fifo_trans;
rand bit wr_en;
rand bit rd_en;
rand bit [7:0] data_in;
bit [7:0] data_op;
bit empty;
bit full;
function void display();
$display(" ");
$display("\t wr_en = %0b, \t rd_en = %0b, \t data_in = %0b, \data_out = %0b, \t empty = %0b, \t full = %0b",wr_en,rd_en,data_in,data_op,empty,full);
$display(" ");

endfunction
endclass
