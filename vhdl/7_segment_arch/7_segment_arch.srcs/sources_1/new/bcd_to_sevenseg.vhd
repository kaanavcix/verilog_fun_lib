
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity bcd_to_sevenseg is

Port (
	bcd_i : in std_logic_vector  (3 downto 0);
	seg_o : out std_logic_vector (7 downto 0)
 );
end bcd_to_sevenseg;

architecture Behavioral of bcd_to_sevenseg is



begin


process (bcd_i) begin

case bcd_i is

	when "0000" => 
		seg_o <= "00000011";
	when "0001" => 
		seg_o <= "00000011";
	when "0010" => 
		seg_o <= "00000011";
	when "0011" => 
		seg_o <= "00000011";
	when "0100" =>  -- 3210    
		seg_o <= "00000011";
		
	when others => 
		seg_o <= "11111111";
	
end case;

end process;


end Behavioral;
