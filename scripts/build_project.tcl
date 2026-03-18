# ============================================================
# BUILD VIVADO PROJECT
# ============================================================

# Paths
set origin_dir [file normalize [file dirname [info script]]]
set root_dir [file normalize "$origin_dir/.."]

# Project config
set proj_name "mlkem_zynq"
set proj_dir "$root_dir/vivado_project"
set part_name "xc7z020clg400-1"   ;# Zynq-7000

# ============================================================
# Create Project
# ============================================================

puts "Creating project: $proj_name"

create_project $proj_name $proj_dir -part $part_name -force

set_property target_language Verilog [current_project]

# ============================================================
# Add RTL Files
# ============================================================

set rtl_dir "$root_dir/rtl"

puts "Adding RTL files from: $rtl_dir"

# Verilog
set v_files [glob -nocomplain "$rtl_dir/*.v"]
foreach file $v_files {
    puts "Adding $file"
    add_files $file
}

# VHDL
set vhdl_files [glob -nocomplain "$rtl_dir/*.vhd"]
foreach file $vhdl_files {
    puts "Adding $file"
    add_files $file
}

# ============================================================
# Set Top Module (CHANGE if needed)
# ============================================================

set top_module "mlkem_accelerator"
puts "Setting top module: $top_module"

set_property top $top_module [current_fileset]

# ============================================================
# Compile Order
# ============================================================

update_compile_order -fileset sources_1

puts "Build project step complete!"
