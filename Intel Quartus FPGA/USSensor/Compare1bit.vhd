library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Compare1bit is
	port(
		a,b : in std_logic;
		G,L,E : out std_logic
	);
end entity;

architecture behave of Compare1bit is
	begin
		G <= A and not(B);
		L <= not(A) and B;
		E <= A xnor B;
end
architecture;