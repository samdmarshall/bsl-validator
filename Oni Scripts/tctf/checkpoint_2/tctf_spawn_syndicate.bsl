#
# tctf_spawn_syndicate.bsl
#
# SCRIPTS TO SPAWN SYNDICATE UNITS
#

var int my_save_point=0;
var int striker_count=0;
var int music_counter = 0;
var int counter = 0;
var int elev_count=0;
var int shut_down_t103;
var int count_follow;

# music #

func void music_intro(void)
{
	sound_music_start mus_asianb
}

func void music_intro_stop(void)
{
	sound_music_stop mus_asianb
}

func void music_attack(void)
{
	sound_music_start mus_pursuit 0
	sound_music_volume mus_pursuit 0.75 3.0
#	this music stopped in floor4_lock script
}

func void music_kidnap(void)
{
	dprint kidnapmusic
	sound_music_start mus_om01 0.0
	sound_music_volume mus_om01 0.75 3.0
#	this music stopped in ta2_54 script
}

func void music_battle(void)
{
	sound_music_start mus_asianb 0
	sound_music_volume mus_asianb 2
#	this music stopped in final script
}

func void music_stop(void)
{
	dprint STOP_THE_MUSIC
	sound_music_stop mus_asianb
	sound_music_stop mus_pursuit
	sound_music_stop mus_om01
#	sound_music_stop mus_asianb
}


###############################
#	start and objectives   	#
###############################
func void start(string ai_name)
{
	dprint start

	trig_deactivate	1	
	trig_deactivate	2	
	trig_deactivate	3	
	trig_deactivate	4	
	trig_deactivate	5
	trig_deactivate	6
	trig_deactivate	7
	trig_deactivate	8
	trig_deactivate	9
	trig_deactivate	10
	trig_deactivate	60
	trig_deactivate	61
	trig_deactivate	62
	trig_deactivate	63
	trig_deactivate	64
	trig_deactivate	65
	trig_deactivate	70
	trig_deactivate	71
	trig_deactivate	72
	trig_deactivate	73
	trig_deactivate	74
	trig_deactivate	75
	trig_deactivate	302	
	trig_deactivate	303	
	trig_deactivate	100
	trig_deactivate	101	
	trig_deactivate	500	
	trig_deactivate	501	
	trig_deactivate	502	
	trig_deactivate	503	
	trig_deactivate	400	
	trig_deactivate	510
	trig_deactivate 511
	trig_deactivate	512	
	trig_deactivate	520
	trig_deactivate	521
	trig_deactivate	522
	trig_deactivate	310
	trig_deactivate	320
	trig_deactivate	98
	trig_deactivate	99
	trigvolume_enable trigger_volume_81 0
	trigvolume_enable z_40t 0
	trigvolume_enable zz_40t 0
	trigvolume_enable zzz_40t 0
	trigvolume_enable zzzz_40t 0
	trigvolume_enable tv_61t 0

	if (save_point eq 0)
	{
		my_save_point=0;	
		set_objective_1
		particle security_locklight01 do start
		particle smoke start
	}

	if (save_point eq 1)
	{
		my_save_point=1;	
		dprint restore1
		set_objective_1
		particle smoke start
		particle security_locklight01 do start
		env_show 398 0
		#turn off unbroken curtain wall
		env_show 98 0
		#turn on broken curtain wall
		env_show 99 1
		#show gunk van 
		env_show 101 1 
		env_show 103 1
		env_show 104 1
		env_show 105 1
		env_show 106 1
		env_show 107 1
		env_show 108 1
		env_show 444 1
		env_show 97 0
		#show gunk motorcycle
		env_show 110 1
		env_show 111 1
		env_show 112 1
		#show door gunk
		env_show 321 1
		env_show 322 1
		env_show 323 1
		env_show 324 1
		env_show 325 1
		env_shade 321 325 .3 .3 .3
		ai2_spawn lobby_striker_01
		ai2_spawn lobby_striker_02
		ai2_spawn lobby_striker_03
		music_intro
		restore_game
		sleep 7
		sound_dialog_play c07_22_01konoko
		particle LobbyWall do explode
	}

	if (save_point eq 2)
		{
		my_save_point=2;	
		dprint restore2
		set_objective_3
		trigvolume_enable tv_58t 0
		door_lock 41
		chr_delete lobby_victim
		trigvolume_enable trigger_volume_80 0
		music_kidnap
		restore_game
		}

	if (save_point eq 3)
	{
		my_save_point=3;	
		dprint restore3
		trigvolume_enable t86 0
		set_objective_5
		trigvolume_enable tsh_55t 0
		#Hide elevator gunk 
		env_show 501 0 
		env_show 502 0 
		env_show 503 0 
		env_show 504 0 
		#Show new elevator gunk 
		env_show 601 1 
		env_show 602 1 
		fork tsh_55
		restore_game
		trigvolume_enable tv_58t 0
	}

	if (save_point eq 4)
		{
		my_save_point=4;	
		dprint restore4
		set_objective_5
		trigvolume_enable tsh_60t 0
		trigvolume_enable tr_66t 0
		trigvolume_enable tr_67t 0
		trigvolume_enable tr_65t 0
		trigvolume_enable tr_64t 0
		ai2_spawn barabus
		chr_boss_shield barabus
		target_set(1,0.0)
		restore_game
		}

}

