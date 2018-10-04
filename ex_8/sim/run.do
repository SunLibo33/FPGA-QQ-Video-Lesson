quit -sim
.main clear

vlib work
vmap work work

vlog ./tb_parall_interf.v
vlog ./../design/parall_interf.v

vsim -voptargs=+acc work.tb_parall_interf

add wave -divider {tb}
add wave /tb_parall_interf/parall_interf_instance/*
add wave /tb_parall_interf/*
run 8us
