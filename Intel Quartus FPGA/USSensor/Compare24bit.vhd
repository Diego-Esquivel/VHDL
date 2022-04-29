library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Compare24bit is
	port(
		A,B : in std_logic_vector(0 to 23);
		G,L,E : out std_logic
	);
end entity;

architecture behave of Compare24bit is
	begin
		process(A,B)
			begin
				if A=B then
					G <= '0';
					L <= '0';
					E <= '1';
				elsif (A(0) = '1' and B(0) = '0') then
					G <= '0';
					L <= '1';
					E <= '0';
				elsif (A(0) = '0' and B(0) = '1') then
					G <= '1';
					L <= '0';
					E <= '0';
				elsif (A(0) = '1' and B(0) = '1') then
					if (not(A(1 to 23)) +1 > not(B(1 to 23))+1) then
						G <= '0';
						L <= '1';
						E <= '0';
					elsif (not(A(1 to 23)) +1 < not(B(1 to 23))+1) then
						G <= '1';
						L <= '0';
						E <= '0';
					end if;
				elsif (A > B) then
					G <= '1';
					L <= '0';
					E <= '0';
				elsif (A < B) then 
					G <= '0';
					L <= '1';
					E <= '0';
				end if;
		end process;
end 
architecture;