-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2021 15:13:55
-- Design Name: 
-- Module Name: TopLevelSim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TopLevelSim is
--  Port ( );
end TopLevelSim;

architecture Behavioral of TopLevelSim is

    component MCU_PRJ_2021_TopLevel is
    Port (
        CLK100MHZ : in STD_LOGIC;
        sw : in STD_LOGIC_VECTOR(3 downto 0);
        btn : in STD_LOGIC_VECTOR(3 downto 0);
        led : out STD_LOGIC_VECTOR(3 downto 0);
        led0_r : out STD_LOGIC; led0_g : out STD_LOGIC; led0_b : out STD_LOGIC;                
        led1_r : out STD_LOGIC; led1_g : out STD_LOGIC; led1_b : out STD_LOGIC;
        led2_r : out STD_LOGIC; led2_g : out STD_LOGIC; led2_b : out STD_LOGIC;                
        led3_r : out STD_LOGIC; led3_g : out STD_LOGIC; led3_b : out STD_LOGIC
    );
    end component;

    signal CLK100MHZ : STD_LOGIC := '0';
    signal sw : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal btn : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal led : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal led0_r, led0_g, led0_b : STD_LOGIC := '0';                
    signal led1_r, led1_g, led1_b : STD_LOGIC := '0';
    signal led2_r, led2_g, led2_b : STD_LOGIC := '0';                
    signal led3_r, led3_g, led3_b : STD_LOGIC := '0';
    
    signal My_S : std_logic_vector (7 downto 0) := (others => '0');
    signal SR_OUT_L, SR_OUT_R, Calc_Done : STD_LOGIC := '0';                
    
begin

    MyCUT : MCU_PRJ_2021_TopLevel 
    
    Port Map (
        CLK100MHZ => CLK100MHZ,
        sw => sw,
        btn => btn,
        led => led,
        led0_r => led0_r,
        led0_g => led0_g,
        led0_b => led0_b,
        led1_r => led1_r,
        led1_g => led1_g,
        led1_b => led1_b,
        led2_r => led2_r,
        led2_g => led2_g,
        led2_b => led2_b,
        led3_r => led3_r,
        led3_g => led3_g,
        led3_b => led3_b 
    );
    
    
    SR_OUT_L <= led2_b;
    SR_OUT_R <= led3_b;
    Calc_Done <= led0_g;
    My_S <= led & led3_r & led2_r & led1_r & led0_r;
    
    MyTestProc : process
    begin
    	led2_b <='1';
        WAIT FOR 4000 ns;
    end process;
    


end Behavioral;
