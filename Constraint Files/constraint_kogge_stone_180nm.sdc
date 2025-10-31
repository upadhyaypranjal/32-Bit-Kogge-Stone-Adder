# ============================================================
# Constraint File for Kogge-Stone 32-bit Adder (180 nm)
# ============================================================

# ------------------------------------------------------------
# Clock Definition
# ------------------------------------------------------------
# Define a relaxed 20 ns clock (50 MHz typical for 180 nm)
create_clock -name clk -period 20 [get_ports clk]

# ------------------------------------------------------------
# Input / Output Delays
# ------------------------------------------------------------
# Define realistic delays for slower 180 nm interfaces
set_input_delay 3 -clock clk [all_inputs]
set_output_delay 3 -clock clk [all_outputs]

# ------------------------------------------------------------
# Drive and Load
# ------------------------------------------------------------
# Standard input drive strength assumption
set_drive 1 [all_inputs]

# Typical output capacitive load (in pF)
set_load 0.1 [all_outputs]

# ------------------------------------------------------------
# Operating Conditions
# ------------------------------------------------------------
# Specify slow corner for 180 nm process
set_operating_conditions -library slow.lib -analysis_type on_chip_variation

# ------------------------------------------------------------
# Design Exceptions / False Paths
# ------------------------------------------------------------
# Ignore false paths between pure input→output if no sequential elements
set_false_path -from [all_inputs] -to [all_outputs]

# ------------------------------------------------------------
# End of File
# ============================================================