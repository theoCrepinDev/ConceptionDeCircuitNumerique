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
    component UALSELOUT is
    port(
    	SEL_OUT : in STD_LOGIC_VECTOR(1 downto 0);
        MEM_CACHE_1 : in STD_LOGIC_VECTOR(7 downto 0);
        MEM_CACHE_2 : in STD_LOGIC_VECTOR(7 downto 0);
        s : in STD_LOGIC_VECTOR(7 downto 0);
        RES_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );   
    end component;
    
    
    --Déclaration des signaux internes à l'architecture pour réaliser les simulations
    signal sSEL_OUT			: std_logic_vector(1 downto 0) := (others => '0');
    signal sMEM_CACHE_1, sMEM_CACHE_2, ss, sRES_OUT 			: std_logic_vector(7 downto 0) := (others => '0');
    
begin

--Instanciation du composant à tester
MyComponentAddNbitsunderTest : UALSELOUT

--raccordement des ports du composant aux signaux dans l'architecture

port map(
	SEL_OUT => sSEL_OUT,
    MEM_CACHE_1 => sMEM_CACHE_1,
    MEM_CACHE_2 => sMEM_CACHE_2,
    s => ss,
    RES_OUT => sRES_OUT
);

MyStimulus_Proc2 : process
begin
	sRES_OUT <= "00000000";
    WAIT FOR 20000 ns;
	sSEL_OUT <= "01";
    WAIT FOR 10000 ns;
    sMEM_CACHE_1 <= "11111111";
    WAIT FOR 10000 ns;
    sMEM_CACHE_1 <= "00000000";
    WAIT FOR 10000 ns;
    sSEL_OUT <= "01";
    WAIT FOR 4000 ns;
    end process;

end myAddNbitstestbench_Arch;
