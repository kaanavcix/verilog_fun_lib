----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2024 12:59:32 AM
-- Design Name: 
-- Module Name: andgate - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity andgate is
 Port ( 
 s0_i : in std_logic_vector (7 downto 0);
 s1_i : in std_logic_vector (7 downto 0);
 s_o  : out std_logic
 
 );
end andgate;

architecture Behavioral of andgate is

--signal s0 :  unsigned (7 downto 0)  := x"00";
signal s0  :std_logic_vector (7 downto 0) := x"00";

begin

s0 <= s0_i + s1_i;


process (s0) begin

	if(s0>20)then
	 s_o <= '1';
	 else
	 s_o <= '0';
	 end if;

end process;

end Behavioral;
