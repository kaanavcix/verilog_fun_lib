
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity seq_btn is

generic
(
 c_clk_freq: integer := 100_000_000
);
port 
(
clk: in std_logic;
sw : in std_logic_vector (1 downto 0);
counter : out std_logic_vector (7 downto 0)
 );
end seq_btn;

architecture Behavioral of seq_btn is

constant c_timer2seclim  : integer  := c_clk_freq * 2;
constant c_timer1seclim  : integer  := c_clk_freq ;
constant c_timer500mslim  : integer  := c_clk_freq / 2;
constant c_timer250mslim  : integer  := c_clk_freq / 2;

signal timer : integer range 0 to c_timer2seclim := 0;
signal timerlim : integer range to c_timer2seclim := 0;
signal counter_int : std_logic_vector (7 downto 0)  := (others => '0');

begin

timerlim <= c_timer2seclim when sw = "00" else
			c_timer1seclim when sw = "01" else
			c_timer500mslim when sw = "10" else
			c_timer250mslim;
			
			

process (clk) begin

if(rising_edge(clk)) begin
	
	if(timer >= timerlim - 1) then
	counter_int <= counter_int + 1; --Atama böyle yapılıyor
	
	end if;
end if;
end process;

counter <= counter_int;
end Behavioral;
