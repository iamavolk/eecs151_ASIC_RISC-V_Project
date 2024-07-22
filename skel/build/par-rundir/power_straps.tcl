# --------------------------------------------------------------------------------
# This script was written and developed by HAMMER at UC Berkeley; however, the
# underlying commands and reports are copyrighted by Cadence. We thank Cadence for
# granting permission to share our research to help promote and foster the next
# generation of innovators.
# --------------------------------------------------------------------------------

# Power strap definition for layer met1 (rails):

reset_db -category add_stripes
set_db add_stripes_stacked_via_bottom_layer met1
set_db add_stripes_stacked_via_top_layer met1
set_db add_stripes_spacing_from_block 2.000
add_stripes -pin_layer met1 -layer met1 -over_pins 1 -master "sky130_fd_sc_hd__tapvpwrvgnd_1" -block_ring_bottom_layer_limit met1 -block_ring_top_layer_limit met1 -pad_core_ring_bottom_layer_limit met1 -pad_core_ring_top_layer_limit met1 -direction horizontal -width pin_width -nets { VSS VDD }

# Power strap definition for layer met2:

reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met2
set_db add_stripes_stacked_via_bottom_layer met1
set_db add_stripes_trim_antenna_back_to_shape {stripe}
set_db add_stripes_spacing_from_block 4.000
add_stripes -create_pins 0 -block_ring_bottom_layer_limit met2 -block_ring_top_layer_limit met1 -direction vertical -layer met2 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met1 -set_to_set_distance 119.60 -spacing 0.42 -switch_layer_over_obs 0 -width 2.80 -area [get_db designs .core_bbox] -start [expr [lindex [lindex [get_db designs .core_bbox] 0] 0] + 5.04]

# Power strap definition for layer met3:

reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met3
set_db add_stripes_stacked_via_bottom_layer met2
set_db add_stripes_trim_antenna_back_to_shape {stripe}
set_db add_stripes_spacing_from_block 2.000
add_stripes -create_pins 0 -block_ring_bottom_layer_limit met3 -block_ring_top_layer_limit met2 -direction horizontal -layer met3 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met2 -set_to_set_distance 44.20 -spacing 1.10 -switch_layer_over_obs 0 -width 3.66 -area [get_db designs .core_bbox] -start [expr [lindex [lindex [get_db designs .core_bbox] 0] 1] + 7.69]

# Power strap definition for layer met4:

reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met4
set_db add_stripes_stacked_via_bottom_layer met3
set_db add_stripes_trim_antenna_back_to_shape {stripe}
set_db add_stripes_spacing_from_block 2.000
add_stripes -create_pins 0 -block_ring_bottom_layer_limit met4 -block_ring_top_layer_limit met3 -direction vertical -layer met4 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met3 -set_to_set_distance 80.04 -spacing 1.10 -switch_layer_over_obs 0 -width 5.34 -area [get_db designs .core_bbox] -start [expr [lindex [lindex [get_db designs .core_bbox] 0] 0] + 10.21]

# Power strap definition for layer met5:

reset_db -category add_stripes
set_db add_stripes_stacked_via_top_layer met5
set_db add_stripes_stacked_via_bottom_layer met4
set_db add_stripes_trim_antenna_back_to_shape {stripe}
set_db add_stripes_spacing_from_block 2.000
add_stripes -create_pins 1 -block_ring_bottom_layer_limit met5 -block_ring_top_layer_limit met4 -direction horizontal -layer met5 -nets {VSS VDD} -pad_core_ring_bottom_layer_limit met4 -set_to_set_distance 34.0 -spacing 4.8 -switch_layer_over_obs 0 -width 5.4 -area [get_db designs .core_bbox] -start [expr [lindex [lindex [get_db designs .core_bbox] 0] 1] + 7.5]
