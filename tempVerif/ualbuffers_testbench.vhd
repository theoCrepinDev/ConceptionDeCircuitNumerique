-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

--déclaration d'une entité pour la simulation sans ports d'entrées et de sorties
entity myAddNbitstestbench is

end myAddNbitstestbench;

architecture myAddNbitstestbench_Arch of myAddNbitstestbench is

	--declaration du composant a tester -> renvoit vers l'entité ET2
    component UALBUFFERS is
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
    end component;
    
    
    --Déclaration des signaux internes à l'architecture pour réaliser les simulations
    signal Mem_1_IN, Mem_2_IN, Mem_1_out , Mem_2_out : std_logic_vector(7 downto 0) := (others => '0');
    signal Buff_A_IN, Buff_B_IN, Buff_A_out, Buff_B_out : std_logic_vector(3 downto 0) := (others => '0');
    signal clk, reset, CE_Mem_1, CE_Mem_2, CE_Buff_A, CE_Buff_B, Buff_SR_IN_L, CE_SR_IN_L, Buff_SR_IN_R, CE_SR_IN_R ,Buff_SR_IN_L_out ,Buff_SR_IN_R_out  : STD_LOGIC := '0';
    
begin

--Instanciation du composant à tester
MyComponentAddNbitsunderTest : UALBUFFERS

--raccordement des ports du composant aux signaux dans l'architecture

port map(
	Mem_1_IN => Mem_1_IN,
    Mem_2_IN => Mem_2_IN,
    Mem_1_out => Mem_1_out,
    Mem_2_out => Mem_2_out,
    Buff_A_IN => Buff_A_IN,
    Buff_B_IN => Buff_B_IN,
    Buff_A_out => Buff_A_out,
    clk => clk,
    reset => reset,
    CE_Mem_1 => CE_Mem_1,
    CE_Mem_2 => CE_Mem_2,
    CE_Buff_A => CE_Buff_A,
    CE_Buff_B => CE_Buff_B,
    Buff_SR_IN_L => Buff_SR_IN_L,
    CE_SR_IN_L => CE_SR_IN_L,
    Buff_SR_IN_R => Buff_SR_IN_R,
    CE_SR_IN_R => CE_SR_IN_R,
    Buff_SR_IN_L_out => Buff_SR_IN_L_out,
    Buff_SR_IN_R_out => Buff_SR_IN_R_out
);

MyStimulus_Proc2 : process
begin
	Buff_A_out <= "0000";
    WAIT FOR 20000 ns;
    Buff_A_out <= "1111";
    WAIT FOR 10000 ns;
    Buff_A_out <= "0000";
    WAIT FOR 10000 ns;
    end process;

end myAddNbitstestbench_Arch;
