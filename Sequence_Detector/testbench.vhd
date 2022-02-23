library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture test of testbench is

	component sequence_detector is 
	port(
	clk : in std_logic;
    rst : in std_logic;
    psw : in std_logic;
    valid : out std_logic;
    sval : out integer
    );
    end component;
    
	signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal psw : std_logic := '0';
    signal valid : std_logic; 
    signal sval : integer;
	
begin

	sd : sequence_detector
    port map(
    	clk => clk,
        rst => rst,
        psw => psw,
        valid => valid,
        sval => sval
    );
    
    -- clock generation
    clk <= not clk after 50 ms;
    
    
    -- testing shift registers inside this process
    process
    
    begin
        
        -- wait atleast till we get a rising edge after 2 cycles
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        
        psw <= '0';
        wait for 100 ms;
        psw <= '1';
        wait for 100 ms;
        psw <= '1';
        wait for 100 ms;
        psw <= '0';
        wait for 100 ms;
        psw <= '1';
        wait for 100 ms;
        psw <= '0';
        wait for 100 ms;
        psw <= '1';
        
        wait;
        
   	end process;
	
end architecture test;
