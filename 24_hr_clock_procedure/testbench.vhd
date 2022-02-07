library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity;

architecture test of testbench is

	component timer is
		generic(clockFreq : integer := 10);
    
    	port(
    		clk : in std_logic;
    		rst : in std_logic;
        	secs : inout integer;
        	mins : inout integer;
        	hrs : inout integer
    	);
	end component;	

	signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal secs : integer := 0;
    signal mins : integer := 0;
    signal hrs : integer := 0;
    
    constant clockPeriod : time := 1000ms / 10;

begin

	tmr : timer
    generic map(clockFreq => 10)
    port map(clk => clk,
    		rst => rst,
            secs => secs,
            mins => mins,
            hrs => hrs);
            
   --clock generation
   clk <= not clk after clockPeriod / 2;
   
   --stimuli generation
   process
   
   begin
   
   -- wait until 2 clock cycles to reset the timer
   	wait until rising_edge(clk);
    wait until rising_edge(clk);
  
  	rst <= '0';
    
    wait;
    
   end process;
   

end architecture;
