# ============================================================
# MASTER SCRIPT (STABLE VERSION)
# ============================================================

set root_dir [file normalize [file dirname [info script]]]
set scripts_dir "$root_dir/scripts"

cd $root_dir

puts "========== MLKEM PROJECT SETUP =========="

# Step 1: Build project + RTL
source [file join $scripts_dir "build_project.tcl"]

# Step 2: Add constraints
source [file join $scripts_dir "add_constraints.tcl"]

# ❌ DISABLE BD for now (important)
# source [file join $scripts_dir "create_bd.tcl"]

# ❌ Optional (enable later)
# source [file join $scripts_dir "run_sim.tcl"]
# source [file join $scripts_dir "run_synth.tcl"]

puts "========== BASIC PROJECT READY =========="
