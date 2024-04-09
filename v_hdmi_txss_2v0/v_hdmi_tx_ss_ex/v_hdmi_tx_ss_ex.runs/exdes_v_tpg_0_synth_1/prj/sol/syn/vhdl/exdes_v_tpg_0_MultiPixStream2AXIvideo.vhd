-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity exdes_v_tpg_0_MultiPixStream2AXIvideo is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ovrlayYUV_dout : IN STD_LOGIC_VECTOR (47 downto 0);
    ovrlayYUV_num_data_valid : IN STD_LOGIC_VECTOR (4 downto 0);
    ovrlayYUV_fifo_cap : IN STD_LOGIC_VECTOR (4 downto 0);
    ovrlayYUV_empty_n : IN STD_LOGIC;
    ovrlayYUV_read : OUT STD_LOGIC;
    m_axis_video_TDATA : OUT STD_LOGIC_VECTOR (47 downto 0);
    m_axis_video_TVALID : OUT STD_LOGIC;
    m_axis_video_TREADY : IN STD_LOGIC;
    m_axis_video_TKEEP : OUT STD_LOGIC_VECTOR (5 downto 0);
    m_axis_video_TSTRB : OUT STD_LOGIC_VECTOR (5 downto 0);
    m_axis_video_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axis_video_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axis_video_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axis_video_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
    height : IN STD_LOGIC_VECTOR (15 downto 0);
    width : IN STD_LOGIC_VECTOR (15 downto 0);
    colorFormat : IN STD_LOGIC_VECTOR (7 downto 0);
    fid_in : IN STD_LOGIC_VECTOR (0 downto 0);
    fid : OUT STD_LOGIC_VECTOR (0 downto 0);
    fid_ap_vld : OUT STD_LOGIC;
    field_id : IN STD_LOGIC_VECTOR (15 downto 0) );
end;


