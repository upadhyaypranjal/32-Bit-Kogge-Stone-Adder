# ============================================================
# Cadence Genus Synthesis Script for Kogge-Stone Adder (90 nm)
# ============================================================

# ------------------------------------------------------------
# Library Setup
# ------------------------------------------------------------
# Path to your 90nm standard cell library folder
set_db init_lib_search_path {/home/install/FOUNDRY/digital/90nm/dig/lib/}

# Name of the timing library (update if needed)
# Example: slow.lib, typical.lib, or ss_1p0v_125C.lib
set_db library slow.lib

# ------------------------------------------------------------
# Read RTL Design
# ------------------------------------------------------------
# Read the Verilog source file
read_hdl {./kogge_stone_adder_32.v}

# ------------------------------------------------------------
# Elaborate Top Module
# ------------------------------------------------------------
elaborate kogge_stone_adder_32
current_design kogge_stone_adder_32

# ------------------------------------------------------------
# Apply Constraints
# ------------------------------------------------------------
read_sdc ./constraint_kogge_stone_90nm.sdc

# ------------------------------------------------------------
# Set Synthesis Effort
# ------------------------------------------------------------
set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

# ------------------------------------------------------------
# Run Synthesis Flow
# ------------------------------------------------------------
syn_generic
syn_map
syn_opt

# ------------------------------------------------------------
# Write Synthesized Outputs
# ------------------------------------------------------------
write_hdl > kogge_stone_adder_90nm_netlist.v
write_sdc > kogge_stone_adder_90nm_output.sdc

# ------------------------------------------------------------
# Generate Reports
# ------------------------------------------------------------
report timing > kogge_stone_adder_90nm_timing.rpt
report power  > kogge_stone_adder_90nm_power.rpt
report area   > kogge_stone_adder_90nm_area.rpt
report gates  > kogge_stone_adder_90nm_gates.rpt

# ------------------------------------------------------------
# Optional GUI
# ------------------------------------------------------------
gui_show

# ------------------------------------------------------------
# End of Script
# ============================================================