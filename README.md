# ALU for checkoff1
template:
- Module name:
- Input:
- Output:
- Implementation: 
- Test cases:
 
## Basic Functions

### Add
- Module name: `adder`
- Input: `a[16]` (16 bit first input), `b[16]` (16 bit second input), `alufn[6]` (6 bit alufn OPCODE)
- Output: `s[16]` (16 bit output), `z[1]` (1 bit output), `v[1]` (1 bit output), `n[1]` (1 bit output)
- Implementation: Execute addition or subtraction operation based on ALUFN OPCODE. If the input ALUFN OPCODE is invalid, output is 16b0.
- Test Cases: 
> 1. input: `a[16]=1010 1011 1111 1000` , `b[16]=0001 0100 0000 1000` , `alufn[6]=000000`; output: `s_out=1100 0000 0000 0000`
> 2. input: `a[16]=1010 1011 1111 1000` , `b[16]=0001 0100 0000 1000` , `alufn[6]=000001`; output: `s_out=1001 0111 1111 0000`

### Compare
- Module name: `compare`
- Input: `z[1]` (1 bit input), `v[1]` (1 bit input), `n[1]` (1 bit input), `alufn[6]` (6 bit alufn OPCODE)
- Output: `out[1]` (1 bit output)
- Implementation: Determining the least significant bit (0 or 1) depending on the ALUFN OPCODE and the Z, V and N outputs of the adder/subtractor unit.
- Test Cases: 
> 1. input: `z[1]=1`, `v[1]=0` , `n[1]=0` , `alufn[6]=110011`; output = `out=1`
> 2. input: `z[1]=0`, `v[1]=1` , `n[1]=0` , `alufn[6]=110101`; output = `out=1`
> 3. input: `z[1]=0`, `v[1]=0` , `n[1]=0` , `alufn[6]=110111`; output = `out=0`

### Boolean
- Module name:`bool2`
- Input: `a[16]` (16 bit first input), `b[16]`(16 bit second input), `alufn[4]`(4 bit alufn OPCODE)
- Output `alu[16]`(16 bit output)
- Implementation: Determine and output the result of boolean expression depending on the input alufn opcode. If the input alufn opcode is invalid, output is 16b0.
- Test Cases:
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

### Shift
- Module name:`shifter`
- Input: `a[16]` (16 bit first input), `b[4]`(4 bit second input), `alufn[[2]`(2 bit alufn OPCODE)
- Output `shift[16]`(16 bit output)
- Implementation: Do Logical Shift left (SHL),	Logical Shift right (SHR) and Arithmetic Shift right (SRA)	depending on different alufn
- Test cases:
> 1. input: `a[16]=1010 1011 1111 1000` , `b[4]=0101`, `alufn[2]=00`; output: `shift=0111 1111 0000 0000`
> 2. input: `a[16]=1010 1011 1111 1000` , `b[4]=0001`, `alufn[2]=01`; output: `shift=0101 0101 1111 1100`

## Additional Functions

### Multiply
- Module name:`multiply`
- Input: `a[16]` (16 bit first input), `b[4]`(4 bit second input), `alufn[[6]`(6 bit alufn OPCODE)
- Output: `out[16]` (16 bit output)
- Implementation: Execute mulplication between a and b.
- Test cases: 
> 1. input: `a[16]=1010 1011 1111 1000` , `b[16]=0101 0100 0000 1000`, `alufn[6]=000010`; output: `alu=1011 1111 1100 0000`
> 2. input: `a[16]=1010 1011 1111 1000` , `b[16]=0000 0000 0000 0000`, `alufn[6]=000010`; output: `alu=0000 0000 0000 0000`

