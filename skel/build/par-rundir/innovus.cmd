#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Wed Jun 26 02:58:53 2024                
#                                                     
#######################################################

#@(#)CDS: Innovus v18.10-p002_1 (64bit) 05/29/2018 19:19 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 18.10-p002_1 NR180522-1057/18_10-UB (database version 2.30, 418.7.1) {superthreading v1.46}
#@(#)CDS: AAE 18.10-p004 (64bit) 05/29/2018 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 18.10-p003_1 () May 15 2018 10:23:07 ( )
#@(#)CDS: SYNTECH 18.10-a012_1 () Apr 19 2018 01:27:21 ( )
#@(#)CDS: CPE v18.10-p005
#@(#)CDS: IQRC/TQRC 18.1.1-s118 (64bit) Fri Mar 23 17:23:45 PDT 2018 (Linux 2.6.18-194.el5)

set_db design_process_node 130
set_multi_cpu_usage -local_cpu 4
set_db timing_analysis_cppr both
set_db timing_analysis_type ocv
set_library_unit -time 1ns
read_physical -lef { /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/tech-sky130-cache/sky130_fd_sc_hd__nom.tlef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/tech-sky130-cache/sky130_ef_io.lef /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lef/sky130_fd_io.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w8/sram22_1024x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w32/sram22_64x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w32/sram22_1024x32m8w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w32/sram22_512x32m4w32.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_2048x32m8w8/sram22_2048x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w8/sram22_512x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x32m8w8/sram22_4096x32m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x4m4w2/sram22_64x4m4w2.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_256x32m4w8/sram22_256x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x8m8w8/sram22_4096x8m8w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w8/sram22_64x32m4w8.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x24m4w24/sram22_64x24m4w24.lef /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x64m4w8/sram22_512x64m4w8.lef }
read_mmmc /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/mmmc.tcl
read_netlist { /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/riscv_top.mapped.v } -top riscv_top
init_design
read_power_intent -cpf /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/power_spec.cpf
commit_power_intent
set_db design_flow_effort standard
set_dont_use [get_db lib_cells */*sdf*]
set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probe_p_*]
set_dont_use [get_db lib_cells */sky130_fd_sc_hd__probec_p_*]
write_db pre_sky130_innovus_settings
set_db place_global_place_io_pins true
set_db opt_honor_fences true
set_db place_detail_dpt_flow true
set_db place_detail_color_aware_legal true
set_db place_global_solver_effort high
set_db place_detail_check_cut_spacing true
set_db place_global_cong_effort high
set_db opt_fix_fanout_load true
set_db opt_clock_gate_aware false
set_db opt_area_recovery true
set_db opt_post_route_area_reclaim setup_aware
set_db opt_fix_hold_verbose true
set_db cts_target_skew 0.03
set_db cts_max_fanout 10
set_db opt_setup_target_slack 0.10
set_db opt_hold_target_slack 0.10
set_db route_design_antenna_diode_insertion 1
set_db route_design_antenna_cell_name sky130_fd_sc_hd__diode_2
set_db route_design_high_freq_search_repair true
set_db route_design_detail_post_route_spread_wire true
set_db route_design_with_si_driven true
set_db route_design_with_timing_driven true
set_db route_design_concurrent_minimize_via_count_effort high
set_db opt_consider_routing_congestion true
set_db route_design_detail_use_multi_cut_via_effort medium
set_db floorplan_snap_die_grid manufacturing
write_db pre_floorplan_design
create_floorplan -core_margins_by die -flip f -die_size_by_io_height max -site unithd -die_size { 1800 1800 0 0 0 0 }
place_inst mem/icache/meta 500 1200 r0
create_place_halo -insts mem/icache/meta -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M4 -inst mem/icache/meta
place_inst mem/dcache/meta 750 115 r180
create_place_halo -insts mem/dcache/meta -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M4 -inst mem/dcache/meta
place_inst mem/icache/sram_00 5 905 r90
create_place_halo -insts mem/icache/sram_00 -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst mem/icache/sram_00
place_inst mem/icache/sram_01 1235 905 r270
create_place_halo -insts mem/icache/sram_01 -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst mem/icache/sram_01
place_inst mem/icache/sram_10 5 1200 r90
create_place_halo -insts mem/icache/sram_10 -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst mem/icache/sram_10
place_inst mem/icache/sram_11 1235 1200 r270
create_place_halo -insts mem/icache/sram_11 -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst mem/icache/sram_11
place_inst mem/dcache/sram_00 5 315 r90
create_place_halo -insts mem/dcache/sram_00 -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst mem/dcache/sram_00
place_inst mem/dcache/sram_01 1235 315 r270
create_place_halo -insts mem/dcache/sram_01 -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst mem/dcache/sram_01
place_inst mem/dcache/sram_10 5 610 r90
create_place_halo -insts mem/dcache/sram_10 -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst mem/dcache/sram_10
place_inst mem/dcache/sram_11 1235 610 r270
create_place_halo -insts mem/dcache/sram_11 -halo_deltas {2.0 2.0 2.0 2.0} -snap_to_site
create_route_halo -bottom_layer li1 -space 2.0 -top_layer M3 -inst mem/dcache/sram_11
create_place_blockage -area {0 0 1800 1.08}
write_db pre_place_bumps
write_db pre_sky130_add_endcaps
set_db add_endcaps_boundary_tap true
set_db add_endcaps_left_edge sky130_fd_sc_hd__tap_1
set_db add_endcaps_right_edge sky130_fd_sc_hd__tap_1
add_endcaps
write_db pre_place_tap_cells
set_db add_well_taps_cell sky130_fd_sc_hd__tapvpwrvgnd_1
add_well_taps -cell_interval 15.0 -in_row_offset 5.0
write_db pre_sky130_connect_nets
connect_global_net VDD -type pg_pin -pin_base_name VPWR -all -auto_tie -netlist_override
connect_global_net VDD -type net -net_base_name VPWR -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name VPB -all -auto_tie -netlist_override
connect_global_net VDD -type net -net_base_name VPB -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name vdd -all -auto_tie -netlist_override
connect_global_net VDD -type net -net_base_name vdd -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VGND -all -auto_tie -netlist_override
connect_global_net VSS -type net -net_base_name VGND -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VNB -all -auto_tie -netlist_override
connect_global_net VSS -type net -net_base_name VNB -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name vss -all -auto_tie -netlist_override
connect_global_net VSS -type net -net_base_name vss -all -netlist_override
write_db pre_power_straps
reset_db -category add_stripes
set_db add_stripes_stacked_via_bottom_layer met1
set_db add_stripes_stacked_via_top_layer met1
set_db add_stripes_spacing_from_block 2.000
add_stripes -pin_layer met1 -layer met1 -over_pins 1 -master sky130_fd_sc_hd__tapvpwrvgnd_1 -block_ring_bottom_layer_limit met1 -block_ring_top_layer_limit met1 -pad_core_ring_bottom_layer_limit met1 -pad_core_ring_top_layer_limit met1 -direction horizontal -width pin_width -nets { VSS VDD }
reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met2
set_db add_stripes_stacked_via_bottom_layer met1
set_db add_stripes_trim_antenna_back_to_shape stripe
set_db add_stripes_spacing_from_block 4.000
add_stripes -create_pins 0 -block_ring_bottom_layer_limit met2 -block_ring_top_layer_limit met1 -direction vertical -layer met2 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met1 -set_to_set_distance 119.60 -spacing 0.42 -switch_layer_over_obs 0 -width 2.80 -area {{0.0 0.0 1800.0 1800.0}} -start 5.04
reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met3
set_db add_stripes_stacked_via_bottom_layer met2
set_db add_stripes_trim_antenna_back_to_shape stripe
set_db add_stripes_spacing_from_block 2.000
add_stripes -create_pins 0 -block_ring_bottom_layer_limit met3 -block_ring_top_layer_limit met2 -direction horizontal -layer met3 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met2 -set_to_set_distance 44.20 -spacing 1.10 -switch_layer_over_obs 0 -width 3.66 -area {{0.0 0.0 1800.0 1800.0}} -start 7.69
reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met4
set_db add_stripes_stacked_via_bottom_layer met3
set_db add_stripes_trim_antenna_back_to_shape stripe
set_db add_stripes_spacing_from_block 2.000
add_stripes -create_pins 0 -block_ring_bottom_layer_limit met4 -block_ring_top_layer_limit met3 -direction vertical -layer met4 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met3 -set_to_set_distance 80.04 -spacing 1.10 -switch_layer_over_obs 0 -width 5.34 -area {{0.0 0.0 1800.0 1800.0}} -start 10.21
reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met5
set_db add_stripes_stacked_via_bottom_layer met4
set_db add_stripes_trim_antenna_back_to_shape stripe
set_db add_stripes_spacing_from_block 2.000
add_stripes -create_pins 1 -block_ring_bottom_layer_limit met5 -block_ring_top_layer_limit met4 -direction horizontal -layer met5 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met4 -set_to_set_distance 34.0 -spacing 4.8 -switch_layer_over_obs 0 -width 5.4 -area {{0.0 0.0 1800.0 1800.0}} -start 7.5
write_db pre_place_pins
set_db assign_pins_edit_in_batch true
set_db assign_pins_promoted_macro_bottom_layer li1
set_db assign_pins_promoted_macro_top_layer met5
edit_pin -fixed_pin -pin * -hinst riscv_top -pattern fill_optimised -layer { met2 met4 } -side bottom -start { 1800 0 } -end { 0 0 }
set_db assign_pins_edit_in_batch false
write_db pre_place_opt_design
place_opt_design
write_db pre_clock_tree
create_clock_tree_spec
ccopt_design -hold -report_dir hammer_cts_debug -report_prefix hammer_cts
write_db pre_add_fillers
set_db add_fillers_cells {sky130_fd_sc_hd__decap_3 sky130_fd_sc_hd__decap_4 sky130_fd_sc_hd__decap_6 sky130_fd_sc_hd__decap_8 sky130_fd_sc_hd__decap_12}
add_fillers
set_db add_fillers_cells {sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8}
add_fillers
write_db pre_route_design
set_db design_express_route true
route_design
write_db pre_opt_design
opt_design -post_route -setup -hold -expanded_views
write_db pre_write_regs
all_registers -edge_triggered -output_pins
write_db pre_sky130_connect_nets2
connect_global_net VDD -type pg_pin -pin_base_name VPWR -all -auto_tie -netlist_override
connect_global_net VDD -type net -net_base_name VPWR -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name VPB -all -auto_tie -netlist_override
connect_global_net VDD -type net -net_base_name VPB -all -netlist_override
connect_global_net VDD -type pg_pin -pin_base_name vdd -all -auto_tie -netlist_override
connect_global_net VDD -type net -net_base_name vdd -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VGND -all -auto_tie -netlist_override
connect_global_net VSS -type net -net_base_name VGND -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name VNB -all -auto_tie -netlist_override
connect_global_net VSS -type net -net_base_name VNB -all -netlist_override
connect_global_net VSS -type pg_pin -pin_base_name vss -all -auto_tie -netlist_override
connect_global_net VSS -type net -net_base_name vss -all -netlist_override
write_db pre_write_design
write_db riscv_top_FINAL -def -verilog
set_db write_stream_virtual_connection false
connect_global_net VDD -type net -net_base_name VPWR
connect_global_net VDD -type net -net_base_name VPB
connect_global_net VDD -type net -net_base_name vdd
connect_global_net VSS -type net -net_base_name VGND
connect_global_net VSS -type net -net_base_name VNB
connect_global_net VSS -type net -net_base_name vss
write_netlist /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.lvs.v -top_module_first -top_module riscv_top -exclude_leaf_cells -phys -flat -exclude_insts_of_cells { sky130_fd_sc_hd__tap_1 sky130_fd_sc_hd__tap_2 sky130_fd_sc_hd__tapvgnd_1 sky130_fd_sc_hd__tapvpwrvgnd_1 sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8 sky130_fd_sc_hd__diode_2 }
write_netlist /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.sim.v -top_module_first -top_module riscv_top -exclude_leaf_cells -exclude_insts_of_cells { sky130_fd_sc_hd__tap_1 sky130_fd_sc_hd__tap_2 sky130_fd_sc_hd__tapvgnd_1 sky130_fd_sc_hd__tapvpwrvgnd_1 sky130_fd_sc_hd__fill_1 sky130_fd_sc_hd__fill_2 sky130_fd_sc_hd__fill_4 sky130_fd_sc_hd__fill_8 sky130_fd_sc_hd__diode_2 }
write_stream -mode ALL -format stream -map_file /home/ff/eecs151/fa23/hammer/hammer/technology/sky130/extra/sky130_lefpin.map -uniquify_cell_names -merge { /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/gds/sky130_fd_sc_hd.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_ef_io.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_ef_io__gpiov2_pad_wrapped.gds /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/gds/sky130_fd_io.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w8/sram22_1024x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w32/sram22_64x32m4w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w32/sram22_1024x32m8w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w32/sram22_512x32m4w32.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_2048x32m8w8/sram22_2048x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w8/sram22_512x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x32m8w8/sram22_4096x32m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x4m4w2/sram22_64x4m4w2.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_256x32m4w8/sram22_256x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x8m8w8/sram22_4096x8m8w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w8/sram22_64x32m4w8.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x24m4w24/sram22_64x24m4w24.gds /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x64m4w8/sram22_512x64m4w8.gds } /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.gds
write_sdf /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.par.sdf
set_db extract_rc_coupled true
extract_rc
write_parasitics -spef_file /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.ss_100C_1v60.par.spef -rc_corner ss_100C_1v60.setup_rc
write_parasitics -spef_file /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/riscv_top.ff_n40C_1v95.par.spef -rc_corner ff_n40C_1v95.hold_rc
write_db post_write_design
