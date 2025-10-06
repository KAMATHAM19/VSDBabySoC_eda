# VSDBabySoC

run_dc.tcl#Sets the path to the technology library (32nm SAED)
set PDK_PATH /data/pdk/pdk32nm/SAED32_EDK/

#Sets the variable RTL_SOURCE_FILES to point to your RTL design
set RTL_SOURCE_FILES {./verilog_files/rvmyth.v ./verilog_files/clk_gate.v}

#Sources the setup script (initializes variables, libraries, and paths)
source -echo -verbose ./rm_setup/dc_setup.tcl

#Defines a design library (WORK) to store intermediate synthesis results
define_design_lib WORK -path ./WORK

#Allows hierarchical design mapping, useful for handling complex designs
set_app_var hdlin_enable_hier_map true

#Parses the RTL code to check for syntax errors
analyze -format verilog ${RTL_SOURCE_FILES}

#Elaborates the design, resolving the HDL structure into a design database
elaborate ${DESIGN_NAME}

#Sets the current working design to the top-level module
current_design

#Sets the top-level design for verification
set_verification_top

#Loads timing constraints from a Synopsys Design Constraints (SDC) file
read_sdc -echo ./../constraints/

#Synthesizes the RTL into a gate-level netlist based on the target library
#compile

compile_ultra


check_design

#report_timing

file mkdir report
write -hierarchy -format verilog -output ./report/rvmyth_gln.v
write_sdc -nosplit -version 2.0 ./report/rvmyth.sdc
report_area -hierarchy > ./report/rvmyth.area
report_timing > ./report/rvmyth.timing
report_power -hierarchy > ./report/rvmyth.power
report_qor > ./report/rvmyth.qor

