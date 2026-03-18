# ============================================================
# CREATE ZYNQ BLOCK DESIGN
# ============================================================

puts "Creating Block Design..."

create_bd_design "design_1"

# Add Zynq Processing System
create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7 ps7

# Apply board automation (IMPORTANT)
apply_bd_automation -rule xilinx.com:bd_rule:processing_system7 \
    -config {make_external "FIXED_IO, DDR"} \
    [get_bd_cells ps7]

# (Optional) Add your MLKEM RTL later as AXI IP

# Validate
validate_bd_design

# Save
save_bd_design

puts "Block Design created!"
