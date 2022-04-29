library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity FullAdder8bit is
	port(
		x,y : in std_logic_vector(0 to 7);
		cin : in std_logic;
		sum : out std_logic_vector(0 to 7);
		co : out std_logic
	);
end entity;

architecture behave of FullAdder8bit is
signal carry : std_logic_vector(0 to 6);

component FullAdder is
	port(
		p,q,r : in std_logic;
		sm,cr : out std_logic
	);
end component;

begin
	Add0 : FullAdder port map (x(7),y(7),cin,sum(7),carry(6));
	Add1 : FullAdder port map (x(6),y(6),carry(6),sum(6),carry(5));
	Add2 : FullAdder port map (x(5),y(5),carry(5),sum(5),carry(4));
	Add3 : FullAdder port map (x(4),y(4),carry(4),sum(4),carry(3));
	Add4 : FullAdder port map (x(3),y(3),carry(3),sum(3),carry(2));
	Add5 : FullAdder port map (x(2),y(2),carry(2),sum(2),carry(1));
	Add6 : FullAdder port map (x(1),y(1),carry(1),sum(1),carry(0));
	Add7 : FullAdder port map (x(0),y(0),carry(0),sum(0),co);
end                                           
architecture;