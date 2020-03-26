
-- *********************************************************************/ 
-- Copyright (c) 2009 Actel Corporation.  All rights reserved.  
-- 
-- Any use or redistribution in part or in whole must be handled in 
-- accordance with the Actel license agreement and must be approved 
-- in advance in writing.  
--  
-- File : openbank.vhd $
--     
-- Description: This block of code tracks the state of one bank inside the SDRAM.
--              Based on the commands issued to this bank, and the SDRAM timing parameters,
--              this state machine indicates when commands can be issued to the SDRAM.
--
-- Revision : $
--
-- Notes:
--
-- *********************************************************************/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity openbank is
    generic (
        sdram_chipbits          : integer := 3;
        sdram_rowbits           : integer := 14 
 
        );
    port (
        clk                     : in std_logic;                                   -- system clock
        reset_n                 : in std_logic;                                   -- system reset (active low)
        sd_init                 : in std_logic;                                   -- strobe to cause reinitialization of sdram
        goactive                : in std_logic;                                   -- signal to activate this bank
        dorw                    : in std_logic;                                   -- signal to begin a read or write on this bank
        readcmd                 : in std_logic;                                   -- inidcates whether dorw is read or write
        dopc                    : in std_logic;                                   -- signal to start a precharge of this bank
        actv                    : in std_logic;                                   -- signal to activate some bank
        doref                   : in std_logic;                                   -- signal to begin a refresh
        dopch                   : in std_logic;                                   -- signal to begin a global precharge
        domode                  : in std_logic;                                   -- signal to begin a mode write
        bsize                   : in std_logic_vector(3 downto 0);                -- number of beats to the burst 
        auto_pch                : in std_logic;                                   -- auto precharge request flag
        lineaddr                : in std_logic_vector(sdram_rowbits-1 downto 0);               -- line address
        chipaddr                : in std_logic_vector(sdram_chipbits-1 downto 0); -- chip address  
        ras                     : in std_logic_vector(3 downto 0);                -- minimum time between activate and precharge  
        rcd                     : in std_logic_vector(2 downto 0);                -- minimum time between activate and read/write  
        rrd                     : in std_logic_vector(1 downto 0);                -- minimum time between activate to activate in different banks  
        rp                      : in std_logic_vector(2 downto 0);                -- minimum precharge to activate  
        mrd                     : in std_logic_vector(2 downto 0);                -- minimum loadmode to activate command  
        rc                      : in std_logic_vector(3 downto 0);                -- minimum activate to activate in same bank  
        rfc                     : in std_logic_vector(3 downto 0);
        wr                      : in std_logic_vector(1 downto 0);                -- minimum delay from write to precharge
        bl                      : in std_logic_vector(1 downto 0);                -- burst length  
        actable                 : out std_logic;                                  -- flag to indicate bank can go active
        rwable                  : out std_logic;                                  -- flag to indicate bank can read/write  
        pcable                  : out std_logic;                                  -- flag to indicate bank can be precharged  
        active                  : out std_logic;                                  -- flag to indicate bank is active
        line                    : out std_logic_vector(sdram_rowbits-1 downto 0);              -- active line for this bank
        chip                    : out std_logic_vector(sdram_chipbits-1 downto 0) -- active chip address;   
        );
end openbank;

architecture rtl of openbank is

signal rc_shift                 : std_logic_vector(8 downto 0);
signal actable_shift            : std_logic_vector(12 downto 0);   
signal rwable_shift             : std_logic_vector(4 downto 0); 
signal pcable_shift             : std_logic_vector(8 downto 0);  
signal ras_shift                : std_logic_vector(6 downto 0);  
signal blen                     : std_logic_vector(3 downto 0);   

signal prev_cmd_read            : std_logic; -- indicates if previous dorw was a read or write

signal rwable_int               : std_logic;   
signal pcable_int               : std_logic;   
signal active_int               : std_logic;

signal rw_ap_in_progress        : std_logic;
signal auto_pch_event           : std_logic;

begin

-- copy internal signals to outputs (this gets around vhdl output read limitation) 
pcable <= pcable_int;
active <= active_int;
rwable <= rwable_int;

