quit -sim
.main clear

vlib work 

vlog ./../design/SPI.v
vlog ./TB_SPI.v

vsim -voptargs=+acc work.TB_SPI

add wave TB_SPI/SPI_Instance/*

run 10us