func void striker_spawn(string ai_name)
{
	dprint striker_spawn
	striker_count =  striker_count + 1
}

func void striker_die(string ai_name)
{
	dprint striker_die
	striker_count =  striker_count - 1
}

#########################
#	trigger volumes	#
#########################

func void t102(string ai_name)
{
	ai2_spawn mbo_sniper
	ai2_spawn mbo_target
}

func void t103(string ai_name)
{
	dprint t103
	trigvolume_enable trigger_volume_103 0
	sleep 7
	if(elev_count ne 1)
	{
		if (chr_has_lsi(0))
		{
			trigvolume_enable trigger_volume_81 1
			objective_set(4)
			particle obj1 create
			target_set(9999, 30.0)
			shut_down_t103 = 1;
		}
	}
	if(shut_down_t103 eq 0)
	{
		sleep 60
		trigvolume_enable trigger_volume_103 1
	}
}

func void spawnL2_4(string ai_name)
{
	dprint spawnL2_4
	ai2_spawn lobby_striker_04
	playback lobby_striker_04 lobbystriker_roll
	trigvolume_enable u_36t 0
	
}

func void spawnL1_6(string ai_name)
{
	dprint spawnL1_6
	ai2_spawn lobby_striker_06
	trigvolume_enable tv_50t 0

}

func void spawnG2_7(string ai_name)
{
	dprint spawnG2_7
	ai2_spawn garage_striker_01
	ai2_spawn garage_striker_02
	
}

func void spawnG3_8(string ai_name)
{
	dprint spawnG3_8
	if (striker_count eq 0)
	{
		ai2_spawn garage_striker_03
		ai2_makeignoreplayer garage_striker_03 1
		ai2_spawn garage_striker_04
		ai2_spawn garage_striker_05
		playback_block garage_striker_03 garage_jump
		ai2_makeignoreplayer garage_striker_03 0
	}
	if (striker_count ne 0)
	{
		ai2_spawn garage_striker_03
		ai2_makeignoreplayer garage_striker_03 1
		playback_block garage_striker_03 garage_jump
		ai2_makeignoreplayer garage_striker_03 0
	}
}

func void spawnG3_11(string ai_name)
{
	dprint spawnG3_11
	ai2_spawn garage_striker_07
	ai2_passive garage_striker_07 1
	ai2_spawn garage_striker_08
	playback garage_striker_07 garage_taunt
	ai2_passive garage_striker_07 0

}

func void spawnG3_12(string ai_name)
{
	dprint spawnG3_12
	
	if (striker_count eq 0)
	{
		ai2_spawn garage_striker_09
		ai2_spawn garage_striker_10
	}
	if (striker_count ne 0)
	{
		ai2_spawn garage_striker_09
	}
}

func void killG2_08(string ai_name)
{
	dprint killG2_08
	trigvolume_enable trigger_volume_G2_08 0 
	
}

