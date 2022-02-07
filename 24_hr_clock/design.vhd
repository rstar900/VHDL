library IEEE;
use IEEE.std_logic_1164.all;

entity timer is
	-- 10Hz is the default frequency for speeding up simulation
	generic(clockFreq : integer := 10);
   
   -- the reason we set time variables as inout is because we are reading 
   -- them for comparison as well and normal out cannot be read
    port(
    	clk : in std_logic;
    	rst : in std_logic;
        secs : inout integer;
        mins : inout integer;
        hrs : inout integer
    );
end entity;

architecture rtl of timer is

	signal ticks : integer := 0;

begin
	
    process(clk)
    	begin
        	if (rising_edge(clk)) then
            
            if (rst = '1') then
            	ticks <= 0;
                hrs <= 0;
                mins <= 0;
                secs <= 0;
                
             else
            
            	-- happens every 1 second
            	if ticks = clockFreq - 1 then
                
                	-- happens every 1 minute
                	if secs = 59 then
                		secs <= 0;
                        
                        -- happens every 1 hour
                        if mins = 59 then
                        	mins <= 0;
                            
                            -- happens every 1 day 
                            if hrs = 23 then
                            	hrs <= 0;
                                
                            else 
                            	hrs <= hrs + 1;
                                
                            end if;    
                         
                         else
                         	mins <= mins + 1;
                         
                         end if;
                        
                     else 
                     	secs <= secs + 1;
                        
                     end if;
                     
                     -- reset tick every 1 second
                     ticks <= 0;
                
            	else 
            		ticks <= ticks + 1;
                
            	end if;
                
             end if;   
                
             end if;   
            
        end process;
    
end architecture;
