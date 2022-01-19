


----------------------------------------------------------------------------------
-- Company: Efrei Paris promotion 2024
-- Engineer:    BURETTE Jules
--              CREPIN Théo
-- 
-- Create Date: 07.11.2021 15:13:55
-- Design Name: MCU_PRJ_2021_TopLevel
-- Module Name: TopLevelSim - Behavioral
-- Project Name: Conception de circuit numérique
-- Target Devices: Xilinx Artix-35T FPGA 
-- Tool Versions: 
-- Description: 
--  Fichier de test bench permettant les simuations des actions réalisées par l'utilisateur.
-- Exemple mise de A et B à la valeur 4 et appuis sur le bouton 3.
-- Cela permet d'observer les réaction de notre code à travers l'observation des états d'entrées et sortie à l'aide de l'EPWave  
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------



-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity TopLevelSim is
--  Port ( );
end TopLevelSim;

architecture Behavioral of TopLevelSim is

    --déclaration du composent à simuler, ici notre composant MCU_PRJ_2021_TopLevel
    component MCU_PRJ_2021_TopLevel is
        -- déclaration de ses E/S comme dans le fichier design.
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

    --déclaration des signaux à observer de la carte et à connecter aux E/S.
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
    
    --Association des signaux aux E/S.
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
    
    -- déclarations des process

    -- on déclare le fonctionnement de la clk ici on la règle à 100MHZ.
    MyClkProc : process
    begin
        CLK100MHZ <= '0';
        WAIT FOR 5 ns;
        CLK100MHZ <= '1';
        WAIT FOR 5 ns;
    end process;

    -- on déclare le process de simulation des action de l'utilisateur sur la carte 
    MyTestProc : process
    begin

        -- par exemple ici on règle le switch (valeur de A et B) sur la valeur 2.
    	sw <= "0010";
        -- puis on appuis sur le bouton 0 de la carte. 'User push buttons'.
        btn <= "0001";
        WAIT FOR 7 ns;
        sw <= "1010";
        btn <= "0000";
        WAIT FOR 20 ns;
        
        sw <= "1010";
        -- ici on déclenche le premier calcul (RES_OUT_1) par appuis sur le bouton 1 de la carte.
        btn <= "0010";
        WAIT FOR 100 ns;
        sw <= "0010";
        btn <= "0001";
        WAIT FOR 20 ns;
        
        sw <= "0010";
        btn <= "0100";
        WAIT FOR 100 ns;
        sw <= "0010";
        btn <= "0001";
        WAIT FOR 20 ns;
        
        sw <= "0011";
        btn <= "1000";
        WAIT FOR 150 ns;
        sw <= "0010";
        btn <= "0001";
        WAIT FOR 20 ns;
    end process;
    


end Behavioral;
