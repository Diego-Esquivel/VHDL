library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity driver is
	port(
		Clk50, triggerin, rst, Ld, Ct, echo : in std_logic;
		din : in std_logic_vector(0 to 23);
		o : out std_logic
	);
end entity;

architecture behave of driver is

signal counter10us, counter60ms, counterecho : std_logic_vector(0 to 23);
signal trigout : std_logic;
signal G60,L60,E60,G10,L10,E10 : std_logic;

component Counter24bit is 
	port(
		rst,clk : in std_logic;
		
		Ld : in std_logic;
		Ct : in std_logic;
		
		din : in std_logic_vector(0 to 23);
		
		o : out std_logic_vector(0 to 23)
	);
end component;
component USSensor is 
	port(
		triggerin : in std_logic;
		triggerout : out std_logic
	);
end component;
component Compare24bit is
	port(
		A,B : in std_logic_vector(0 to 23);
		G,L,E : out std_logic
	);
end component;

begin
	Compare60ms : Compare24bit port map (counter60ms, "001011011100011011000000", G60,L60,E60);
	Compare10us : Compare24bit port map (counter10us, "000000000000000111110100", G10,L10,E10);
	Counter10usInstance : Counter24bit port map (rst or E60, Clk50, Ld, Ct and not(E10), din, counter10us(0 to 23));
	Counter60msInstance : Counter24bit port map (rst or E60, Clk50, Ld, Ct, din, counter60ms(0 to 23));
	CounterEchoInstance : Counter24bit port map (rst or E60, Clk50, Ld, echo, din, counterecho);
	SensorInstance : USSensor port map(Ct and not(E10), o);
end
architecture;