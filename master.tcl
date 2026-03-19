# ============================================================
# MASTER SCRIPT
# ============================================================

set root_dir [file normalize [file dirname [info script]]]
set scripts_dir "$root_dir/scripts"

cd $root_dir

puts "========== MLKEM PROJECT SETUP =========="

# Step 1: Build project (RTL + TB)
source [file join $scripts_dir "build_project.tcl"]

# Step 2: Add constraints
source [file join $scripts_dir "add_constraints.tcl"]

puts "========== OPENING PROJECT =========="

# Open Vivado GUI with project
set proj_name "mlkem_zynq"
set proj_dir "$root_dir/vivado_project"
set xpr_file "$proj_dir/$proj_name.xpr"

start_gui
