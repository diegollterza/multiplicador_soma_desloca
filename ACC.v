module ACC(entrada, load, sh, ad, clk, saida);

	// Input Port(s)
	input[8:0] entrada;
	input load, sh, ad, clk;

	// Output Port(s)
	output reg [8:0] saida = 9'b0;
	
	always@(posedge clk) begin
		
		if(load) begin
			saida[3:0] <= entrada[3:0];
			saida[8:4] <= 5'b0;
		end
		
		if(sh) saida <= saida >> 1;
		
		if(ad) saida[8:4] <= entrada[8:4];
		
	end
endmodule