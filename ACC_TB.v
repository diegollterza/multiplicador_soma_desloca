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
	//clock inicial
	clk = 0;
	#5 clk = !clk;
   #5 clk = !clk;
	///////////////////////////////////////////////////
	$display("Carregando os 4 bits LSB e 0 no resto");
	load = 1; 
	sh = 0;
	ad = 0;
	//////////////////////////////////////////////////
   #5 clk = !clk;
   #5 clk = !clk;
   $display("load = %d ", load, " sh = %d ", sh, " ad = %d ", ad, "SAIDA = %b ", saida);
	//////////////////////////////////////////////////
	
	$display("Carrega a entrada nos 5 MSB e mantem o resto");
	load = 0;
	ad = 1;
	#5 clk = !clk;
   #5 clk = !clk;
	$display("load = %d ", load, " sh = %d ", sh, " ad = %d ", ad, "SAIDA = %b ", saida);
	///////////////////////////////////////////////////
	
	$display("Realizando shift para a direita na saida");
	ad = 0;
	sh = 1;
	for(i=0;i<9;i=i+1) begin
		#5 clk = !clk;
		#5 clk = !clk;
		$display("load = %d ", load, " sh = %d ", sh, " ad = %d ", ad, "SAIDA = %b ", saida);
	end
end

		
endmodule
