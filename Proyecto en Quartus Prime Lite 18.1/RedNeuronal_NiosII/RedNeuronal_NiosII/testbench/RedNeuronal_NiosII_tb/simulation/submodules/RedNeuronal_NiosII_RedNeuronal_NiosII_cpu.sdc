# Legal Notice: (C)2024 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu:*
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_nios2_oci:the_RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_nios2_oci
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_break 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_nios2_oci_break:the_RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_nios2_oci_break
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_ocimem 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_nios2_ocimem:the_RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_nios2_ocimem
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_debug 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_nios2_oci_debug:the_RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_nios2_oci_debug
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_wrapper 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_debug_slave_wrapper:the_RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_debug_slave_wrapper
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_tck 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_debug_slave_tck:the_RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_debug_slave_tck
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sysclk 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_debug_slave_sysclk:the_RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_debug_slave_sysclk
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_path 	 [format "%s|%s" $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci]
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_break_path 	 [format "%s|%s" $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_path $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_break]
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_ocimem_path 	 [format "%s|%s" $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_path $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_ocimem]
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_debug_path 	 [format "%s|%s" $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_path $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_debug]
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_tck_path 	 [format "%s|%s|%s" $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_path $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_wrapper $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_tck]
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sysclk_path 	 [format "%s|%s|%s" $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_path $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_wrapper $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sysclk]
set 	RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sr 	 [format "%s|*sr" $RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_break_path|break_readreg*] -to [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sr*]
set_false_path -from [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_debug_path|*resetlatch]     -to [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sr[33]]
set_false_path -from [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_debug_path|monitor_ready]  -to [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sr[0]]
set_false_path -from [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_debug_path|monitor_error]  -to [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sr[34]]
set_false_path -from [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_ocimem_path|*MonDReg*] -to [get_keepers *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sr*]
set_false_path -from *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sr*    -to *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$RedNeuronal_NiosII_RedNeuronal_NiosII_cpu_oci_debug_path|monitor_go
