quit -sim

.main clear

vlib work
vlog ./tb_ex_dds.v
vlog ./altera_lib/altera_mf.v
vlog ./../design/*.v

vlog ./../quartus_project/ipcore_dir/sp_ram_256x8.v

vsim -voptargs=+acc work.tb_ex_dds

add wave tb_ex_dds/ex_dds_instance/*

run 1000us