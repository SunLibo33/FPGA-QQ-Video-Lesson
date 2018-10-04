quit -sim

.main clear

vlib work
vlog ./tb_ex_mult.v
vlog ./../design/*.v
vlog ./../altera_project/ip_core/mult_16x16_l1.v
vlog ./../altera_project/ipcore_dir/divier_16d8_l3.v
vlog ./../altera_project/ip_core/220model.v

vsim -voptargs=+acc work.tb_ex_mult

add wave tb_ex_mult/ex_mult_instance/*

run 10us