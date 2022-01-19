----------------------------------------------------------------------------------
-- Company: Efrei Paris promotion 2024
-- Engineer:    BURETTE Jules
--              CREPIN Théo
-- 
-- Create Date: 07.11.2021 11:19:51
-- Design Name: MCU_PRJ_2021_TopLevel
-- Module Name: UALSELOUT
-- Project Name: Conception de circuit numérique
-- Target Devices: Xilinx Artix-35T FPGA 
-- Tool Versions: 
-- associe les valeurs des mémoires cache 1 et 2 et S sur RES_OUT en fonction de la valeur de SEL_OUT
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

-- Déclaration de l'entité
entity UALSELOUT is
    -- Déclaration des port de l'entité
    Port (
        SEL_OUT : in STD_LOGIC_VECTOR(1 downto 0);
        MEM_CACHE_1 : in STD_LOGIC_VECTOR(7 downto 0);
        MEM_CACHE_2 : in STD_LOGIC_VECTOR(7 downto 0);
        s : in STD_LOGIC_VECTOR(7 downto 0);
        RES_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end UALSELOUT;

architecture UALSELOUT_Arch of UALSELOUT is
    -- Déclaration des signaux de sortie de l'entité
	signal sRES_OUT : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
    -- Association des signaux de sorties aux ports de sorties de l'entité
	RES_OUT <= sRES_OUT;

    MySelOutProc : process (SEL_OUT, MEM_CACHE_1, MEM_CACHE_2, s)
    --dès qu'une entrée bouge on regarde ce qui se passe
    begin
        case SEL_OUT is
            when "00" => -- aucune sortie on met RES_OUT à 0
                sRES_OUT <= (others => '0');
            when "01" => -- la sortie prend la valeur de MEM_CACHE_1
                sRES_OUT(7 downto 0) <= MEM_CACHE_1(7 downto 0);
            when "10" => -- la sortie prend la valeur de MEM_CACHE_2
                sRES_OUT(7 downto 0) <= MEM_CACHE_2(7 downto 0);
            when others => -- la sortie prend la valeur de s
                sRES_OUT(7 downto 0) <= s(7 downto 0);
        end case;
    end process;

end UALSELOUT_Arch;