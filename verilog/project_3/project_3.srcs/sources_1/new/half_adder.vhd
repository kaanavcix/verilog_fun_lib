
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity half_adder is
  Port ( 
  a : in std_logic;
  b : in std_logic;
  sum_o : out std_logic;
  carry_o: out std_logic;
  
  );
end half_adder;

architecture Behavioral of half_adder is

begin

sum_o <= a xor b;
carry_o <= a and b;

end Behavioral;
