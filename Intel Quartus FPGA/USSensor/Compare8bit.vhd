library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Compare8bit is
	port(
		A,B : in std_logic_vector(0 to 7);
		G,L,E : out std_logic
	);
end entity;

architecture behave of Compare8bit is
	begin
		process 
			begin
				if A=B then
					G <= '0';
					L <= '0';
					E <= '1';
				elsif A > B then
					G <= '1';
					L <= '0';
					E <= '0';
				elsif A < B then 
					G <= '0';
					L <= '1';
					E <= '0';
				end if;
		end process;
end
architecture;