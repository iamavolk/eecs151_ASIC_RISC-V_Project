# --------------------------------------------------------------------------------
# This script was written and developed by HAMMER at UC Berkeley; however, the
# underlying commands and reports are copyrighted by Cadence. We thank Cadence for
# granting permission to share our research to help promote and foster the next
# generation of innovators.
# --------------------------------------------------------------------------------

puts "set_db design_process_node 130" 
set_db design_process_node 130
puts "set_multi_cpu_usage -local_cpu 4" 
set_multi_cpu_usage -local_cpu 4
puts "set_db timing_analysis_cppr both" 
set_db timing_analysis_cppr both
puts "set_db timing_analysis_type ocv" 
set_db timing_analysis_type ocv
puts "set_library_unit -time 1ns" 
set_library_unit -time 1ns
puts "read_physical -lef { /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/tech-sky130-cache/sky130_ef_io.lef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lef/sky130_fd_io.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w8/sram22_1024x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w32/sram22_64x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w32/sram22_1024x32m8w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w32/sram22_512x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_2048x32m8w8/sram22_2048x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w8/sram22_512x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x32m8w8/sram22_4096x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x4m4w2/sram22_64x4m4w2.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_256x32m4w8/sram22_256x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x8m8w8/sram22_4096x8m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w8/sram22_64x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x24m4w24/sram22_64x24m4w24.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x64m4w8/sram22_512x64m4w8.lef }" 
read_physical -lef { /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/tech-sky130-cache/sky130_ef_io.lef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lef/sky130_fd_io.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w8/sram22_1024x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w32/sram22_64x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w32/sram22_1024x32m8w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w32/sram22_512x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_2048x32m8w8/sram22_2048x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w8/sram22_512x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x32m8w8/sram22_4096x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x4m4w2/sram22_64x4m4w2.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_256x32m4w8/sram22_256x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x8m8w8/sram22_4096x8m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w8/sram22_64x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x24m4w24/sram22_64x24m4w24.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x64m4w8/sram22_512x64m4w8.lef }
puts "read_mmmc /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/mmmc.tcl" 
read_mmmc /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/mmmc.tcl
puts "read_netlist { /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/riscv_top.mapped.v } -top riscv_top" 
read_netlist { /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/riscv_top.mapped.v } -top riscv_top
puts "init_design" 
init_design
puts "read_power_intent -cpf /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/power_spec.cpf" 
read_power_intent -cpf /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/power_spec.cpf
puts "commit_power_intent" 
commit_power_intent
puts "set_db design_flow_effort standard" 
set_db design_flow_effort standard

puts "set_dont_use \[get_db lib_cells */*sdf*\]"
if { [get_db lib_cells */*sdf*] ne "" } {
    set_dont_use [get_db lib_cells */*sdf*]
} else {
    puts "WARNING: cell */*sdf* was not found for set_dont_use"
}
            

puts "set_dont_use \[get_db lib_cells */sky130_fd_sc_hd__probe_p_*\]"
if { [get_db lib_cells */sky130_fd_sc_hd__probe_p_*] ne "" } {
    set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probe_p_*]
} else {
    puts "WARNING: cell */sky130_fd_sc_hd__probe_p_* was not found for set_dont_use"
}
            

puts "set_dont_use \[get_db lib_cells */sky130_fd_sc_hd__probec_p_*\]"
if { [get_db lib_cells */sky130_fd_sc_hd__probec_p_*] ne "" } {
    set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probec_p_*]
} else {
    puts "WARNING: cell */sky130_fd_sc_hd__probec_p_* was not found for set_dont_use"
}
            
puts "write_db pre_sky130_innovus_settings" 
write_db pre_sky130_innovus_settings
puts "ln -sfn pre_sky130_innovus_settings latest" 
ln -sfn pre_sky130_innovus_settings latest


##########################################################
# Placement attributes  [get_db -category place]
##########################################################
#-------------------------------------------------------------------------------
set_db place_global_place_io_pins  true

set_db opt_honor_fences true
set_db place_detail_dpt_flow true
set_db place_detail_color_aware_legal true
set_db place_global_solver_effort high
set_db place_detail_check_cut_spacing true
set_db place_global_cong_effort high

##########################################################
# Optimization attributes  [get_db -category opt]
##########################################################
#-------------------------------------------------------------------------------

set_db opt_fix_fanout_load true
set_db opt_clock_gate_aware false
set_db opt_area_recovery true
set_db opt_post_route_area_reclaim setup_aware
set_db opt_fix_hold_verbose true

