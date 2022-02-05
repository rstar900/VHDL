library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg_4 is 
	port(
    	clk : in std_logic;
        d : in std_logic;
        out_serial : out std_logic;
        out_parallel: out std_logic_vector(3 downto 0)
    );
end shift_reg_4;

architecture rtl of shift_reg_4 is

	signal regs : std_logic_vector (3 downto 0) := "0000";

begin
	
    process(clk)
    
    begin
    	-- we push new data through 4th register
    	-- shifting from left to right in the registers internally
        if rising_edge(clk) then
        
        	regs(3) <= d;
        	regs(2 downto 0) <= regs(3 downto 1);
            
        end if;
        
    end process;
    
    -- assigning out_parallel to value in each register 
    -- and out_serial to the lsb
    
    out_parallel <= regs;
    out_serial <= regs(0);
    
    
end rtl;
