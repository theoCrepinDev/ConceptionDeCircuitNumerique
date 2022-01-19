----------------------------------------------------------------------------------
-- Company: Efrei Paris promotion 2024
-- Engineer:    BURETTE Jules
--              CREPIN Théo
-- 
-- Create Date: 07.11.2021 11:19:51
-- Design Name: MCU_PRJ_2021_TopLevel
-- Module Name: UALBUFFERS
-- Project Name: Conception de circuit numérique
-- Target Devices: Xilinx Artix-35T FPGA 
-- Tool Versions: 
-- Gère la mise en mémoire et le maintient des données des buffers et des mémoires
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
entity UALBUFFERS is 
-- Déclaration des entrées sorties de l'entité
port( 
	clk : in STD_LOGIC;
    reset : in STD_LOGIC;
	Mem_1_IN : in STD_LOGIC_VECTOR( 7 downto 0);
    CE_Mem_1 : in STD_LOGIC;
    Mem_2_IN : in STD_LOGIC_VECTOR( 7 downto 0);
    CE_Mem_2 : in STD_LOGIC;
	Buff_A_IN : in STD_LOGIC_VECTOR( 3 downto 0);
    CE_Buff_A : in STD_LOGIC;
    Buff_B_IN : in STD_LOGIC_VECTOR( 3 downto 0);
    CE_Buff_B : in STD_LOGIC;
    Buff_SR_IN_L : in STD_LOGIC;
    CE_SR_IN_L : in STD_LOGIC;
    Buff_SR_IN_R : in STD_LOGIC;
    CE_SR_IN_R : in STD_LOGIC;
    Buff_SR_IN_L_out : out STD_LOGIC;
    Buff_SR_IN_R_out : out STD_LOGIC;
    Mem_1_out : OUT STD_LOGIC_VECTOR( 7 downto 0);
    Mem_2_out : OUT STD_LOGIC_VECTOR( 7 downto 0);
    Buff_A_out : OUT STD_LOGIC_VECTOR( 3 downto 0);
	Buff_B_out : OUT STD_LOGIC_VECTOR( 3 downto 0)
 );
 end UALBUFFERS;
 
 architecture UALBUFFERS_Arch of UALBUFFERS is
    -- Déclarations des signaux de sortie de l'entité
 	signal sBuff_SR_IN_L_out, sBuff_SR_IN_R_out : std_logic := '0';
    signal sMem_1_out, sMem_2_out :STD_LOGIC_VECTOR( 7 downto 0) := (others => '0');
    signal sBuff_A_out, sBuff_B_out :STD_LOGIC_VECTOR( 3 downto 0) := (others => '0');
 
 begin
    -- Association des signaux aux ports de sorties de l'entité
 	Buff_SR_IN_L_out <= sBuff_SR_IN_L_out;
	Buff_SR_IN_R_out <= sBuff_SR_IN_R_out;
	Mem_1_out <= sMem_1_out;
	Mem_2_out <= sMem_2_out;
	Buff_A_out <= sBuff_A_out;
	Buff_B_out <= sBuff_A_out;
 	
    -- L'ensemble de ces process a pour but de mettre les valeurs de entrées buffers et mémoires sur les signaux de sorties
    -- à chaque front montant de la clock et ce tant que le reset n'est pas demandé.

 	BufAProc : process (reset, clk, CE_Buff_A)
    begin
    	if reset = '1' then
        	sBuff_A_OUT <= (others => '0');
        else if(rising_edge(clk) and CE_Buff_A = '1') then
        	sBuff_A_OUT <= Buff_A_IN;
        end if;
        end if;
    end process;
    BufBProc : process (reset, clk, CE_Buff_B)
    begin
    	if reset = '1' then
        	sBuff_B_OUT <= (others => '0');
        else if(rising_edge(clk) and CE_Buff_B = '1') then
        	sBuff_B_OUT <= Buff_B_IN;
        end if;
        end if;
    end process;
    SR_IN_LProc : process (reset, clk, CE_SR_IN_L)
    begin
        if reset = '1' then
            sBuff_SR_IN_L_out <= '0'; 
        elsif (rising_edge(clk) and CE_SR_IN_L = '1') then
            sBuff_SR_IN_L_out <= Buff_SR_IN_L;
        end if;
    end process;
    
    SR_IN_RProc : process (reset, clk, CE_SR_IN_R)
    begin
        if reset = '1' then
            sBuff_SR_IN_R_out <= '0'; 
        elsif (rising_edge(clk) and CE_SR_IN_R = '1') then
            sBuff_SR_IN_R_out <= Buff_SR_IN_R;
        end if;
    end process;
    
    Mem_1Proc : process (reset, clk, CE_Mem_1)
    begin
        if reset = '1' then
            sMem_1_out <= (others => '0'); 
        elsif (rising_edge(clk) and CE_Mem_1 = '1') then
            sMem_1_out <= Mem_1_in;
        end if;
    end process;
    
    Mem_2Proc : process (reset, clk, CE_Mem_2)
    begin
        if reset = '1' then
            sMem_2_out <= (others => '0'); 
        elsif (rising_edge(clk) and CE_Mem_2 = '1') then
            sMem_2_out <= Mem_2_in;
        end if;
    end process;
end UALBUFFERS_Arch;