func void killG2_10(string ai_name)
{
	dprint killG2_10
	trigvolume_enable trigger_volume_G2_10 0 
	
}

func void killG3_11(string ai_name)
{
	dprint killG3_11
	trigvolume_enable trigger_volume_G3_11 0 
	
}

func void killG3_12(string ai_name)
{
	dprint killG3_12
	trigvolume_enable trigger_volume_G3_12 0 
	
}

func void a_18(string ai_name)
{
	dprint a_18
	trigvolume_enable b_19t 0 
	trigvolume_enable c_13t 0 

}

func void b_19(string ai_name)
{
	dprint b_19
	ai2_spawn lobby_striker_30
	ai2_spawn lobby_striker_31
	playback lobby_striker_31 lobby_roll2
#	ai2_spawn lobby_striker_33
#	ai2_spawn lobby_tctf_02
	trigvolume_enable d_20t 0
}

func void c_13(string ai_name)
{
	dprint c_13
	ai2_spawn lobby_striker_20
	ai2_spawn lobby_striker_21
	ai2_spawn lobby_fodder01
	ai2_spawn lobby_striker_05
	trigvolume_enable vv_38t 0
	trigvolume_enable a_18t 0
	music_stop
}

func void d_20(string ai_name)
{
	dprint d_20
	ai2_spawn l2_s46
	ai2_spawn l2_s44
	playback_block l2_s44 lobby_roll3

}

func void e_21(string ai_name)
{
	dprint e_21
	ai2_spawn lobby_striker_34
	ai2_spawn lobby_victim05
	ai2_spawn lobby_victim06
	trigvolume_enable l_27t 0
}

func void f_22(string ai_name)
{
	dprint f_22
	ai2_spawn lobby_striker_05
	trigvolume_enable vv_38t 0
	ai2_spawn lobby_striker_20
	ai2_spawn lobby_fodder01
	ai2_spawn lobby_striker_21

}

func void g_23(string ai_name)
{
	dprint g_23
	ai2_spawn L2s_01
	ai2_spawn L2s_02
	ai2_spawn L2s_03
	ai2_spawn L2tctf_01
	ai2_spawn L2tctf_02
	music_stop
	trigvolume_enable trigger_volume_w_39 0

}

func void h_06(string ai_name)
{
	dprint h_06
	ai2_spawn L2s_10
	ai2_spawn Ls_15
	ai2_spawn Ltctf_55
	ai2_dopath L2tctf_01 patrol_L2_13
	ai2_dopath L2tctf_02 patrol_L2_13

}

func void i_24(string ai_name)
{
	dprint i_24
	trigvolume_enable j_25t 0
	trigvolume_enable h_06t 0

}

func void j_25(string ai_name)
{
	dprint j_25
	ai2_spawn L2s_11

}

func void k_26(string ai_name)
{
	dprint k_26
	trigvolume_enable l_27t 1

}

func void l_27(string ai_name)
{
	dprint l_27
	ai2_spawn L3s_40
	ai2_spawn L3s_41
#	ai2_spawn L3s_42

}

func void m_28(string ai_name)
{
	dprint m_28
	ai2_spawn Lv_40
	ai2_spawn Lv_41
	ai2_spawn Lc_43
	ai2_spawn Ls_44
	trigvolume_enable s_34t 1

}

func void n_29(string ai_name)
{
	dprint n_29
	ai2_spawn Lc_50
	ai2_spawn Ls_51
	ai2_spawn Ls_12

}

func void o_30(string ai_name)
{
	dprint o_30
	ai2_spawn Ls_60
	ai2_spawn a_v2
	
}

func void p_31(string ai_name)
{
	dprint p_31
	trigvolume_enable trigger_volume_L2_4 1

}

func void s_34(string ai_name)
{
	dprint s_34
	ai2_spawn Lcom_01

}

func void t_35(string ai_name)
{
	dprint t_35
	trigvolume_enable s_34t 0

}

func void u_36(string ai_name)
{
	dprint u_36
	ai2_spawn cat1_02
	trigvolume_enable trigger_volume_L2_4 0
}

