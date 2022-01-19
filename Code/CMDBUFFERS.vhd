----------------------------------------------------------------------------------
-- Company: Efrei Paris promotion 2024
-- Engineer:    BURETTE Jules
--              CREPIN Théo
-- 
-- Create Date: 07.11.2021 11:19:51
-- Design Name: MCU_PRJ_2021_TopLevel
-- Module Name: CMDBuffers
-- Project Name: Conception de circuit numérique
-- Target Devices: Xilinx Artix-35T FPGA 
-- Tool Versions: 
-- Description: Gère la valeur de SEL_OUT et SEL_FCT pour la gestion des Buffers et Mémoires
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Déclaration de l'entité
entity CMDBuffers is
    -- Déclaration des ports E/S
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           SEL_FCT_in : in STD_LOGIC_VECTOR (3 downto 0);
           SEL_OUT_In : in STD_LOGIC_VECTOR (1 downto 0);
           SEL_FCT_out : out STD_LOGIC_VECTOR (3 downto 0);
           SEL_OUT_out : out STD_LOGIC_VECTOR (1 downto 0)
         );
    end CMDBuffers;
    
    architecture CMDBuffers_Arch of CMDBuffers is
        -- Création des signaux pour les sorties de l'entité
    	signal sSEL_OUT_out 			: std_logic_vector(1 downto 0) := (others => '0');
    	signal sSEL_FCT_out 			: std_logic_vector(3 downto 0) := (others => '0');
    
    
    	
    begin
        -- Association des signaux aux entrées et sorties
    	SEL_FCT_out <= sSEL_FCT_out;
    	SEL_OUT_out <= sSEL_OUT_out;
        
        --Process qui met la valeur de SEL_FCT à zéro si reset et garde la même sinon.
        SEL_FCT_Proc : process (reset, clk)
        begin
            if reset = '1' then
                sSEL_FCT_out <= (others => '0'); 
            elsif (rising_edge(clk)) then
                sSEL_FCT_out <= SEL_FCT_in;
            end if;
        end process;
        
        --Process qui met la valeur de SEL_OUT à zéro si reset et garde la même sinon.
        SEL_OUT_Proc : process (reset, clk)
        begin
            if reset = '1' then
                sSEL_OUT_out <= (others => '0'); 
            elsif (rising_edge(clk)) then
                sSEL_OUT_out <= SEL_OUT_In;
            end if;
        end process;
        
    
    end CMDBuffers_Arch;