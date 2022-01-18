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
    component INSTRMEMORY is
    port(
    	clk : in STD_LOGIC;
    reset : in STD_LOGIC;
    INSTR_in : in STD_LOGIC_VECTOR(9 downto 0);
    INSTR_out : out STD_LOGIC_VECTOR(9 downto 0);
    INSTR_addr : in STD_LOGIC_VECTOR(6 downto 0);
    INSTR_CE : in STD_LOGIC;
    RIW0 : in STD_LOGIC
    );   
    end component;
    
    
    --Déclaration des signaux internes à l'architecture pour réaliser les simulations
    signal INSTR_in, INSTR_out : std_logic_vector(9 downto 0) := (others => '0');
    signal INSTR_addr : std_logic_vector(6 downto 0) := (others => '0');
    signal clk, reset, INSTR_CE, RIW0 : STD_LOGIC := '0';
    
begin

--Instanciation du composant à tester
MyComponentAddNbitsunderTest : INSTRMEMORY

--raccordement des ports du composant aux signaux dans l'architecture

port map(
	INSTR_in => INSTR_in,
    INSTR_addr => INSTR_addr,
    
    INSTR_out => INSTR_out,
    
    clk => clk,
    reset => reset,
    INSTR_CE=>INSTR_CE,
    RIW0 => RIW0
);

MyStimulus_Proc2 : process
begin
	INSTR_out <= "0000000000";
    WAIT FOR 20000 ns;
    INSTR_out <= "1111111111";
    WAIT FOR 10000 ns;
    INSTR_out <= "0000000000";
    WAIT FOR 10000 ns;
    end process;

end myAddNbitstestbench_Arch;
