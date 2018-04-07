library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LFSR1 is
    Port( clk : in  STD_LOGIC;
           ld  : in  STD_LOGIC;
           data: in  STD_LOGIC_VECTOR(18 downto 0) := (OTHERS => '0');
           R   : out STD_LOGIC
      );
end LFSR1;

ARCHITECTURE first OF LFSR1 IS
  signal q : STD_LOGIC_VECTOR(18 downto 0) := (OTHERS => '0');
BEGIN
  PROCESS(clk, ld, data)
  BEGIN
    if(ld = '1')
    then
      q <= data;
    elsif(clk'event and clk = '1')
    then
      q(18 downto 1) <= q(17 downto 0);
      q(0) <= (q(18) XOR q(17) XOR q(16) XOR q(13));
    end if;
  END PROCESS;
  R <= q(18);
END first;
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity LFSR2 is
    Port( clk : in  STD_LOGIC;
          ld  : in STD_LOGIC;
          data: in  STD_LOGIC_VECTOR(21 downto 0) := (OTHERS => '0');
          R   : out STD_LOGIC
        );
end LFSR2;

ARCHITECTURE second OF LFSR2 IS
  signal q : STD_LOGIC_VECTOR(21 downto 0) := (OTHERS => '0');
BEGIN
  PROCESS(clk, ld, data)
  BEGIN
    if(ld = '1')
    then
      q <= data;
    elsif(clk'event and clk = '1')
    then
      q(21 downto 1) <= q(20 downto 0);
      q(0) <= (q(21) XOR q(20));
    end if;
  END PROCESS;
  R <= q(21);
END second;
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity LFSR3 is
    Port ( clk : in  STD_LOGIC;
        ld  : in STD_LOGIC;
        data: in  STD_LOGIC_VECTOR(22 downto 0) := (OTHERS => '0');
        R   : out STD_LOGIC
        );
end LFSR3;
ARCHITECTURE third OF LFSR3 IS
  signal q : STD_LOGIC_VECTOR(22 downto 0) := (OTHERS => '0');
BEGIN
  PROCESS(clk, ld, data)
  BEGIN
    if(ld = '1')
    then
      q <= data;
    elsif(clk'event and clk = '1')
    then
      q(22 downto 1) <= q(21 downto 0);
      q(0) <= (q(22) XOR q(21) XOR q(20) XOR q(7));
    end if;
  END PROCESS;
  R <= q(22);
END third;
