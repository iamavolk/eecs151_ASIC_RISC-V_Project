# --------------------------------------------------------------------------------
# This script was written and developed by HAMMER at UC Berkeley; however, the
# underlying commands and reports are copyrighted by Cadence. We thank Cadence for
# granting permission to share our research to help promote and foster the next
# generation of innovators.
# --------------------------------------------------------------------------------

create_clock clk -name clk -period 18.0
set_clock_uncertainty 0.1 [get_clocks clk]
set_clock_groups -asynchronous  -group { clk }

