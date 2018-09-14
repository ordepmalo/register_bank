-------------------------------------------------------------------------------
-- Title         : Decoder to register bank control (Testbench)
-- Project       : Register banck exercise
-------------------------------------------------------------------------------
-- File          : decoder_tb.vhd
-- Author        : Pedro Messias Jose da Cunha Bastos
-- Company       : 
-- Created       : 2018-09-08
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
    -- Decaclaração do componente
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

    -- declaração de sinais
    signal addr_i 	 : std_logic_vector(2 downto 0);
	signal enable_i  : std_logic := '0';
	signal reg_0_o	 : std_logic := '0';
	signal reg_1_o	 : std_logic := '0';
	signal reg_2_o	 : std_logic := '0';
	signal reg_3_o	 : std_logic := '0';
	signal reg_4_o	 : std_logic := '0';
	signal reg_5_o	 : std_logic := '0';
    signal reg_6_o	 : std_logic := '0';
	signal reg_7_o	 : std_logic := '0';
	
begin  -- inicio do corpo da arquitetura

    -- Instância de divisor_clock com nome dut, pode haver 
    -- quantas mais do que uma
    dut: decoder 
    	port map (
    		addr_i => addr_i,
    		enable_i => enable_i,
    		reg_0_o  => reg_0_o,
        	reg_1_o  => reg_1_o,
        	reg_2_o  => reg_2_o,
        	reg_3_o  => reg_3_o,
        	reg_4_o  => reg_4_o,
        	reg_5_o  => reg_5_o,
            reg_6_o  => reg_6_o,
        	reg_7_o  => reg_7_o
	   );
	-- clock generation
  	--sysclk <= not sysclk after 5 ns;
  	
  	-- reset generation
  	--reset_proc: process
 	--begin
    	--reset_n <= '0';
    	--wait for 20 ns; 
    	--reset_n <= '1';
    	--wait for 50 ns;
    	--reset_n <= '0';
    	--wait for 10 ns;
    	--reset_n <= '1';
    	--wait;
  	--end process reset_proc;
  	
    -- Stimulus generation
  	stimulus_proc : process
  	begin
    	-- Add stimulus here
		addr_i <= "000";
		wait for 10 ns;
		enable_i <= '1';
		wait for 10 ns;
		addr_i <= "001";
		wait for 10 ns;
		addr_i <= "010";
		wait for 10 ns;
		addr_i <= "011";
		enable_i <= '0';
		wait for 10 ns;
		addr_i <= "100";
		wait for 10 ns;
		addr_i <= "101";
		enable_i <= '1';
		wait for 10 ns;
		addr_i <= "110";
		wait for 10 ns;
		addr_i <= "111";
    	wait;
  	end process stimulus_proc;

END ARCHITECTURE stimulus;