func void v_37(string ai_name)
{
	dprint v_37
	ai2_spawn cat1_01
	trigvolume_enable vv_38t 0
	
}

func void t98(string ai_name)
{
	dprint t98
	ai2_spawn a_v4
}

func void vv_38(string ai_name)
{
	dprint vv_38
	ai2_spawn lobby_striker_05
	ai2_spawn lobby_striker_20
	ai2_spawn lobby_striker_21
	ai2_spawn lobby_fodder01
	trigvolume_enable v_37t 0

}

func void w_39(string ai_name)
{
	dprint w_39
	ai2_spawn s2_t01
	ai2_spawn s2_t02
	ai2_spawn s2_s01
	ai2_spawn s2_s02
	ai2_spawn s2_s03
#	ai2_spawn s2_c01
	ai2_spawn s2_s05
	ai2_spawn s2_t05
	trigvolume_enable g_23t 0

}

func void x_05(string ai_name)
{
	dprint x_05
	ai2_spawn l_c01
	ai2_lookatme l_c01
	ai2_passive l_c01 1
	playback l_c01 lobby_runout
	ai2_passive l_c01 0
	trigvolume_enable trigger_volume_L1_6_9 0

}

func void y_32(string ai_name)
{
	dprint y_32
	ai2_spawn l_t01
	playback l_t01 lobby_backroll
	sleep 15
	ai2_spawn l_s02
	ai2_spawn l_s03
	trigvolume_enable tv_47t 0

}

func void unlock_follow(void)
{
	dprint unlockfollow
	count_follow = count_follow + 1;
	if(count_follow eq 2)
	{
		trigvolume_enable z_40t 1
		trigvolume_enable zz_40t 1
		trigvolume_enable zzz_40t 1
		trigvolume_enable zzzz_40t 1
		trigvolume_enable tv_61t 1
	}
}

func void patrolscript2222(void)
{
	dprint lookatplayer
	ai2_lookatchar l_t01 char_0
	ai2_lookatchar l_t23 char_0
}
	
func void z01(string ai_name)
{
	dprint z01

	ai2_dopath l_t01 l_t01_01
	ai2_setjobstate l_t01

	ai2_dopath l_t23 l_t23_04
	ai2_setjobstate l_t23

}

func void z02(string ai_name)
{
	dprint z02
	ai2_dopath l_t01 l_t01_04
	ai2_setjobstate l_t01
	
	ai2_dopath l_t23 l_t23_02
	ai2_setjobstate l_t23
}

func void z03(string ai_name)
{
	dprint z03
	ai2_dopath l_t01 l_t01_05
	ai2_setjobstate l_t01

	ai2_dopath l_t23 l_t23_01
	ai2_setjobstate l_t23
}

func void z04(string ai_name)
{
	dprint z04	
	ai2_dopath l_t01 l_t01_06
	ai2_setjobstate l_t01

	ai2_dopath l_t23 l_t23_06
	ai2_setjobstate l_t23
}

func void z05(string ai_name)
{
	dprint z05
	ai2_dopath l_t01 l_t01_07
	ai2_setjobstate l_t01

	ai2_dopath l_t23 l_t23_07
	ai2_setjobstate l_t23
}

func void z06(string ai_name)
{
	dprint z06
	ai2_dopath l_t01 l_t01_08
	ai2_setjobstate l_t01

	ai2_dopath l_t23 l_t23_08
	ai2_setjobstate l_t23
}

func void z_40(string ai_name)
{
	dprint z_40
	ai2_followme l_t01
	ai2_lookatme l_t01
	ai2_followme l_t23
	ai2_lookatme l_t23
	ai2_followme s2_t05
	ai2_lookatme s2_t05
	ai2_followme s2_t02
	ai2_lookatme s2_t02
	ai2_followme s2_t01
	ai2_lookatme s2_t01
	ai2_followme L2tctf_02
	ai2_lookatme L2tctf_02
	ai2_followme L2tctf_01
	ai2_lookatme L2tctf_01
	ai2_followme Lc_43
	ai2_lookatme Lc_43

}

