module Adder(operandoA,operandoB,soma);
	// Input Port(s)
	input [3:0] operandoA, operandoB;
	
	// Output Port(s)
	output[4:0] soma;
	
	//simples somador, S = A + B
	assign soma = operandoA + operandoB;

endmodule