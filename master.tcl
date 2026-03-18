# ============================================================
# MASTER SCRIPT
# ============================================================

set root_dir [file normalize [file dirname [info script]]]
set scripts_dir "$root_dir/scripts"

cd $root_dir

puts "========== MLKEM PROJECT SETUP =========="

# Step 1: Create project + add RTL
source [file join $scripts_dir "build_project.tcl"]

# Step 2: Add constraints
source [file join $scripts_dir "add_constraints.tcl"]

# Step 3: Create Zynq Block Design
source [file join $scripts_dir "create_bd.tcl"]

# Step 4: (optional) synthesis
# source [file join $scripts_dir "run_synth.tcl"]

puts "========== DONE =========="
