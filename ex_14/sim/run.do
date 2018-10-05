quit -sim
.main clear

vlib work
vlog ./../quartus_project/ipcore_dir/fir_lpf/

vcom ./../quartus_project/ipcore_dir/fir_lpf/auk_dspip_avalon_streaming_controller_hpfir.vhd
vcom ./../quartus_project/ipcore_dir/fir_lpf/
vcom ./../quartus_project/ipcore_dir/fir_lpf/
vcom ./../quartus_project/ipcore_dir/fir_lpf/