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
    component UALCORE is
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
    end component;
    
    
    --Déclaration des signaux internes à l'architecture pour réaliser les simulations
    signal sA, sB, sSEL_FCT			: std_logic_vector(3 downto 0) := (others => '0');
    signal  ss			: std_logic_vector(7 downto 0) := (others => '0');
    signal sSR_IN_L, sSR_IN_R, sSR_OUT_R, sSR_OUT_L: STD_LOGIC := '0';
    
begin

--Instanciation du composant à tester
MyComponentAddNbitsunderTest : UALCORE

--raccordement des ports du composant aux signaux dans l'architecture

port map(
	A => sA,
    B => sB,
    SEL_FCT => sSEL_FCT,
    s => ss,
    SR_IN_L => sSR_IN_L,
    SR_IN_R=>sSR_IN_R,
    SR_OUT_R => sSR_OUT_R,
    SR_OUT_L => sSR_OUT_L
);

MyStimulus_Proc2 : process
begin
	ss <= "00000000";
    WAIT FOR 20000 ns;
	sSR_OUT_L <= '0';
    WAIT FOR 10000 ns;
    ss <= "11111111";
    WAIT FOR 10000 ns;
    ss <= "00000000";
    WAIT FOR 10000 ns;
    sSR_OUT_L <= '1';
    WAIT FOR 4000 ns;
    end process;

end myAddNbitstestbench_Arch;
