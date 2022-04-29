library IEEE;
use Ieee.std_logic_1164.all;

entity D_FlipFlop_Clr is
	port(
		d : in std_logic;
		Clk : in std_logic;
		Clr : in std_logic;
		
		
		q2 : out std_logic
	);
end entity;

architecture behave of D_FlipFlop_Clr is
signal psignal, void : std_logic;
component D_Latch_Clr 
	port (
		d : in std_logic;
		g : in std_logic;
		Clr : in std_logic;
		
		q : out std_logic;
		p : out std_logic
	);
end component;

begin
	Add0 : D_Latch_Clr port map (d,not Clk,Clr,psignal,void);
	Add1 : D_Latch_Clr port map (psignal,Clk,Clr,q2, void);
end
architecture;