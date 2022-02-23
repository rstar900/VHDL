library IEEE;
use IEEE.std_logic_1164.all;

entity shift_reg_4_extended is
port(
	clk : in std_logic;
    rst: in std_logic;
    load: in std_logic;
    din: in std_logic_vector(3 downto 0);
    dout: out std_logic_vector(3 downto 0) 
);
end entity;

architecture rtl of shift_reg_4_extended is

	signal regs : std_logic_vector(3 downto 0) := "0000";

begin

	-- registers process

	process(clk)
    begin
    	
        if clk'event and clk = '1' then
        	
            if rst = '1' then
            	regs <= "0000";
            
            elsif load = '1' then
            	regs <= din;
            
            else 
            	
                regs(3 downto 1) <= regs(2 downto 0);
                regs(0) <= '0';
                
            end if;
            
        end if;
        
    end process;
    
    
    -- output assignment
    
    dout <= regs;

end architecture;
