quit -sim
.main clear

vlib work 

vlog ./tb_ex_ipcore.v
vlog ./altera_lib/*.v

vlog ./../design/*.v
vlog ./../quartus_project/ipcore_dir/pll1.v
vlog ./../quartus_project/ipcore_dir/rom_8x256.v

vsim -voptargs=+acc work.tb_ex_ipcore


add wave tb_ex_ipcore/ex_ipcore_instance/*
add wave -hex tb_ex_ipcore/ex_ipcore_instance/odata

run 10us