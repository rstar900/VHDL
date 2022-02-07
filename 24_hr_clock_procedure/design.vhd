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
    
    procedure wrapAndIncrement(signal counter : inout integer;
                               constant wrapValue : in integer; 
                               constant enable : in boolean;
                               variable wrapped : out boolean) is
    begin
    
    	if enable then
        
        	if counter = wrapValue - 1 then
            	counter <= 0;
                wrapped := true;
                
            else 
            	counter <= counter + 1;
                wrapped := false;
            
            end if;
            
        end if;    
    
    end procedure;

begin
	
    process(clk)
    
    	 variable wrapped : boolean := false; 
    	
    	begin
        	if (rising_edge(clk)) then
            
            	if (rst = '1') then
            		ticks <= 0;
                	hrs <= 0;
               		mins <= 0;
                	secs <= 0;
                    
                else
                
                	wrapAndIncrement(ticks, clockFreq, true, wrapped);
                  wrapAndIncrement(secs, 60, wrapped, wrapped);
                  wrapAndIncrement(mins, 60, wrapped, wrapped);
                  wrapAndIncrement(hrs, 23, wrapped, wrapped);
                    
                end if;
         	
            end if;
                 
            
        end process;
    
end architecture;
