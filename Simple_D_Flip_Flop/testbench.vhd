library IEEE;
use IEEE.std_logic_1164.all;


entity testbench is
end testbench;

architecture test of testbench is

signal clk_s : std_logic := '0';
signal d_s : std_logic := '0';
signal q_s : std_logic;

component d_flip_flop is 
	port (
     	clk : in std_logic;
    	d : in std_logic;
        q : out std_logic    	
    );
	end component;
    
begin

	dff : d_flip_flop
    port map (
    	clk => clk_s,
        d => d_s,
        q => q_s
    );
    
    CLOCK_process : process
   begin
        clk_s<= '0';
        wait for 50 ns;
        clk_s <= '1';
        wait for 50 ns;
   end process;
   
   Stimuli_process : process
   begin
   
   d_s <= '1';
   wait for 25 ns;
   
     d_s <= '0';
   wait for 25 ns;
   
     d_s <= '0';
   wait for 25 ns;
   
     d_s <= '1';
   wait for 25 ns;
   
     d_s <= '1';
   wait for 25 ns;
   
     d_s <= '1';
   wait for 25 ns;
   
     d_s <= '1';
   wait for 25 ns;
   
     d_s <= '0';
   wait for 25 ns;
   
     d_s <= '0';
   wait for 25 ns;
   
   
   wait;
   	
   end process;


end test;
