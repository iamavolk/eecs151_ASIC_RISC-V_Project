HAMMER_EXEC ?= /home/aa/users/cs199-aly/venv_151/bin/hammer-vlsi
HAMMER_DEPENDENCIES ?= /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sky130.yml /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sram_generator-output.json /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/syn.yml /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/par.yml /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-rtl.yml /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-syn.yml /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-par.yml /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/Cache.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/Memory151.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/Riscv151.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/riscv_arbiter.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/riscv_top.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/no_cache_mem.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/ExtMemModel.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/mux2.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/mux3.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/mux4.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/EECS151.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/BranchComp.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/ImmGen.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/ALU.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/ForwardingUnit.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/InstrKillID.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/RegFile.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/JALTargetID.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/ControlDec.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/PCSelect.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/MemLoadMask.v /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/src/StoreMask.v


####################################################################################
## Global steps
####################################################################################
.PHONY: pcb
pcb: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/pcb-rundir/pcb-output-full.json

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/pcb-rundir/pcb-output-full.json: $(HAMMER_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sky130.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sram_generator-output.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/par.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-rtl.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-par.yml --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build pcb


####################################################################################
## Steps for riscv_top
####################################################################################
.PHONY: sim-rtl syn syn-to-sim sim-syn syn-to-par par par-to-sim sim-par sim-par-to-power par-to-power power-par power-rtl sim-rtl-to-power sim-syn-to-power syn-to-power power-syn par-to-drc drc par-to-lvs lvs syn-to-formal formal-syn par-to-formal formal-par syn-to-timing timing-syn par-to-timing timing-par

sim-rtl          : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-rtl-rundir/sim-output-full.json
syn              : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json

syn-to-sim       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-input.json
sim-syn          : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-rundir/sim-output-full.json

syn-to-par       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-input.json
par              : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json

par-to-sim       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-input.json
sim-par          : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-rundir/sim-output-full.json

sim-par-to-power : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-par-input.json
par-to-power     : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-input.json
power-par        : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-rundir/power-output-full.json

sim-rtl-to-power : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-rtl-input.json
power-rtl        : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-rtl-rundir/power-output-full.json

sim-syn-to-power : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-syn-input.json
syn-to-power     : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-input.json
power-syn        : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-rundir/power-output-full.json

par-to-drc       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-input.json
drc              : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-rundir/drc-output-full.json

par-to-lvs       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-input.json
lvs              : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-rundir/lvs-output-full.json

syn-to-formal    : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-input.json
formal-syn       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-rundir/formal-output-full.json

par-to-formal    : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-input.json
formal-par       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-rundir/formal-output-full.json

syn-to-timing    : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-input.json
timing-syn       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-rundir/timing-output-full.json

par-to-timing    : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-input.json
timing-par       : /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-rundir/timing-output-full.json



/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-rtl-rundir/sim-output-full.json: $(HAMMER_DEPENDENCIES) $(HAMMER_SIM_RTL_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sky130.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sram_generator-output.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/par.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-rtl.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-par.yml $(HAMMER_EXTRA_ARGS) --sim_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-rtl-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-rtl-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-rtl-rundir/sim-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-rtl-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-rtl-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim-to-power

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-rtl-rundir/power-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-rtl-input.json $(HAMMER_POWER_RTL_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-rtl-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-rtl-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build power

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json: $(HAMMER_DEPENDENCIES) $(HAMMER_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sky130.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sram_generator-output.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/par.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-rtl.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-par.yml $(HAMMER_EXTRA_ARGS) --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-sim

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-rundir/sim-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-input.json $(HAMMER_SIM_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-input.json $(HAMMER_EXTRA_ARGS) --sim_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-syn-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-rundir/sim-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim-to-power

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-power

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-rundir/power-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-syn-input.json /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-input.json $(HAMMER_POWER_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-syn-input.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build power

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-par

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-input.json $(HAMMER_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-sim

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-rundir/sim-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-input.json $(HAMMER_SIM_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-input.json $(HAMMER_EXTRA_ARGS) --sim_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-par-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-rundir/sim-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim-to-power

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-power

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-rundir/power-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-par-input.json /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-input.json $(HAMMER_POWER_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-par-input.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build power

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-drc

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-rundir/drc-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-input.json $(HAMMER_DRC_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build drc

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-lvs

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-rundir/lvs-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-input.json $(HAMMER_LVS_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build lvs

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-formal

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-rundir/formal-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-input.json $(HAMMER_FORMAL_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build formal

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-formal

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-rundir/formal-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-input.json $(HAMMER_FORMAL_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build formal

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-timing

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-rundir/timing-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-input.json $(HAMMER_TIMING_SYN_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build timing

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-input.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-timing

/scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-rundir/timing-output-full.json: /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-input.json $(HAMMER_TIMING_PAR_DEPENDENCIES)
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build timing

# Redo steps
# These intentionally break the dependency graph, but allow the flexibility to rerun a step after changing a config.
# Hammer doesn't know what settings impact synthesis only, e.g., so these are for power-users who "know better."
# The HAMMER_EXTRA_ARGS variable allows patching in of new configurations with -p or using --to_step or --from_step, for example.
.PHONY: redo-sim-rtl redo-sim-rtl-to-power redo-syn redo-syn-to-sim redo-syn-to-power redo-sim-syn redo-sim-syn-to-power redo-syn-to-par redo-par redo-par-to-sim redo-sim-par redo-sim-par-to-power redo-par-to-power redo-power-par redo-par-to-drc redo-drc redo-par-to-lvs redo-lvs redo-syn-to-formal redo-formal-syn redo-par-to-formal redo-formal-par redo-syn-to-timing redo-timing-syn redo-par-to-timing redo-timing-par

redo-sim-rtl:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sky130.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sram_generator-output.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/par.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-rtl.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-par.yml $(HAMMER_EXTRA_ARGS) --sim_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-rtl-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim

redo-sim-rtl-to-power:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-rtl-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-rtl-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim-to-power

redo-power-rtl:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-rtl-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-rtl-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build power

redo-syn:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sky130.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sram_generator-output.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/par.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-rtl.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-syn.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/sim-gl-par.yml $(HAMMER_EXTRA_ARGS) --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn

redo-syn-to-sim:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-sim

redo-syn-to-power:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-power

redo-sim-syn:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-input.json $(HAMMER_EXTRA_ARGS) --sim_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim

redo-sim-syn-to-power:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-syn-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim-to-power

redo-syn-to-par:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-par

redo-power-syn:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-syn-input.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-syn-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build power

redo-par:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par

redo-par-to-sim:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-sim

redo-sim-par:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-input.json $(HAMMER_EXTRA_ARGS) --sim_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim

redo-sim-par-to-power:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/sim-par-rundir/sim-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build sim-to-power

redo-par-to-power:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-power

redo-power-par:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-sim-par-input.json -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-input.json $(HAMMER_EXTRA_ARGS) --power_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/power-par-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build power

redo-par-to-drc:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-drc

redo-drc:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/drc-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build drc

redo-par-to-lvs:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-lvs

redo-lvs:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/lvs-input.json $(HAMMER_EXTRA_ARGS) --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build lvs

redo-syn-to-formal:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-formal

redo-formal-syn:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-syn-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build formal

redo-par-to-formal:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-formal

redo-formal-par:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-input.json $(HAMMER_EXTRA_ARGS) --formal_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/formal-par-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build formal

redo-syn-to-timing:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/syn-rundir/syn-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build syn-to-timing

redo-timing-syn:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-syn-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build timing

redo-par-to-timing:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/par-rundir/par-output-full.json $(HAMMER_EXTRA_ARGS) -o /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-input.json --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build par-to-timing

redo-timing-par:
	$(HAMMER_EXEC) -e /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/inst-env.yml -p /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-input.json $(HAMMER_EXTRA_ARGS) --timing_rundir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build/timing-par-rundir --obj_dir /scratch/cs199-aly/eecs151_ASIC_RISC-V_Project/skel/build timing

