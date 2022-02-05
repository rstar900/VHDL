library IEEE;
use IEEE.std_logic_1164.all;

entity johnson_counter_4 is
	port(
    	clk : in std_logic;
        rst : in std_logic;
    	Q : out std_logic_vector(3 downto 0)
    ); 
end johnson_counter_4;

architecture rtl of johnson_counter_4 is
	
    signal regs : std_logic_vector(3 downto 0) := "0000";
    
begin

-- start from 0000 and shift towards left
-- use rst to reset to 0000 (asynchronous)
	process(clk, rst)
    
    begin
    
    	if rst = '1' then
        	regs <= "0000";
            
    	elsif rising_edge(clk) then
        	regs(0) <= not regs(3);
            regs(3 downto 1) <= regs(2 downto 0);
            
         end if;
         
     -- assign the current register values to Q
     Q <= regs;
        	
        	
    end process;
    
	
end rtl;
