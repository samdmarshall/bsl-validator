#	tctf2_spawn
#	scripts for level 18 by wu

var int counter=3;
var int my_save_point=0;
var int counterA=0;
var int counterB=0;
var int counterC=0;
var int counterD=0;
var int counterDestroy=0;
var int lastdoor_count=0;
var int sub1 = 0;
var int sub2 = 0;
var int sub3 = 0;
var int ld1;
var int ld2;
var int ld3;
var int audio_counter = 3;

#########
# music #
#########
func void music_intro(void)
{
	sound_music_start mus_main03 1.0
#	this music stopped in t2 script
}

func void music_chair(void)
{
	dprint music_chair
	sound_music_start mus_wls 1.0
#	this music stopped in 11 and 11b script
}

func void music_atrium(void)
{
	dprint music_atrium
	sound_music_start mus_trt .8
#	this music stopped in check_power script
}

func void music_zom(void)
{
	dprint music_zom
	sound_music_start mus_sv 0.75
#	this music stopped in Zom script
}

func void music_stop(void)
{
	dprint STOP_THE_MUSIC
	sound_music_stop mus_main03
	sound_music_stop mus_wls
	sound_music_stop mus_trt
	sound_music_stop mus_sv
}

func void spawnA(void)
{
		dprint spawn_zone_A

		ai2_spawn A_L19
		ai2_spawn l1
		ai2_spawn l3
		ai2_spawn A_L12
		ai2_spawn A_Lbo13
		ai2_spawn A_L8
		ai2_spawn l7
}
###############################
#	start and objectives    #
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
	trig_deactivate 91
	trig_deactivate 92
	trig_deactivate 93
	trig_deactivate	98
	trig_deactivate	99
	trig_deactivate	10
	trig_deactivate	302	
	trig_deactivate	303	
	trig_deactivate	315
	trig_deactivate	320	
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
	door_unlock 65
	door_unlock 71
#	door_unlock 59
	door_unlock 61	
	door_unlock 67
	door_lock 7
	door_lock 4
	door_lock 5
	door_lock 8
	door_lock 6
	door_lock 9
	console_deactivate 3

	# incidental zombie shinatama dialog
	trigvolume_enable shinzom_voice1 0
	trigvolume_enable shinzom_voice2 0
	trigvolume_enable shinzom_voice3 0
	trigvolume_enable shinzom_voice4 0

	particle griffin_locklight01 do start
	particle door42_locklight01 do start
	particle stair_lock_locklight01 do start
	particle roof_doors_locklight01 do start
	trigvolume_enable trigger_volume_29 0
	trigvolume_enable trigger_volume_35 0
	trigvolume_enable trigger_volume_39 0
	trigvolume_enable trigger_volume_36 0
	trigvolume_enable trigger_volume_41 0

	my_save_point = save_point;

	if (my_save_point eq 0)
	{
		objective_set(1)
		target_set(590,30.0)

		Intro	
		spawnA
	}

	if (my_save_point eq 1)
	{
		dprint restore1
		objective_set(1)
		env_show 403 0 
		target_set(590,30.0)
		spawnA
		music_intro
		restore_game
	}

	if (my_save_point eq 2)
	{
		dprint restore2
		objective_set(2)
		target_set(593,30.0)
		trigvolume_enable trigger_volume_06 0
		ai2_spawn B_S22

		particle shin_lock_locklight01 do start
		door_unlock 48
		door_unlock 14
		trig_activate	6
		trig_activate	7
		trig_activate	99
		trig_activate	98
		restore_game
	}

	if (my_save_point eq 3)
	{
		dprint restore3
		particle shin_lock_locklight01 do stop
		door_lock 14
		objective_set(2)
		trigvolume_enable trigger_volume_46 0
		trigvolume_enable trigger_volume_47 0
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
		trig_deactivate 91
		trig_deactivate 92
		trig_deactivate 93
		trig_deactivate	98
		trig_deactivate	99
		trig_deactivate	6
		trig_deactivate	7
		target_set(587,30.0)
		restore_game
		spine1
		sleep 7
		spine2
		sleep 7
		spine3
	}

	if (my_save_point eq 4)
	{
		dprint restore4
		objective_set(3)
		target_set(596,30.0)
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
		trig_deactivate 91
		trig_deactivate 92
		trig_deactivate 93
		trig_deactivate	98
		trig_deactivate	99
		trig_deactivate	6
		trig_deactivate	7
		door_lock 42
		particle door42_locklight01 do stop
		ai2_spawn D_N74
		restore_game
	}

	if (my_save_point eq 5)
	{
		dprint restore5
		objective_set(4)
		trigvolume_enable trigger_volume_42 0
		trigvolume_enable trigger_volume_35 0
		particle ZomShin_door_locklight01 do stop
		door_lock 16

		#TCTF II cutscene "Base"
		env_show 171 1
		env_show 172 1
		env_show 173 1
		env_show 174 1
		particle Forcefield do start
		particle zombiesteam start
		sound_ambient_start zomshin_amb_loop 1.0
		music_zom

		GrifSpawn

		# don't call the GrifSpawn function again
		trigvolume_enable t9 0

		create_zomshin
		playback ZomShin BaseShin

		restore_game

		zombie_round_2
	#	chr_teleport 0 589
	}
}

