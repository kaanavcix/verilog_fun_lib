

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity top is
generic
( c_clkfreq : integer := 100_000_000
);
Port (
 clk 			: in std_logic;
 start_i 		: in std_logic;
 reset_i 		: in std_logic;
 seven_seg_o 	: out std_logic_vector (7 downto 0);
 anodes_0		: out std_logic_vector (7 downto 0)	
 );
end top;

architecture Behavioral of top is
--Component Declaretion
component debounce is

	generic (
	c_clkfreq : integer   := 1_000_000;
	c_debtime : integer   := 1000; 
	c_initval : std_logic := '0'
	);
	port (
	clk_i : in std_logic;
	signal_i : in std_logic;
	signal_o : out std_logic
	);
end component debounce;

component bcd_incrementor is

generic (
	c_birlerm : integer  := 9;
	c_onlarim : integer  := 5
);
Port (
	clk 		: in std_logic;
	increment_i : in std_logic;
	reset_i 	: in std_logic;
	birler_o	: out std_logic_vector (3 downto 0);
	onlar_o 	: out std_logic_vector (3 downto 0)
 );
end component bcd_incrementor;

component bcd_to_sevenseg is

Port (
	bcd_i : in std_logic_vector  (3 downto 0);
	seg_o : out std_logic_vector (7 downto 0)
 );
end component bcd_to_sevenseg;

--Constant Definition
constant c_timer1mslim			: integer := c_clkfreq/1000;
constant c_salise_counter_lim	: integer := c_clkfreq/100;
constant c_saniye_counter_lim	: integer := 100;	-- 100 saliseye kadar sayacak ve 1 artacak saniye
constant c_dakika_counter_lim	: integer := 60;	-- 60 saniyeye kadar sayacak ve 1 artacak dakika

--Signal Definition
signal start_deb_o 			:  std_logic := '0';
signal reset_deb_o 			:  std_logic := '0';
signal salise_incerement 	:  std_logic := '0';
signal saniye_incerement 	:  std_logic := '0';
signal dakika_incerement 	:  std_logic := '0';
signal contiunes 			:  std_logic := '0';

signal salise_birler 		: std_logic_vector (3 downto 0):= (others => '0');
signal salise_onlar 		: std_logic_vector (3 downto 0):= (others => '0');
signal saniye_birler 		: std_logic_vector (3 downto 0):= (others => '0');
signal saniye_onlar 		: std_logic_vector (3 downto 0):= (others => '0');
signal dakika_birler 		: std_logic_vector (3 downto 0):= (others => '0');
signal dakika_onler	 		: std_logic_vector (3 downto 0):= (others => '0');
signal saniye_birler_7seg	: std_logic_vector (7 downto 0):= (others => '0');
signal saniye_onlar_7seg	: std_logic_vector (7 downto 0):= (others => '0');
signal salise_birler_7seg	: std_logic_vector (7 downto 0):= (others => '0');
signal salise_onlar_7seg	: std_logic_vector (7 downto 0):= (others => '0');
signal dakika_birler_7seg	: std_logic_vector (7 downto 0):= (others => '0');
signal dakika_onlar_7seg	: std_logic_vector (7 downto 0):= (others => '0');
signal anodes 				:std_logic_vector  (7 downto 0):= "11111110";

signal timer1ms					: integer range 0 to c_timer1mslim 			:= 0;
signal salise_counter			: integer range 0 to c_salise_counter_lim 	:= 0;
signal saniye_counter			: integer range 0 to c_saniye_counter_lim 	:= 0;
signal dakika_counter			: integer range 0 to c_dakika_counter_lim 	:= 0;

begin

--Component instantaion  

--Debounce
i_start_deb : debounce
generic map 
( 	c_clkfreq 	=> c_clkfreq,
	c_debtime 	=> 1000,   
	c_initval 	=> '0'
)
port map 
(
	clk_i => clk,
	signal_i => start_i,
	signal_o => start_deb_o
);

i_reset_deb :debounce
generic map 
( 	c_clkfreq => c_clkfreq,
	c_debtime => 1000,
	c_initval => '0'
);

port map 
(
	clk_i => clk,
	signal_i => reset_i,
	signal_o => start_deb_o
);