##########################################################
# Clock attributes  [get_db -category cts]
##########################################################
#-------------------------------------------------------------------------------
set_db cts_target_skew 0.03
set_db cts_max_fanout 10
#set_db cts_target_max_transition_time .3
set_db opt_setup_target_slack 0.10
set_db opt_hold_target_slack 0.10

##########################################################
# Routing attributes  [get_db -category route]
##########################################################
#-------------------------------------------------------------------------------
set_db route_design_antenna_diode_insertion 1
set_db route_design_antenna_cell_name "sky130_fd_sc_hd__diode_2"

set_db route_design_high_freq_search_repair true
set_db route_design_detail_post_route_spread_wire true
set_db route_design_with_si_driven true
set_db route_design_with_timing_driven true
set_db route_design_concurrent_minimize_via_count_effort high
set_db opt_consider_routing_congestion true
set_db route_design_detail_use_multi_cut_via_effort medium
    

# For top module: snap die to manufacturing grid, not placement grid
set_db floorplan_snap_die_grid manufacturing
        
puts "write_db pre_floorplan_design" 
write_db pre_floorplan_design
puts "ln -sfn pre_floorplan_design latest" 
ln -sfn pre_floorplan_design latest
puts "source -echo -verbose /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/floorplan.tcl" 
source -echo -verbose /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/floorplan.tcl
puts "write_db pre_place_bumps" 
write_db pre_place_bumps
puts "ln -sfn pre_place_bumps latest" 
ln -sfn pre_place_bumps latest
puts "write_db pre_sky130_add_endcaps" 
write_db pre_sky130_add_endcaps
puts "ln -sfn pre_sky130_add_endcaps latest" 
ln -sfn pre_sky130_add_endcaps latest

set_db add_endcaps_boundary_tap     true
set_db add_endcaps_left_edge        sky130_fd_sc_hd__tap_1
set_db add_endcaps_right_edge       sky130_fd_sc_hd__tap_1
add_endcaps
    
