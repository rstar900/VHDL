library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture test of testbench is

	component shift_reg_4_extended is 
	port(
	clk : in std_logic;
    rst: in std_logic;
    load: in std_logic;
    din: in std_logic_vector(3 downto 0);
    dout: out std_logic_vector(3 downto 0)     
    );
    end component;
    
	signal clk : std_logic := '0';
    signal rst: std_logic := '0';
    signal load: std_logic := '0';
    signal din: std_logic_vector(3 downto 0) := "1011";
    signal dout: std_logic_vector(3 downto 0);  
	
begin

	sr4 : shift_reg_4_extended
    port map(
    	clk => clk,
    	rst => rst,
    	load => load,
    	din => din,
    	dout => dout
    );
    
    -- clock generation
    clk <= not clk after 50 ms;
    
    
    -- testing shift registers inside this process
    process
    
    begin
    
    	rst <= '1';
        
        -- wait atleast till we get a rising edge after 2 cycles
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        
        rst <= '0';
        load <= '1';
        
        wait until rising_edge(clk);
        
        load <= '0';
        
        wait for 500 ms;
        
        rst <= '1';
        
        wait;
        
   	end process;
	
end architecture test;
