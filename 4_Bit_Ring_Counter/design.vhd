library IEEE;
use IEEE.std_logic_1164.all;

entity ring_counter_4 is
	port(
    	clk : in std_logic;
        rst : in std_logic;
    	Q : out std_logic_vector(3 downto 0)
    ); 
end ring_counter_4;

architecture rtl of ring_counter_4 is
	
    signal regs : std_logic_vector(3 downto 0) := "0001";
    
begin

-- start from 0001 and shift towards left
-- use rst to reset to 0001 (asynchronous)
	process(clk, rst)
    
    begin
    
    	if rst = '1' then
        	regs <= "0001";
            
    	elsif rising_edge(clk) then
        	regs(0) <= regs(3);
            regs(3 downto 1) <= regs(2 downto 0);
            
         end if;
         
     -- assign the current register values to Q
     Q <= regs;
        	
        	
    end process;
    
	
end rtl;
