`timescale 1ns/10ps
module ACC_TB();

	reg load, sh, ad, clk;
	reg[8:0] entrada;
	wire[8:0] saida;
	integer i;
	
	ACC DUT(
	.entrada(entrada),
	.load(load),
	.sh(sh),
	.ad(ad),
	.clk(clk),
	.saida(saida)
	);
	
	
initial begin
   entrada = 9'b1_0101_1101;
	$display("Entrada = %b", entrada);
	load = 1;
	sh = 0;
	ad = 0;
	clk = 0;
   #5 clk = !clk;
   #5 clk = !clk;
   $display("load = %d ", load, " sh = %d ", sh, " ad = %d ", ad, "SAIDA = %b ", saida);
	load = 0;
	ad = 1;
	#5 clk = !clk;
   #5 clk = !clk;
	$display("load = %d ", load, " sh = %d ", sh, " ad = %d ", ad, "SAIDA = %b ", saida);
	ad = 0;
	sh = 1;
	#5 clk = !clk;
	#5 clk = !clk;
	$display("load = %d ", load, " sh = %d ", sh, " ad = %d ", ad, "SAIDA = %b ", saida);
end

		
endmodule
