library IEEE;
use Ieee.std_logic_1164.all;

entity USSensor is 
	port(
		triggerin : in std_logic;
		triggerout : out std_logic
	);
end entity;

architecture behave of USSensor is
component Trigger is 
	port(
		input : in std_logic;
		output : out std_logic
	);
end component;

begin
	Add0 : Trigger port map (triggerin,triggerout);
end
architecture;