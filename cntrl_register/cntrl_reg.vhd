-------------------------------------------------------------------------------
-- Title         : Control bank register
-- Project       : Exercise
-------------------------------------------------------------------------------
-- File          : cntrl_reg.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2018-09-07
-- Last update   : 2018-09-08
-- Target Device : 
-- Standard      : VHDL'93/02
-------------------------------------------------------------------------------
-- Description   : 
-------------------------------------------------------------------------------
-- Copyright (c) 2018
-------------------------------------------------------------------------------
-- Revisions     :
-- Date        Version  Author  Description
-- 2018-09-08  1.0      Ordep   Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cntrl_reg is
	generic(
		N_INPUTS : natural := 16
	);
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
end entity cntrl_reg;
 
architecture cntrl_reg_rtl of cntrl_reg is
	
	signal reg_0_int : std_logic;
	signal a_data_int : std_logic_vector(N_INPUTS-1 downto 0);
	
begin
	
	decoder_inst1 : entity work.decoder
		port map (
				 addr_i   => wrt_addr_i, 
    	         enable_i => wrt_en_i,
    	         reg_0_o  => reg_0_int, 
		         reg_1_o  => open,
		         reg_2_o  => open,
		         reg_3_o  => open,
		         reg_4_o  => open,
		         reg_5_o  => open,
		         reg_6_o  => open,
		         reg_7_o  => open
	    );
   	
   	register_n_0_inst1 : entity work.register_n
        generic map (
      	            N_INPUTS => 16
        )
        port map (
    	         clk_enable_i  => reg_0_int,
		         sysclk        => sysclk,
		         syn_reset_n_i => reset_n,
		         data_i        => wrt_data_i,
		         data_o        => a_data_int 
        );
      
	process(sysclk, reset_n)
	
	begin
		
		if reset_n = '0' then
			a_data_o <= (others => '0');
			b_data_o <= (others => '0');
		elsif rising_edge(sysclk) then
			a_data_o <= a_data_int;
		end if;
	
	end process;
	
	
	
end architecture cntrl_reg_rtl;
