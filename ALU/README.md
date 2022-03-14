# ALU for checkoff1
template:
- Module name:
- Input:
- Output:
- Implementation: 
- Test cases:
 
## Basic Functions

### Adder
- Module name: "adder"
- Input: `a[16]` (16 bit first input), `b[16]`(16 bit second input), `alufn[[6]`(6 bit alufn OPCODE)
- Output: `s[16]` (16 bit output), `z[1]` (1 bit output), `v[1]` (1 bit output), `n[1]` (1 bit output)
- Implementation: Execute addition or subtraction operation based on ALUFN OPCODE. If the input ALUFN OPCODE is invalid, output is 16b0.
- Test Cases: 
> 1. input: `a[16]=1010 1011 1111 1000` , `b[16]=0001 0100 0000 1000` , `alufn[6]=000000`; output: `s_out=1100 0000 0000 0000`
> 2. input: `a[16]=1010 1011 1111 1000` , `b[16]=0001 0100 0000 1000` , `alufn[6]=000001`; output: `s_out=1001 0111 1111 0000`

### Boolean
- Module name:'bool2'
- Input: `a[16]` (16 bit first input), `b[16]`(16 bit second input), `alufn[4]`(4 bit alufn OPCODE)
- Output `alu[16]`(16 bit output)
- Implementation: Determine and output the result of boolean expression depending on the input alufn opcode. If the input alufn opcode is invalid, output is 16b0.
- Test cases:
> 1. input: `a[16]=1010 1011 1111 1000` , `b[16]=0101 0100 0000 1000`, `alufn[4]=1110`; output: `alu=1111 1111 1111 1000`
> 2. input: `a[16]=1010 1011 1111 1000` , `b[16]=0000 0000 0000 0000`, `alufn[4]=1111`; output: `alu=0101 0100 0000 0111`
-
|Operation|ALUFN[3:0]|
|-------|--------|
| AND | 1000 |
| NOR | 1111 |
| NAND | 0001 |
| OR | 1110 |
| XOR | 0110 |
| “A" | 1010 |
| XNOR | 0111 |
| invert of msb | 0100 |

### Shifter
- Module name:'shifter'
- Input: `a[16]` (16 bit first input), `b[4]`(4 bit second input), `alufn[[2]`(2 bit alufn OPCODE)
- Output `shift[16]`(16 bit output)
- Implementation: Do Logical Shift left (SHL),	Logical Shift right (SHR) and Arithmetic Shift right (SRA)	depending on different alufn
- Test cases:
> 1. input: `a[16]=1010 1011 1111 1000` , `b[4]=0101`, `alufn[2]=00`; output: `shift=0111 1111 0000 0000`
> 2. input: `a[16]=1010 1011 1111 1000` , `b[4]=0001`, `alufn[2]=01`; output: `shift=0101 0101 1111 1100`

## Additional Functions

### 2's complement
- Module name:`sixteen_bit_2s_complement`
- Input: `a[16]` (16 bit input to be negated using 2's complement)
- Output: `n[16]` (16 bit negated value)
- Implementation: Making use of `~` to change all 0 to 1 and vice versa, then use `sixteen_bit_add_1` mudule to add 1.
- Test cases: 
> 1. input:  `a[16]=1010 1011 1111 1000` ; output: `n[16]=0101 0100 0000 1000`  *possible error: try remove add 1*  
> 2. input:  `a[16]=0110 0101 1001 0111` ; output: `n[16]=1001 1010 0110 1001`
### Division
- Module name:'sixteen_bit_division'
- Input: `a[16]` (16 bit input divident), `b[16]`(16 bit divisor), `clk`(system clock), `rst`
- Output `q[16]`(16 bit quotient), `r[16]`(16 bit remainder), `ex`(1 bit exception, `1` if divided by 0, `0` else) 
- Implementation: Using the method of repeated subtraction, according to the sign of the divident and divisor, using muxes, registers, and condition to output different values. *The reason for choosing repeated subtraction method is that it can be implemented under all conditions without bit number restriction, as shift and restore remainder methods require.* 
- Test cases:
> 1. input:  `a[16]=1010 1011 1111 1000` , `b[16]=0101 0100 0000 1000` ; output: `q=0x0002`, `r=0000 0011 1110 1000` , `ex=0x0000`; ps:a=44024,b=21512  
> 2. input:  `a[16]=1010 1011 1111 1000` , `b[16]=0000 0000 0000 0000` ; output: `q=0x0000`, `r=0x0000` , `ex=0x0001'; ps:a=44024,b=0


### ALUFN OPCODE:
|Operation|ALUFN[5:0]|
|-------|--------|
| ADD | 000000 |
| SUB | 000001 |
| AND | 011000 |
| OR | 011110 |
| XOR | 010110 |
| “A" | 011010 |
| SHL | 100000 |
| SHR | 100001 |
| SRA | 100011 |
| CMPEQ | 110011 |
| CMPLT | 110101 |
| CMPLE | 110111 |
| MUL | 100010 |
