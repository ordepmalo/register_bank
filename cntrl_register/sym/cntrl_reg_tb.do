# ============================================================================
# Name        : cntrl_reg_tb.do
# Author      : Pedro Bastos
# Version     : 1
# Copyright   : Pedro, Departamento de Eletrônica, Florianópolis, IFSC
# Description : 
# ============================================================================


#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom decoder.vhd
vcom register_n.vhd
vcom cntrl_reg.vhd cntrl_reg_tb.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
--radix: binary, hex, dec
--label: nome da forma de onda
add wave -radix binary  /dut/sysclk
add wave -radix binary  /dut/reset_n
add wave -radix binary  /dut/reg_0_int
add wave -radix binary  /dut/wrt_en_i
add wave -radix binary  /dut/wrt_addr_i
add wave -radix binary  /dut/wrt_data_i
add wave -radix binary  /dut/a_data_o

#Como mostrar sinais internos do processo

#Simula até um 500ns
run 150ns

wave zoomfull
write wave wave.ps
