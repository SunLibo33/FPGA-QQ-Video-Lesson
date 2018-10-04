quit -sim

.main clear
vlib work

vlog ./tb_ex_fifo.v
vlog ./../design/*.v
vlog ./../quartus_project/ipcore_dir/dp_ram_256x8_swsr.v
vlog ./altera_lib/*.v

vsim -voptargs=+acc work.tb_ex_fifo

add wave tb_ex_fifo/ex_fifo_instance/*
add wave tb_ex_fifo/ex_fifo_instance/w_ctrl_instance/*

run 30us