library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Divide2000000 is
	port(
		valuetodivide : in std_logic_vector(0 to 23);
		finalvalue : out std_logic_vector(0 to 23);
		cin : in std_logic;
		en : in std_logic
		--co : out std_logic --
	);
end entity;

architecture behave of Divide2000000 is
signal tempcout : std_logic_vector(0 to 23) := valuetodivide(0 to 23);
signal temp : std_logic_vector(0 to 23);
signal G, L, E : std_logic;
signal intermediatevalue : std_logic_vector(0 to 23) := "000000000000000000000000";
signal subtractedval : std_logic_vector(0 to 23) := "111000010111101110000000";
signal voidbit : std_logic;
signal tempval : std_logic_vector(0 to 23);

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
		Add0 : FullAdder24bit port map (tempcout, subtractedval, cin, temp, voidbit);
		Add1 : FullAdder24bit port map (intermediatevalue, "000000000000000000000001", cin, tempval, voidbit);
		Compare2000000 : Compare24bit port map (temp, "000000000000000000000000", G,L,E);
		process(en)
			begin
				if(en'event and en = '1' and L = '0') then
					tempcout <= temp;
					intermediatevalue <= tempval;
					finalvalue <= intermediatevalue;
				end if;
		end process;	
end
architecture;