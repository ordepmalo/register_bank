-------------------------------------------------------------------------------
-- Title         : Decoder to register bank control
-- Project       : Register banck exercise
-------------------------------------------------------------------------------
-- File          : decoder.vhd
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder is
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
end entity decoder;

architecture decoder_rtl of decoder is
	
begin
	
	process(addr_i,enable_i)
	
	begin
		if enable_i = '1' then
			case addr_i is
				when "000" =>
					reg_0_o <= '1';
					reg_1_o <= '0';
					reg_2_o <= '0';
					reg_3_o <= '0';
					reg_4_o <= '0';
					reg_5_o <= '0';
					reg_6_o <= '0';
					reg_7_o <= '0';
				when "001" =>
					reg_0_o <= '0';
					reg_1_o <= '1';
					reg_2_o <= '0';
					reg_3_o <= '0';
					reg_4_o <= '0';
					reg_5_o <= '0';
					reg_6_o <= '0';
					reg_7_o <= '0';
				when "010" =>
					reg_0_o <= '0';
					reg_1_o <= '0';
					reg_2_o <= '1';
					reg_3_o <= '0';
					reg_4_o <= '0';
					reg_5_o <= '0';
					reg_6_o <= '0';
					reg_7_o <= '0';
				when "011" =>
					reg_0_o <= '0';
					reg_1_o <= '0';
					reg_2_o <= '0';
					reg_3_o <= '1';
					reg_4_o <= '0';
					reg_5_o <= '0';
					reg_6_o <= '0';
					reg_7_o <= '0';
				when "100" =>
					reg_0_o <= '0';
					reg_1_o <= '0';
					reg_2_o <= '0';
					reg_3_o <= '0';
					reg_4_o <= '1';
					reg_5_o <= '0';
					reg_6_o <= '0';
					reg_7_o <= '0';
				when "101" =>
					reg_0_o <= '0';
					reg_1_o <= '0';
					reg_2_o <= '0';
					reg_3_o <= '0';
					reg_4_o <= '0';
					reg_5_o <= '1';
					reg_6_o <= '0';
					reg_7_o <= '0';
				when "110" =>
					reg_0_o <= '0';
					reg_1_o <= '0';
					reg_2_o <= '0';
					reg_3_o <= '0';
					reg_4_o <= '0';
					reg_5_o <= '0';
					reg_6_o <= '1';
					reg_7_o <= '0';
				when "111" =>
					reg_0_o <= '0';
					reg_1_o <= '0';
					reg_2_o <= '0';
					reg_3_o <= '0';
					reg_4_o <= '0';
					reg_5_o <= '0';
					reg_6_o <= '0';
					reg_7_o <= '1';
				when others =>
					reg_0_o <= '0';
					reg_1_o <= '0';
					reg_2_o <= '0';
					reg_3_o <= '0';
					reg_4_o <= '0';
					reg_5_o <= '0';
					reg_6_o <= '0';
					reg_7_o <= '0';
			end case;
		else
			reg_0_o <= '0';
			reg_1_o <= '0';
			reg_2_o <= '0';
			reg_3_o <= '0';
			reg_4_o <= '0';
			reg_5_o <= '0';
			reg_6_o <= '0';
			reg_7_o <= '0';
		end if;
	end process;
end architecture decoder_rtl;
