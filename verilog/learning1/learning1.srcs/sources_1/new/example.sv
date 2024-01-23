`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dudestin
// 
// Create Date: 2020/11/09 15:34:49
// Design Name: matrix.sv
// Module Name: 
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: math-matrix & vector implementation on System-Verilog
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

typedef class vector;
typedef class multiplier_matrix;

// math-matrix implementation, support `shortint`,`int`,`longint`,`byte`,`real`,`shortreal`
class matrix#(type elemT = real, int unsigned U = 3, int unsigned V = 3);
    typedef matrix#(elemT, U, V) MATRIX;
	typedef matrix#(elemT, V, U) TRANS_MATRIX;
	elemT M [U][V];
    
	function new (elemT initarray [U][V]);
		this.M = initarray;
	endfunction: new

	// identity matrix: support non-square matrix
	function MATRIX eye();
		MATRIX retM;
		elemT array [U][V];
        	retM = new(array);
		for (int i = 0; i < U; ++i)
			for (int j = 0; j < V; ++j)
				retM.M[i][j] = (i == j);
		return retM;
	endfunction: eye

    	// zeros: create matrix of all zeros
    	function MATRIX zeros();
		MATRIX retM;
		elemT array [U][V];
		retM = new(array);
			for (int i = 0; i < U; ++i)
				for (int j = 0; j < V; ++j)
					retM.M[i][j] = 0;
			return retM;
    	endfunction: zeros      

	// ones: create matrix of all ones
	function MATRIX ones();
		MATRIX retM;
		elemT array [U][V];
		retM = new(array);
		for (int i = 0; i < U; ++i)
			for (int j = 0; j < V; ++j)
				retM.M[i][j] = 1;
		return retM;
	endfunction: ones
       
	// invert: calculate ivnert maxtrix(M^-1)
	function MATRIX invert();
		MATRIX retM;
		elemT temp;
		elemT array [U][V];
		// 2x2 square
		if (this.U == 2 && this.V == 2) begin
			elemT det;
			det = this.M[0][0] * this.M[1][1] - this.M[1][0] * this.M[0][1];
			array[0][0] = this.M[1][1] / det;
			array[0][1] = -this.M[0][1] / det;
			array[1][0] = -this.M[1][0] / det;
			array[1][1] = this.M[0][0] / det;
			retM = new(array);
		end
		else // more dimension square matrix(gaussian method)
			if (this.isSquare()) begin
			retM = this.eye();
			for(int i=0;i<U;i++)begin
			 temp=1/this.M[i][i];
			 for(int j=0;j<U;j++)begin
			 this.M[i][j]*=temp;
			 retM.M[i][j]*=temp;
		end
		for(int j=0;j<U;j++)begin
		 if(i!=j)begin
		  temp=this.M[j][i];
		  for(int k=0;k<U;k++)begin
		   this.M[j][k]-=this.M[i][k]*temp;
		   retM.M[j][k]-=retM.M[i][k]*temp;
		  end
		 end
		end
		end
		end
		return retM;
	endfunction: invert

	// trans: transposed matrix
	function TRANS_MATRIX trans();
		TRANS_MATRIX retM;
		elemT array [V][U];
		retM = new(array);
		for (int i = 0; i < V; ++i)
			for(int j = 0; j < U; ++j)
				retM.M[i][j] = this.M[j][i];
		return retM;
	endfunction: trans

	/* operator */
	function MATRIX add(const ref MATRIX adder);
		MATRIX retM;
		elemT array [U][V];
		retM = new(array);
		for (int i = 0; i < U; ++i)
			for (int j = 0; j < V; ++j)
				retM.M[i][j] = this.M[i][j] + adder.M[i][j];
		return retM;
	endfunction: add

	function MATRIX sub(const ref MATRIX subtrahend);
		MATRIX retM;
		elemT array [U][V];
		retM = new(array);
		for (int i = 0; i < U; ++i)
			for (int j = 0; j < V; ++j)
				retM.M[i][j] = this.M[i][j] - subtrahend.M[i][j];
		return retM;
	endfunction: sub

	// (matrix x matrix) product(same shape only!!)
	function MATRIX multiply(const ref MATRIX multiplier);
		MATRIX retM;
		elemT array [U][V];
        	retM = new(array);
		for (int i = 0; i < U; ++i)
			for (int j = 0; j < U; ++j) begin
				for (int k = 0; k < V; ++k)
				    retM.M[i][j] = retM.M[i][j] + this.M[i][k] * multiplier.M[k][j];
		    end
		return retM;
	endfunction: multiply	
	
	// (matrix x vector) product
    	function matrix#(elemT,U,1) vector_multiply(const ref matrix#(elemT,V,1) multiplier);
		matrix#(elemT,U,1) retM;
		elemT array [U][1];
        	retM = new(array);
		for (int i = 0; i < U; ++i)
			for (int j = 0; j < 1; ++j) begin
				for (int k = 0; k < V; ++k)
				    retM.M[i][j] = retM.M[i][j] + this.M[i][k] * multiplier.M[k][j];
		    end
		return retM;
	endfunction: vector_multiply	

	// scalar product
	function MATRIX  scalar_multiply(elemT multiplier);
		MATRIX retM;
		elemT array [U][V];
        	retM = new(array);
		for (int i = 0; i < U; ++i)
			for (int j = 0; j < V; ++j)
				retM.M[i][j] = this.M[i][j] * multiplier;
		return retM;
	endfunction: scalar_multiply
	
	// Hadamard product
	function MATRIX hadamard(const ref MATRIX multiplier);
	     MATRIX retM;
	     elemT array [U][V];
	     retM = new(array);
	     for(int i = 0; i < U; ++i)
	       for (int j = 0; j < V; ++j)
	           retM.M[i][j] = this.M[i][j] * multiplier.M[i][j];
	     return retM;
	endfunction: hadamard
	/* check is Square */
	function bit isSquare();
		return (this.U == this.V);
	endfunction: isSquare
    
	/* utility */
	function void print();
		$write("%d x %d  : MATRIX\n", U, V);
		for (int i = 0; i < U; ++i) begin
			$write("\n%d: ", i);
			for (int j = 0; j < V; ++j) begin
			     if (type(elemT) == type(real) | type(elemT) == type(shortreal))
			  $write("%f ",this.M[i][j]);
			 else if(type(elemT) == type(int))
			  $write("%d ",this.M[i][j]);
			 else
			  $write("%p ",this.M[i][j]);
		    end
			$display("");
		end
	endfunction: print
endclass: matrix

// math-vector implementation (inherit "matrix" class)
class vector#(type elemT = int, int unsigned N = 3) extends matrix#(elemT, N, 1);
	function new (const ref elemT initV[N][1]);
		super.new(initV);
	endfunction: new
endclass: vector