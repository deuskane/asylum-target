-------------------------------------------------------------------------------
-- Title      : Clock Buffer Global
-- Project    : PicoSOC
-------------------------------------------------------------------------------
-- File       : cbufg.vhd
-- Author     : Mathieu Rosière
-- Company    : 
-- Created    : 2025-08-11
-- Last update: 2025-08-12
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

  ins_nx_bd : NX_BD
    generic map (
      mode => "global_lowskew"
      )
    port    map (
      I	   => d_i,
      O	   => d_o
      );
  
end rtl;