-- bcd_incrementor

i_salise_incerementor : bcd_incrementor
generic map(
	c_birlerm => 9,
	c_onlarim => 9
)

Port map(
	clk 		 => clk,
	increment_i  => salise_incerement,
	reset_i 	 => reset_deb_o,
	birler_o	 => salise_birler,
	onlar_o 	 => salise_onlar
 );
 
 i_saniye_incerementor : bcd_incrementor
generic map(
	c_birlerm => 9,
	c_onlarim => 5
);
Port map(
	clk 		 => clk,
	increment_i  => saniye_incerement,
	reset_i 	 => reset_deb_o,
	birler_o	 => saniye_birler,
	onlar_o 	 => saniye_onlar
 );
 
  i_dakika_incerementor : bcd_incrementor
generic map(
	c_birlerm => 9,
	c_onlarim => 5,
);
Port map(
	clk 		 => clk,
	increment_i  => saniye_incerement,
	reset_i 	 => reset_deb_o,
	birler_o	 => dakika_birler,
	onlar_o 	 => dakika_onler,
 );
 
 --Sevensegmnt to bcd
 
 i_saniye_birler_sevensegment : bcd_to_sevenseg
 Port map(
	bcd_i => saniye_birler,
	seg_o  => saniye_birler_7seg
 );
  i_saniye_onlar_sevensegment : bcd_to_sevenseg
 Port map(
	bcd_i => saniye_onlar,
	seg_o  => saniye_onlar_7seg
 );
 i_salise_birler_sevensegment : bcd_to_sevenseg
 Port map(
	bcd_i => salise_birler,
	seg_o  => salise_birler_7seg
 );
 i_salise_onlar_sevensegment : bcd_to_sevenseg
 Port map(
	bcd_i => salise_onlar,
	seg_o  => salise_onlar_7seg
 );
 
 i_dakika_birler_sevensegment : bcd_to_sevenseg
 Port map(
	bcd_i => dakika_birler,
	seg_o  => dakika_birler_7seg
 );
 i_dakika_onlar_sevensegment : bcd_to_sevenseg
 Port map(
	bcd_i => dakika_onlar,
	seg_o  => dakika_onlar_7seg
 );
 
 --Main process
 
 P_MAIN : process (clk) begin
 
 if(start_i = '1') then
	contiunes <= not contiunes;
 end if;
 
	salise_counter <= 0;
	saniye_counter <= 0;
	dakika_counter <= 0;
 
 if(contiunes = '1') then 
 
	if(salise_counter  = c_salise_counter_lim - 1) then
		salise_counter <= 0;
		salise_incerement <='1';
		saniye_counter <= saniye_counter + 1;
		
		else 
			salise_counter <= salise_counter + 1;
	end if;
	
	
	if(saniye_counter  = c_saniye_counter_lim - 1) then
		saniye_counter <= 0;
		saniye_incerement <= '1';
		dakika_counter  <= dakika_counter + 1;
	end if;
	
	
	if(dakika_counter  = c_dakika_counter_lim - 1) then
	dakika_counter <=0;
	dakika_incerement <= '1';
	
	end if;
 
 end if;
 
 
 salise_incerement <= '0';
 saniye_incerement <= '0';
 dakika_incerement <= '0';
 
 end process;
 
 --Anodes process
 
 P_ANODE : process (clk) begin	
	if(rising_edge(clk) then
	
	anodes(7 downto 6) <= "11";
	
	if(timer1ms = c_timer1mslim - 1) then
	timer1ms 				<= 0;
	anodes (5 downto 1)     <= anodes(4 downto 0);
	anodes(0)               <= anodes(5);
	--Shifting
	else
		timer1ms            <= timer1ms + 1;
	end if;
	end if;
 end process;
 --Kathod process
 P_KATHODE : process (clk) begin
 if(rising_edge(clk))  then
 
	if (anodes(0) = '0') then
	seven_seg_o <= salise_birler_7seg;
	elsif (anodes(1) = '0') then
	seven_seg_o <= salise_onlar_7seg;
	--yazarsın
	else
		seven_seg_o <= (others => '1');
	end if;
 end if;
 
 
 end process;
  anodes_0 <= anodes;

end Behavioral;
