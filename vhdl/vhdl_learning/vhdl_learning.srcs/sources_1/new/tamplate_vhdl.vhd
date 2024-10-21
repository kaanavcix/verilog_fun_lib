----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/12/2024 01:22:09 AM
-- Design Name: 
-- Module Name: tamplate_vhdl - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



-- user defined package;

use work.PCK_MYPACKAGE.ALL;

--Entity   Dış dünya ile iletişim module yada fonksiyon başı

entity tamplate_vhdl is
  generic (
  c_clkin : integer  :100_000_000;
  c_sclkfeq:integer  := 1_000_000;
  c_bitnum : integer := 8;
  c_is_sim : boolean  := false;
  );
  Port ( 
  input1_i : in std_logic_vector (c_bitnum - 1 downto 0);
  output1_o : out std_logic;
  inout1_io : inout std_logic_vector ((2*c_bitnum) - 1 downto 0);
  );
end tamplate_vhdl;


-- Architecture 
architecture KaanAvci of tamplate_vhdl is

--Declaretion General until the begin

--Constant
constant c_constant : integer  := 30;


--Compenent Declaretion

component my_component is

generic (

gen1 : integer :=10;
);

Port(
in1 : std_logic_vector (c_bitnum - 1 downto 0);
);



end component my_component;


--Types 

type t_state is (S_START,S_OPERATION, S_TERMINATE, S_IDLE);
subtype t_decimal_digit is integer range 0 to 9;


type my_record_type is record
param1 : std_logic;

end record;


--signal
signal s0 : std_logic_vector (7 downto 0);

signal s1 : std_logic_vector (7 downto 0) := x"F4";  --b11110100 0 
signal s2: t_state := S_START;
signal s3 : integer range 0 to 255 := 0;


--Begin Main Code Bloc Logic
begin

--Component Instantitions

mycomp1: my_component
generic map
(
	gen1 => c_constant
	

)
Port map (
	in1 => input1_i,
	out1 => output1_o 

);


end KaanAvci;
