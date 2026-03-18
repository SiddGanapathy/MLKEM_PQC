# ============================================================
# ADD CONSTRAINTS
# ============================================================

set origin_dir [file normalize [file dirname [info script]]]
set root_dir [file normalize "$origin_dir/.."]

set constr_dir "$root_dir/constraints"

puts "Checking constraints in: $constr_dir"

if {[file exists $constr_dir]} {

    set xdc_files [glob -nocomplain "$constr_dir/*.xdc"]

    foreach file $xdc_files {
        puts "Adding constraint: $file"
        add_files -fileset constrs_1 $file
    }

} else {
    puts "No constraints directory found."
}

puts "Constraint step complete!"
