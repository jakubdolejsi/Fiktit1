-- fsm.vhd: Finite State Machine
-- Author(s): 
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (TEST1, TEST2, TEST3, TEST4, TEST5, TEST6, TEST7A, TEST7B,TEST8A,TEST8B, TEST9A,TEST9B, TEST10A,TEST10B, TEST11, PRINT_MESSAGE_OK, FINISH, PRINT_MESSAGE_KO, ERROR);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= TEST1;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST1 =>
    next_state <= TEST1;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(9)='1') then
      next_state <= TEST2;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST2 =>
    next_state <= TEST2;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(5)='1') then
      next_state <= TEST3;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST3 =>
    next_state <= TEST3;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(4)='1') then
      next_state <= TEST4;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST4 =>
    next_state <= TEST4;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(3)='1') then
      next_state <= TEST5;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST5 =>
    next_state <= TEST5;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(7)='1') then
      next_state <= TEST6;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST6 =>
    next_state <= TEST6;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(4)='1') then
      next_state <= TEST7A;
    elsif(KEY(6)= '1') then
      next_state <= TEST7B;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST7A =>
    next_state <= TEST7A;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(5)='1') then
      next_state <= TEST8A;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST7B =>
    next_state <= TEST7B;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(6)='1') then
      next_state <= TEST8B;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
  -- - - - - - - - - - - - - - - - - - - - - - -
  when TEST8A =>
    next_state <= TEST8A;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(8)='1') then
      next_state <= TEST9A;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;

 -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST8B =>
    next_state <= TEST8B;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(8)='1') then
      next_state <= TEST9B;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
  -- - - - - - - - - - - - - - - - - - - - - - -
     when TEST9A =>
    next_state <= TEST9A;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(4)='1') then
      next_state <= TEST10A;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
  -- - - - 
   -- - - - - - - - - - - - - - - - - - - - - - -
      when TEST9B =>
    next_state <= TEST9B;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(4)='1') then
      next_state <= TEST10B;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
  -- - - - 
        when TEST10A =>
    next_state <= TEST10A;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_OK;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
  -- - - - - - - - - - - - - - - - - - - - - - -
        when TEST10B =>
    next_state <= TEST10B;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_KO;
      elsif(KEY(8)='1') then
      next_state <= TEST11;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
  -- - - - - - - - - - - - - - - - - - - - - - -
          when TEST11 =>
    next_state <= TEST11;
    if(KEY(15)='1') then
      next_state <= PRINT_MESSAGE_OK;
    elsif(KEY(14 downto 0) /= "000000000000000") then
    next_state <= ERROR;
  end if;
  -- - - - - - - - - - - - - - - - - - - - - - -
  when PRINT_MESSAGE_OK =>
      next_state <= PRINT_MESSAGE_OK;
      if (CNT_OF = '1') then
         next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         next_state <= TEST1; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_KO =>
      next_state <= PRINT_MESSAGE_KO;
      if(CNT_OF = '1') then
      next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when ERROR =>
     next_state <= ERROR;
     if(KEY(15) = '1') then
     next_state <=PRINT_MESSAGE_KO;
     end if;
    -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      null;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when PRINT_MESSAGE_OK =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
      FSM_MX_MEM     <= '1';
  -- - - - - - - - - - - - - - - - - - - - - - -    
    when PRINT_MESSAGE_KO =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
     if(KEY(14 downto 0) /= "000000000000000") then
      FSM_LCD_WR     <= '1';
    end if;
    if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
    
    
   end case;
end process output_logic;

end architecture behavioral;