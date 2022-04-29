library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Trigger is
	port(
		input : in std_logic;
		output : out std_logic
	);
end entity;

architecture behave of Trigger is
begin
	output <= input;
end
architecture;