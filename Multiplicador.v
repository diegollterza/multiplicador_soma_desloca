module Multiplicador(multiplicando, multiplicador, st, clk, done, idle, produto);

	// Input Port(s)
	input[3:0] multiplicando, multiplicador;
	input st, clk;
	

	// Output Port(s)
	output[8:0] produto;
	output done, idle;
	
	//Wire Port(s)
	wire[4:0] soma;
	wire k,load, sh, ad;
	

	// Hierarquia Top-Down

	Control control(produto[0], st, clk, k, idle, done, load, sh, ad);
	Counter counter(load,clk,k);
	Adder adder(multiplicando, produto[7:4],soma);
	ACC acc({soma,multiplicador}, load, sh, ad,clk,produto);
	
	

endmodule
