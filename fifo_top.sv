module fifo_top;
    bit clk,rst;

   
 fifo_intf intf(clk,rst);
 fifo_test t1(intf);
 fifo DUT(.data_in(intf.data_in),
                .rst(intf.rst),
                .clk(intf.clk),
                .wr_en(intf.wr_en),
                .rd_en(intf.rd_en),
                .data_op(intf.data_op),
                .empty(intf.empty),
                .full(intf.full));
always #5 clk=~clk;
   
initial begin

    rst=1;
    #155 rst=0;
    #200;rst=1;
    #155 rst=0;
    
end
 
 
endmodule
