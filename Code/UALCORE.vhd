----------------------------------------------------------------------------------
-- Company: Efrei Paris promotion 2024
-- Engineer:    BURETTE Jules
--              CREPIN Théo
-- 
-- Create Date: 07.11.2021 11:19:51
-- Design Name: MCU_PRJ_2021_TopLevel
-- Module Name: UALCORE
-- Project Name: Conception de circuit numérique
-- Target Devices: Xilinx Artix-35T FPGA 
-- Tool Versions: 
-- associe les valeurs de A, B et des SR_IN L et R aux  singaux S et SR_OUT L et R en fonction de la valeur de SEL_FCT
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
use ieee.std_logic_unsigned.all;

-- Déclaration de l'entité
entity UALCORE is
	-- Déclaration des ports de l'entité
	port(
    	A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        SEL_FCT : in STD_LOGIC_VECTOR(3 downto 0);
        SR_IN_L : in STD_LOGIC;
        SR_IN_R : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR(7 downto 0);
        SR_OUT_R : out STD_LOGIC;
        SR_OUT_L : out STD_LOGIC
    );
end UALCORE;

architecture UALCORE_Arch of UALCORE is
	-- Déclaration des signaux de sortie de l'entité
	signal sS : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal sSR_OUT_R ,sSR_OUT_L : STD_LOGIC := '0';
begin
	-- Association des signaux de sortie au port de Sortie de l'entité
	S <= sS;
	SR_OUT_R <= sSR_OUT_R;
	SR_OUT_L <= sSR_OUT_L;
	
	
	MyUalCoreProc : process (A, B, SEL_FCT, SR_IN_L, SR_IN_R) -- dès qu'une entrée bouge on regarde ce qui se passe
	-- Ce process regarde la valeur de SEL_FCT et met les valeurs d'entrée sur les bonne valeurs de sortie.

    begin
    	case SEL_FCT is 
        	when "0000" => 
            	sS <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
         	when "0001" => 
            	sS(3 downto 0) <= A(3 downto 0); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "0010" => 
            	sS(3 downto 0) <= B(3 downto 0); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "0011" => 
            	sS(3 downto 0) <= not A(3 downto 0); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "0100" => 
            	sS(3 downto 0) <= not B(3 downto 0); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "0101" => 
            	sS(3 downto 0) <= (A and B); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "0110" => 
            	sS(3 downto 0) <= (A or B); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "0111" => 
            	sS(3 downto 0) <= (A xor B); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "1000" => 
            	sS(3) <= SR_IN_L;sS(2 downto 0) <= A(3 downto 1); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= A(0);
            when "1001" => 
            	sS(0) <= SR_IN_R;sS(3 downto 1) <= A(2 downto 0); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= A(3); sSR_OUT_R <= '0';
            when "1010" => 
            	sS(3) <= SR_IN_L;sS(2 downto 0) <= B(3 downto 1); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= B(0);
            when "1011" => 
            	sS(0) <= SR_IN_R;sS(3 downto 1) <= B(2 downto 0); sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= B(3); sSR_OUT_R <= '0';
            when "1100" => 
            	sS <= (A + B) ;sS(4) <= SR_IN_R; sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
           	when "1101" => 
            	sS(3 downto 0) <= (A + B) ; sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "1110" => 
            	sS <= (A - B) ; sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when "1111" => 
            	sS <= (A * B) ; sS(7 downto 4) <= (others => '0'); sSR_OUT_L <= '0'; sSR_OUT_R <= '0';
            when others =>
            	sSR_OUT_L <= '0';
				sS(7 downto 0) <= (others => '0');
				sSR_OUT_R <= '0';
		end case;
	end process;
end UALCORE_Arch;