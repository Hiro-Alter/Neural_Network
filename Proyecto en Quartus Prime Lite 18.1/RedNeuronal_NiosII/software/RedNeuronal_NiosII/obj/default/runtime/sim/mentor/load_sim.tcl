# ------------------------------------------------------------------------------
# Top Level Simulation Script to source msim_setup.tcl
# ------------------------------------------------------------------------------
set QSYS_SIMDIR obj/default/runtime/sim
source msim_setup.tcl
# Copy generated memory initialization hex and dat file(s) to current directory
file copy -force C:/Users/braya/Desktop/RedNeuronal_NiosII/software/RedNeuronal_NiosII/mem_init/hdl_sim/RedNeuronal_NiosII_sram.dat ./ 
file copy -force C:/Users/braya/Desktop/RedNeuronal_NiosII/software/RedNeuronal_NiosII/mem_init/RedNeuronal_NiosII_sram.hex ./ 
