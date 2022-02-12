-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity for_loop_tb is
end entity;

architecture test of for_loop_tb is 
begin 
	
    process
    
    	begin
        
        	for i in 1 to 10 loop
            	report "i = " & integer'image(i);
            end loop;    
                
            wait;    
        
        end process;
    
end architecture;
