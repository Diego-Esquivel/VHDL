library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Counter24bit is 
	port(
		rst,clk : in std_logic;
		
		Ld : in std_logic;
		Ct : in std_logic;
		
		din : in std_logic_vector(0 to 23);
		
		o : out std_logic_vector(0 to 23)
	);
end entity;

architecture behave of Counter24bit is
	signal clk1,clk2,clk3,clk4,clk5, clk6 : std_logic_vector(0 to 3);
component Counter4bit
	Port(
		din : in std_logic_vector(0 to 3);
		rst,clk : in std_logic;
		
		Ld, Ct : in std_logic;
		
		o : out std_logic_vector(0 to 3)
	);
end component;
begin
	Add0 : Counter4bit port map (din(20 to 23), rst, clk, Ld, Ct, clk1);
	Add1 : Counter4bit port map (din(16 to 19), rst, not clk1(0), Ld, Ct, clk2);
	Add2 : Counter4bit port map (din(12 to 15), rst, not clk2(0), Ld, Ct, clk3);
	Add3 : Counter4bit port map (din(8 to 11), rst, not clk3(0), Ld, Ct, clk4);
	Add4 : Counter4bit port map (din(4 to 7), rst, not clk4(0), Ld, Ct, clk5);
	Add5 : Counter4bit port map (din(0 to 3), rst, not clk5(0), Ld, Ct, clk6);
	
	o(20 to 23) <= clk1;
	o(16 to 19) <= clk2;
	o(12 to 15) <= clk3;
	o(8 to 11) <= clk4;
	o(4 to 7) <= clk5;
	o(0 to 3) <= clk6;
	
end
architecture;