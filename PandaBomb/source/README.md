# upload source

## File structure:

### Integration
- au_top.luc: connection and integration of the game
- test_unit.luc: to test individual function for debugging

### Control
- control_unit.luc: main fsm to control the game
- slowtimer.luc: for counting remaining time(60->0)
- orientation_unit: to produce moving direction according to cur orientation
- disappearing_unit: to produce map signal

### Input
- joystick.luc: to add joystick functionality for user to move panda in game

### Output
- led_output.luc: to produce signals for 64 leds according to diff control signal
-led_strip.luc: produce signal to LED strips per row 
- seven_seg_timer.luc: to show remaining time
- seven_seg_char: to show other information e.g. WIN/LOSE etc.

### Storage
- regfile_unit: declare all registers used
- maps: to store three hardcoded maps

### Alu
- alu.luc: for complex calculation
- abselmux.luc: aselmux and bselmux to select ra and rb data
- wdselmux.luc: to control the ouput of the alu 

### Unit Testing
- autocheck.luc: checks thru alu functions and tests basic alu functionality
- cu_test.luc: runs through states of control unit with hardcoded inputs to expect correct selector signals
- test_regfile.luc: checks whether regifle stores correct content in the correct address location given some hardcoded selector signals and write data and ra, rb, rc addresses


### Constraints
- io.acf: io board specification
- br.acf: br board specification