func void you_lose(string ai_name)
{
	sleep 240
	fade_out 0 0 0 180 
	sleep 240
	lose
}

func void you_win(int char_index)
{
	outro
	win
}

func void set_objective_1(string ai_name)
{
	dprint set_objective_1
	objective_set(1)
	target_set (1,0)
}

func void set_objective_2(string ai_name)
{
	dprint set_objective_2
	objective_set(2)
	target_set (1,0)
}

func void set_objective_3(string ai_name)
{
	dprint set_objective_3
	objective_set(3)
	target_set (1,0)
}

func void set_objective_4(string ai_name)
{
	dprint set_objective_4
	objective_set(4)
	target_set (401,30)
	particle ZomShin_door_locklight01 do start
}


#################################
#	cut scene scripts         #
#################################

func void grifdies(string ai_name)
{
	killed_griffen 1
	OutroKill
}

func void t35(string ai_name)
{
	killed_griffen 0
	OutroNoKill
}

func void outta_sight(string ai_name)
{
	ai2_dopath n5 patrol_99
	ai2_setjobstate n5
}

#########################
#  trigger volume stuff #
#########################

func void t68(string ai_name)
{
	ai2_spawn mbo_femcop
}

func void t2(string ai_name)
{
	dprint t2_active
	trigvolume_enable trigger_volume_61 0
	ai2_spawn n5
	ai2_spawn A_Sbo14
	ai2_dopath A_Sbo14 patrol_14
	ai2_setjobstate A_Sbo14
	ai2_spawn A_Sbo15
	sleep 30
	ai2_dopath A_Sbo15 patrol_14
	ai2_setjobstate A_Sbo15
#	ai2_spawn A_Sbo16
	music_stop

}

func void t61(string ai_name)
{
	dprint t61_active
	trigvolume_enable trigger_volume_02 0
	ai2_spawn n5
	ai2_spawn A_Sbo14
	ai2_spawn A_Sbo15
	music_stop
}

func void t3(string ai_name)
{
	dprint t3_active
	ai2_dopath A_n17 patrol_16
	ai2_setjobstate A_n17

}

func void t4(string ai_name)
{
	dprint t4_active
	ai2_spawn A_L18
}

func void t6(string ai_name)
{
	dprint t6_active
	ai2_spawn A_L20
	ai2_spawn A_L21	
	ai2_spawn B_S22
	ai2_makeignoreplayer B_S22 1
	trig_activate	6
	trig_activate	7
	trig_activate	99
	trig_activate	98
	target_set(593,30.0)
}

func void t7(string ai_name)
{
	dprint t7_active
	ai2_dopath B_S22 patrol_23
	ai2_setjobstate B_S22
	ai2_makeignoreplayer B_S22 0
	ai2_spawn B_N28	
}

func void t7b(string ai_name)
{
	dprint t7b_active
	ai2_spawn B_Lbo26
	playback_block B_Lbo26 run1 interp 20
	sleep 20
	ai2_dopath B_Lbo26 patrol_27
	ai2_setjobstate B_Lbo26
		
}

func void t8(string ai_name)
{
	dprint t8_active
	chr_delete A_L19
	chr_delete l1
	chr_delete l3
	chr_delete A_L12
	chr_delete A_Lbo13
	chr_delete A_L8
	chr_delete l7
	chr_delete n5
	chr_delete A_T25
	chr_delete A_n17
	chr_delete A_N31
	ai2_spawn B_Sbo38
	ai2_spawn B_S36	
	ai2_makeignoreplayer B_S36 1
	ai2_spawn B_L40
	ai2_spawn B_L41
	music_chair
	sleep 90
	substation_monologue
}

func void t9(string ai_name)
{
	dprint t9_spawning_griffin
#	ai2_spawn ZomGrif
	GrifSpawn
	target_set (1,0.0)
}

func void t10(string ai_name)
{
	dprint t10_active
	ai2_spawn B_S29
}

func void t11(string ai_name)
{
	dprint t11_active
	ai2_dopath B_S36 patrol_38
	ai2_setjobstate B_S36
	ai2_makeignoreplayer B_Sbo38 0
#	ai2_makeignoreplayer B_Sbo35 0
	ai2_makeignoreplayer B_S36 0
	ai2_makeignoreplayer B_S37 0
	ai2_spawn B_Lbo76
#	ai2_spawn B_Lbo77
	ai2_spawn B_C34
	ai2_spawn B_C33
	ai2_spawn B_C32
	trigvolume_enable trigger_volume_11_copy 0
	music_stop
}

func void t59(string ai_name)
{
	ai2_spawn B_L30
	ai2_spawn B_L95
	ai2_spawn B_Lbo27
}

func void t60(string ai_name)
{
	ai2_spawn B_C32
	ai2_spawn B_C34
	ai2_spawn B_C33
	ai2_makeignoreplayer B_S36 0
}

func void t67(string ai_name)
{
	ai2_spawn B_S43
}

