`timescale 1ns/10ps
module Control_TB();

	reg st, clk, k, m;
	reg [1:0] state;
	wire done, idle, load, sh, ad;
	integer i;
	
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
	//clock inicial
	#5 clk = !clk;
	#5 clk = !clk;
	
	//testando estados, dependendo da entrada
	//entradas aleatorias
	for(i=0;i<20;i=i+1) begin
		st = $random % 2;
		m = $random % 2;
		k = $random % 2;
		$display("Entradas: start = %b",st," m = %d", m, " k = %d",k);
		#5 clk = !clk;
		#5 clk = !clk;
		$display("State = %d", state, " idle = %b ", idle, " sh = %d ", sh, " ad = %d", ad, " m = %d", m, " K = %d", k);
	end
end

initial   begin
		$init_signal_spy("/Control_TB/DUT/state", "state", 1);
	end
		
endmodule
