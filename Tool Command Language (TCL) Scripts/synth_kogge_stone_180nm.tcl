# ============================================================
# Cadence Genus Synthesis Script for Kogge-Stone Adder (180 nm)
# ============================================================

# ------------------------------------------------------------
# Library Setup
# ------------------------------------------------------------
# Path to your 180 nm standard cell library
set_db init_lib_search_path {/home/install/FOUNDRY/digital/180nm/dig/lib/}

# Name of the 180 nm timing library
# Update "slow.lib" if your library name differs
set_db library slow.lib

# ------------------------------------------------------------
# Read RTL Design
# ------------------------------------------------------------
read_hdl {./kogge_stone_adder_32.v}

# ------------------------------------------------------------
# Elaborate Top Module
# ------------------------------------------------------------
elaborate kogge_stone_adder_32
current_design kogge_stone_adder_32

# ------------------------------------------------------------
# Apply Constraints
# ------------------------------------------------------------
read_sdc ./constraint_kogge_stone_180nm.sdc

# ------------------------------------------------------------
# Set Synthesis Effort Levels
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
write_hdl > kogge_stone_adder_180nm_netlist.v
write_sdc > kogge_stone_adder_180nm_output.sdc

# ------------------------------------------------------------
# Generate Synthesis Reports
# ------------------------------------------------------------
report timing > kogge_stone_adder_180nm_timing.rpt
report power  > kogge_stone_adder_180nm_power.rpt
report area   > kogge_stone_adder_180nm_area.rpt
report gates  > kogge_stone_adder_180nm_gates.rpt

# ------------------------------------------------------------
# Optional GUI
# ------------------------------------------------------------
gui_show

# ------------------------------------------------------------
# End of Script
# ============================================================