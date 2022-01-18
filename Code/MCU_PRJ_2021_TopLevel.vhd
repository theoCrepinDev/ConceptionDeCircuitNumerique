----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2021 11:19:51
-- Design Name: 
-- Module Name: MCU_PRJ_2021_TopLevel - MCU_PRJ_2021_TopLevel_Arch
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MCU_PRJ_2021_TopLevel is
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
end MCU_PRJ_2021_TopLevel;

architecture MCU_PRJ_2021_TopLevel_Arch of MCU_PRJ_2021_TopLevel is

    component UALCore 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SR_IN_L : in STD_LOGIC;
           SR_IN_R : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (7 downto 0);
           SR_OUT_L : out STD_LOGIC;
           SR_OUT_R : out STD_LOGIC;
           SEL_FCT : in STD_LOGIC_VECTOR (3 downto 0));
    end component;
     

    component CMDBuffers
    Port (  clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           SEL_FCT_in : in STD_LOGIC_VECTOR (3 downto 0);
           SEL_OUT_In : in STD_LOGIC_VECTOR (1 downto 0);
           SEL_FCT_out : out STD_LOGIC_VECTOR (3 downto 0);
           SEL_OUT_out : out STD_LOGIC_VECTOR (1 downto 0)
     );
    end component;

    component INSTRMemory 
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           INSTR_in : in STD_LOGIC_VECTOR (9 downto 0);
           INSTR_out : out STD_LOGIC_VECTOR (9 downto 0);
           INSTR_addr : in STD_LOGIC_VECTOR (6 downto 0);
           INSTR_CE : in STD_LOGIC;
           RIW0  : in STD_LOGIC
    );
    end component;
    
    component UALBuffers
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           Buff_A_in : in STD_LOGIC_VECTOR (3 downto 0);
           Buff_B_in : in STD_LOGIC_VECTOR (3 downto 0);
           Mem_1_In : in STD_LOGIC_VECTOR (7 downto 0);
           Mem_2_In : in STD_LOGIC_VECTOR (7 downto 0);
           Buff_SR_IN_L : in STD_LOGIC;
           Buff_SR_IN_R : in STD_LOGIC; 
           CE_Buff_A : in STD_LOGIC;
           CE_Buff_B : in STD_LOGIC;
           CE_Mem_1 : in STD_LOGIC;
           CE_Mem_2 : in STD_LOGIC;
           CE_SR_IN_L : in STD_LOGIC;
           CE_SR_IN_R : in STD_LOGIC;
           Buff_A_out : out STD_LOGIC_VECTOR (3 downto 0);
           Buff_B_out : out STD_LOGIC_VECTOR (3 downto 0);
           Mem_1_out : out STD_LOGIC_VECTOR (7 downto 0);
           Mem_2_out : out STD_LOGIC_VECTOR (7 downto 0);
           Buff_SR_IN_L_out : out STD_LOGIC;
           Buff_SR_IN_R_out : out STD_LOGIC);
    end component;
    
    component UALSELOUT
    Port ( 
        SEL_OUT : in STD_LOGIC_VECTOR (1 downto 0);
        S : in STD_LOGIC_VECTOR (7 downto 0);
        MEM_CACHE_1 : in STD_LOGIC_VECTOR (7 downto 0);
        MEM_CACHE_2 : in STD_LOGIC_VECTOR (7 downto 0);
        Res_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
    end component;

    component UALSELROUTE
    Port ( 
            SEL_ROUTE : in STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (7 downto 0);
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Buf_A_out : in STD_LOGIC_VECTOR (3 downto 0);
            Buf_B_out : in STD_LOGIC_VECTOR (3 downto 0);
            Mem_1_out : in STD_LOGIC_VECTOR (7 downto 0);
            Mem_2_out : in STD_LOGIC_VECTOR (7 downto 0);
            Buf_A_in : out STD_LOGIC_VECTOR (3 downto 0);
            Buf_B_in : out STD_LOGIC_VECTOR (3 downto 0);
            Mem_1_In : out STD_LOGIC_VECTOR (7 downto 0);
            Mem_2_In : out STD_LOGIC_VECTOR (7 downto 0);
            CE_Buf_A : out STD_LOGIC;
            CE_Buf_B : out STD_LOGIC;
            CE_Mem_1 : out STD_LOGIC;
            CE_Mem_2 : out STD_LOGIC            
    );
    end component;

    -- Pour l'automate des 3 fonctions
    type t_Function_Main is (s_Idle, s_Funct_1, s_Funct_2, s_Funct_3);
    
    signal FSM_Main : t_Function_Main := s_Idle;
    signal MyCounter1 : STD_LOGIC_VECTOR (6 downto 0); 
    
    signal My_A, My_B, My_SEL_FCT, My_Buf_A_in, My_Buf_B_in, My_Buf_A_out, My_Buf_B_out : std_logic_vector(3 downto 0); 
    
    signal My_SR_IN_R, My_SR_IN_L, My_SR_OUT_R, My_SR_OUT_L, My_CE_Buf_A, My_CE_Buf_B, My_CE_Mem_1, My_CE_Mem_2, My_CE_SR_IN_L, My_CE_SR_IN_R, My_Buf_SR_IN_L_in, My_Buf_SR_IN_R_in, My_Buf_SR_IN_L_out, My_Buf_SR_IN_R_out,My_INSTR_CE, My_R1W0 : std_logic;
    
    signal My_S, My_Mem_1_In, My_Mem_2_In, My_Mem_1_out, My_Mem_2_out : std_logic_vector(7 downto 0);
    signal My_Res_out : STD_LOGIC_VECTOR (7 downto 0);
    signal My_SEL_OUT : STD_LOGIC_VECTOR (1 downto 0);
    signal My_INSTR_in, My_INSTR_out : STD_LOGIC_VECTOR (9 downto 0);
    signal My_INSTR_addr : STD_LOGIC_VECTOR (6 downto 0);

begin

    MyUALCore : UALCore 
    Port Map ( A => My_Buf_A_out,
            B => My_Buf_B_out,
            SR_IN_L => My_Buf_SR_IN_L_out,
            SR_IN_R => My_Buf_SR_IN_R_out,
            S => My_S,
            SR_OUT_L => led3_b,
            SR_OUT_R => led2_b,
            SEL_FCT => My_SEL_FCT
    );
    
     MyCMDBuffers : CMDBuffers
       Port Map (  clk => CLK100MHZ,
               reset => btn(0),
               SEL_FCT_in => My_INSTR_out(9 downto 6),
               SEL_OUT_In => My_INSTR_out(1 downto 0),
               SEL_FCT_out => My_SEL_FCT,
               SEL_OUT_out => My_SEL_OUT
        );    
   
       MyINSTRMemory : INSTRMemory 
       Port Map ( clk => CLK100MHZ,
              reset => btn(0),
              INSTR_in => (others => '0'),
              INSTR_out => My_INSTR_out,
              INSTR_addr => MyCounter1,
              INSTR_CE => '1',
              RIW0  => '1'
       );
   
       MyUALBuffers : UALBuffers
       Port Map ( clk => CLK100MHZ,
              reset => btn(0),
              Buff_A_in => My_Buf_A_in,
              Buff_B_in => My_Buf_B_in,
              Mem_1_In => My_Mem_1_in,
              Mem_2_In => My_Mem_2_in,
              Buff_SR_IN_L => My_Buf_SR_IN_L_in,
              Buff_SR_IN_R => My_Buf_SR_IN_R_in,
              CE_Buff_A => My_CE_Buf_A,
              CE_Buff_B => My_CE_Buf_B,
              CE_Mem_1 => My_CE_Mem_1,
              CE_Mem_2 => My_CE_Mem_1,
              CE_SR_IN_L => '1',
              CE_SR_IN_R => '1',
              Buff_A_out => My_Buf_A_out,
              Buff_B_out => My_Buf_B_out,
              Mem_1_out => My_Mem_1_out,
              Mem_2_out => My_Mem_2_out,
              Buff_SR_IN_L_out => My_Buf_SR_IN_L_out,
              Buff_SR_IN_R_out => My_Buf_SR_IN_R_out 
        );
   
       MyUALSELOUT : UALSELOUT
       Port Map ( 
           SEL_OUT => My_Sel_Out,
           S => My_S,
           MEM_CACHE_1 => My_Mem_1_out,
           MEM_CACHE_2 => My_Mem_2_out,
           Res_out => My_Res_Out
       );
   
       MyUALSELROUTE : UALSELROUTE
       Port Map ( 
           SEL_ROUTE => My_INSTR_out(5 downto 2),
           S => My_S,
           A => My_A,
           B => My_B,
           Buf_A_out => My_Buf_A_out,
           Buf_B_out => My_Buf_B_out,
           Mem_1_out => My_Mem_1_out,
           Mem_2_out => My_Mem_2_out,
           Buf_A_in => My_Buf_A_in,
           Buf_B_in => My_Buf_B_in,
           Mem_1_In => My_Mem_1_In,
           Mem_2_In => My_Mem_2_In,
           CE_Buf_A => My_CE_Buf_A,
           CE_Buf_B => My_CE_Buf_B,
           CE_Mem_1 => My_CE_Mem_1,
           CE_Mem_2 => My_CE_Mem_2            
       );

--Gestion des valeurs par d�faut :
    My_Buf_SR_IN_L_in <= '0';
    My_Buf_SR_IN_R_in <= '0';
    MyCounter1 <= (others => '0');
    My_Res_Out <= (others => '0');
    
    led <= My_Res_Out (7 downto 4);
    led0_r <= My_Res_Out (0); led0_b <= '0'; led0_g <= '0';               
    led1_r <= My_Res_Out (1); led1_g <= '0'; led1_b <= '0'; 
    led2_r <= My_Res_Out (2); led2_g <= '0'; led2_b <= '0';                 
    led3_r <= My_Res_Out (3); led3_g <= '0'; led3_b <= '0'; 
    
-- Gestion des 3 algorithmes
MyAlgoProc : process (btn(3 downto 0), CLK100MHZ)
begin
    
end process;

end MCU_PRJ_2021_TopLevel_Arch;