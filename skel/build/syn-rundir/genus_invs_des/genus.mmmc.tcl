#################################################################################
#
# Created by Genus(TM) Synthesis Solution 19.15-s090_1 on Wed Jun 12 00:27:26 PDT 2024
#
#################################################################################

## library_sets
create_library_set -name ss_100C_1v60.setup_set \
    -timing { /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ss_100C_1v60.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__gpiov2_pad_wrapped_ss_ss_100C_1v60_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vccd_lvc_clamped3_pad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vccd_lvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vdda_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vddio_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssa_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssd_lvc_clamped3_pad_ss_100C_1v60_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssd_lvc_clamped_pad_ss_100C_1v60_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssio_hvc_clamped_pad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_gpiov2_ss_ss_100C_1v60_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_ground_hvc_wpad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_ground_lvc_wpad_ss_100C_1v60_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_power_hvc_wpad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_power_lvc_wpad_ss_100C_1v60_3v00_3v00.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_xres4v2_ss_ss_100C_1v60_3v00.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w8/sram22_1024x32m8w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w32/sram22_64x32m4w32_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w32/sram22_1024x32m8w32_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w32/sram22_512x32m4w32_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_2048x32m8w8/sram22_2048x32m8w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w8/sram22_512x32m4w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x32m8w8/sram22_4096x32m8w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x4m4w2/sram22_64x4m4w2_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_256x32m4w8/sram22_256x32m4w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x8m8w8/sram22_4096x8m8w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w8/sram22_64x32m4w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x24m4w24/sram22_64x24m4w24_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x64m4w8/sram22_512x64m4w8_tt_025C_1v80.rc.lib }
create_library_set -name ff_n40C_1v95.hold_set \
    -timing { /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__ff_n40C_1v95_ccsnoise.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__gpiov2_pad_wrapped_ff_ff_n40C_1v95_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vccd_lvc_clamped3_pad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vccd_lvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vdda_hvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vddio_hvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssa_hvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssd_lvc_clamped3_pad_ff_n40C_1v95_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssd_lvc_clamped_pad_ff_n40C_1v95_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_ef_io__vssio_hvc_clamped_pad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_gpiov2_ff_ff_n40C_1v95_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_ground_hvc_wpad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_ground_lvc_wpad_ff_n40C_1v95_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_power_hvc_wpad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_power_lvc_wpad_ff_n40C_1v95_5v50_5v50.lib \
              /home/ff/eecs151/fa23/pdk_mod/lab3/sky130A/libs.ref/sky130_fd_io/lib/sky130_fd_io__top_xres4v2_ff_ff_n40C_1v95_5v50.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w8/sram22_1024x32m8w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w32/sram22_64x32m4w32_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_1024x32m8w32/sram22_1024x32m8w32_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w32/sram22_512x32m4w32_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_2048x32m8w8/sram22_2048x32m8w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x32m4w8/sram22_512x32m4w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x32m8w8/sram22_4096x32m8w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x4m4w2/sram22_64x4m4w2_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_256x32m4w8/sram22_256x32m4w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_4096x8m8w8/sram22_4096x8m8w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x32m4w8/sram22_64x32m4w8_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_64x24m4w24/sram22_64x24m4w24_tt_025C_1v80.rc.lib \
              /home/ff/eecs151/fa23/sky130_srams/sram22_sky130_macros_20231011/sram22_512x64m4w8/sram22_512x64m4w8_tt_025C_1v80.rc.lib }

## timing_condition
create_timing_condition -name ss_100C_1v60.setup_cond \
    -library_sets { ss_100C_1v60.setup_set }
create_timing_condition -name ff_n40C_1v95.hold_cond \
    -library_sets { ff_n40C_1v95.hold_set }

## rc_corner
create_rc_corner -name ss_100C_1v60.setup_rc \
    -temperature 100.0 \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}
create_rc_corner -name ff_n40C_1v95.hold_rc \
    -temperature -40.0 \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}

## delay_corner
create_delay_corner -name ss_100C_1v60.setup_delay \
    -early_timing_condition { ss_100C_1v60.setup_cond } \
    -late_timing_condition { ss_100C_1v60.setup_cond } \
    -early_rc_corner ss_100C_1v60.setup_rc \
    -late_rc_corner ss_100C_1v60.setup_rc
create_delay_corner -name ff_n40C_1v95.hold_delay \
    -early_timing_condition { ff_n40C_1v95.hold_cond } \
    -late_timing_condition { ff_n40C_1v95.hold_cond } \
    -early_rc_corner ff_n40C_1v95.hold_rc \
    -late_rc_corner ff_n40C_1v95.hold_rc

## constraint_mode
create_constraint_mode -name my_constraint_mode \
    -sdc_files { genus_invs_des/genus.my_constraint_mode.sdc }

## analysis_view
create_analysis_view -name ss_100C_1v60.setup_view \
    -constraint_mode my_constraint_mode \
    -delay_corner ss_100C_1v60.setup_delay
create_analysis_view -name ff_n40C_1v95.hold_view \
    -constraint_mode my_constraint_mode \
    -delay_corner ff_n40C_1v95.hold_delay

## set_analysis_view
set_analysis_view -setup { ss_100C_1v60.setup_view } \
                  -hold { ff_n40C_1v95.hold_view }
