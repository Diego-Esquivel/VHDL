library IEEE;
use Ieee.std_logic_1164.all;

entity D_Latch_Clr is
	port(
		d : in std_logic;
		g : in std_logic;
		Clr : in std_logic;
		
		q : out std_logic;
		p : out std_logic
	);
end entity;

architecture behave of D_Latch_Clr is

component D_Latch 
	port(
		d : in std_logic;
		g : in std_logic;
		
		q : out std_logic;
		p : out std_logic
	);
end component;
signal qsignal, psignal : std_logic;
begin
	Add0 : D_Latch port map (d,g,qsignal,psignal);
	q <= qsignal nand not(Clr);
	p <= not(qsignal nand not(Clr));
end
architecture;