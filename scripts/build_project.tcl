# ============================================================
# BUILD VIVADO PROJECT
# ============================================================

# Paths
set origin_dir [file normalize [file dirname [info script]]]
set root_dir [file normalize "$origin_dir/.."]

# Project config
set proj_name "mlkem_zynq"
set proj_dir "$root_dir/vivado_project"
set part_name "xc7z020clg400-1"

# ============================================================
# Create Project
# ============================================================

puts "Creating project: $proj_name"

create_project $proj_name $proj_dir -part $part_name -force

set_property target_language Verilog [current_project]

# ============================================================
# ADD RTL FILES
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
# SET DESIGN TOP
# ============================================================

set top_module "mlkem_accelerator"
puts "Setting design top: $top_module"

set_property top $top_module [current_fileset]

update_compile_order -fileset sources_1

# ============================================================
# ADD TESTBENCH (SIMPLE)
# ============================================================

set tb_dir "$root_dir/tb"

if {[file exists $tb_dir]} {

    puts "Adding testbench files..."

    set tb_files [concat \
        [glob -nocomplain "$tb_dir/*.sv"] \
        [glob -nocomplain "$tb_dir/*.v"]]

    foreach file $tb_files {
        puts "Adding TB: $file"
        add_files -fileset sim_1 $file
    }

    # Set simulation top (no validation)
    set sim_top "tb_mlkem"
    puts "Setting simulation top: $sim_top"

    set_property top $sim_top [get_filesets sim_1]

} else {
    puts "No testbench folder found"
}

puts "Build project step complete!"
