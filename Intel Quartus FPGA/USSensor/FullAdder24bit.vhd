library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity FullAdder24bit is
	port(
		x,y : in std_logic_vector(0 to 23);
		cin : in std_logic;
		sum : out std_logic_vector(0 to 23);
		co : out std_logic
	);
end entity;

architecture behave of FullAdder24bit is
signal carry : std_logic_vector(0 to 1);

component FullAdder8bit is
	port(
		x,y : in std_logic_vector(0 to 7);
		cin : in std_logic;
		sum : out std_logic_vector(0 to 7);
		co : out std_logic
	);
end component;

begin
	Add0 : FullAdder8bit port map (x(16 to 23),y(16 to 23),cin,sum(16 to 23),carry(0));
	Add1 : FullAdder8bit port map (x(8 to 15),y(8 to 15),carry(0),sum(8 to 15),carry(1));
	Add2 : FullAdder8bit port map (x(0 to 7),y(0 to 7),carry(1),sum(0 to 7),co);
end 
architecture;