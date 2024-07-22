# --------------------------------------------------------------------------------
# This script was written and developed by HAMMER at UC Berkeley; however, the
# underlying commands and reports are copyrighted by Cadence. We thank Cadence for
# granting permission to share our research to help promote and foster the next
# generation of innovators.
# --------------------------------------------------------------------------------

set_load 1.0 [all_outputs]
set_input_delay 3.6 -clock clk [get_port "mem*"]