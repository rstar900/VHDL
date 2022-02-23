library IEEE;
use IEEE.std_logic_1164.all;

-- detect the sequence "11010" and assert valid in case of valid sequence
-- for now the if valid becomes 1 it stays so forever

entity sequence_detector is
port(
	clk : in std_logic;
    rst : in std_logic;
    psw : in std_logic;
    valid : out std_logic;
    sval : out integer --for debugging purposes
);
end entity;

architecture rtl of sequence_detector is

	type states is (idle, s1, s2, s3, s4, valid_state); 
    
    signal current_state : states := idle; 
    signal next_state : states;

begin

	--process for transition function
    transition : process(psw, current_state)
    
    begin
    
    	case current_state is
    	
        	when idle =>
            sval <= 0;
            	if psw = '0' then
                	next_state <= idle;
                elsif psw = '1' then 
                	next_state <= s1;
                end if;    
            
        	when s1 =>
            sval <= 1;
            	if psw = '0' then
                	next_state <= idle;
                elsif psw = '1' then
                	next_state <= s2;
                end if;    
                    
        	when s2 =>
            sval <= 2;
            	if psw = '0' then
                	next_state <= s3;
                elsif psw = '1' then
                	next_state <= s2;
                end if;    
            
        	when s3 =>
            sval <= 3;
            
            	if psw = '0' then
                	next_state <= idle;
                elsif psw = '1' then 
                	next_state <= s4;
                end if;    
            
        	when s4 =>
            sval <= 4;
            	if psw = '0' then
                	next_state <= valid_state;
                elsif psw = '1' then
                	next_state <= s2;
                end if;    
            
        	when valid_state =>
            sval <= 5;
            	next_state <= valid_state;
                
            
        	when others => next_state <= idle; sval <= 16;
        
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