func void t11b(string ai_name)
{
	dprint t11b_active
	ai2_dopath B_S36 patrol_38
	ai2_setjobstate B_S36
	ai2_makeignoreplayer B_Sbo38 0
#	ai2_makeignoreplayer B_Sbo35 0
	ai2_makeignoreplayer B_S36 0
	ai2_makeignoreplayer B_S37 0
	ai2_spawn B_Lbo76
#	ai2_spawn B_Lbo77
	trigvolume_enable trigger_volume_11 0
	music_stop
}

func void t12(string ai_name)
{
	dprint t12_active
	ai2_dopath B_N28 patrol_42
	ai2_setjobstate B_N28
}

func void t14(string ai_name)
{
	dprint t14_active
	ai2_spawn C_Sbo44
#	ai2_spawn C_C46
	ai2_spawn C_C47
	ai2_spawn C_N48
#	ai2_spawn C_L50
#	ai2_makeignoreplayer C_L50 1
#	ai2_spawn C_L51
#	ai2_makeignoreplayer C_L51 1

}

func void t15(string ai_name)
{
	dprint t15_active
	ai2_lookatme C_L51
	ai2_dopath C_L51 patrol_51
	ai2_setjobstate C_L51
	ai2_makeignoreplayer C_L51 0
	sleep 90
	ai2_lookatme C_L50
	ai2_dopath C_L50 patrol_50
	ai2_setjobstate C_L50 
	ai2_makeignoreplayer C_L50 0

}

func void t16(string ai_name)
{
	dprint t16_active
	ai2_makeignoreplayer C_L50 0
	ai2_makeignoreplayer C_L51 0

}

func void t17(string ai_name)
{
	dprint t17_active
	ai2_makeignoreplayer C_N55 0
	ai2_spawn C_Sbo56

}

func void t18(string ai_name)
{
	dprint t18_active
	ai2_spawn C_S57

}

func void t19(string ai_name)
{
	dprint t19_active
	ai2_spawn C_S58
	ai2_spawn C_S59

}

func void t20(string ai_name)
{
	dprint t20_active
#	sleep 200
	ai2_spawn C_Lbo62
	ai2_spawn C_Sbo61

}

func void t21(string ai_name)
{
	dprint t21_active
	ai2_spawn C_Sbo63
	ai2_spawn C_Sbo64

}

func void t22(string ai_name)
{
	dprint t22_active
	ai2_makeignoreplayer C_C65 0

}

func void t23(string ai_name)
{
	dprint t23_active
	ai2_spawn C_L71
	ai2_spawn C_S72
	ai2_spawn C_N74

}

func void t25(string ai_name)
{
	dprint t25_active
	ai2_spawn D_C70
	ai2_makeignoreplayer D_C70 1
	ai2_spawn D_Sbo71
	ai2_spawn D_Sbo72
	ai2_spawn D_Sbo73
	ai2_spawn D_Sbo75
	ai2_spawn D_N76

}

func void t26(string ai_name)
{
	dprint t26_active
	ai2_spawn D_L74
	ai2_spawn new_1
}

func void t28(string ai_name)
{
	dprint t28_active
	ai2_spawn D_S78
	ai2_spawn D_S79
	trigvolume_enable trigger_volume_29 1

}

func void t29(string ai_name)
{
	dprint t29_active
	ai2_spawn D_Lbo81
	ai2_spawn D_S82

}

func void t30(string ai_name)
{
	dprint t30_active
	ai2_spawn D_L80

}

func void t31(string ai_name)
{
	dprint t31_active
	ai2_spawn D_S83
	ai2_spawn D_L84
	ai2_spawn D_Lbo85
	ai2_spawn D_Sbo86
	trigvolume_enable trigger_volume_32 0
}

func void t32(string ai_name)
{
	dprint t32_active
	ai2_spawn D_L88
	ai2_spawn D_S87
	ai2_spawn D_Sbo86
	trigvolume_enable trigger_volume_31 0
	target_set(599,30.0)
}


func void t33(string ai_name)
{
	dprint t33_active
	door_lock 97
	particle lastdoor1_locklight01 do stop
	particle lastdoor2_locklight01 do stop
	particle lastdoor3_locklight01 do stop
	#play doorsound
}

func void t34(string ai_name)
{
	dprint t34_active
	ai2_spawn D_Sbo75
	ai2_spawn D_Sbo92
	ai2_spawn D_L91
	ai2_spawn D_S90
	ai2_spawn D_S89
}

func void t37(string ai_name)
{
	dprint t37_active
	ai2_makeignoreplayer D_C70 0

}

func void t38(string ai_name)
{
	dprint t38
#	ai2_spawn B_N31

}

func void t41(string ai_name)
{
	dprint t41_active
	target_set(596,30.0)
}

func void t42(string ai_name)
{
	dprint t42_active
	door_lock 16
	particle ZomShin_door_locklight01 do stop
	trigvolume_enable trigger_volume_35 0
	Base
	s5
}

func void t43(string ai_name)
{
	dprint t43_active
	ai2_spawn B_S96
}

func void t44(string ai_name)
{
	dprint t44
	target_set(598,30.0)
}

