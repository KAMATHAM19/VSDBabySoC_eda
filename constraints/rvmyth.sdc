##########################################################################################
# rvmyth.sdc
# Design Constraints for rvmyth (SAED32nm)
##########################################################################################

# -----------------------------------------------------------------------------
# Units
# -----------------------------------------------------------------------------

set_units -time ns

# -----------------------------------------------------------------------------
# Clock Definition
# -----------------------------------------------------------------------------

# Define a 100 MHz (10 ns period) clock on PLL output pin
create_clock -name CLK -period 10 [get_ports CLK]

# Clock latency and uncertainty modeling
set_clock_latency -source 2 [get_clocks CLK]
set_clock_latency 1 [get_clocks CLK]
set_clock_uncertainty -setup 0.5 [get_clocks CLK]
set_clock_uncertainty -hold 0.5 [get_clocks CLK]

# -----------------------------------------------------------------------------
# Design Constraints
# -----------------------------------------------------------------------------

set_max_area 8000
set_max_fanout 5 [current_design]
set_max_transition 10 [current_design]

# -----------------------------------------------------------------------------
# Input Ports Constraints
# -----------------------------------------------------------------------------
# Input ports: CLK, reset

set_input_delay -max 4 -clock [get_clocks CLK] [get_ports {CLK reset}]
set_input_delay -min 1 -clock [get_clocks CLK] [get_ports {CLK reset}]
set_input_transition -max 0.4 [get_ports {CLK reset}]
set_input_transition -min 0.1 [get_ports {CLK reset}]

# -----------------------------------------------------------------------------
# Output Ports Constraints
# -----------------------------------------------------------------------------
# Output ports: OUT[9:0]

set_output_delay -max 0.5 -clock CLK [all_outputs]
set_output_delay -min 0.5 -clock CLK [all_outputs]
set_load -max 0.5 [get_ports {OUT[9] OUT[8] OUT[7] OUT[6] OUT[5] OUT[4] OUT[3] OUT[2] OUT[1] OUT[0]}]
set_load -min 0.5 [get_ports {OUT[9] OUT[8] OUT[7] OUT[6] OUT[5] OUT[4] OUT[3] OUT[2] OUT[1] OUT[0]}]

# -----------------------------------------------------------------------------
# Path Delay Constraints (example)
# -----------------------------------------------------------------------------
# Constrain data paths between DAC output and top-level OUT ports
# (Adjust or remove if DAC is not instantiated in rvmyth)
#set_max_delay 10 -from [get_pins dac/OUT*] -to [get_ports {OUT[9] OUT[8] OUT[7] OUT[6] OUT[5] OUT[4] OUT[3] OUT[2] OUT[1] OUT[0]}]

##########################################################################################
# End of SDC
##########################################################################################
