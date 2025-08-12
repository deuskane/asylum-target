-------------------------------------------------------------------------------
-- Title      : 2 FF synchronizer
-- Project    : PicoSOC
-------------------------------------------------------------------------------
-- File       : sync2dff.vhd
-- Author     : Mathieu Rosière
-- Company    : 
-- Created    : 2025-01-06
-- Last update: 2025-08-11
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2013 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author   Description
-- 2025-01-06  1.0      mrosiere Created
-------------------------------------------------------------------------------

library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.numeric_std.ALL;

entity sync2dff is
  port   (
    clk_i    : in  std_logic; -- Input  Clock
    d_i      : in  std_logic; -- Input  data
    q_o      : out std_logic  -- Output data
    );
end sync2dff;

architecture rtl of sync2dff is

  constant WIDTH : natural := 2;
  signal   q_r   : std_logic_vector(WIDTH-1 downto 0);  -- Synchronization chain
  
begin

  process (clk_i) is
  begin  -- process
    if rising_edge(clk_i)
    then

      q_r <= q_r(WIDTH-2 downto 0)  & d_i;
      
    end if;
  end process;

  -- Output
  q_o <= q_r(WIDTH-1);
  
end rtl;
