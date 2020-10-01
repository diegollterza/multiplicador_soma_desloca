`timescale 1ns/10ps
module Counter_TB();

	reg load, clk;
	reg[2:0] counter;
	wire k;
	integer i;
	
	Counter DUT(
	.load(load),
	.clk(clk),
	.k(k)
	);
	
	//testa o contador duas vezes
	initial begin
		load = 0;
		clk = 0;
		for( i = 0; i < 6; i = i + 1)
		begin
			#5 clk = !clk;
			#5 clk = !clk;
			$display("Counter = %d", DUT.counter, " k = %d", k);
		end
		
	//reinicia o contador
		$display("Reiniciando contador");
		load = 1;
		#5 clk = !clk;
		#5 clk = !clk;
		load = 0;
		 for( i = 0; i < 6; i = i + 1)
		begin
			#5 clk = !clk;
			#5 clk = !clk;
			$display("Counter = %d", DUT.counter, " k = %d", k);
		end
		
	end

	initial   begin
		$init_signal_spy("/Counter_TB/DUT/counter", "counter", 1);
	end
		
endmodule
