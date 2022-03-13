# ALU for checkoff1
template:
- Module name:
- Input:
- Output:
- Implementation: 
- Test cases:
 
## Basic Functions
to be filled

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