func void t45(string ai_name)
{
	dprint t45_active
	target_set(587,30.0)
	door_lock 14
	particle shin_lock_locklight01 do stop
	console_activate 3
#	play door lock sound
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
	trig_deactivate 91
	trig_deactivate 92
	trig_deactivate 93
	trig_deactivate	98
	trig_deactivate	99
	trig_deactivate	6
	trig_deactivate	7
	if (trigvolume_count(20) eq 0)
	{
		dprint delete_B_AI
		chr_delete B_L95
		chr_delete B_Lbo27
		chr_delete B_S29
		chr_delete B_L30
		chr_delete B_Sbo38
		chr_delete B_S36	
		chr_delete B_S37
		chr_delete B_L40
		chr_delete B_L41
		chr_delete B_Lbo39
		chr_delete B_S43
		chr_delete B_C32
		chr_delete B_C33
		chr_delete B_C34
		chr_delete B_Lbo26
		chr_delete B_S96
		chr_delete B_Lbo76
		chr_delete B_S22
		chr_delete B_N31
		chr_delete B_Lbo77
	}
	dprint delete_A_AI
	chr_delete A_L20
	chr_delete A_L21
	chr_delete A_Sbo15
	chr_delete A_Sbo14
	chr_delete A_L19
	chr_delete l1
	chr_delete l3
	chr_delete A_L12
	chr_delete A_Lbo13
	chr_delete A_L8
	chr_delete l7
	chr_delete n5
	chr_delete A_T25
	chr_delete B_N28
	chr_delete A_n17
	chr_delete A_N31
}

func void attack_konoko(string ai_name)
{
	ai2_attack new_1 A_player
}

func void substation_monologue(void)
{
	dprint playkonokoline
	sound_dialog_play c14_54_24konoko
	cinematic_start (KONtalkangryfront, 180, 180, 19, 7, 20)
	sound_dialog_play_block
	sleep f60
	cinematic_stop (KONtalkangryfront, 19, 20)

	objective_set(2, silent)
}

func void save3_and_spine(string ai_name)
{
	s3
	spine1
	sleep 7
	spine2
	sleep 7
	spine3
}
func void t45b(string ai_name)
{
	dprint t45b_modified_by_okita
	ai2_spawn C_L51
	ai2_spawn C_L50
	ai2_spawn C_C65
	ai2_spawn C_N66
	ai2_spawn C_Sbo93
	ai2_spawn C_N60
	ai2_spawn C_N55
	ai2_makeignoreplayer C_L50 1
	ai2_makeignoreplayer C_L51 1
	ai2_makeignoreplayer C_N55 1
	ai2_makeignoreplayer C_C65 1
	trig_activate	1	
	trig_activate	2	
	trig_activate	3	
	trig_activate	4	
	trig_activate	5
	trig_activate	8		
	trig_activate	303	
	trig_activate	100
	trig_activate	101	
	trig_activate	500	
	trig_activate	400	
	trig_activate	503
	trig_activate	502
	trig_activate	501
	trig_activate	510
	trig_activate 	511
	trig_activate	512	
	trig_activate	520
	trig_activate	521
	trig_activate	522
	trig_activate	320
	trig_activate	315
	trig_activate	302	
	music_atrium	
}
################ begin #################
########## okita's modification ########
########################################
func void spine1(void)
{
	dprint spine1_start

	if (sub1 eq 0)
	{
		particle spine1 start
		particle spinesound1 start
	}
}

func void spine2(void)
{
	dprint spine2_start

	if (sub2 eq 0)
	{
		particle spine2 start
		particle spinesound2 start
	}
}

func void spine3(void)
{
	dprint spine3_start

	if (sub3 eq 0)
	{
		particle spine3 start
		particle spinesound3 start
	}
}
################  end  #################
########## okita's modification ########
########################################
func void patrolscript0001(void)
{
	playback_block B_S22 taunt1 interp 20
}

func void B_S22_run (string ai_name)
{
	ai2_dopath B_S22 patrol_24
	ai2_setjobstate B_S22
}

func void A_T25_run (string ai_name)
{
	ai2_dopath A_T25 patrol_25
	ai2_setjobstate A_T25
}

func void t39(string ai_name)
{
	target_set(598,30.0)
}

func void t48(string ai_name)
{
	ai2_spawn D_S101
	ai2_spawn D_C100
}
#########################################
#      		console/special	    #
#########################################
func void unlock14(string ai_name)
{
	dprint unlock14_active
	door_unlock 14
	particle shin_lock_locklight01 do start
}

func void console_android(void)
{
	text_console level_18b
	console_reset 16
}

func void console_zombie(void)
{
	text_console level_18a
	console_reset 17
}

func void console1(string ai_name)
{
	dprint console1_active
	text_console level_18c
	console_reset 14
	console_activate 14
}

func void console2(string ai_name)
{
	dprint console2_active
	text_console level_18d
	console_reset 15
}

func void level_18e(string ai_name)
{
	dprint text_18e
	text_console level_18e
	console_reset 1
	console_activate 1
}

