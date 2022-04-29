library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Counter4bit is
	Port(
		din : in std_logic_vector(0 to 3);
		rst,clk : in std_logic;
		
		Ld, Ct : in std_logic;
		
		o : out std_logic_vector(0 to 3)
	);
end entity;

architecture behave of Counter4bit is
	signal count : std_logic_vector(0 to 3);
	
	begin
		process(rst,clk, Ct, Ld, din)
			begin
				if (rst = '1') then count <= "0000";
				elsif (clk'event and clk='1' and Ld='1') then count <= din;
				elsif (clk'event and clk='1' and Ct='1') then count <= count+1;
				end if;
		end process;
	o <= count;
end 
architecture;