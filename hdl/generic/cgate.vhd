-------------------------------------------------------------------------------
-- Title      : Gated Clock
-- Project    : PicoSOC
-------------------------------------------------------------------------------
-- File       : cgate.vhd
-- Author     : Mathieu Rosière
-- Company    : 
-- Created    : 2017-03-31
-- Last update: 2025-08-11
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Clock Gate
-------------------------------------------------------------------------------
-- Copyright (c) 2013 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author   Description
-- 2017-03-31  1.0      mrosiere Created
-- 2025-01-06  2.0      mrosiere Rename module and port
-------------------------------------------------------------------------------

library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.numeric_std.ALL;

entity cgate is
  port   (
    clk_i    : in  std_logic; -- Input Clock
    cke_i    : in  std_logic; -- Clock command (active high)
                              --   0 disable clock
                              --   1 enable  clock
    clk_o    : out std_logic; -- Output Clock
    dft_te_i : in  std_logic  -- Test enable (active high)
    );
end cgate;

architecture rtl of cgate is
  signal cke   : std_logic; -- Clock enable
  signal cke_l : std_logic; -- Clock enable latched
begin

  -- Command depends of cke_i and test mode
  cke <= cke_i or dft_te_i;
  
  -- Latch 
  process (clk_i,cke) is
  begin  -- process
    if clk_i = '0'
    then
      cke_l <= cke;
    end if;
  end process;

  -- Gated output
  clk_o <= clk_i and cke_l;
  
end rtl;