func void lastdoor_console(string ai_name)
{	
	dprint lastdoor_console
	lastdoor_count = lastdoor_count + 1
	if (lastdoor_count eq 1)
	{
		input 0
		fade_out 0 0 0 30
		cm_interpolate lastdoor_cam 0
		fade_in 30
		sleep 60
		particle lastdoor3_locklight01 do start
		sleep 30
		fade_out 0 0 0 30
		cm_reset
		input 1
		fade_in 30
	}
	if (lastdoor_count eq 2)
	{
		input 0
		fade_out 0 0 0 30
		cm_interpolate lastdoor_cam 0
		fade_in 30
		sleep 60
		particle lastdoor2_locklight01 do start
		sleep 30
		fade_out 0 0 0 30
		cm_reset
		input 1
		fade_in 30
	}
	if (lastdoor_count eq 3)
	{
		input 0
		fade_out 0 0 0 30
		cm_interpolate lastdoor_cam 0
		fade_in 30
		sleep 60
		particle lastdoor1_locklight01 do start
		set_objective_4
		target_set(401,30.0)
		sleep 30
		fade_out 0 0 0 30
		cm_reset
		input 1
		fade_in 30
		trigvolume_enable trigger_volume_40 0
		door_unlock 97
	}

}

func void refuse_script(string ai_name)
{	
	dprint refuse
	ai2_dopath C_N48 patrol_98
}

func void patrolscript0098(string ai_name)
{	
	dprint patrolscript0098
	ai2_doalarm C_N48 10
}

func void shin_lock(string ai_name)
{
	particle shin_lock_locklight01 do start
}

func void stair_lock(string ai_name)
{
	particle stair_lock_locklight01 do start
}

func void roof(string ai_name)
{
	particle roof_locklight01 do start
	particle shin_lock_locklight01 do start
	ai2_spawn A_T25

}

func void floor4_lock(string ai_name)
{
	particle floor4_lock_locklight01 do start
	trigvolume_enable trigger_volume_39 1

}

func void roof_doors(string ai_name)
{
	particle roof_doors_locklight01 do start

}

func void roof_door2(string ai_name)
{
	particle roof_door2_locklight01 do start
	ai2_spawn A_n17
}

func void enable_t29(string ai_name)
{
	trigvolume_enable trigger_volume_29 1

}

func void t40(string ai_name)
{
	dprint t40_active
	if(sub1 ne 1)
	{
		if (audio_counter eq 2)
		{
			if(trigvolume_count(49) eq 0)
			{
				trigvolume_enable trigger_volume_40 0
				sound_dialog_play c14_54_26konoko
				sound_dialog_play_block pause
				audio_counter = audio_counter - 1;
			}
		}
		if (audio_counter eq 3)
		{
			if(trigvolume_count(49) eq 0)
			{
				trigvolume_enable trigger_volume_40 0
				sound_dialog_play c14_54_25konoko
				sound_dialog_play_block pause
				audio_counter = audio_counter - 1;
			}
		}
	}
}

func void t50(string ai_name)
{
	dprint t50_active
	if(sub2 ne 1)
	{
		if (audio_counter eq 2)
		{
			if(trigvolume_count(51) eq 0)
			{

				trigvolume_enable trigger_volume_50 0
				sound_dialog_play c14_54_26konoko
				sound_dialog_play_block pause
				audio_counter = audio_counter - 1;
			}
		}
		if (audio_counter eq 3)
		{
			if(trigvolume_count(51) eq 0)
			{
				trigvolume_enable trigger_volume_50 0
				sound_dialog_play c14_54_25konoko
				sound_dialog_play_block pause
				audio_counter = audio_counter - 1;
			}
		}
	}
}

func void t53(string ai_name)
{
	dprint t53_active
	if(sub3 ne 1)
	{
		if (audio_counter eq 2)
		{
			if(trigvolume_count (54) eq 0)
			{
				trigvolume_enable trigger_volume_53 0
				sound_dialog_play c14_54_26konoko
				sound_dialog_play_block pause
				audio_counter = audio_counter - 1;
			}
		}
		if (audio_counter eq 3)
		{
			if(trigvolume_count(54) eq 0)
			{
				trigvolume_enable trigger_volume_53 0
				sound_dialog_play c14_54_25konoko
				sound_dialog_play_block pause
				audio_counter = audio_counter - 1;
			}
		}
	}
}

func powersub1(string ai_name)
{
	dprint powersub1_active
	sub1 = 1;
	particle spine1 stop
	particle spinesound1 stop

	if(sub3 eq 0)
	{
		target_set(594,30.0)
	}
	if(sub3 ne 0)
	{
		if(sub2 eq 0)
		{
			target_set(595,30.0)
		}
	}
	check_power
}

func powersub2(string ai_name)
{
	dprint powersub2_active
	particle spine2 do stop
	particle spinesound2 stop
	sub2 = 1;
	if(sub3 eq 0)
	{
		target_set(594,30.0)
	}
	if(sub3 ne 0)
	{
		if(sub1 eq 0)
		{
			target_set(587,30.0)
		}
	}
	check_power
}

func powersub3(string ai_name)
{
	dprint powersub3_active
	sub3 = 1;
	particle spine3 do stop
	particle spinesound3 stop
	if(sub2 eq 0)
	{
		target_set(595,30.0)
	}

	if(sub2 ne 0)
	{
		if(sub1 eq 0)
		{
			target_set(587,30.0)
		}
	}
	check_power
}

