library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end testbench;

architecture test of testbench is

	component johnson_counter_4 is
	port(
    	clk : in std_logic;
        rst : in std_logic;
    	Q : out std_logic_vector(3 downto 0)
    ); 
	end component;
    
    signal clk_s : std_logic;
    signal rst_s : std_logic;
    signal Q_s : std_logic_vector(3 downto 0);

begin

	rc4 : johnson_counter_4
    port map(
    	clk => clk_s,
        rst => rst_s,
        Q => Q_s
    );
    
    clock_process : process
    begin
    	clk_s <= '0';
        wait for 20 ns;
        clk_s <= '1';
        wait for 20 ns;
    end process;
    
    counter_process : process
    begin
    	
        rst_s <= '1';
        wait for 5 ns;
        
        rst_s <= '0';
        wait for 410 ns;
        
        rst_s <= '1';
        wait;
        
    end process;
    
	
end test;
