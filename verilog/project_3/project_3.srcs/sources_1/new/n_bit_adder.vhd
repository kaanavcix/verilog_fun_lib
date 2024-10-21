

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity n_bit_adder is
generic(
 N : integer  := 4; -- JUST GENERIC TYPE
);
 Port (

	a : in std_logic_vector (N - 1 downto 0);
	b : in std_logic_vector (N - 1 downto 1);
	carry_i : in std_logic;
	sum_o : out std_logic_vector (N - 1 downto 0);
	carry_o : out std_logic ;
 );
end n_bit_adder;

architecture Behavioral of n_bit_adder is

component full_adder is
 Port ( 
 
 carry_i : in std_logic;
 in1_i : in std_logic;
 in2_i : in std_logic;
 sum_o : out std_logic;
 carry_o : out std_logic;
 );
end component full_adder;

signal temp : std_logic_vector (N downto 0) := (others => '0');
begin

temp(0) <= carry_i;
carry_o <= temp(N);

FULL_ADDR_GEN: for k in 0 to N - 1 generate

	full_adder_k:full_adder 
	Port map 
	( 
	 in1_i = a(k),
	 in2_i = b(k),
	 carry_i = temp(k),
	 sum_o = sum_o(k),
	 carry_o = temp(k + 1)
	);
end generate; 

end Behavioral;
