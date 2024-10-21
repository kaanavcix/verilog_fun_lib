
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder is
 Port ( 
 
 carry_i : in std_logic;
 a: : in std_logic;
 b : in std_logic;
 sum_o : out std_logic;
 carry_o : out std_logic;
 );
end full_adder;

architecture Behavioral of full_adder is


--Component declaration
component half_adder is
  Port ( 
  in_1 : in std_logic;
  in_2 : in std_logic;
  sum_o : out std_logic;
  carry_o: out std_logic;
  
  );
end component half_adder; 

--Signals
signal first_sum : std_logic := '0';
signal firs_carry: std_logic := '0';
signal second_carry: std_logic := '0';

begin

--Component Instantition

first_half_adder :half_adder
Port map(
a => a,
b => b,
sum_o => first_sum,
carry_o => firs_carry
);

second_half_adder :half_adder
Port map(
a => first_sum,
b => carry_i,
sum_o => sum_0,
carry_o => second_carry
);


carry_o  <= firs_carry or second_carry;

end Behavioral;
