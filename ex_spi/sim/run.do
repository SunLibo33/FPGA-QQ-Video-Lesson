quit -sim
.main clear

vlib work
vmap work work

vlog ./tb_ex_spi.v 
vlog ./../design/spi_ctrl.v 
vlog ./../quartus_project/ram_16x32_sr.v
vlog ./altera_lib/*.v

vsim -voptargs=+acc work.tb_ex_spi

add wave tb_ex_spi/spi_ctrl_instance/*
add wave tb_ex_spi/rec_spi/*



run 1000us