
class fifo_bfm;

virtual fifo_intf intf;
mailbox gen2bfm;
int no_transactions;
function new(virtual fifo_intf intf,mailbox gen2bfm);
	this.intf = intf;
	this.gen2bfm = gen2bfm;
endfunction
task reset;

wait(intf.rst);
$display("Reset Initiated");
intf.bfm_cb.wr_en <= 0;
intf.bfm_cb.rd_en <= 0;
intf.bfm_cb.data_in <= 0;
wait(!intf.rst);
$display("Reset finished");
endtask



task main;
forever begin
fifo_trans trans;
gen2bfm.get(trans);
$display("Transaction No. = %0d", no_transactions);
intf.bfm_cb.wr_en <= trans.wr_en;
intf.bfm_cb.rd_en <= trans.rd_en;
intf.bfm_cb.data_in<= trans.data_in;
repeat(2)@(posedge intf.clk);
trans.data_op = intf.bfm_cb.data_op;
trans.empty= intf.bfm_cb.empty;
trans.full= intf.bfm_cb.full;
trans.display();
no_transactions++;
end
endtask
endclass
