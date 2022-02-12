library IEEE;
use IEEE.std_logic_1164.all;

entity while_loop_tb is
end entity;

architecture test of while_loop_tb is 
begin
	
    process
    
    	variable i : integer := 0;
        
    	begin
        	
           while i < 10 loop
           	
            report "i = " & integer'image(i);
            i := i + 2;
            
           end loop;
           
           wait;
            
        end process;
    
end architecture;