### 2's complement
- Module name:`sixteen_bit_2s_complement`
- Input: `a[16]` (16 bit input to be negated using 2's complement)
- Output: `n[16]` (16 bit negated value)
- Implementation: Making use of `~` to change all 0 to 1 and vice versa, then use `sixteen_bit_add_1` mudule to add 1.
- Test cases: 
> 1. input:  `a[16]=1010 1011 1111 1000` ; output: `n[16]=0101 0100 0000 1000`  *possible error: try remove add 1*  
> 2. input:  `a[16]=0110 0101 1001 0111` ; output: `n[16]=1001 1010 0110 1001`
### Division & Modulo
- Module name:'division'
- Input: `a[16]` (16 bit input divident), `b[16]`(16 bit divisor)
- Output `q[16]`(16 bit quotient), `r[16]`(16 bit remainder)
- Implementation: Using built-in `/` to calculate quotient, and subtract the product to get remainder. If b =0, then both q and r will be 0.
- Test cases:
> 1. input:  `a[16]=1010 1011 1111 1000` , `b[16]=0101 0100 0000 1000` ; output: `q=0x0002`, `r=0000 0011 1110 1000` , `ex=0x0000`; ps:a=44024,b=21512  
> 2. input:  `a[16]=1010 1011 1111 1000` , `b[16]=0000 0000 0000 0000` ; output: `q=0x0000`, `r=0x0000` , `ex=0x0001'; ps:a=44024,b=0


### ALUFN OPCODE:
|Operation|ALUFN[5:0]|
|-------|--------|
| ADD | 000000 |
| SUB | 000001 |
| MUL | 000010 |
| DIV | 000011 |
| MOD | 000100 |
| 2sCOMP | 000101 |
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

# Testing User Mannual

## Modules

### Rom
- Module name: `rom`
- Input: `address[5]` (5 bit ROM address)
- Output: `outA[16]` (TESTCASES[address][5]), `outB[16]` = TESTCASES[address][4], `correct_answer[16]` (TESTCASES[address][3]), `outZ[1]` (TESTCASES[address][2][0]),`outV[1]` (TESTCASES[address][1][0]),`outN[1]`(TESTCASES[address][0][0])
- Implementation: 26 TESTCASES in the format of `ALUNF[5:0]  a   b  correct_ans  correct_z  correct_v  correct_n`, to be used by `auto_check`.

### Auto check
- Module name: `auto_check`
- Input: `io_dip[16]` (16 bit operands), `io_button` (control button to switch to next state), `clk`, `rst`
- Output: `out[16]` (last input operand during input states; calculated value by the alu during output states), `ex`(DivisinByZeroException)
- Implementation: define a fsm `alu_checker` with 4 states: `S0,S1,S2,S3`, corresponding to input a, input b, input alufn, output calculated value by the alu and return to S0. 

### Manual check
- Module name: `manual_check`
- Input: `fail_case[5]` (5 bit test_Case_index for failure demo), `switch[2]` (control button to stert/reset), `clk`, `rst`
- Output: `status[2]` (`b00` means still testing, `b01` means `PASS`, `b10` means `FAIL`), `out_true[16]`(hardcoded answer key from rom), `out_calc[16]` (value calculated by ALU)
- Implementation: define a fsm `fsm_t` with 29 states, corresponding to 26 test cases defined in `rom` and `START`, `PASS`, `FAIL`. If the `S(i)` test case passes, go to the `S(i+1)` test_case/state, if not, go to `FAIL` state

## Mannual Check

### IO components
(Specified in au_top.luc)
- io_led[1:0] = output[16] / operand[16]
- io_led[2][0] = exception when divided by 0
- io_dip[1:0] = operand[16] / alufn[6]
- io_dip[2][7] = switch between auto and manual check modes
- io_button[4] = switch states

### Instructions
1. pulldown `io_dip[2][7]` to switch to mannual check mode
2. input 16 bit first operand using io_dip[1] and io_dip[0]
3. press io_button[4](rightmost button)
4. input 16 bit second operand using io_dip[1] and io_dip[0]
5. press io_button[4](rightmost button)
6. input 6 bit OPCODE(see table) using io_dip[0]
7. press io_button[4](rightmost button)
8. result is shown on io_led[1] and io_led[0]
9. press io_button[4](rightmost button)
10. reset to initial state, go back to step2 to input the first operand.


## Auto Check

### IO components
- io_dip[2][7] = switch between auto and manual check modes
- io_dip[2][6] = reset
- io_led[2][7:6] = status
- io_dip[2][0:4] = set false test case for demo


### Instructions
1. pullup `io_dip[2][7]` to switch to auto check mode
2. set false test case(0-25) at io_dip[2][0:4]
3. test cases are automatically run, if io_led[2][7:6] both light up, it means all test cases have passed; if only io_led[2][6] lights up, it means certain test case fails.