puts "write_db pre_place_tap_cells" 
write_db pre_place_tap_cells
puts "ln -sfn pre_place_tap_cells latest" 
ln -sfn pre_place_tap_cells latest
set_db add_well_taps_cell sky130_fd_sc_hd__tapvpwrvgnd_1
add_well_taps -cell_interval 15.0 -in_row_offset 5.0
puts "write_db pre_sky130_connect_nets" 
write_db pre_sky130_connect_nets
puts "ln -sfn pre_sky130_connect_nets latest" 
ln -sfn pre_sky130_connect_nets latest
connect_global_net VDD -type pg_pin -pin_base_name VPWR -all -auto_tie -netlist_override
connect_global_net VDD -type net    -net_base_name VPWR -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name VPB -all -auto_tie -netlist_override
connect_global_net VDD -type net    -net_base_name VPB -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name vdd -all -auto_tie -netlist_override
connect_global_net VDD -type net    -net_base_name vdd -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VGND -all -auto_tie -netlist_override
connect_global_net VSS -type net    -net_base_name VGND -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VNB -all -auto_tie -netlist_override
connect_global_net VSS -type net    -net_base_name VNB -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name vss -all -auto_tie -netlist_override
connect_global_net VSS -type net    -net_base_name vss -all -netlist_override
puts "write_db pre_power_straps" 
write_db pre_power_straps
puts "ln -sfn pre_power_straps latest" 
ln -sfn pre_power_straps latest
puts "source -echo -verbose /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/power_straps.tcl" 
source -echo -verbose /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/power_straps.tcl
puts "write_db pre_place_pins" 
write_db pre_place_pins
puts "ln -sfn pre_place_pins latest" 
ln -sfn pre_place_pins latest
puts "set_db assign_pins_edit_in_batch true" 
set_db assign_pins_edit_in_batch true
set_db assign_pins_promoted_macro_bottom_layer li1
set_db assign_pins_promoted_macro_top_layer met5
set all_ppins ""
puts "edit_pin -fixed_pin -pin * -hinst riscv_top -pattern fill_optimised -layer { met2 met4 } -side bottom -start { 1800 0 } -end { 0 0 }   " 
edit_pin -fixed_pin -pin * -hinst riscv_top -pattern fill_optimised -layer { met2 met4 } -side bottom -start { 1800 0 } -end { 0 0 }   
puts "if {[llength $all_ppins] ne 0} {assign_io_pins -move_fixed_pin -pins [get_db $all_ppins .net.name]}" 
if {[llength $all_ppins] ne 0} {assign_io_pins -move_fixed_pin -pins [get_db $all_ppins .net.name]}
puts "set_db assign_pins_edit_in_batch false" 
set_db assign_pins_edit_in_batch false
puts "write_db pre_place_opt_design" 
write_db pre_place_opt_design
puts "ln -sfn pre_place_opt_design latest" 
ln -sfn pre_place_opt_design latest
puts "place_opt_design" 
place_opt_design
puts "write_db pre_clock_tree" 
write_db pre_clock_tree
puts "ln -sfn pre_clock_tree latest" 
ln -sfn pre_clock_tree latest
puts "create_clock_tree_spec" 
create_clock_tree_spec
puts "ccopt_design -hold -report_dir hammer_cts_debug -report_prefix hammer_cts" 
ccopt_design -hold -report_dir hammer_cts_debug -report_prefix hammer_cts
puts "write_db pre_add_fillers" 
write_db pre_add_fillers
puts "ln -sfn pre_add_fillers latest" 
ln -sfn pre_add_fillers latest
set_db add_fillers_cells "sky130_fd_sc_hd__decap_3 sky130_fd_sc_hd__decap_4 sky130_fd_sc_hd__decap_6 sky130_fd_sc_hd__decap_8 sky130_fd_sc_hd__decap_12"
puts "add_fillers" 
add_fillers
set_db add_fillers_cells "sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8"
puts "add_fillers" 
add_fillers
puts "write_db pre_route_design" 
write_db pre_route_design
puts "ln -sfn pre_route_design latest" 
ln -sfn pre_route_design latest
puts "set_db design_express_route true" 
set_db design_express_route true
puts "route_design" 
route_design
puts "write_db pre_opt_design" 
write_db pre_opt_design
puts "ln -sfn pre_opt_design latest" 
ln -sfn pre_opt_design latest
puts "opt_design -post_route -setup -hold -expanded_views" 
opt_design -post_route -setup -hold -expanded_views
puts "write_db pre_write_regs" 
write_db pre_write_regs
puts "ln -sfn pre_write_regs latest" 
ln -sfn pre_write_regs latest

        set write_cells_ir "./find_regs_cells.json"
        set write_cells_ir [open $write_cells_ir "w"]
        puts $write_cells_ir "\["

        set refs [get_db [get_db lib_cells -if .is_sequential==true] .base_name]

        set len [llength $refs]

        for {set i 0} {$i < [llength $refs]} {incr i} {
            if {$i == $len - 1} {
                puts $write_cells_ir "    \"[lindex $refs $i]\""
            } else {
                puts $write_cells_ir "    \"[lindex $refs $i]\","
            }
        }

        puts $write_cells_ir "\]"
        close $write_cells_ir
        set write_regs_ir "./find_regs_paths.json"
        set write_regs_ir [open $write_regs_ir "w"]
        puts $write_regs_ir "\["

        set regs [get_db [get_db [all_registers -edge_triggered -output_pins] -if .direction==out] .name]

        set len [llength $regs]

        for {set i 0} {$i < [llength $regs]} {incr i} {
            #regsub -all {/} [lindex $regs $i] . myreg
            set myreg [lindex $regs $i]
            if {$i == $len - 1} {
                puts $write_regs_ir "    \"$myreg\""
            } else {
                puts $write_regs_ir "    \"$myreg\","
            }
        }

        puts $write_regs_ir "\]"

        close $write_regs_ir
        
