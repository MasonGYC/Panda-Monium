# PANDA MONIUM
50.002 Computational Structure 1D project  
demo video: https://youtu.be/bG9KT3KGwnY 

## File structure:

### Integration
- `au_top`: connection and integration of the game

### Control
- `control_unit`: main fsm to control the game
- `orientation_unit`: to produce moving direction according to cur orientation state

### Output
- `led_output`: to produce signals for 64 leds according to diff control signal
- `led_strip`: produce signal to LED strips per row 
- `multi_seven_seg`: to control the seven segment on io board to debug
- `seven-seg`: to control the seven segment on io board to debug

### Storage
- `regfile`: declare all registers used
- `maps`: to store three hardcoded maps

### Alu and muxes
- `alu`: for complex calculation
- `aselmux`,`bselmux`: aselmux and bselmux to select ra and rb data
- `wdselmux`: to control the ouput of the alu 

### Unit Testing(inside `archive`)
- `autocheck`: checks thru alu functions and tests basic alu functionality
- `cu_test`: runs through states of control unit with hardcoded inputs to expect correct selector signals
- `test_regfile`: checks whether regifle stores correct content in the correct address location given some hardcoded selector signals and write data and ra, rb, rc addresses

### Constraints
- `alchitry.acf`: au,io,br boards specification

## Contributors
1005005 Lim Sheng Xiang  
1005548 Ng Jing Heng Jarron  
1005031 Mun Yit Hung, Nigel  
1005053 Jon-Taylor Lim Ming Te  
1004885 Guo Yuchen  
1004875 Xiang Siqi  
1004866 Wang Yueheng  
1005254 Visshal Natarajan  
