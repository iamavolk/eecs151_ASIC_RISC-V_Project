if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name ss_100C_1v60.setup_set\
   -timing\
    [list ${::IMEX::libVar}/mmmc/sky130_fd_sc_hd__ss_100C_1v60.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__gpiov2_pad_wrapped_ss_ss_100C_1v60_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vccd_lvc_clamped3_pad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vccd_lvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vdda_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vddio_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vssa_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vssd_lvc_clamped3_pad_ss_100C_1v60_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vssd_lvc_clamped_pad_ss_100C_1v60_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vssio_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_gpiov2_ss_ss_100C_1v60_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_ground_hvc_wpad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_ground_lvc_wpad_ss_100C_1v60_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_power_hvc_wpad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_power_lvc_wpad_ss_100C_1v60_3v00_3v00.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_xres4v2_ss_ss_100C_1v60_3v00.lib\
    ${::IMEX::libVar}/mmmc/sram22_1024x32m8w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_64x32m4w32_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_1024x32m8w32_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_512x32m4w32_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_2048x32m8w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_512x32m4w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_4096x32m8w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_64x4m4w2_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_256x32m4w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_4096x8m8w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_64x32m4w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_64x24m4w24_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_512x64m4w8_tt_025C_1v80.rc.lib]
create_library_set -name ff_n40C_1v95.hold_set\
   -timing\
    [list ${::IMEX::libVar}/mmmc/sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__gpiov2_pad_wrapped_ff_ff_n40C_1v95_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vccd_lvc_clamped3_pad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vccd_lvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vdda_hvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vddio_hvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vssa_hvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vssd_lvc_clamped3_pad_ff_n40C_1v95_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vssd_lvc_clamped_pad_ff_n40C_1v95_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_ef_io__vssio_hvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_gpiov2_ff_ff_n40C_1v95_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_ground_hvc_wpad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_ground_lvc_wpad_ff_n40C_1v95_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_power_hvc_wpad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_power_lvc_wpad_ff_n40C_1v95_5v50_5v50.lib\
    ${::IMEX::libVar}/mmmc/sky130_fd_io__top_xres4v2_ff_ff_n40C_1v95_5v50.lib\
    ${::IMEX::libVar}/mmmc/sram22_1024x32m8w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_64x32m4w32_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_1024x32m8w32_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_512x32m4w32_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_2048x32m8w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_512x32m4w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_4096x32m8w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_64x4m4w2_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_256x32m4w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_4096x8m8w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_64x32m4w8_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_64x24m4w24_tt_025C_1v80.rc.lib\
    ${::IMEX::libVar}/mmmc/sram22_512x64m4w8_tt_025C_1v80.rc.lib]
create_timing_condition -name ff_n40C_1v95.hold_cond\
   -library_sets [list ff_n40C_1v95.hold_set]
create_timing_condition -name ss_100C_1v60.setup_cond\
   -library_sets [list ss_100C_1v60.setup_set]
create_rc_corner -name ff_n40C_1v95.hold_rc\
   -pre_route_res 1\
   -post_route_res 1\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -temperature -40
create_rc_corner -name ss_100C_1v60.setup_rc\
   -pre_route_res 1\
   -post_route_res 1\
   -pre_route_cap 1\
   -post_route_cap 1\
   -post_route_cross_cap 1\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -temperature 100
create_delay_corner -name ss_100C_1v60.setup_delay\
   -timing_condition {ss_100C_1v60.setup_cond}\
   -rc_corner ss_100C_1v60.setup_rc
create_delay_corner -name ff_n40C_1v95.hold_delay\
   -timing_condition {ff_n40C_1v95.hold_cond}\
   -rc_corner ff_n40C_1v95.hold_rc
create_constraint_mode -name my_constraint_mode\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/my_constraint_mode/my_constraint_mode.sdc]
create_analysis_view -name ss_100C_1v60.setup_view -constraint_mode my_constraint_mode -delay_corner ss_100C_1v60.setup_delay -latency_file ${::IMEX::dataVar}/mmmc/views/ss_100C_1v60.setup_view/latency.sdc
create_analysis_view -name ff_n40C_1v95.hold_view -constraint_mode my_constraint_mode -delay_corner ff_n40C_1v95.hold_delay -latency_file ${::IMEX::dataVar}/mmmc/views/ff_n40C_1v95.hold_view/latency.sdc
set_analysis_view -setup [list ss_100C_1v60.setup_view] -hold [list ff_n40C_1v95.hold_view]