func check_power(string ai_name)
{
	dprint check_power_active
	counter = counter - 1
	if (counter eq 1)
	{
		sound_dialog_play c14_54_27konoko
		sound_dialog_play_block pause
	}

	if (counter eq 0)
	{
		dprint power_down
		trigvolume_enable trigger_volume_36 1
		trigvolume_enable trigger_volume_41 1
		input 0
		fade_out 0 0 0 30
		cm_interpolate substation 0
		fade_in 30
	#	sleep 180
		trig_deactivate	1	
		trig_deactivate	2	
		trig_deactivate	3	
		trig_deactivate	4	
		trig_deactivate	5
		trig_deactivate	8		
		trig_deactivate	303	
		trig_deactivate	100
		trig_deactivate	101	
		trig_deactivate	500	
		trig_deactivate	400	
		sleep 15
		trig_deactivate	503
		sleep 5
		trig_deactivate	502
		sleep 5
		trig_deactivate	501
		sleep 15	
		trig_deactivate	510
		sleep 5
		trig_deactivate 	511
		sleep 5	
		trig_deactivate	512	
		sleep 15
		trig_deactivate	520
		sleep 5	
		trig_deactivate	521
		sleep 5	
		trig_deactivate	522
		sleep 15
		trig_deactivate	320
		sleep 15
		trig_deactivate	315
		sleep 15
		trig_deactivate	302	
		door_unlock	16
		particle ZomShin_door_locklight do start
		sleep 120
		fade_out 0 0 0 240
		cm_reset
		input 1
		target_set(403, 30.0)
		fade_in 30
		music_stop
		objective_set(3)
	}
}

func void lastdoor1(string ai_name)
{
	ld1=1
	if(ld2 eq 0)
	{
		target_set(599,30.0)
	}
	if (ld2 ne 0)
	{
		if(ld3 eq 0)
		{
			target_set(598,30.0)
		}
	}
}

func void lastdoor2(string ai_name)
{
	ld2=1
	if(ld3 eq 0)
	{
		target_set(598,30.0)
	}
	if(ld3 ne 0)
	{
		if(ld1 eq 0)
		{
			target_set(597,30.0)
		}
	}
}

func void lastdoor3(string ai_name)
{
	ld3=1
	if(ld2 eq 0)
	{
		target_set(599,30.0)
	}
	if(ld2 ne 0)
	{
		if(ld1 eq 0)
		{
			target_set(597,30.0)
		}
	}
}

#########################
#	save game	      #
#########################
func void s1(string ai_name)
{
	dprint SAVEDGAME1	

	if (my_save_point ne 1)
	{
		save_game 1 autosave
	}
}

func void s2(string ai_name)
{
	dprint SAVEDGAME2	

	if (my_save_point ne 2)
	{
		save_game 2 autosave
	}
}

func void s3(string ai_name)
{
	dprint SAVEDGAME3	

	if (my_save_point ne 3)
	{
		save_game 3 autosave
	}
}

func void s4(string ai_name)
{
	dprint SAVEDGAME4	

	if (my_save_point ne 4)
	{
		save_game 4 autosave
	}
}

func void s5(string ai_name)
{
	dprint SAVEDGAME5	

	if (my_save_point ne 5)
	{
		save_game 5 autosave
	}
}

###############################################
#####   FURIOUS ZOMBIE SHINATAMA FIGHT   ######
###############################################

var int console_count = 4;
var int zombie_counter_var = 0;

func void zombie_counter(string player_name)
{
	console_count = console_count - 1;

	door_lock 16	

	if (console_count eq 0)
	{
		console_count = 4;

		dprint zombie_counter
		zombie_counter_var = zombie_counter_var + 1;

		if (zombie_counter_var eq 0)
		{
			zombie_round_2
		}

		if (zombie_counter_var eq 1)
		{
			zombie_round_3
		}

		if (zombie_counter_var eq 2)
		{
			zombie_round_4
		}

		if (zombie_counter_var eq 3)
		{
			zombie_round_5
		}
	}
}

func void t52(string ai_name)
{
	ai2_dopath ZomGrif patrol_102
}

func void t55(string ai_name)
{
	ai2_dopath ZomGrif patrol_103
}

func void t56(string ai_name)
{
	ai2_dopath ZomGrif patrol_104
}

func void t57(string ai_name)
{
	ai2_dopath ZomGrif patrol_105
}

func void t58(string ai_name)
{
	ai2_spawn C_Lbo53
	ai2_spawn C_Sbo52
}

func void zombie_dialog_round3(void)
{
	sound_dialog_play c14_51_07shinatama
	cinematic_start(SHINZOMlistening, 180,180,19,8,20, false)
	sound_dialog_play_block
	cinematic_stop (SHINZOMlistening, 19, 20)
}

func void zombie_dialog_round4(void)
{
	sound_dialog_play c14_51_08shinatama
	cinematic_start(SHINZOMlistening, 180,180,19,8,20, false)
	sound_dialog_play_block
	cinematic_stop (SHINZOMlistening, 19, 20)
}

