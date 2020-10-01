module Counter(load, clk, k);

	// Input Port(s)
	input load, clk;
	reg[2:0] counter = 4'b0;
	
	// Output Port(s)
	output reg k = 0;
	
	//A cada ciclo de clock, o contador é incrementado em 1
	//O contador para a contagem quando o valor 4 é alcançado
	//Quando load é acionado, counter = 0, k = 0;
	always@(posedge clk) begin
		if (load) begin
			counter <= 4'b0; 
			k <= 0;
		end
		else begin
			counter <= counter + 3'b1;
		end
		if (counter == 3'd4) k <= 1;
	end
	
endmodule