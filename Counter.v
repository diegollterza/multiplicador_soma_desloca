module Counter(load, clk, k);

	// Input Port(s)
	
	input load, clk;
	reg[3:0] counter = 4'b0;
	// Output Port(s)
	output reg k;
	
	always@(posedge clk) begin
		if (load) begin
			counter <= 4'b0; 
			k <= 0;
		end
		else begin
			counter <= counter + 3'b1;
		end
		if (counter == 4'd4) k <= 1;
	end
	
endmodule