func void zombie_dialog_round5(void)
{
	sound_dialog_play c14_51_09shinatama
	cinematic_start(SHINZOMlistening, 180,180,19,8,20, false)
	sound_dialog_play_block
	cinematic_stop (SHINZOMlistening, 19, 20)
}

# CB: this round is not called any longer! only zombie rounds 2-5 are used now
# ZOMBIE ROUND 1
func void zombie_round_1(string ai_name)
{
	dprint zombie_round_1

	particle zombie1 create
	particle zombie1 start

	ai2_allpassive 1
	input 0

	# CB: kill all weapon particles
	p3_removedangerous

	sleep 120

	trig_show 91
	trig_show 92
	trig_show 93

	trig_activate 91
	trig_activate 92
	trig_activate 93

	sleep 30

#	trig_speed 202 .2
#	trig_speed 204 .2
#	trig_hide 2023
#	trig_hide 2013

#	particle ????? start
#	particle ????? start

	cm_reset
	input 1
	sleep 90
	ai2_allpassive 0
	ai2_makeignoreplayer ZomGrif 1
}

# CB: this round has all the old zombie round 2 setup including camera angles
# OLD ZOMBIE ROUND 2
func void old_zombie_round_2(string ai_name)
{
	dprint zombie_round_2

	ai2_allpassive 1
	turret_deactivate 330
	turret_deactivate 333
	turret_deactivate 336
	input 0

	# CB: kill all weapon particles
	p3_removedangerous

	particle zombie1 kill

	sleep 90

	cm_interpolate zombie_hint 0

	particle zombie1 create
	particle zombie1 start

	sleep 120

	trig_deactivate 91
	trig_deactivate 92
	trig_deactivate 93

	dprint trig_off_1

	sleep 15
	trig_hide 91
	sleep 15
	trig_hide 92
	sleep 15
	trig_hide 93

	sleep 120

	trig_show 210
	trig_show 310
	trig_show 410
	trig_show 510

	trig_activate 210
	trig_activate 310
	trig_activate 410
	trig_activate 510

	trig_reset 91
	trig_reset 92
	trig_reset 93

	sleep 15
	trig_show 91
	sleep 15
	trig_show 92
	sleep 15
	trig_show 93

	trig_activate 91
	trig_activate 92
	trig_activate 93

	sleep 90
	
	cm_reset
	input 1
	sleep 90
	ai2_allpassive 0
	ai2_passive ZomShin 1
	ai2_makeignoreplayer ZomGrif 1

	console_reset 399
	console_reset 400
	console_reset 401
	console_reset 402
}	

# CB: this round is the new zombie round 2 setup which is tabulae rasa
# and fit to be called from a save point, or from the cutscene
# ZOMBIE ROUND 2
func void zombie_round_2(string ai_name)
{
	dprint zombie_round_2_active

	particle zombie1 create
	particle zombie1 start

	ai2_allpassive 1
	input 0

	# CB: kill all weapon particles
	p3_removedangerous

	sleep 120

	trig_show 210
	trig_show 310
	trig_show 410
	trig_show 510

	trig_activate 210
	trig_activate 310
	trig_activate 410
	trig_activate 510

	trig_reset 91
	trig_reset 92
	trig_reset 93

	sleep 15
	trig_show 91
	sleep 15
	trig_show 92
	sleep 15
	trig_show 93

	trig_activate 91
	trig_activate 92
	trig_activate 93

	# incidental zombie shinatama dialog
	trigvolume_enable shinzom_voice1 1
	trigvolume_enable shinzom_voice2 1

	cm_reset
	input 1
	sleep 90
	ai2_allpassive 0
	ai2_makeignoreplayer ZomGrif 1
	ai2_passive ZomShin 1
}	

# ZOMBIE ROUND 3
func void zombie_round_3(string ai_name)
{
	dprint zombie_round_3_active

	ai2_allpassive 1
	turret_deactivate 330
	turret_deactivate 333
	turret_deactivate 336
	input 0

	# CB: kill all weapon particles
	p3_removedangerous

	particle zombie1 kill

	# incidental zombie shinatama dialog
	trigvolume_enable shinzom_voice3 1

	sleep 90

	cm_interpolate zombie_hint 0

	particle zombie1 create
	particle zombie1 start
	sleep 20
	particle zombie1 kill
	sleep 10
	particle zombie1 create
	particle zombie1 start

	sleep 120

	trig_deactivate 91
	trig_deactivate 92
	trig_deactivate 93

	dprint trig_off_2

	sleep 15
	trig_hide 91
	sleep 15
	trig_hide 92
	sleep 15
	trig_hide 93

	trig_deactivate 210
	trig_deactivate 310
	trig_deactivate 410
	trig_deactivate 510

	fork zombie_dialog_round3
	sleep 120

	trig_reset 91
	trig_reset 92
	trig_reset 93

	sleep 15
	trig_show 91
	sleep 15
	trig_show 92
	sleep 15
	trig_show 93

	trig_activate 91
	trig_activate 92
	trig_activate 93

	trig_reset 210
	trig_reset 310
	trig_reset 410
	trig_reset 510

	trig_activate 210
	trig_activate 310
	trig_activate 410
	trig_activate 510

	trig_show 2101
	trig_show 3101
	trig_show 4101
	trig_show 5101

	trig_activate 2101
	trig_activate 3101
	trig_activate 4101
	trig_activate 5101

	trig_speed 210 .3
	trig_speed 310 .3
	trig_speed 410 .3
	trig_speed 510 .3

	trig_speed 2101 .3
	trig_speed 3101 .3
	trig_speed 4101 .3
	trig_speed 5101 .3

	sleep 90

	cm_reset
	input 1
	sleep 90
	ai2_allpassive 0
	ai2_passive ZomShin 1
	# ai2_passive ZomGrif 1

	console_reset 399
	console_reset 400
	console_reset 401
	console_reset 402
}

