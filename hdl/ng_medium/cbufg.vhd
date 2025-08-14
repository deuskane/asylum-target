-------------------------------------------------------------------------------
-- Title      : Clock Buffer Global
-- Project    : PicoSOC
-------------------------------------------------------------------------------
-- File       : cbufg.vhd
-- Author     : Mathieu Rosière
-- Company    : 
-- Created    : 2025-08-11
-- Last update: 2025-08-14
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: Clock Buffer Global
-------------------------------------------------------------------------------
-- Copyright (c) 2025
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author   Description
-- 2025-08-11  1.0      mrosiere Created
-------------------------------------------------------------------------------

library IEEE;
use     IEEE.STD_LOGIC_1164.ALL;
use     IEEE.numeric_std.ALL;

library nx;
use     nx.nxPackage.all;

entity cbufg is
  port   (
    d_i    : in  std_logic; -- Input  Clock
    d_o    : out std_logic  -- Output Clock
    );
end cbufg;

architecture rtl of cbufg is
begin

  -- ins_clock_buffer : NX_BD
  --   generic map (
  --     mode => "global_lowskew"
  --     )
  --   port    map (
  --     I    => d_i,
  --     O    => d_o
  --     );

  -- ins_clock_buffer : NX_CSC
  --   port    map (
  --     I    => d_i,
  --     O    => d_o
  --     );

  ins_clock_buffer :  NX_WFG
    generic map(
        location     => "",
        wfg_edge     => '0',             -- 0: no invert / Rising
        mode         => '0',             -- 0: no pattern - 1: pattern
        pattern_end  => 0,               -- 0: to 15 (1 step to 16 steps)                 
        pattern      => (others => '0'), -- pattern p0 ... p15
        delay_on     => '0',             -- 0: no delay - 1: delay 
        delay        => 0                -- 0 to 63 (1 unit to 64 unit)
    )
    port map(
        ZI           => d_i,
        ZO           => d_o,
        SI           => '0',
        SO           => open,
        RDY          => '1'
    );
  
end rtl;
