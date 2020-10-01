`timescale 1ns/10ps
module Multiplicador_TB();

	reg st, clk;
	reg[3:0] multiplicador, multiplicando;
	wire done, idle;
	wire[8:0] produto;
	integer i, resultadoEsperado;
	
	Multiplicador DUT(
	.multiplicando(multiplicando), 
	.multiplicador(multiplicador), 
	.st(st), 
	.clk(clk), 
	.done(done), 
	.idle(idle), 
	.produto(produto));
	
	
initial begin
	//Clock inicial//
	clk = 0;
   #5 clk = !clk;
   #5 clk = !clk;
	///////////////////////////////////////////////////////////////////////////////
	$display("-----------------------------Teste 1-----------------------------");
   multiplicando = 4'd13; // multiplicando = 13
	multiplicador = 4'd11; // multiplicador = 11
	resultadoEsperado = multiplicando*multiplicador; //resultadoEsperado = 143
	$display("Multiplicando: %d ",multiplicando,"Multiplicador: %d",multiplicador," Resultado Esperado:%d ",resultadoEsperado);
	st = 1; //start = 1 ; o circuito esta pronto para comecar
   #5 clk = !clk;
   #5 clk = !clk;
	$display("start = %d ", st, "done = %d ", done, " idle = %d ", idle, "Produto = %d", produto);
	st = 0; //start volta a 0, apos um ciclo de clock
	//o circuito continuará calculando até que passe os 4 clocks no contador
	for(i=0;i<18;i=i+1) begin
		#5 clk = !clk;
		#5 clk = !clk;
		$display("start = %d ", st, "done = %d ", done, " idle = %d ", idle, "Produto = %d", produto);
	end
	//quando o contador k esta acionado, 4 ciclos de clocks se passaram 
	//e o resultado está correto; done = 1
	//Apos o calculo, done = 0 e idle = 1
	//enquanto o multiplicador esta calculando (clocks<4), done = 0 idle = 0;
	
	$display("-----------------------------Teste 2-----------------------------");
	multiplicando = 4'd7;
	multiplicador = 4'd15;
	resultadoEsperado = multiplicando*multiplicador;
	$display("Multiplicando: %d ",multiplicando,"Multiplicador: %d",multiplicador," Resultado Esperado:%d ",resultadoEsperado);
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
