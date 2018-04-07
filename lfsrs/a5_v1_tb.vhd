library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.textio.all;

-- this is a testbench, but can be any other entity
entity a5_v1_tb is
  end a5_v1_tb;

architecture complex of a5_v1_tb is
  function to_bstring(sl : std_logic) return string is
    variable sl_str_v : string(1 to 3);  -- std_logic image with quotes around
  begin
    sl_str_v := std_logic'image(sl);
    return "" & sl_str_v(2);  -- "" & character to get string
  end function;

  function to_bstring(slv : std_logic_vector) return string is
    alias    slv_norm : std_logic_vector(1 to slv'length) is slv;
    variable sl_str_v : string(1 to 1);  -- String of std_logic
    variable res_v    : string(1 to slv'length);
  begin
    for idx in slv_norm'range loop
      sl_str_v := to_bstring(slv_norm(idx));
      res_v(idx) := sl_str_v(1);
    end loop;
    return res_v;
  end function;
  shared variable line_v : line;
  file output_file : text open write_mode is "output.txt";
  -- this clock runs at HOW MANY MHz?
  constant clock_period : time := 10 ns;

  -- clock signal
  signal clock : std_logic :=  '0';
  -- lines for loading-up LFSRs
  signal register1 : std_logic_vector(18 downto 0) := (others => '0');
  signal register2 : std_logic_vector(21 downto 0) := (others => '0');
  signal register3 : std_logic_vector(22 downto 0) := (others => '0');

  signal load  : std_logic := '0';
  -- outputs from LFSRs
  signal lfsr_1,lfsr_2,lfsr_3 : std_logic;
  signal result : std_logic := '0';

  component l1
    port(
          clk  : in STD_LOGIC;
          ld   : in STD_LOGIC;
          data : in STD_LOGIC_VECTOR(18 downto 0);
          R    : out STD_LOGIC );
  end component;
  component l2
    port(
          clk  : in STD_LOGIC;
          ld   : in STD_LOGIC;
          data : in STD_LOGIC_VECTOR(21 downto 0);
          R    : out STD_LOGIC );
  end component;
  component l3
    port(
          clk  : in STD_LOGIC;
          ld   : in STD_LOGIC;
          data : in STD_LOGIC_VECTOR(22 downto 0);
          R    : out STD_LOGIC );
  end component;
  -- remember? we defined two architectures for 'lfsr'
  for UUT1 : l1 use entity work.LFSR1(first);
  for UUT2 : l2 use entity work.LFSR2(second);
  for UUT3 : l3 use entity work.LFSR3(third);

begin

  UUT1 : l1 port map ( clk => clock, ld => load, data => register1, R => lfsr_1 );
  UUT2 : l2 port map ( clk => clock, ld => load, data => register2, R => lfsr_2 );
  UUT3 : l3 port map ( clk => clock, ld => load, data => register3, R => lfsr_3 );

clocker : process
    begin
      clock <= not clock;
      wait for clock_period/2;
end process;

-- this will run once and then wait for ever
init : process
begin
  -- time to tell LFSRs to load up some data
  load <= '1';
  -- and give it to them (to one of them, at least)
  -- register1 <= "0101010101010101011";
  -- register1 <= "0000000000000000000";
  -- register1 <= "0111111110101111101";
     register1 <= "0101010101010101010";
  -- register2 <= "1100001011101011111011";
  -- register2 <= "0101010101010101010101";
     register2 <= "1010101010101010101010";
  -- register2 <= "1111111111111111111111";
  -- register3 <= "01000111101011111011111";
  -- register3 <= "01010101010101010101010";
     register3 <= "01010101010101010101010";
  -- register3 <= "11111111111111111111111";
  wait until clock'event and clock = '0';
  -- ... and let them run freely

  load <= '0';
  -- this process is finished, make it wait ad infinitum
  wait;
end process;

writeOut : process
    variable l : line;
begin
    wait until clock'event and clock = '0';
    result <= lfsr_1 xor lfsr_2 xor lfsr_3;
    write(l, to_bstring(result));
    writeline(output, l);
    wait until clock'event and clock = '1';
end process;

end complex;