func void tv_44(string ai_name)
{
	dprint tv_44
	ai2_spawn l_c10
	ai2_dopath l_t01 l_t01_02
	ai2_setjobstate l_t01

	ai2_dopath l_t23 l_t23_03
	ai2_setjobstate l_t23
}

func void tv_45(string ai_name)
{
	dprint tv_45
	ai2_spawn a_v1
	ai2_spawn l_s22
	ai2_spawn l_s23
	ai2_dopath l_t01 l_t01_03
	ai2_setjobstate l_t01

	ai2_dopath l_t23 l_t23_05
	ai2_setjobstate l_t23

}

func void tv_46(string ai_name)
{
	dprint tv_46
	ai2_spawn l_s24
	ai2_spawn l_t23
	trigvolume_enable tv_47t 1
	ai2_dopath l_t01 l_t01_06
	ai2_setjobstate l_t01
}

func void tv_47(string ai_name)
{
	dprint tv_47
	ai2_spawn l_s27

}

func void tv_48(string ai_name)
{
	dprint tv_48
	ai2_spawn l2_s46

}

func void tv_49(string ai_name)
{
	dprint tv_49
	ai2_spawn l2_s47

}

func void tv_50(string ai_name)
{
	dprint tv_50
	ai2_spawn l_s99
	ai2_spawn l_s98
	music_stop

}

func void tv_51(string ai_name)
{
	dprint tv_51
	ai2_spawn l4_red1
	ai2_spawn l4_t1
	ai2_spawn l4_s1
	ai2_spawn l4_s67
	ai2_spawn l4_t2
	ai2_spawn l4_s2
	ai2_spawn l4_s3	
	ai2_spawn l4_f1
	ai2_spawn l4_f2
	ai2_spawn l4_f3
	ai2_kill l4_f1
	ai2_kill l4_f2
	ai2_kill l4_f3
	ai2_spawn l4_c66
	ai2_kill l4_c66
	
}

func void tv_52(string ai_name)
{
	dprint tv_52
	particle smoke stop
	ai2_spawn a_t03
	ai2_passive a_t03 1
	playback a_t03 atrium_run
	sleep 7
	ai2_spawn a_t06
	sleep 7
	ai2_spawn a_s02
	sleep 7
	ai2_spawn a_s03
	sleep 7
	ai2_spawn a_red1
	ai2_passive a_t03 0
	chr_set_health a_t05 900
	chr_set_health a_t06 900
	chr_set_health a_s02 900
	chr_set_health a_s03 900
}
func void new_atrium(string ai_name)
{
	ai2_spawn a_s07
	ai2_spawn a_s05
	ai2_spawn a_v3
}

func void ta_53(string ai_name)
{
	dprint ta_53
	ai2_spawn a_t05
	ai2_dopath a_s03 patrol_7043
	ai2_setjobstate a_s03
	ai2_dopath a_s02 patrol_7030
	ai2_setjobstate a_s02
	ai2_dopath a_t06 patrol_7034
	ai2_setjobstate a_t06
	ai2_dopath a_t05 patrol_7042
	ai2_setjobstate a_t05
	chr_set_health a_t05 40
	chr_set_health a_t06 30
	chr_set_health a_s02 80
	chr_set_health a_s03 80
	sleep 2000
	dprint no_more_tctf
	counter = 100

}

func void ta_53b(string ai_name)
{
	dprint ta_53b
	chr_set_health a_t05 80
	chr_set_health a_t06 60
	chr_set_health a_s02 70
	chr_set_health a_s03 80
}

func void ta2_54(string ai_name)
{
	dprint ta2_54
	ai2_spawn a2_t1
	ai2_spawn a2_red1
	ai2_spawn LSI
	chr_invincible LSI 1
	sleep 240
	music_stop
}

func void tsh_55(string ai_name)
{
	dprint tsh_55
	ai2_spawn sh_tank1
	ai2_spawn sh_red1
	ai2_spawn sh_s3
	ai2_spawn sh_s4
	ai2_spawn sh_s4b
	set_objective_5
	sleep 120
	ai2_attack sh_s3 char_0
}

func void t62(string ai_name)
{
	dprint t62
	ai2_spawn sh_s1
	ai2_spawn sh_s2
	ai2_spawn sh_s6
}

