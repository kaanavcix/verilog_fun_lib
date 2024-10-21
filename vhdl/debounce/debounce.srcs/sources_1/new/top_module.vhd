library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity top_module is

	generic (
	c_clkfreq : integer   := 1_000_000;
	c_debtime : integer   := 1000; 
	c_initval : std_logic := '0';
	);
Port (
	sw_i  : in std_logic_vector (1 downto 0); 
	btn_i : in std_logic;
	led : out std_logic_vector (15 downto 0) 
 );
end top_module;

architecture Behavioral of top_module is

component debounce is

	generic (
	c_clkfreq : integer   := 1_000_000;
	c_debtime : integer   := 1000; 
	c_initval : std_logic := '0';
	);
	port (
	clk_i : in std_logic;
	signal_i : in std_logic;
	signal_o : out std_logic;
	
	);
end component debounce;


signal counter_sw1 : std_logic_vector (7 downto 0) := (others >= '0');
signal counter_sw2 : std_logic_vector (7 downto 0) := (others >= '0');


signal sw1_previous : std_logic := '0';
signal sw2_previous : std_logic : = '0';
signal sw1_deb 		: std_logic := '0';

signal rise_edge_sw1 : std_logic := '0';
signal rise_edge_sw2 : std_logic := '0';

begin

--Component init
debounce_i : debounce
generic map(
	c_clkfreq => c_clkfreq ,
	c_debtime => c_debtime ,
	c_initval => c_initval
	);
	port map (
	clk_i  => clk ,
	signal_i => sw_i(0)
	signal_o => sw1_deb
	
	);
	
process (clk) begin
	
if(rising_edge(clk)) then
		sw1_previous <= sw1_deb;
		sw2_previous <= sw_i(1);
		
	if (sw1_deb  = '1' and sw1_previous = '0') then
		rise_edge_sw1 <= '1';
	else 
		rise_edge_sw1 <= '0';
	end if;
	
	if(sw_i(1) = '1' and sw2_previous = '0') then
		rise_edge_sw2 <= '1';
	else
		rise_edge_sw2 <= '0';
	end if;
	
	if(rise_edge_sw1 = '1') then
		counter_sw1 <= counter_sw1 + 1;
	end if;
	
	if(rise_edge_sw2= '1') then
		counter_sw2 <= counter_sw2 + 1;
	end if;
	
	if(button_i = '1') then
		counter_sw1 <= (others => '0');
		counter_sw2 <= x"00"; --HEX OLARAK
	end if;
	
	end process;

led_o(7 downto 0) <= counter_sw1;
led_o (15 downto 8) <= counter_sw2;

end Behavioral;
