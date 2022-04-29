library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX2to1_1bit is
	port(
		i0 : in std_logic;
		i1 : in std_logic;
		
		a : in std_logic;
		
		z : out std_logic
		
	);
end entity;

architecture behave of MUX2to1_1bit is

begin
	z <= (i0 and not(a)) or (i1 and a);
end
architecture;