--
-- Track chip and line (row) last activated -- used by fastsdram to determine line hit/miss
--
process (clk, reset_n)
begin
    if (reset_n = '0') then
        line <= (others => '0');    
        chip <= (others => '0');    
    elsif (clk'event and clk = '1') then
        if sd_init = '1' then
            line <= (others => '0');    
            chip <= (others => '0');    
        else        
            if (goactive = '1') then
                line <= lineaddr;    
                chip <= chipaddr;    
            end if;
        end if;
    end if;
end process;


--
-- ACTIVE -- indicates when bank is active (open)
--
process (clk, reset_n)
begin
    if (reset_n = '0') then
        active_int <= '0';    
    elsif (clk'event and clk = '1') then
        if sd_init = '1' then
            active_int <= '0';    
        elsif (goactive = '1') then
            active_int <= '1';    
        elsif (dopch = '1' or dopc = '1' or (dorw = '1' and auto_pch = '1')) then
            active_int <= '0';    
        end if;
    end if;
end process;

--
-- actable_shift --  shift register to track when bank can be activated
-- ACTABLE -- asserted when bank ready for read/write command
--
process (clk, reset_n)
begin
    if (reset_n = '0') then
        actable_shift <= "1111111111111";    
        actable <= '1';    
    elsif (clk'event and clk = '1') then
        if sd_init = '1' then
            actable_shift <= "1111111111111";    
            actable <= '1';    
        else        
            actable_shift <= (not active_int) & actable_shift(12 downto 1);    
            actable <= actable_shift(0) and rc_shift(0);    
       
            if (doref = '1') then
                if (rfc >= 3 or rc_shift(0) = '0') then
                    actable <= '0';    
                else
                    actable <= '1';    
                end if;
                if (rfc >= 4) then
                   actable_shift(0) <= '0';    
                end if;
                if (rfc >= 5) then
                   actable_shift(1) <= '0';    
                end if;
                if (rfc >= 6) then
                   actable_shift(2) <= '0';    
                end if;
                if (rfc >= 7) then
                   actable_shift(3) <= '0';    
                end if;
                if (rfc >= 8) then
                   actable_shift(4) <= '0';    
                end if;
                if (rfc >= 9) then
                   actable_shift(5) <= '0';    
                end if;
                if (rfc >= 10) then
                   actable_shift(6) <= '0';    
                end if;
                if (rfc >= 11) then
                   actable_shift(7) <= '0';    
                end if;
                if (rfc >= 12) then
                   actable_shift(8) <= '0';    
                end if;
                if (rfc >= 13) then
                   actable_shift(9) <= '0';    
                end if;
                if (rfc >= 14) then
                   actable_shift(10) <= '0';    
                end if;
            elsif (dopch = '1' or dopc = '1' or auto_pch_event = '1') then
                actable_shift <= "1111111111111";    
                if (rp >= 3 or rc_shift(0) = '0') then
                   actable <= '0';    
                else
                   actable <= '1';    
                end if;
                if (rp >= 4) then
                   actable_shift(0) <= '0';    
                end if;
            elsif (dorw = '1' and auto_pch = '1') then
                --disable activate until auto_pch_event happens
                actable_shift <= "0000000000000";    
            elsif (domode = '1') then
                if (mrd >= 3 or rc_shift(0) = '0') then
                    actable <= '0';    
                else
                    actable <= '1';    
                end if;
                if (mrd >= 4) then
                   actable_shift(1 downto 0) <= "00";    
                end if;
                if (mrd >= 5) then
                   actable_shift(2) <= '0';    
                end if;
                if (mrd >= 6) then
                   actable_shift(3) <= '0';    
                end if;
                if (mrd = 7) then
                   actable_shift(4) <= '0';    
                end if;
            elsif (goactive = '1') then
                actable_shift <= "0000000000000";    
                actable <= '0';    
            elsif (actv = '1' and active_int = '0') then
                if (rrd >= 2) then
                   actable_shift(0) <= '0';    
                end if;
                if (rrd = 3) then
                   actable_shift(1) <= '0';    
                end if;
                actable <= '0';    
            end if;
        end if;
    end if;
end process;

--
-- rc_shift -- shift register to track activate command period to prevent RC violation
--
process(reset_n,clk)
begin
    if (reset_n = '0') then
        rc_shift <= "000000000";
    elsif (clk'event and (clk = '1')) then
        if (GOACTIVE = '1') then
            rc_shift <= "111111111";
            if (RC >= 4) then
                rc_shift(0) <= '0';
            end if;
            if (RC >= 5) then
                rc_shift(1) <= '0';
            end if;
            if (RC >= 6) then
                rc_shift(2) <= '0';
            end if;
            if (RC >= 7) then
                rc_shift(3) <= '0';
            end if;
            if (RC >= 8) then
                rc_shift(4) <= '0';
            end if;
            if (RC >= 9) then
                rc_shift(5) <= '0';
            end if;
            if (RC >= 10) then
                rc_shift(6) <= '0';
            end if;
            if (RC >= 11) then
                rc_shift(7) <= '0';
            end if;
            if (RC >= 12) then
                rc_shift(8) <= '0';
            end if;
        else
            rc_shift <= '1' & rc_shift(8 downto 1);
        end if;
    end if;
end process;


--
-- auto_pch_event -- strobes when autoprecharge happens.  This is used in actable computation to delay
--   activate after precharge for meeting RP spec
--
ap_event_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        rw_ap_in_progress <= '0';
        auto_pch_event <= '0';
    elsif (clk'event and (clk = '1')) then
        if (dorw = '1' and auto_pch = '1') then
            rw_ap_in_progress <= '1';
        elsif (auto_pch_event = '1') then
            rw_ap_in_progress <= '0';
        end if;
        
        if (rw_ap_in_progress = '1' and pcable_int = '1' and auto_pch_event = '0') then
            auto_pch_event <= '1';
        else
            auto_pch_event <= '0';
        end if;
    end if;    
end process;


--
-- rwable_shift --  shift register to track when bank is ready for read/write command
-- RWABLE -- asserted when bank ready for read/write command
--
rw_p:process(reset_n,clk)
 begin
    if (reset_n = '0') then
        rwable_shift <= "00000";
        rwable_int <= '0';
    elsif (clk'event and (clk = '1')) then
        rwable_shift <= active_int & rwable_shift(4 downto 1);
        rwable_int <= rwable_shift(0);
        if (goactive = '1') then
            rwable_shift <= "11111";
            if (auto_pch = '1' and  readcmd = '1' and (blen = 2 or blen = 1)) then 
                    --for read w/ autoprecharge and BLEN 1, or BLEN 2, use 5 clks to guarantee tRAP
                    -- Note: this is not optimal for many values of RAS, but BLEN 1 and 2 are inefficient anyway.
                    --   May be fine tuned for specific values of RAS, BLEN, and RCD, possibly at the expense of fmax.
                rwable_shift(1 downto 0) <= "00";
                rwable_int <= '0';
            elsif (rcd = 5) then
                rwable_shift(1 downto 0) <= "00";
                rwable_int <= '0';
            elsif (rcd = 4) then
                rwable_shift(0) <= '0';
                rwable_int <= '0';
            elsif (rcd = 3) then
                rwable_int <= '0';
            else
                rwable_int <= '1';
            end if;
        elsif (dopch = '1' or dopc = '1') then
            rwable_shift <= "00000";
            rwable_int <= '0';
        elsif (dorw = '1' and auto_pch = '1') then
            rwable_shift <= "00000";  --nothing rw-able after read/write w/ auto precharge
            rwable_int <= '0';
        end if;
    end if;        
end process rw_p;


--
-- pcable_shift -- shift register used for tracking when bank can be precharged
--
pcable_shift_p: process(reset_n, clk)
begin
    if (reset_n = '0') then
        pcable_shift <= "111111111";
    elsif (clk'event and (clk = '1')) then
        if dorw = '1' then
--             --SDR cases
                if (auto_pch = '1') then
                    case bl is
                    when "11" => pcable_shift <= "000000000";
                    when "10" => pcable_shift <= '1' & pcable_shift(8 downto 6) & "00000";
                    when "01" => pcable_shift <= '1' & pcable_shift(8 downto 4) & "000";
                    when "00" => pcable_shift <= '1' & pcable_shift(8 downto 3) & "00";
                    when others => pcable_shift <= "000000000";
                    end case;
                else
                    case bsize is
                    when "1000"   => pcable_shift <= "000000000";
                    when "0111"   => pcable_shift <= "000000000";
                    when "0110"   => pcable_shift <= "100000000";
                    when "0101"   => pcable_shift <= '1' & pcable_shift(8) & "0000000";
                    when "0100"   =>
                        if blen = 8 then --blen can only be 8 w/ SDR, let synth minimize
                            pcable_shift <= '1' & pcable_shift(8 downto 7) & "000000";
                        else
                            pcable_shift <= '1' & pcable_shift(8 downto 6) & "00000";
                        end if;
                    when others => --bsize 3,2,1
                        pcable_shift <= '1' & pcable_shift(8 downto 1) ;
                    end case;
                end if;

        else
            pcable_shift <= '1' & pcable_shift(8 downto 1);
        end if;
    end if;
end process pcable_shift_p;

--
-- ras_shift -- shift register used for tracking when precharge can be issued after activate (per tRAS spec)
--
ras_shift_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        ras_shift <= "1111111";
    elsif (clk'event and (clk = '1')) then
        if (actv = '1') then
            case ras is
            when "1111" => ras_shift <= "1111111"; --15 (invalid)
            when "1110" => ras_shift <= "1111111"; --14 (invalid)
            when "1101" => ras_shift <= "1111111"; --13 (invalid)
            when "1100" => ras_shift <= "1111111"; --12 (invalid)
            when "1011" => ras_shift <= "1111111"; --11 (invalid)
            when "1010" => ras_shift <= "1000000"; --10
            when "1001" => ras_shift <= "1100000"; --9
            when "1000" => ras_shift <= "1110000"; --8
            when "0111" => ras_shift <= "1111000"; --7
            when "0110" => ras_shift <= "1111100"; --6
            when "0101" => ras_shift <= "1111110"; --5
            when "0100" => ras_shift <= "1111111"; --4
            when others => ras_shift <= "1111111"; -- < 4
            end case;
        else
            ras_shift <= '1' & ras_shift(6 downto 1);
        end if;
    end if;
end process ras_shift_p;

            
--
-- PCABLE -- flags when bank can be precharged
--    For reads, bank is prechargeable x clocks after the read command, where x is the BSIZE
--    For writes, bank is prechargable x + WR clocks after write command, where x is BLEN, WR is tWR (in full clocks)
--
pcable_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        pcable_int <= '1';
    elsif (clk'event and (clk = '1')) then
        if (dorw = '1') then
            pcable_int <= '0';

        else -- sdr sdram
            if (prev_cmd_read = '0') then
                case wr is
                when "11" =>
                    if pcable_shift(2) = '1' and ras_shift(0) = '1' then
                        pcable_int <= '1';
                    else
                        pcable_int <= '0';
                    end if;
                when "10" =>
                    if pcable_shift(3) = '1' and ras_shift(0) = '1' then
                        pcable_int <= '1';
                    else
                        pcable_int <= '0';
                    end if;
                when others =>
                    if pcable_shift(4) = '1' and ras_shift(0) = '1' then
                        pcable_int <= '1';
                    else
                        pcable_int <= '0';
                    end if;
                end case;    
            else  --prev_cmd was a read -- precharge'able at end of burst for read
                if pcable_shift(4) = '1' and ras_shift(0) = '1' then
                    pcable_int <= '1';
                else
                    pcable_int <= '0';
                end if;
            end if;
        end if;
    end if;
end process pcable_p;                    


--
-- prev_cmd_read -- tracks whether previous command was read or write
--
prev_cmd_read_p:process(reset_n,clk)
begin
    if (reset_n = '0') then
        prev_cmd_read <= '1';
    elsif (clk'event and (clk = '1')) then
        if dorw = '1' then
            if readcmd = '1' then
                prev_cmd_read <= '1';
            else
                prev_cmd_read <= '0';
            end if;
        end if;
    end if;
end process prev_cmd_read_p;

--      
-- decode bl into actual burst length (number of local side data transfers)
--    
blen_p:process (bl)
begin
    case bl is
    when "00" => blen <= "0001";
    when "01" => blen <= "0010";
    when "10" => blen <= "0100";
    when "11" => blen <= "1000";
    when others => null;
    end case;
end process blen_p;

end rtl;
