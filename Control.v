module Control(m, st, clk, k, idle, done, load, sh, ad);

	// Input Port(s)
	input st, clk, k, m;
	

	// Output Port(s)
	output reg done, idle, load, sh, ad;
	
	reg[1:0] state = 0;
	
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
	
	//Maquina de estados especificada no trabalho
	
	// Saidas que dependem somente dos estados
	always @ (state) begin
		case (state)
			S0:
				begin
					idle = 1;
					done = 0;
					sh = 0;
				end
			S1:
				begin
					idle = 0;
					done = 0;
					sh = 0;
				end
			S2:
				begin
					idle = 0;
					done = 0;
					sh = 1;
				end
			S3:
				begin
					idle = 0;
					done = 1;
					sh = 0;
				end
		endcase
	end

	// Determinaçao dos proximos estados
	always @ (posedge clk) begin
		case (state)
			S0:
				if(st) state <= S1;
			S1:
				state <= S2;
			S2:
				if (k)
					state <= S3;
				else
					state <= S1;
			S3:
				state <= S0;
		endcase
	end

	//Saidas que dependem da entrada e do estado
	always@(*) begin
		case (state)
			S0:
				if(st) load = 1;
			S1:
				ad = m;
			default:
				begin
					ad = 0;
					load = 0;
				end
		endcase
	end

endmodule