puts "write_db pre_sky130_connect_nets2" 
write_db pre_sky130_connect_nets2
puts "ln -sfn pre_sky130_connect_nets2 latest" 
ln -sfn pre_sky130_connect_nets2 latest
connect_global_net VDD -type pg_pin -pin_base_name VPWR -all -auto_tie -netlist_override
connect_global_net VDD -type net    -net_base_name VPWR -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name VPB -all -auto_tie -netlist_override
connect_global_net VDD -type net    -net_base_name VPB -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name vdd -all -auto_tie -netlist_override
connect_global_net VDD -type net    -net_base_name vdd -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VGND -all -auto_tie -netlist_override
connect_global_net VSS -type net    -net_base_name VGND -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VNB -all -auto_tie -netlist_override
connect_global_net VSS -type net    -net_base_name VNB -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name vss -all -auto_tie -netlist_override
connect_global_net VSS -type net    -net_base_name vss -all -netlist_override
puts "write_db pre_write_design" 
write_db pre_write_design
puts "ln -sfn pre_write_design latest" 
ln -sfn pre_write_design latest
puts "write_db riscv_top_FINAL -def -verilog" 
write_db riscv_top_FINAL -def -verilog
puts "set_db write_stream_virtual_connection false" 
set_db write_stream_virtual_connection false
puts "connect_global_net VDD -type net -net_base_name VPWR" 
connect_global_net VDD -type net -net_base_name VPWR
puts "connect_global_net VDD -type net -net_base_name VPB" 
connect_global_net VDD -type net -net_base_name VPB
puts "connect_global_net VDD -type net -net_base_name vdd" 
connect_global_net VDD -type net -net_base_name vdd
puts "connect_global_net VSS -type net -net_base_name VGND" 
connect_global_net VSS -type net -net_base_name VGND
puts "connect_global_net VSS -type net -net_base_name VNB" 
connect_global_net VSS -type net -net_base_name VNB
puts "connect_global_net VSS -type net -net_base_name vss" 
connect_global_net VSS -type net -net_base_name vss
puts "write_netlist /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.lvs.v -top_module_first -top_module riscv_top -exclude_leaf_cells -phys -flat -exclude_insts_of_cells { sky130_fd_sc_hd__tap_1 sky130_fd_sc_hd__tap_2 sky130_fd_sc_hd__tapvgnd_1 sky130_fd_sc_hd__tapvpwrvgnd_1 sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8 sky130_fd_sc_hd__diode_2 } " 
write_netlist /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.lvs.v -top_module_first -top_module riscv_top -exclude_leaf_cells -phys -flat -exclude_insts_of_cells { sky130_fd_sc_hd__tap_1 sky130_fd_sc_hd__tap_2 sky130_fd_sc_hd__tapvgnd_1 sky130_fd_sc_hd__tapvpwrvgnd_1 sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8 sky130_fd_sc_hd__diode_2 } 
puts "write_netlist /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.sim.v -top_module_first -top_module riscv_top -exclude_leaf_cells -exclude_insts_of_cells { sky130_fd_sc_hd__tap_1 sky130_fd_sc_hd__tap_2 sky130_fd_sc_hd__tapvgnd_1 sky130_fd_sc_hd__tapvpwrvgnd_1 sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8 sky130_fd_sc_hd__diode_2 } " 
write_netlist /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.sim.v -top_module_first -top_module riscv_top -exclude_leaf_cells -exclude_insts_of_cells { sky130_fd_sc_hd__tap_1 sky130_fd_sc_hd__tap_2 sky130_fd_sc_hd__tapvgnd_1 sky130_fd_sc_hd__tapvpwrvgnd_1 sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8 sky130_fd_sc_hd__diode_2 } 
puts "write_stream -mode ALL -format stream -map_file /home/ff/eecs151/fa23/hammer/hammer/technology/sky130/extra/sky130_lefpin.map -uniquify_cell_names -merge { /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_ef_io.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_ef_io__gpiov2_pad_wrapped.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_fd_io.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w8/sram22_1024x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w32/sram22_64x32m4w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w32/sram22_1024x32m8w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w32/sram22_512x32m4w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_2048x32m8w8/sram22_2048x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w8/sram22_512x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x32m8w8/sram22_4096x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x4m4w2/sram22_64x4m4w2.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_256x32m4w8/sram22_256x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x8m8w8/sram22_4096x8m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w8/sram22_64x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x24m4w24/sram22_64x24m4w24.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x64m4w8/sram22_512x64m4w8.gds }  /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.gds" 
write_stream -mode ALL -format stream -map_file /home/ff/eecs151/fa23/hammer/hammer/technology/sky130/extra/sky130_lefpin.map -uniquify_cell_names -merge { /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_ef_io.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_ef_io__gpiov2_pad_wrapped.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_fd_io.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w8/sram22_1024x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w32/sram22_64x32m4w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w32/sram22_1024x32m8w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w32/sram22_512x32m4w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_2048x32m8w8/sram22_2048x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w8/sram22_512x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x32m8w8/sram22_4096x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x4m4w2/sram22_64x4m4w2.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_256x32m4w8/sram22_256x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x8m8w8/sram22_4096x8m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w8/sram22_64x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x24m4w24/sram22_64x24m4w24.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x64m4w8/sram22_512x64m4w8.gds }  /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.gds
puts "write_sdf /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.par.sdf" 
write_sdf /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.par.sdf
puts "set_db extract_rc_coupled true" 
set_db extract_rc_coupled true
puts "extract_rc" 
extract_rc
puts "write_parasitics -spef_file /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.ss_100C_1v60.par.spef -rc_corner ss_100C_1v60.setup_rc" 
write_parasitics -spef_file /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.ss_100C_1v60.par.spef -rc_corner ss_100C_1v60.setup_rc
puts "write_parasitics -spef_file /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.ff_n40C_1v95.par.spef -rc_corner ff_n40C_1v95.hold_rc" 
write_parasitics -spef_file /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.ff_n40C_1v95.par.spef -rc_corner ff_n40C_1v95.hold_rc
puts "write_db post_write_design" 
write_db post_write_design
puts "ln -sfn post_write_design latest" 
ln -sfn post_write_design latest
puts "exit" 
exit