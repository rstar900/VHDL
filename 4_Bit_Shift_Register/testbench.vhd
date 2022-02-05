library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity testbench;

architecture test of testbench is

	component shift_reg_4 is 
	port(
    	clk : in std_logic;
        d : in std_logic;
        out_serial : out std_logic;
        out_parallel: out std_logic_vector(3 downto 0)
    );
    end component;
    
	signal clk_s : std_logic;
    signal d_s : std_logic;
    signal out_serial_s : std_logic;
    signal out_parallel_s : std_logic_vector(3 downto 0);  
	
begin

	sr4 : shift_reg_4
    port map(
    	clk => clk_s,
        d => d_s,
        out_serial => out_serial_s,
        out_parallel => out_parallel_s
    );
    
    clock_process : process
    begin
    	clk_s <= '0';
        wait for 25 ns;
        clk_s <= '1';
        wait for 25 ns;
    end process;
    
    shift_reg_process : process
    begin
   		d_s <= '1';
        wait for 60 ns;
        d_s <= '0';
    	wait;
    end process;
	
end architecture test;
