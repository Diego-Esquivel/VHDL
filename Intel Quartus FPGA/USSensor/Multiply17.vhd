library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Multiply17 is
	port(
		valuetomultiply : in std_logic_vector(0 to 23);
		finalvalue : out std_logic_vector(0 to 23);
		cin : in std_logic;
		en : in std_logic;
		co : out std_logic
	);
end entity;

architecture behave of Multiply17 is 
signal intermediatevalue, tempadd, tempit : std_logic_vector(0 to 23) := "000000000000000000000000";
signal iterations : std_logic_vector(0 to 23) := "000000000000000000010001"; -- #17 --
signal thelonedecrementor : std_logic_vector(0 to 23) := "111111111111111111111111";
signal voidbit : std_logic;
signal G,L,E : std_logic;
component FullAdder24bit is
	port(
		x,y : in std_logic_vector(0 to 23);
		cin : in std_logic;
		sum : out std_logic_vector(0 to 23);
		co : out std_logic
	);
end component;

component Compare24bit is
	port(
		A,B : in std_logic_vector(0 to 23);
		G,L,E : out std_logic
	);
end component;

begin
	Add0 : FullAdder24bit port map (valuetomultiply, intermediatevalue, cin, tempadd, co);
	Add1 : FullAdder24bit port map (iterations, thelonedecrementor, cin, tempit, voidbit);
	Compare17 : Compare24bit port map (iterations, thelonedecrementor, G,L,E);
	process(en, intermediatevalue)
		begin
			if(en'event and en = '1' and E = '0') then 
				intermediatevalue <= tempadd;
				iterations <= tempit;
				finalvalue <= intermediatevalue;
			end if;
	end process;
end
architecture;