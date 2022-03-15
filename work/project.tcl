set projDir "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/vivado"
set projName "ALU"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/au_top_0.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/reset_conditioner_1.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/manual_check_2.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/auto_check_3.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/multi_seven_seg_4.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/button_conditioner_5.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/edge_detector_6.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/alu_7.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/counter_8.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/rom_9.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/counter_10.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/seven_seg_11.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/decoder_12.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/pipeline_13.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/adder2_14.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/bool2_15.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/shifter_16.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/compare_17.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/multiply_18.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/divide2_19.v" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/verilog/sixteen_bit_2s_complement_20.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Application-installation\ Directory/Alchitry/library/components/au.xdc" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/constraint/alchitry.xdc" "D:/Term\ 4/50.002\ Computation\ Structures/FPGA_final/ALU/work/constraint/io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 12
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 12
wait_on_run impl_1
