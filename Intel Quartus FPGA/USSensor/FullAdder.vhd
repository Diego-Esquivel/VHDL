library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity FullAdder is
	port(
		p,q,r : in std_logic;
		sm,cr : out std_logic
	);
end entity;

architecture behave of FullAdder is
begin
	sm <= p xor q xor r;
	cr <= (p and q) or (q and r) or (r and p);
end 
architecture;