## ZOMBIE ROUND 4
func void zombie_round_4(string ai_name)
{
	dprint zombie_round_4_active

	ai2_allpassive 1
	turret_deactivate 330
	turret_deactivate 333
	turret_deactivate 336
	input 0

	# CB: kill all weapon particles
	p3_removedangerous

	particle zombie1 kill

	# incidental zombie shinatama dialog
	trigvolume_enable shinzom_voice4 1

	sleep 90

	cm_interpolate zombie_hint 0

	sleep 30
	particle zombie1 create
	particle zombie1 start
	sleep 20
	particle zombie1 kill
	sleep 30
	particle zombie1 create
	particle zombie1 start

	fork zombie_dialog_round4
	sleep 120

	trig_deactivate 91
	trig_deactivate 92
	trig_deactivate 93

	dprint trig_off_3

	trig_hide 91
	trig_hide 92
	trig_hide 93

	trig_deactivate 210
	trig_deactivate 310
	trig_deactivate 410
	trig_deactivate 510

	trig_hide 210
	trig_hide 310
	trig_hide 410
	trig_hide 510

	trig_deactivate 2101
	trig_deactivate 3101
	trig_deactivate 4101
	trig_deactivate 5101

	trig_hide 2101
	trig_hide 3101
	trig_hide 4101
	trig_hide 5101

	sleep 120
		
	trig_show 214
	trig_show 314
	trig_show 414
	trig_show 514

	sleep 15

	trig_show 94

	sleep 15

	trig_show 910

	trig_activate 214
	trig_activate 314
	trig_activate 414
	trig_activate 514

	trig_activate 910
	trig_activate 94

	trig_speed 214 .15
	trig_speed 314 .15
	trig_speed 414 .15
	trig_speed 514 .15

	trig_speed 910 .35
	trig_speed 94 .35
		
	sleep 90
	
	cm_reset
	input 1
	sleep 90
	ai2_allpassive 0
	ai2_passive ZomShin 1
	# # ai2_passive ZomGrif 1

	console_reset 399
	console_reset 400
	console_reset 401
	console_reset 402
}

########## ZOMBIE ROUND 5 - YOU WIN ############

func void zombie_round_5(string ai_name)
{
	dprint zombie_round_5_active

	ai2_allpassive 1
	turret_deactivate 330
	turret_deactivate 333
	turret_deactivate 336

	trig_hide 214
	trig_hide 414

	trig_activate 210
	trig_activate 410	

	# CB: kill all weapon particles
	p3_removedangerous

	input 0

	begin_cutscene	

	music_stop

	sleep 60

	cm_interpolate zombie_death 0
	
	fork zombie_dialog_round5
	sleep 90

	trig_speed 9 1
	trig_speed 10 2
	trig_speed 910 2.5
	trig_speed 94 .5
	trig_speed 210 2
	sleep 90	
	trig_speed 410 2
	sleep 90	
	trig_speed 514 1
	trig_speed 410 1
	sleep 90
	trig_speed 314 2
	sleep 90
	trig_speed 210 1

	sleep 60
	trig_hide 210
	trig_hide 9
	trig_speed 10 .2
	sleep 60	
	trig_hide 314
	trig_hide 910
	sleep 60	
	trig_speed 514 .2
	trig_hide 410
	trig_hide 10
	trig_hide 94
	sleep 60
	trig_hide 514
	sleep 60
	trig_hide 93
	particle zombie1 kill
	sound_ambient_start shin_zom_shutdown 1.0
	sleep 10
	particle zombie1 create
	particle zombie1 start
	sleep 20
	particle zombie1 kill
	particle zombie1 create
	particle zombie1 start
	sleep 30
	particle zombie1 kill
	particle zombiesteam stop
	particle zombient stop
	
	sleep 90

#	Hardy, if griffin has to see konoko after or during the zom cutscene, 
#	make sure this next line makes it into the shorter zombie shin scripts --mike

	ai2_makeignoreplayer ZomGrif 0
	Zom
}



############################################################
########### INCIDENTAL SHINATAMA ZOMBIE DIALOG #############
############################################################

func void shinzom_voice1(string ai_name)
{
	sound_dialog_play c00_01_102shinatama
}

func void shinzom_voice2(string ai_name)
{
	sound_dialog_play c00_01_101shinatama
}

func void shinzom_voice3(string ai_name)
{
	sound_dialog_play c00_01_100shinatama
}

func void shinzom_voice4(string ai_name)
{
	sound_dialog_play c00_01_103shinatama
}
