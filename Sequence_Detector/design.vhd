library IEEE;
use IEEE.std_logic_1164.all;

-- detect the sequence "11010" and assert valid for a clock cycle 

entity sequence_detector is
port(
	clk : in std_logic;
    rst : in std_logic;
    psw : in std_logic;
    valid : out std_logic;
);
end entity;

architecture rtl of sequence_detector is

	type states is (idle, s1, s2, s3, s4, valid_state); 
    
    signal current_state : states := idle; 
    signal next_state : states := idle;

begin

	--process for transition function
    transition : process(current_state, psw)
    
    begin
    
    	case current_state is
    	
        	when idle =>
            
            	if psw = '0' then
                	next_state <= idle;
                else 
                	next_state <= s1;
                end if;    
            
        	when s1 =>
            
            	if psw = '0' then
                	next_state <= idle;
                else 
                	next_state <= s2;
                end if;    
                    
        	when s2 =>
            
            	if psw = '0' then
                	next_state <= s3;
                else 
                	next_state <= s2;
                end if;    
            
        	when s3 =>
            
            	if psw = '0' then
                	next_state <= idle;
                else 
                	next_state <= s4;
                end if;    
            
        	when s4 =>
            
            	if psw = '0' then
                	next_state <= valid_state;
                else 
                	next_state <= s2;
                end if;    
            
        	when valid_state =>
            
            	wait until rising_edge(clk); -- hold this state for a while
                next_state <= idle;
            
        	when others => next_state <= idle;
        
    	end case;    
    
    end process;
    
    -- process for state registers
    registers : process(clk)
    begin
    
    	if rising_edge(clk) then
        	if rst = '1' then
            	current_state <= idle;
            else 
            	current_state <= next_state;
            end if;
        end if;    
    
    end process;
    
    --process for outputs
    outputs : process(current_state)
    begin 
    
    	case current_state is  
    
        	when idle => valid <= '0';
        	when s1 => valid <= '0';
        	when s2 => valid <= '0';
        	when s3 => valid <= '0';
        	when s4 => valid <= '0';
        	when valid_state => valid <= '1';
        	when others => valid <= '0'; 
        
    	end case;    
    
    end process;

end architecture;
