quit -sim
.main clear

vlib ./lib/
vlib ./lib/work_a/
vlib ./lib/design/
vlib ./lib/altera_lib/

vmap base_space ./lib/work_a/
vmap design     ./lib/design/
vmap altera_lib ./lib/altera_lib/

vlog -work base_space ./tb_mealy.v
#vlog -work design ./../design/*.v
vlog -work design ./../design/*.vo

vlog -work altera_lib ./altera_lib/*.v

#-t 运行仿真的时间精度是ns
#-L 是链接库的关键字
vsim -t ns -sdfmax tb_mealy/tb_mealy_instance=mealy_v.sdo -voptargs=+acc -L altera_lib -L base_space -L design base_space.tb_mealy

virtual type {
{01 S1}
{02 S2}
{04 S3}
{08 S4}
{10 S5}
{20 S6}
} vir_new_signal

add wave -divider -height 100 {tb_mealy_1}
add wave tb_mealy/*
add wave -divider -height 120 {mealy}
add wave tb_mealy/tb_mealy_instance/*
#创建一个vir_new_signal类型的信号，也就是把Current_State进行类型转换
#virtual function {(vir_new_signal)/tb_mealy/tb_mealy_instance/Current_State} new_state
#add wave -color red tb_mealy/tb_mealy_instance/new_state

run 10us







