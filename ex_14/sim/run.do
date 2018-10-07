quit -sim
.main clear
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries/     
ensure_lib      ./libraries/work/
vmap       work     ./libraries/work/
vmap       work_lib ./libraries/work/
if  ![ string match "*ModelSim ALTERA*" [ vsim -version ] ]  {
  ensure_lib                  ./libraries/altera_ver/      
  vmap       altera_ver       ./libraries/altera_ver/      
  ensure_lib                  ./libraries/lpm_ver/         
  vmap       lpm_ver          ./libraries/lpm_ver/         
  ensure_lib                  ./libraries/sgate_ver/       
  vmap       sgate_ver        ./libraries/sgate_ver/       
  ensure_lib                  ./libraries/altera_mf_ver/   
  vmap       altera_mf_ver    ./libraries/altera_mf_ver/   
  ensure_lib                  ./libraries/altera_lnsim_ver/
  vmap       altera_lnsim_ver ./libraries/altera_lnsim_ver/
  ensure_lib                  ./libraries/cycloneive_ver/  
  vmap       cycloneive_ver   ./libraries/cycloneive_ver/  
  ensure_lib                  ./libraries/altera/          
  vmap       altera           ./libraries/altera/          
  ensure_lib                  ./libraries/lpm/             
  vmap       lpm              ./libraries/lpm/             
  ensure_lib                  ./libraries/sgate/           
  vmap       sgate            ./libraries/sgate/           
  ensure_lib                  ./libraries/altera_mf/       
  vmap       altera_mf        ./libraries/altera_mf/       
  ensure_lib                  ./libraries/altera_lnsim/    
  vmap       altera_lnsim     ./libraries/altera_lnsim/    
  ensure_lib                  ./libraries/cycloneive/      
  vmap       cycloneive       ./libraries/cycloneive/      
}

  if  ![ string match "*ModelSim ALTERA*" [ vsim -version ] ]  {
    vlog     "C:/altera/14.1/quartus/eda/sim_lib/altera_primitives.v"              -work altera_ver      
    vlog     "C:/altera/14.1/quartus/eda/sim_lib/220model.v"                       -work lpm_ver         
    vlog     "C:/altera/14.1/quartus/eda/sim_lib/sgate.v"                          -work sgate_ver       
    vlog     "C:/altera/14.1/quartus/eda/sim_lib/altera_mf.v"                      -work altera_mf_ver   
    vlog -sv "C:/altera/14.1/quartus/eda/sim_lib/mentor/altera_lnsim_for_vhdl.sv"  -work altera_lnsim_ver  	
    vlog     "C:/altera/14.1/quartus/eda/sim_lib/cycloneive_atoms.v"               -work cycloneive_ver  
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/altera_syn_attributes.vhd"        -work altera          
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/altera_standard_functions.vhd"    -work altera          
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/alt_dspbuilder_package.vhd"       -work altera          
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/altera_europa_support_lib.vhd"    -work altera          
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/altera_primitives_components.vhd" -work altera          
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/altera_primitives.vhd"            -work altera          
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/220pack.vhd"                      -work lpm             
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/220model.vhd"                     -work lpm             
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/sgate_pack.vhd"                   -work sgate           
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/sgate.vhd"                        -work sgate           
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/altera_mf_components.vhd"         -work altera_mf       
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/altera_mf.vhd"                    -work altera_mf       
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/altera_lnsim_components.vhd"      -work altera_lnsim    
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/cycloneive_atoms.vhd"             -work cycloneive      
    vcom     "C:/altera/14.1/quartus/eda/sim_lib/cycloneive_components.vhd"        -work cycloneive      
  }
  
vlog ./../quartus_project/ipcore_dir/*.v
vlog ./../quartus_project/ipcore_dir/fir_lpf/*.v
#vcom ./../quartus_project/ipcore_dir/fir_lpf/*.vhd 
#replaced by the following vlog and vcom tcl command
vlog "./../quartus_project/ipcore_dir/fir_lpf/altera_avalon_sc_fifo.v"                        
vcom "./../quartus_project/ipcore_dir/fir_lpf/auk_dspip_math_pkg_hpfir.vhd"                   
vcom "./../quartus_project/ipcore_dir/fir_lpf/auk_dspip_lib_pkg_hpfir.vhd"                    
vcom "./../quartus_project/ipcore_dir/fir_lpf/auk_dspip_avalon_streaming_controller_hpfir.vhd"
vcom "./../quartus_project/ipcore_dir/fir_lpf/auk_dspip_avalon_streaming_sink_hpfir.vhd"      
vcom "./../quartus_project/ipcore_dir/fir_lpf/auk_dspip_avalon_streaming_source_hpfir.vhd"    
vcom "./../quartus_project/ipcore_dir/fir_lpf/auk_dspip_roundsat_hpfir.vhd"  


vcom "./../quartus_project/ipcore_dir/fir_lpf/fir_lpf_0002_rtl.vhd"
vcom "./../quartus_project/ipcore_dir/fir_lpf/fir_lpf_0002_ast.vhd"
vcom "./../quartus_project/ipcore_dir/fir_lpf/fir_lpf_0002.vhd"

vlog ./../design/*.v
vlog ./tb_ex_fir_lpf.v

vsim -voptargs=+acc -L work -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive  work.tb_ex_fir_lpf

add wave -format analog -height 200 -max 127 -min -128 tb_ex_fir_lpf/top_fir_lpf_instance/o_wave
add wave -format analog -height 200 -max 548575 -min -548576 tb_ex_fir_lpf/top_fir_lpf_instance/lpf_wave

run 10ms