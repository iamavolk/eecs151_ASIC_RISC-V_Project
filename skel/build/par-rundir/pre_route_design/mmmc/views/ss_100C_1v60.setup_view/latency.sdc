set_clock_latency -source -early -min -rise  -1.29421 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -min -fall  -1.29327 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -max -rise  -1.29421 [get_ports {clk}] -clock clk 
set_clock_latency -source -early -max -fall  -1.29327 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -min -rise  -1.29421 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -min -fall  -1.29327 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -rise  -1.29421 [get_ports {clk}] -clock clk 
set_clock_latency -source -late -max -fall  -1.29327 [get_ports {clk}] -clock clk 
