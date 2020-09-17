`timescale 1ns/10ps
module Adder_TB();

	reg[3:0] opA, opB;
	wire[4:0] soma;
	integer i;
	
	Adder DUT(
	.operandoA(opA),
	.operandoB(opB),
	.soma(soma)
	);
	
	
initial begin
   opA = 4'd0;
	opB = 4'd0;
	#5;
   for( i = 0; i <= 15; i = i + 1)
   begin
      opA = $random % 16;
		opB = $random % 16;
		#5;
      $display("opA = %d", opA, " opB = %d", opB," Soma = %d", soma);
   end
end
		
endmodule
