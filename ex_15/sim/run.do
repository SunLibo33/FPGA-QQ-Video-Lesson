quit -sim

.main clear

vlib work
vlog ./tb_cic_top.v
vlog ./altera_lib/altera_mf.v
vlog ./altera_lib/220model.v
vlog ./../design/*.v

vlog ./../quartus_project/ipcore_dir/*.v

vsim -voptargs=+acc work.tb_cic_top

add wave tb_cic_top/cic_top_instance/*
add wave tb_cic_top/cic_top_instance/cic_interpolate_instance/s_flag
add wave tb_cic_top/cic_top_instance/cic_interpolate_instance/s_flag_i

run 200us