architecture behav of exdes_v_tpg_0_MultiPixStream2AXIvideo is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv12_0 : STD_LOGIC_VECTOR (11 downto 0) := "000000000000";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_C : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001100";
    constant ap_const_lv12_FFF : STD_LOGIC_VECTOR (11 downto 0) := "111111111111";
    constant ap_const_lv8_1 : STD_LOGIC_VECTOR (7 downto 0) := "00000001";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv12_1 : STD_LOGIC_VECTOR (11 downto 0) := "000000000001";
    constant ap_const_lv5_0 : STD_LOGIC_VECTOR (4 downto 0) := "00000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal fidStored : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal counter : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal trunc_ln882_fu_186_p1 : STD_LOGIC_VECTOR (11 downto 0);
    signal trunc_ln882_reg_313 : STD_LOGIC_VECTOR (11 downto 0);
    signal div283_cast_fu_195_p4 : STD_LOGIC_VECTOR (11 downto 0);
    signal div283_cast_reg_318 : STD_LOGIC_VECTOR (11 downto 0);
    signal sub_fu_205_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal sub_reg_323 : STD_LOGIC_VECTOR (11 downto 0);
    signal cmp33265_fu_211_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal cmp33265_reg_338 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln975_fu_221_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln975_reg_342 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln975_1_fu_227_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln975_1_reg_347 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_2_fu_261_p2 : STD_LOGIC_VECTOR (11 downto 0);
    signal i_2_reg_355 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal p_load_reg_360 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln934_fu_256_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_done : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_idle : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_ready : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid_ap_vld : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ovrlayYUV_read : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TDATA : STD_LOGIC_VECTOR (47 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TVALID : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TREADY : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TKEEP : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TSTRB : STD_LOGIC_VECTOR (5 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TID : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TDEST : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_loc_1_out_o : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_loc_1_out_o_ap_vld : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_p_phi_out : STD_LOGIC_VECTOR (0 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_p_phi_out_ap_vld : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_ap_vld : STD_LOGIC;
    signal grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start_reg : STD_LOGIC := '0';
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal counter_loc_0_fu_108 : STD_LOGIC_VECTOR (15 downto 0);
    signal empty_fu_104 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_fu_96 : STD_LOGIC_VECTOR (11 downto 0);
    signal ap_block_state4_on_subcall_done : BOOLEAN;
    signal ap_block_state1 : BOOLEAN;
    signal sof_fu_100 : STD_LOGIC_VECTOR (0 downto 0);
    signal fid_preg : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state2_blk : STD_LOGIC;
    signal ap_ST_fsm_state3_blk : STD_LOGIC;
    signal ap_ST_fsm_state4_blk : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component exdes_v_tpg_0_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        sof : IN STD_LOGIC_VECTOR (0 downto 0);
        empty : IN STD_LOGIC_VECTOR (0 downto 0);
        div283_cast : IN STD_LOGIC_VECTOR (11 downto 0);
        fid_in_load : IN STD_LOGIC_VECTOR (0 downto 0);
        fid : OUT STD_LOGIC_VECTOR (0 downto 0);
        fid_ap_vld : OUT STD_LOGIC;
        ovrlayYUV_dout : IN STD_LOGIC_VECTOR (47 downto 0);
        ovrlayYUV_num_data_valid : IN STD_LOGIC_VECTOR (4 downto 0);
        ovrlayYUV_fifo_cap : IN STD_LOGIC_VECTOR (4 downto 0);
        ovrlayYUV_empty_n : IN STD_LOGIC;
        ovrlayYUV_read : OUT STD_LOGIC;
        icmp_ln975_1 : IN STD_LOGIC_VECTOR (0 downto 0);
        icmp_ln975 : IN STD_LOGIC_VECTOR (0 downto 0);
        m_axis_video_TDATA : OUT STD_LOGIC_VECTOR (47 downto 0);
        m_axis_video_TVALID : OUT STD_LOGIC;
        m_axis_video_TREADY : IN STD_LOGIC;
        m_axis_video_TKEEP : OUT STD_LOGIC_VECTOR (5 downto 0);
        m_axis_video_TSTRB : OUT STD_LOGIC_VECTOR (5 downto 0);
        m_axis_video_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axis_video_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axis_video_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
        m_axis_video_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
        field_id_load : IN STD_LOGIC_VECTOR (15 downto 0);
        sub_cast : IN STD_LOGIC_VECTOR (11 downto 0);
        counter_loc_1_out_i : IN STD_LOGIC_VECTOR (15 downto 0);
        counter_loc_1_out_o : OUT STD_LOGIC_VECTOR (15 downto 0);
        counter_loc_1_out_o_ap_vld : OUT STD_LOGIC;
        p_phi_out : OUT STD_LOGIC_VECTOR (0 downto 0);
        p_phi_out_ap_vld : OUT STD_LOGIC;
        counter : OUT STD_LOGIC_VECTOR (15 downto 0);
        counter_ap_vld : OUT STD_LOGIC );
    end component;



begin
    grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149 : component exdes_v_tpg_0_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start,
        ap_done => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_done,
        ap_idle => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_idle,
        ap_ready => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_ready,
        sof => sof_fu_100,
        empty => p_load_reg_360,
        div283_cast => div283_cast_reg_318,
        fid_in_load => fid_in,
        fid => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid,
        fid_ap_vld => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid_ap_vld,
        ovrlayYUV_dout => ovrlayYUV_dout,
        ovrlayYUV_num_data_valid => ap_const_lv5_0,
        ovrlayYUV_fifo_cap => ap_const_lv5_0,
        ovrlayYUV_empty_n => ovrlayYUV_empty_n,
        ovrlayYUV_read => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ovrlayYUV_read,
        icmp_ln975_1 => icmp_ln975_1_reg_347,
        icmp_ln975 => icmp_ln975_reg_342,
        m_axis_video_TDATA => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TDATA,
        m_axis_video_TVALID => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TVALID,
        m_axis_video_TREADY => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TREADY,
        m_axis_video_TKEEP => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TKEEP,
        m_axis_video_TSTRB => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TSTRB,
        m_axis_video_TUSER => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TUSER,
        m_axis_video_TLAST => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TLAST,
        m_axis_video_TID => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TID,
        m_axis_video_TDEST => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TDEST,
        field_id_load => field_id,
        sub_cast => sub_reg_323,
        counter_loc_1_out_i => counter_loc_0_fu_108,
        counter_loc_1_out_o => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_loc_1_out_o,
        counter_loc_1_out_o_ap_vld => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_loc_1_out_o_ap_vld,
        p_phi_out => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_p_phi_out,
        p_phi_out_ap_vld => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_p_phi_out_ap_vld,
        counter => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter,
        counter_ap_vld => grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_ap_vld);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((icmp_ln934_fu_256_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    fid_preg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                fid_preg <= ap_const_lv1_0;
            else
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    fid_preg <= fidStored;
                end if; 
            end if;
        end if;
    end process;


    grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
                    grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_ready = ap_const_logic_1)) then 
                    grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    counter_loc_0_fu_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                counter_loc_0_fu_108 <= counter;
            elsif (((cmp33265_reg_338 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4) and (grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_loc_1_out_o_ap_vld = ap_const_logic_1))) then 
                counter_loc_0_fu_108 <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_loc_1_out_o;
            end if; 
        end if;
    end process;

    empty_fu_104_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                empty_fu_104 <= fidStored;
            elsif (((cmp33265_reg_338 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4) and (grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_p_phi_out_ap_vld = ap_const_logic_1))) then 
                empty_fu_104 <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_p_phi_out;
            end if; 
        end if;
    end process;

    i_fu_96_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i_fu_96 <= ap_const_lv12_0;
            elsif (((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_boolean_0 = ap_block_state4_on_subcall_done))) then 
                i_fu_96 <= i_2_reg_355;
            end if; 
        end if;
    end process;

    sof_fu_100_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                sof_fu_100 <= ap_const_lv1_1;
            elsif (((cmp33265_reg_338 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_boolean_0 = ap_block_state4_on_subcall_done))) then 
                sof_fu_100 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state1)) then
                cmp33265_reg_338 <= cmp33265_fu_211_p2;
                div283_cast_reg_318 <= width(12 downto 1);
                icmp_ln975_1_reg_347 <= icmp_ln975_1_fu_227_p2;
                icmp_ln975_reg_342 <= icmp_ln975_fu_221_p2;
                sub_reg_323 <= sub_fu_205_p2;
                trunc_ln882_reg_313 <= trunc_ln882_fu_186_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((cmp33265_reg_338 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4) and (grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter_ap_vld = ap_const_logic_1))) then
                counter <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_counter;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln934_fu_256_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                fidStored <= empty_fu_104;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state2)) then
                i_2_reg_355 <= i_2_fu_261_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln934_fu_256_p2 = ap_const_lv1_0) and (cmp33265_reg_338 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                p_load_reg_360 <= empty_fu_104;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, cmp33265_reg_338, ap_CS_fsm_state2, icmp_ln934_fu_256_p2, ap_CS_fsm_state4, ap_block_state4_on_subcall_done)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln934_fu_256_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                elsif (((icmp_ln934_fu_256_p2 = ap_const_lv1_0) and (cmp33265_reg_338 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state4;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (ap_const_boolean_0 = ap_block_state4_on_subcall_done))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start, ap_done_reg)
    begin
        if (((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state2_blk <= ap_const_logic_0;
    ap_ST_fsm_state3_blk <= ap_const_logic_0;

    ap_ST_fsm_state4_blk_assign_proc : process(ap_block_state4_on_subcall_done)
    begin
        if ((ap_const_boolean_1 = ap_block_state4_on_subcall_done)) then 
            ap_ST_fsm_state4_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state4_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;


    ap_block_state4_on_subcall_done_assign_proc : process(cmp33265_reg_338, grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_done)
    begin
                ap_block_state4_on_subcall_done <= ((grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_done = ap_const_logic_0) and (cmp33265_reg_338 = ap_const_lv1_0));
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state2, icmp_ln934_fu_256_p2)
    begin
        if (((icmp_ln934_fu_256_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state2, icmp_ln934_fu_256_p2)
    begin
        if (((icmp_ln934_fu_256_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    cmp33265_fu_211_p2 <= "1" when (div283_cast_fu_195_p4 = ap_const_lv12_0) else "0";
    div283_cast_fu_195_p4 <= width(12 downto 1);

    fid_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, fidStored, cmp33265_reg_338, grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid, grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid_ap_vld, ap_CS_fsm_state4, fid_preg)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            fid <= fidStored;
        elsif (((grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid_ap_vld = ap_const_logic_1) and (cmp33265_reg_338 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            fid <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid;
        else 
            fid <= fid_preg;
        end if; 
    end process;


    fid_ap_vld_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, cmp33265_reg_338, grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid_ap_vld, ap_CS_fsm_state4)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            fid_ap_vld <= ap_const_logic_1;
        elsif (((cmp33265_reg_338 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            fid_ap_vld <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_fid_ap_vld;
        else 
            fid_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ap_start_reg;
    grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TREADY <= (m_axis_video_TREADY and ap_CS_fsm_state4);
    i_2_fu_261_p2 <= std_logic_vector(unsigned(i_fu_96) + unsigned(ap_const_lv12_1));
    icmp_ln934_fu_256_p2 <= "1" when (i_fu_96 = trunc_ln882_reg_313) else "0";
    icmp_ln975_1_fu_227_p2 <= "1" when (colorFormat = ap_const_lv8_0) else "0";
    icmp_ln975_fu_221_p2 <= "1" when (colorFormat = ap_const_lv8_1) else "0";
    m_axis_video_TDATA <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TDATA;
    m_axis_video_TDEST <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TDEST;
    m_axis_video_TID <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TID;
    m_axis_video_TKEEP <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TKEEP;
    m_axis_video_TLAST <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TLAST;
    m_axis_video_TSTRB <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TSTRB;
    m_axis_video_TUSER <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TUSER;
    m_axis_video_TVALID <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_m_axis_video_TVALID;

    ovrlayYUV_read_assign_proc : process(cmp33265_reg_338, grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ovrlayYUV_read, ap_CS_fsm_state4)
    begin
        if (((cmp33265_reg_338 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state4))) then 
            ovrlayYUV_read <= grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_936_2_fu_149_ovrlayYUV_read;
        else 
            ovrlayYUV_read <= ap_const_logic_0;
        end if; 
    end process;

    sub_fu_205_p2 <= std_logic_vector(unsigned(div283_cast_fu_195_p4) + unsigned(ap_const_lv12_FFF));
    trunc_ln882_fu_186_p1 <= height(12 - 1 downto 0);
end behav;