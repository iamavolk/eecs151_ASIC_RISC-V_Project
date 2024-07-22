# --------------------------------------------------------------------------------
# This script was written and developed by HAMMER at UC Berkeley; however, the
# underlying commands and reports are copyrighted by Cadence. We thank Cadence for
# granting permission to share our research to help promote and foster the next
# generation of innovators.
# --------------------------------------------------------------------------------

create_floorplan -core_margins_by die -flip f -die_size_by_io_height max -site unithd -die_size { 1800 1800 0 0 0 0 }
# Floorplan automatically generated from HAMMER
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