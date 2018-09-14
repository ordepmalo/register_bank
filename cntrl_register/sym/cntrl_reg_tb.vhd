-------------------------------------------------------------------------------
-- Title         : Decoder to register bank control (Testbench)
-- Project       : Register banck exercise
-------------------------------------------------------------------------------
-- File          : cntrl_reg_tb.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2018-09-10
-- Last update   : 2018-09-10
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : 
-------------------------------------------------------------------------------
-- Copyright (c) 2018
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2018-09-10  1.0      Ordep   Created
-------------------------------------------------------------------------------

-- Bibliotecas e clásulas
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------
entity testbench is
end entity testbench;
-------------------------------------

architecture stimulus of testbench is
	
	-- Declaracao de constantes
	--constant N_INPUTS : natural := 16;
	constant N_INPUTS : natural := 16;
    -- Decaclaração do componente
    component cntrl_reg is
	    port(
			sysclk  	: in std_logic;
			reset_n 	: in std_logic;
			a_rd_en_i	: in std_logic;
			a_addr_i    : in std_logic_vector(2 downto 0);
			b_rd_i  	: in std_logic;
			b_addr_i	: in std_logic_vector(2 downto 0);
			wrt_en_i	: in std_logic;
			wrt_addr_i  : in std_logic_vector(2 downto 0);
			wrt_data_i  : in std_logic_vector(N_INPUTS-1 downto 0);
			a_data_o	: out std_logic_vector(N_INPUTS-1 downto 0);
			b_data_o	: out std_logic_vector(N_INPUTS-1 downto 0)		
		);
	end component cntrl_reg;
	
	component decoder is
		port(
			addr_i   : in std_logic_vector(2 downto 0);
			enable_i : in std_logic;
			reg_0_o  : out std_logic;
			reg_1_o  : out std_logic;
			reg_2_o  : out std_logic;
			reg_3_o  : out std_logic;
			reg_4_o  : out std_logic;
			reg_5_o  : out std_logic;
			reg_6_o  : out std_logic;
			reg_7_o  : out std_logic
		);
	end component decoder;
	
	component register_n is
		port(
			sysclk 		  : in std_logic;
			clk_enable_i  : in std_logic;
			syn_reset_n_i : in std_logic;
			data_i		  : in std_logic_vector(N_INPUTS-1 downto 0);
			data_o		  : out std_logic_vector(N_INPUTS-1 downto 0)
		);
	end component register_n;
	
    -- declaração de sinais
    signal sysclk 	  : std_logic := '0';
	signal reset_n    : std_logic := '0';
	signal a_rd_en_i  : std_logic := '0';
	signal a_addr_i	  : std_logic_vector(2 downto 0) := "000";
	signal b_rd_i	  : std_logic := '0';
	signal b_addr_i	  : std_logic_vector(2 downto 0) := "000";
	signal wrt_en_i	  : std_logic := '0';
	signal wrt_addr_i : std_logic_vector(2 downto 0) := "000";
    signal wrt_data_i : std_logic_vector(N_INPUTS-1 downto 0) := "0000000000000000";
	signal a_data_o	  : std_logic_vector(N_INPUTS-1 downto 0) := "0000000000000000";
	signal b_data_o	  : std_logic_vector(N_INPUTS-1 downto 0) := "0000000000000000";
	
	--signal addr_i     : std_logic_vector(2 downto 0) := "000";
	--signal enable_i   : std_logic := '0';
    --signal reg_0_o    : std_logic;
    --signal reg_1_o    : std_logic;
    --signal reg_2_o    : std_logic;
    --signal reg_3_o    : std_logic;
    --signal reg_4_o    : std_logic;
    --signal reg_5_o    : std_logic;
	--signal reg_6_o    : std_logic;
	--signal reg_7_o    : std_logic;
	
	
begin  -- inicio do corpo da arquitetura

    -- Instância de divisor_clock com nome dut, pode haver 
    -- quantas mais do que uma
    dut: cntrl_reg 
    	port map (
    		sysclk     => sysclk,
    		reset_n    => reset_n,
    		a_rd_en_i  => a_rd_en_i,
        	a_addr_i   => a_addr_i,
        	b_rd_i     => b_rd_i,
        	b_addr_i   => b_addr_i,
        	wrt_en_i   => wrt_en_i,
        	wrt_addr_i => wrt_addr_i,
            wrt_data_i => wrt_data_i,
        	a_data_o   => a_data_o,
        	b_data_o   => b_data_o
	   );
	   
	--  dut_2: decoder 
    --	port map (
 	--		addr_i     => addr_i,    
	--		enable_i   => enable_i,
    --		reg_0_o    => reg_0_o, 
    --		reg_1_o    => reg_1_o,
    --		reg_2_o    => reg_2_o,
    --	    reg_3_o    => reg_3_o,
    --		reg_4_o    => reg_4_o,
    --		reg_5_o    => reg_5_o,
	--		reg_6_o    => reg_6_o,
	--		reg_7_o    => reg_7_o
	--   );
	-- clock generation
  	sysclk <= not sysclk after 5 ns;
  	
  	-- reset generation
  	reset_proc: process
 	begin
    	reset_n <= '0';
    	wait for 10 ns; 
    	reset_n <= '1';
    	wait;
  	end process reset_proc;
  	
    -- Stimulus generation
  	stimulus_proc : process
  	begin
    	-- Add stimulus here
		wrt_data_i <= "0000000000000001";
		wait for 10 ns;
		wrt_en_i <= '1';
		wait for 10 ns;
		wrt_data_i <= "0000000000000011";
		wait for 10 ns;
		
    	wait;
  	end process stimulus_proc;

END ARCHITECTURE stimulus;