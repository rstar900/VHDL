library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is
end entity;

architecture test of testbench is

	component traffic_light is
    
		generic(clockFreq : integer := 5);
    
    	port(
    		clk : in std_logic;
    		rst : in std_logic;
      		NorthSouthRed : out std_logic;
        	NorthSouthYellow : out std_logic;
        	NorthSouthGreen : out std_logic;
        	WestEastRed : out std_logic;
        	WestEastYellow : out std_logic;
        	WestEastGreen : out std_logic
    		);
		end component;	

	signal clk : std_logic := '1';
    signal rst : std_logic := '1';
    signal NorthSouthRed : std_logic;
    signal NorthSouthYellow :  std_logic;
    signal NorthSouthGreen :  std_logic;
    signal WestEastRed :  std_logic;
    signal WestEastYellow :  std_logic;
    signal WestEastGreen : std_logic;

    
    constant clockPeriod : time := 1000ms / 5;

begin

	tl : traffic_light
    generic map(clockFreq => 5)
    port map(clk => clk,
    		rst => rst,
            NorthSouthRed => NorthSouthRed,
            NorthSouthYellow => NorthSouthYellow,
            NorthSouthGreen => NorthSouthGreen,
            WestEastRed => WestEastRed,
            WestEastYellow => WestEastYellow,
            WestEastGreen => WestEastGreen           
            );
            
   --clock generation
   clk <= not clk after clockPeriod / 2;
   
   --stimuli generation
   process
   
   begin
   
   -- wait until 1 clock cycle to reset the timer
   	wait until rising_edge(clk);
    
  	rst <= '0';
    
    wait;
    
   end process;
   

end architecture;
