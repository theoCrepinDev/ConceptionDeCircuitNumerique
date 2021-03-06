library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UALSELOUT is
    Port (
        SEL_OUT : in STD_LOGIC_VECTOR(1 downto 0);
        MEM_CACHE_1 : in STD_LOGIC_VECTOR(7 downto 0);
        MEM_CACHE_2 : in STD_LOGIC_VECTOR(7 downto 0);
        s : in STD_LOGIC_VECTOR(7 downto 0);
        RES_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end UALSELOUT;

architecture UALSELOUT_Arch of UALSELOUT is
	signal sRES_OUT : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
begin
	RES_OUT <= sRES_OUT;

    MySelOutProc : process (SEL_OUT, MEM_CACHE_1, MEM_CACHE_2, s)
    --dès qu'une entrée bouge on regarde ce qui se passe
    begin
        case SEL_OUT is
            when "00" => -- aucune sortie on met RES_OUT à 0
                sRES_OUT <= (others => '0');
            when "01" =>
                sRES_OUT(7 downto 0) <= MEM_CACHE_1(7 downto 0);
            when "10" =>
                sRES_OUT(7 downto 0) <= MEM_CACHE_2(7 downto 0);
            when others =>
                sRES_OUT(7 downto 0) <= s(7 downto 0);
        end case;
    end process;

end UALSELOUT_Arch;