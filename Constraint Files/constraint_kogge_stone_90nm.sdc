# ============================================================
# Constraint File for Kogge-Stone 32-bit Adder (90 nm)
# ============================================================

# ------------------------------------------------------------
# Clock Definition
# ------------------------------------------------------------
# Assume 10 ns clock (100 MHz typical for 90 nm)
create_clock -name clk -period 10 [get_ports clk]

# ------------------------------------------------------------
# Input / Output Delays
# ------------------------------------------------------------
# Typical 90nm I/O delay assumptions
set_input_delay 1.5 -clock clk [all_inputs]
set_output_delay 1.5 -clock clk [all_outputs]

# ------------------------------------------------------------
# Drive and Load
# ------------------------------------------------------------
# Standard input drive strength
set_drive 1 [all_inputs]

# Small capacitive load for outputs
set_load 0.05 [all_outputs]

# ------------------------------------------------------------
# Operating Conditions
# ------------------------------------------------------------
# Use the slow corner from your 90 nm library
set_operating_conditions -library slow.lib -analysis_type on_chip_variation

# ------------------------------------------------------------
# False Paths / Exceptions
# ------------------------------------------------------------
# If purely combinational (no clk), disable false warnings
set_false_path -from [all_inputs] -to [all_outputs]

# ------------------------------------------------------------
# End of File
# ============================================================