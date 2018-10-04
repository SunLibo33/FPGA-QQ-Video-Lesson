quit -sim
.main clear
vlib work

vlog ./tb_ex_ise_fifo.v
vlog ./../design/ex_ise_fifo.v
vlog ./../ise_project/ipcore_dir/*.v
vlog ./ise_lib/*.v

vsim -voptargs=+acc work.tb_ex_ise_fifo work.glbl

add wave tb_ex_ise_fifo/ex_ise_fifo_instance/*

run 12us