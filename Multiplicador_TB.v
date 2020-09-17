`timescale 1ns/10ps
module Multiplicador_TB();

	reg st, clk;
	reg[3:0] multiplicador, multiplicando;
	wire done, idle;
	wire[8:0] produto;
	integer i;
	
	Multiplicador DUT(
	.multiplicando(multiplicando), 
	.multiplicador(multiplicador), 
	.st(st), 
	.clk(clk), 
	.done(done), 
	.idle(idle), 
	.produto(produto));
	
	
initial begin
   multiplicando = 4'd13;
	multiplicador = 4'd11;
	st = 1;
	clk = 0;
   #5 clk = !clk;
   #5 clk = !clk;
	$display("start = %d ", st, "done = %d ", done, " idle = %d ", idle, "Produto = %d", produto);
	st = 0;
	for(i=0;i<18;i=i+1) begin
		#5 clk = !clk;
		#5 clk = !clk;
		$display("start = %d ", st, "done = %d ", done, " idle = %d ", idle, "Produto = %d", produto);
	end
	multiplicando = 4'd7;
	multiplicador = 4'd15;
	st = 1;
	#5 clk = !clk;
	#5 clk = !clk;
	$display("start = %d ", st, "done = %d ", done, " idle = %d ", idle, "Produto = %d", produto);
	st =0;
	for(i=0;i<18;i=i+1) begin
		#5 clk = !clk;
		#5 clk = !clk;
		$display("start = %d ", st, "done = %d ", done, " idle = %d ", idle, "Produto = %d", produto);
	end
	
end

		
endmodule
