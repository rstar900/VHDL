library IEEE;
use IEEE.std_logic_1164.all;

entity traffic_light is

-- 5Hz clock frequency 
generic(clockFreq : integer := 5);

port(
		clk : in std_logic;
        rst : in std_logic;
		NorthSouthRed : out std_logic;
        NorthSouthYellow : out std_logic;
        NorthSouthGreen : out std_logic;
        WestEastRed : out std_logic;
        WestEastYellow : out std_logic;
        WestEastGreen : out std_logic
	);
    
end entity;

architecture rtl of traffic_light is

	-- enumerated type in vhdl representing possible states
    -- each state except NorthSouth and WestEast is 1 seconds
	type t_states is (NorthSouthNext, NorthSouthStart, NorthSouth, 
				  NorthSouthStop, WestEastNext, WestEastStart, WestEast,
                  WestEastStop);
	
    signal state : t_states := NorthSouthNext;
    signal counter : integer := 0;

begin
	
	process(clk)
    
    begin
    	
    	if (rising_edge(clk)) then
        
        
        	if rst = '1' then
            	counter <= 0;
            	NorthSouthRed <= '1';
        		NorthSouthYellow <= '0';
        		NorthSouthGreen <= '0'; 
        		WestEastRed <= '1';
        		WestEastYellow <= '0';
        		WestEastGreen <= '0' ;
                state <= NorthSouthNext;
     			
            else
            
            	-- default values
            	NorthSouthRed <= '0';
        		NorthSouthYellow <= '0';
        		NorthSouthGreen <= '0'; 
        		WestEastRed <= '0';
        		WestEastYellow <= '0';
        		WestEastGreen <= '0' ;
                
                --increment counter to keep track of time
                counter <= counter + 1;                
            
            	case state is
                	
                   when NorthSouthNext =>
                   
                   	NorthSouthRed <= '1';
                    WestEastRed <= '1';
                    
                    if counter = 1 * clockFreq - 1 then
                    	counter <= 0;
                        state <= NorthSouthStart;
                    end if; 
                    
                   when NorthSouthStart =>
                   
                   	NorthSouthRed <= '1';
                    WestEastRed <= '1';
                    NorthSouthYellow <= '1';
                    
                    if counter = 1 * clockFreq - 1 then
                    	counter <= 0;
                        state <= NorthSouth;
                    end if; 
                    
                   when NorthSouth =>
                   
                   	NorthSouthGreen <= '1';
                    WestEastRed <= '1';
                    
                    if counter = 2 * clockFreq - 1 then
                    	counter <= 0;
                        state <= NorthSouthStop;
                    end if;    

                   when NorthSouthStop =>
                   
                   	NorthSouthYellow <= '1';
                    WestEastRed <= '1';
                    
                    if counter = 1 * clockFreq - 1 then
                    	counter <= 0;
                        state <= WestEastNext;
                    end if;    

                   when WestEastNext =>
                   
                   	NorthSouthRed <= '1';
                    WestEastRed <= '1';
                    
                    if counter = 1 * clockFreq - 1 then
                    	counter <= 0;
                        state <= WestEastStart;
                    end if;    

                   when WestEastStart =>
                   
                   	NorthSouthRed <= '1';
                    WestEastRed <= '1';
                    WestEastYellow <= '1';
                    
                    if counter = 1 * clockFreq - 1 then
                    	counter <= 0;
                        state <= WestEast;
                    end if;    

                   when WestEast =>
                   
                   	NorthSouthRed <= '1';
                    WestEastGreen <= '1';
                    
                    if counter = 2 * clockFreq - 1 then
                    	counter <= 0;
                        state <= WestEastStop;
                    end if;    

                   when WestEastStop =>
                   
                   	NorthSouthRed <= '1';
                    WestEastYellow <= '1';
                    
                    if counter = 1 * clockFreq - 1 then
                    	counter <= 0;
                        state <= NorthSouthNext;
                    end if;    
 
                end case;
            
            end if;
        
        end if;
        
    end process;
    
end architecture;
