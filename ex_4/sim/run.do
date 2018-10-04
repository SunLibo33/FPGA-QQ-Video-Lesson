#此次是注释
quit -sim 
#退出当前的仿真工程，之后可以重新创建Other Project
.main clear 
#清空命令行里面的显示信息
vlib ./lib
vlib ./lib/work
vmap work ./lib/work 
#创建一个库到我们的物理目录路径中

vlog -work work  ./tb_ex_shift_reg.v
vlog -work work  ./../design/ex_shift_reg.v

#vlog -work work  ./../design/*.v
#Data Radix : -decimal , -hex , -unsigned


vsim -voptargs=+acc work.tb_ex_shift_reg

add wave -divider -height 20 {TestBench Signal Section}
add wave tb_ex_shift_reg/tb_lvds_d
add wave -hex -color blue tb_ex_shift_reg/tb_o_lvds_d
add wave -unsigned -color red tb_ex_shift_reg/i_30
add wave tb_ex_shift_reg/tb_lvds_clk
add wave tb_ex_shift_reg/tb_rst_n

add wave -divider -height 80 {RTL TOP  Level Signal Section}
add wave -hex -color blue tb_ex_shift_reg/ex_shift_reg_inst/o_lvds_d

add wave -hex -color blue tb_ex_shift_reg/ex_shift_reg_inst/shift_reg

add wave -hex -color blue -format Analog-Step -height 230 -signed tb_ex_shift_reg/ex_shift_reg_inst/shift_reg
add wave -hex -color blue -format Analog-Step -height 300 -unsigned tb_ex_shift_reg/ex_shift_reg_inst/shift_reg

add wave -unsigned -color red tb_ex_shift_reg/ex_shift_reg_inst/s_cnt
add wave -color orange tb_ex_shift_reg/ex_shift_reg_inst/s_flag
add wave -color orange tb_ex_shift_reg/ex_shift_reg_inst/s_flag_dly1
add wave -color orange tb_ex_shift_reg/ex_shift_reg_inst/s_flag_dly2

run 100us