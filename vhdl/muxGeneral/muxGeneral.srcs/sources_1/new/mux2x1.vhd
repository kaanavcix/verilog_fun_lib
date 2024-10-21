

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
  Port
  (
	a_i: in std_logic;
	b_i: in std_logic;
	s1_i: in std_logic;
	c_i: in std_logic;
	d_i: in std_logic;
	s2_i: in std_logic;
	e_i: in std_logic;
	f_i: in std_logic;
	s3_i: in std_logic;
	q1_o: out std_logic;
	q2_o: out std_logic;
	q3_o: out std_logic;
  );
end mux2x1;

architecture Behavioral of mux2x1 is


--Signal

signal firstNand : std_logic := '0';
signal secondNand : std_logic := '0';

begin

-- Gate Level Combinational design
firstNand <= not( a_i and s1_i );
secondNand <= not ((not s1_i)) and b_i);
q1_o <= not (firstNand and  secondNand);


--Concurnet Assignment Combinational Design

q2_o = c_i when s2_i = '1' else
		d_i;


-- Process Combinational Design

P_LABEL: process (s3_i,e_i,f_i) begin -- Hangi değerler tetiklendiğinde process olsun

	if(s3_i = '1')then
	q3_o <= e_i;
	else
		q3_o <=f_i;
	end if;


end process;
end Behavioral;