func void femcop_holster(string ai_name)
{
	dprint holstergun
	chr_forceholster Lc_43 1
}

func void t72(string ai_name)
{
	dprint t72
	ai2_spawn sh_com1
	ai2_spawn sh_tank2
	ai2_spawn sh_s9
}

func void tv57(string ai_name)
{
	dprint tv57
	Attack
	target_set(59,30.0)
}

func void goAttack(string ai_name)
{
	music_intro_stop

	dprint goAttack
	trigvolume_enable tv_57t 1
	input 0
	fade_out 0 0 0 30
	chr_delete l_c01
	chr_delete lobby_striker_01
	chr_delete lobby_striker_02
	chr_delete garage_striker_01
	chr_delete garage_striker_02
	chr_delete garage_striker_03
	chr_delete garage_striker_04
	chr_delete garage_striker_05
	chr_delete garage_striker_06
	chr_delete garage_striker_07
	chr_delete garage_striker_08
	chr_delete garage_striker_09
	chr_delete garage_striker_10
	chr_delete l_s98
	chr_delete l_s99	
	cm_interpolate stair_lock 0
	fade_in 30
	sleep 60
	particle stair_lock_locklight01 do start
	sleep 90
	fade_out 0 0 0 30
	cm_reset
	fade_in 30
	input 1
	set_objective_2
	ai2_spawn tanker_stairdoor
	sound_dialog_play c00_01_27shinatama
}

func void tsh_60(string ai_name)
{
	dprint tsh_60
	ai2_spawn sh_s12
	ai2_spawn sh_s12b
	helicopter
}

func void ta_62(string ai_name)
{
	dprint ta_62
	if (chr_has_lsi(0))
	{	
		trigvolume_enable trigger_volume_81 0
		particle obj1 kill
		ai2_kill
		elev_count = 1;
		sleep 10
		Elevator
	}
}

func void tv_58(string ai_name)
{
	dprint tv_58
	door_lock 41
	particle security_locklight01 do stop
	ai2_kill
	Kidnap
	set_objective_3
	s2
}

func void tv_68(string ai_name)
{
	dprint tv_68
	ai2_spawn b_victim
}

func void tr_64(string ai_name)
{
	dprint tr_64
	target_set(58,0.0)
	HeliOutroRight
	trigvolume_enable tr_65t 0
	trigvolume_enable tr_66t 0
	trigvolume_enable tr_67t 0

}

func void tr_65(string ai_name)
{
	dprint tr_65
	target_set(58,0.0)
	HeliOutroLeft
	trigvolume_enable tr_64t 0
	trigvolume_enable tr_66t 0
	trigvolume_enable tr_67t 0

}

func void tr_66(string ai_name)
{
	dprint tr_66
	target_set(58,0.0)
	HeliOutroMid
	trigvolume_enable tr_65t 0
	trigvolume_enable tr_64t 0
	trigvolume_enable tr_67t 0

}

func void tr_67(string ai_name)
{
	dprint tr_67
	target_set(58,0.0)
	HeliOutroMidLt
	trigvolume_enable tr_65t 0
	trigvolume_enable tr_66t 0
	trigvolume_enable tr_64t 0

}

func void t100(string ai_name)
{
	dprint t100
	ai2_spawn roof_tctf1
	ai2_spawn sh_s12c
}
#####################
#	save scripts  #
#####################

func void s1(string ai_name)
{
	dprint SAVEDGAME	
	save_game 1 autosave
}

func void s2(string ai_name)
{
	dprint SAVEDGAME	
	save_game 2 autosave
}

func void s3(string ai_name)
{
	dprint SAVEDGAME	
	save_game 3 autosave
}

func void s4(string ai_name)
{
	dprint SAVEDGAME	
	save_game 4 autosave
}

func void check_death(string ai_name)
{
	dprint check_death
	counter = counter - 1
	if (trigvolume_count(99) eq 0)
	{	
		if(counter eq 0)
		{
			sleep 210
			ai2_spawn a_t99
		}
	}
}

func void spawn(string ai_name)
{
	dprint spawn	
	counter = counter + 1
}