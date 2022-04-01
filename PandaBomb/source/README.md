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

### Output
- led.luc: to produce signals for 64 leds according to diff control signal
- seven_seg_timer.luc: to show remaining time
- seven_seg_char: to show other information e.g. WIN/LOSE etc.

### Storage
- regfile_unit: declare all registers used
- rom_map: to store three hardcoded maps

### Alu
- alu.luc: for complex calculation

### Constraints
- io.acf: io board specification
- br.acf: br board specification
