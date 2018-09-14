# ============================================================================
# Name        : decoder_tb.do
# Author      : Pedro Bastos
# Version     : 1
# Copyright   : Pedro, Departamento de Eletrônica, Florianópolis, IFSC
# Description : 
# ============================================================================


#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivo. Ordem é importante
vcom decoder.vhd decoder_tb.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
vsim -t ns work.testbench

#Mosta forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix binary  /dut/addr_i
add wave -radix binary  /dut/enable_i
add wave -radix binary  /dut/reg_0_o
add wave -radix binary  /dut/reg_1_o
add wave -radix binary  /dut/reg_2_o
add wave -radix binary  /dut/reg_3_o
add wave -radix binary  /dut/reg_4_o
add wave -radix binary  /dut/reg_5_o
add wave -radix binary  /dut/reg_6_o
add wave -radix binary  /dut/reg_7_o

#Como mostrar sinais internos do processo

#Simula até um 500ns
run 150ns

wave zoomfull
write wave wave.ps
