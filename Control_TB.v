`timescale 1ns/10ps
module Control_TB();

	reg st, clk, k, m;
	reg [1:0] state;
	wire done, idle, load, sh, ad;
	
	
	Control DUT(
	.m(m), 
	.st(st), 
	.clk(clk), 
	.k(k), 
	.idle(idle), 
	.done(done), 
	.load(load), 
	.sh(sh), 
	.ad(ad)
	);
	
	
initial begin
   st = 0;
	clk = 0;
	k = 0;
	m = 0;
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	st = 1;
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	st = 0;
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	m = 1;
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	k = 1;
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	#5 clk = !clk;
	#5 clk = !clk;
	$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
end

initial   begin
		$init_signal_spy("/Control_TB/DUT/state", "state", 1);
	end
		
endmodule
