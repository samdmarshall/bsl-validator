#	rooftop
#	scripts for level 12 by wu
#	
#	LEGEND
#
#	character naming convention: X_Yx
#	where X = area letter (A=first area, B=second area, etc.)
#	      Y = character type (N=ninja, T=tanker, S=striker, R=red, etc.)
#		x = character number, usually same as character's initial patrol id
#
#	trigger volume scripts: t##, where ## refers to trigger volume id
#	
#	CONTENTS
#	
#	1.variables defined
#	1b.music scripts
#	2.start and objectives scripts
#	3.save game scripts
#	4.cut scene scripts
#	5.console scripts
#	6.trigger volume scripts

###############################
#	variables defined 	#
###############################

var int my_save_point=0;
var int ninja1=0;
var int ninja2=0;
var int strike1=0;
var int strike1b=0;
var int strike2=0;
var int strike3=0;
#var int elv1_check=0;
var int invading_counter=3;
var int done_with_intro_cutscene = 0;
var int go_hide;
var int go_hide2;

###############################
#		music		 	#
###############################

func void music_first(void)
{
	sound_music_start mus_cool19 0.0
	sound_music_volume mus_cool19 0.75 3.0
#	stopped at tanker death or timer
}

func void music_first_timer(void)
{
	sleep 1800
	music_stop
}

func void music_gauntlet(void)
{
	sound_music_start mus_atm_cl12lp 0.0
	sound_music_volume mus_atm_cl12lp 0.75 3.0
#	this music stopped in t14
}

func void music_billboard(void)
{
	sound_music_start mus_low1 0.0
	sound_music_start mus_low1 0.75 3
#	this music stopped in ta2_54 script
}

func void music_battle(void)
{
	sound_music_start mus_fitec
#	this music stopped in outro
}

func void music_stop(void)
{
	dprint STOP_THE_MUSIC
	sound_music_stop mus_cool19
	sound_music_stop mus_atm_cl12lp
	sound_music_stop mus_low1
	sound_music_stop mus_fitec
}

###############################
#	start and objectives	#
###############################
func void start(string ai_name)
{
	dprint start	
	
	particle el1_locklight01 do start
	door_lock 6

	my_save_point = save_point;

	if (my_save_point eq 0)
	{
		set_objective_1
		powerup_spawn lsi 605 
	}

	if (my_save_point eq 1)
	{
		dprint restore1
		set_objective_1
		done_with_intro_cutscene = 1;
		fork intro_taunt
		restore_game
		powerup_spawn lsi 605 
	}

	if (my_save_point eq 2)
	{
		done_with_intro_cutscene = 1;
		dprint restore2
		set_objective_1
		chr_delete A_Sr9
		chr_delete A_N1
		chr_delete IntroNinja
		ai2_spawn C_T16
		ai2_spawn C_Sr15
		ai2_spawn C_R55
		ai2_spawn C_N57
		trigvolume_enable trigger_volume_13 0
		door_lock 3
		restore_game
		powerup_spawn lsi 605 
	}

	if (my_save_point eq 3)
	{
		done_with_intro_cutscene = 1;
		dprint restore3
		set_objective_3
		chr_delete A_Sr9
		chr_delete A_N1
		chr_delete IntroNinja
		trigvolume_enable trigger_volume_79 0
		restore_game
	}

	if (my_save_point eq 4)
	{
		done_with_intro_cutscene = 1;
		dprint restore4
		chr_delete A_Sr9
		chr_delete A_N1
		chr_delete IntroNinja
		trigvolume_enable trigger_volume_28 0
		ai2_spawn OutroNinja
		chr_boss_shield OutroNinja
		music_battle
		gs_farclipplane_set 500
		door_lock 2
		restore_game
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
	target_set (7006,0.0)
}

func void set_objective_2(string ai_name)
{
	dprint set_objective_2
	objective_set(2)
	target_set (7006,0.0)
}

func void set_objective_3(string ai_name)
{
	dprint set_objective_3
	objective_set(3)
	target_set (7006,0.0)
}

###################
#	save game	#
###################

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

##########################
#	cut scene scripts  #
##########################

func void t12(string ai_name)
{
	dprint t12_elevator
	if (trigvolume_count(62) eq 0)
	{
		trigvolume_enable trigger_volume_12 0
		sleep 7
		trigvolume_corpse 62
		dprint delete_oldAI
		chr_delete B_R11
		chr_delete B_R12a
		chr_delete B_Sr10
		chr_delete B_Sr10a
		chr_delete B_T13
		chr_delete B_Sr12
		chr_delete B_N17
		chr_delete B_N18	
		chr_delete A_N8
		chr_delete A_T4
		chr_delete A_Sr3
		chr_delete C_N17
		chr_delete C_N18
		Elevator
		target_set(47,0.0)
		ai2_spawn C_Sr15
		ai2_spawn C_T16
		ai2_spawn C_R55
		ai2_spawn C_N57
	}
}

func void t17(string ai_name)
{
	dprint t17_KonokoZip
	if (chr_has_lsi(0))
	{
		KonokoZip
		chr_delete D_C19
		chr_delete D_C60
		chr_delete D_N25
		chr_delete D_R21
		chr_delete D_Sb20
		chr_delete D_Sb22
		chr_delete D_Sb23
		chr_delete D_Sr24
		chr_delete D_Sr26
		chr_delete D_Sr27
		chr_delete D_Sr38
		chr_delete D_T28
		set_objective_3
	}
}

func void t27(string ai_name)
{
	dprint t27_ElevatorFinalFight
	ai2_spawn SuperNinja
#	Elevator cut scene
#	I'm backing him into a corner.  This isn't going to be pretty..."

	chr_teleport 0 96

}


###################
#	console	#
###################

#########################
#  trigger volume stuff #
#########################

func void t28(string ai_name)
{
	chr_wait_animtype char_0 Pickup_Object
	particle obj_zip create
}

func void runup(void)
{
	ai2_dopath B_Sr10 patrol_10z
	ai2_setjobstate B_Sr10
}

func void t1(string ai_name)
{
	dprint t1 
	ai2_dopath A_N1 patrol_02
	ai2_setjobstate A_N1
	ai2_dopath IntroNinja patrol_40
	ai2_setjobstate IntroNinja
	if (strike1b eq 1)
	{	
		dprint strike1b
		ai2_dopath A_Sr9 patrol_09
		ai2_setjobstate A_Sr9
	}
	sleep 300
	if (ninja1 ne 0)
	{
		dprint ninja1_failed_trying_again
		ai2_dopath IntroNinja patrol_40
		ai2_setjobstate IntroNinja
	}

	if (ninja2 ne 0)
	{
		dprint ninja2_failed_trying_again
		ai2_dopath A_N1 patrol_02
		ai2_setjobstate A_N1
	}
}

func void patrolscript0001(string ai_name)
{
	dprint patrolscript0001_t1
	playback_block IntroNinja ninja_jump5 interp 30
#	ai2_makeignoreplayer A_N1 0
}

func void patrolscript0002(string ai_name)
{
	dprint patrolscript0002_t1
	playback_block A_N1 ninja_jump interp 30
#	ai2_makeignoreplayer A_N1 0
}

func void t2(string ai_name)
{
	dprint t2
	trigvolume_enable trigger_volume_03 0
	ai2_spawn A_C5
}

func void t3(string ai_name)
{
	dprint t3
	trigvolume_enable trigger_volume_02 0
	ai2_spawn A_Sr3
}

func void t4(string ai_name)
{
	dprint t4	
	trigvolume_enable trigger_volume_05 0
	ai2_spawn A_T6
	chr_delete A_Sr9
	chr_delete A_N1
	chr_delete IntroNinja

}

func void patrolscript0004(string ai_name)
{
	dprint patrolscript0004	
	playback_block A_T6 tanker2 interp 20

}

func void t5(string ai_name)
{
	dprint t5	
	trigvolume_enable trigger_volume_04 0
	ai2_spawn A_T4
	chr_delete A_Sr9
	chr_delete A_N1
	chr_delete IntroNinja

}

func void patrolscript0005(string ai_name)
{
	dprint patrolscript0005	
	playback_block A_T4 tanker1 interp 20

}

func void t6(string ai_name)
{
	dprint t6
	ai2_spawn A_N7
	trigvolume_enable trigger_volume_07_copy 0

}

func void t7(string ai_name)
{
	dprint t7
	ai2_spawn A_N8
	trigvolume_enable trigger_volume_06 0
}

func void t8(string ai_name)
{
	dprint t8
	ai2_spawn B_Sr10
	ai2_spawn B_Sr10a
	ai2_spawn B_R11
	ai2_spawn B_R12a
	ai2_dopath A_T6 patrol_42
	ai2_setjobstate A_T6
	ai2_dopath A_T4 patrol_42
	ai2_setjobstate A_T4
#	ai2_dopath A_Sr3 patrol_44
	ai2_setjobstate A_Sr3
#	ai2_dopath A_C5 patrol_44
	ai2_setjobstate A_C5
	ai2_dopath A_N7 patrol_45
	ai2_setjobstate A_N7
	ai2_dopath A_N8 patrol_45
	ai2_setjobstate A_N8
}

func void t9(string ai_name)
{
	dprint t9
	ai2_spawn E_N37
	ai2_makeignoreplayer E_N37 1
	playback_block E_N37 ninja_jump2
	ai2_makeignoreplayer E_N37 0
	ai2_attack E_N37 char_0
}

func void t10(string ai_name)
{
	dprint t10
	# "I lost him. Wait! There he is."
	sound_dialog_play c11_39_03konoko
	ai2_spawn B_Sr12
	ai2_spawn B_T13
	ai2_spawn B_SuperNinja
	chr_boss_shield B_SuperNinja
	chr_unstoppable B_SuperNinja 1
	chr_neutral B_SuperNinja 1
	playback_block B_SuperNinja superninja1 interp 20
	sleep 60
	chr_delete B_SuperNinja

}

func void t11(string ai_name)
{
	dprint t11
	ai2_spawn C_N17
	ai2_spawn C_N18
	ai2_dopath B_T13 patrol_41
	ai2_setjobstate B_T13
}

func void patrolscript0011(string ai_name)
{
	dprint patrolscript0011
	playback_block B_T13 tanker_jump interp 30

}

func void t14(string ai_name)
{
	dprint t14
	music_stop
	target_set (1,0.0)
	chr_delete C_N57
	chr_delete C_Sr15
	chr_delete C_T16
	chr_delete C_R55
	ai2_dopath D_Sb20 patrol_35
	ai2_spawn D_Sr38
	ai2_spawn D_C60
}

func void patrolscript0014(string ai_name)
{
	dprint patrolscript0014	
	playback_block D_Sb20 striker_jump interp 20
}

func void t15(string ai_name)
{
	dprint t15
	ai2_spawn E_N14
	ai2_spawn E_N14a
	ai2_passive E_N14 1
	#ai2_passive E_N14a 1
	ai2_spawn NinjaZip
	ai2_passive NinjaZip 1
	chr_unstoppable NinjaZip 1
	playback NinjaZip NinjaZipSet
	playback E_N14 Ninja02Set

}

#func void patrolscript0016(string ai_name)
#{
#	dprint patrolscript0016	
#	playback_block E_N14 LSIninja interp 20
#}

func void t18(string ai_name)
{
	dprint t18
	music_gauntlet
	ai2_spawn D_C19
	ai2_spawn D_Sb20
	ai2_spawn D_R21
	ai2_spawn D_Sb22
	ai2_spawn D_Sb23
	ai2_spawn D_Sr24
}

func void t19(string ai_name)
{
	dprint t19
	music_billboard
	ai2_spawn D_N25
	ai2_spawn C_R61
}

func void t20(string ai_name)
{
	dprint t20
	music_stop
	ai2_spawn D_Sr26
	ai2_spawn D_Sr27
	ai2_spawn D_T28
}

func void cantescape_dialog(void)
{
	sleep 120
	# "He can't escape me. But why?"
	sound_dialog_play c11_39_04konoko
}

func void t21(string ai_name)
{
	dprint t21_E_SuperNinja
	fork cantescape_dialog
	ai2_spawn E_N29
	ai2_spawn E_Sb31
	ai2_spawn E_Sr63
	ai2_spawn E_Sr64
	ai2_spawn E_R65
	ai2_spawn E_SuperNinja
	chr_boss_shield E_SuperNinja
	chr_unstoppable E_SuperNinja
	playback_block E_SuperNinja superninja2 interp 20
	sleep 60
	chr_delete E_SuperNinja

}

func void t22(string ai_name)
{
	dprint t22
	ai2_dopath IntroNinja patrol_39
	ai2_setjobstate IntroNinja

}

func void patrolscript0022(string ai_name)
{
	dprint patrolscript0022
	playback_block IntroNinja ninja_jump4 interp 20

}

func void t23(string ai_name)
{
	dprint t23
	ai2_spawn E_Sr30

}

func void t24(string ai_name)
{
	dprint t24
	# "He knows I can feel him. That we are... rivals? Natural enemies?"
	sound_dialog_play c11_39_08konoko
	ai2_spawn E_R32
	ai2_dopath E_Sr33 patrol_34
	ai2_setjobstate E_Sr33
}

func void t25(string ai_name)
{
	dprint t25
	ai2_spawn E_Sr33
	ai2_dopath E_Sr30 patrol_34
	ai2_setjobstate E_Sr30
}

func void t29(string ai_name)
{
	dprint t29
	# "There's something familar about him, I can't quite place it."
	sound_dialog_play c11_39_05konoko
}

func void t30(string ai_name)
{
	dprint t30_D_SuperNinja
	# "Where... ? Ah! Over there!"
	sound_dialog_play c11_39_01konoko
	ai2_spawn D_SuperNinja
	chr_boss_shield D_SuperNinja
	chr_unstoppable D_SuperNinja 1
	playback_block D_SuperNinja superninja1b interp 20
	sleep 60
	chr_delete D_SuperNinja

}

func void t31(string ai_name)
{
	dprint t31
	ai2_spawn A_N43
}

func void t32in(string ai_name)
{
	dprint t32in
	ninja1 = ninja1 + 1
}

func void t32out(string ai_name)
{
	dprint t32out
	ninja1 = ninja1 - 1
}

func void t33in(string ai_name)
{
	dprint t33in
	ninja2 = ninja2 + 1
}

func void t33out(string ai_name)
{
	dprint t33out
	ninja2 = ninja2 - 1
}

func void ninja1_die(string ai_name)
{
	dprint ninja1_die
	ninja1 = 0
}

func void ninja2_die(string ai_name)
{
	dprint ninja2_die
	ninja2 = 0
}

func void t57(string ai_name)
{
	dprint t57
	strike1=1
	sleep 120
	if (strike1 eq 1)
	{
		ai2_dopath A_Sr9 patrol_48
		ai2_setjobstate A_Sr9
	}
}

func void t57b(string ai_name)
{
	dprint t57b
	strike1=0
	strike1b=1
}


func void t58(string ai_name)
{
	dprint t58
	music_first
#	ai2_makeignoreplayer A_Sr9 1
#	ai2_makeignoreplayer A_N1 1
#	ai2_makeignoreplayer IntroNinja 1
	ai2_dopath A_Sr9 patrol_49
	ai2_setjobstate A_Sr9
	ai2_dopath A_N1 patrol_50
	ai2_setjobstate A_N1
	ai2_dopath IntroNinja patrol_51
	ai2_setjobstate IntroNinja
#	sleep 15
#	ai2_makeignoreplayer A_Sr9 0
#	ai2_makeignoreplayer A_N1 0
#	ai2_makeignoreplayer IntroNinja 0
	music_first_timer

}

func void t83(string ai_name)
{
	dprint checking
	go_hide =  go_hide + 1;
	if(trigvolume_count (83) ne 0)
	{
		dprint t83
		if(go_hide eq 0)
		{
			ai2_makeignoreplayer (ai_name,1)
			ai2_dopath (ai_name,patrol_13b)
			ai2_setjobstate (ai_name)
			ai2_forget (ai_name)
			sleep 60
			ai2_makeignoreplayer (ai_name,0)
		}
		if(go_hide eq 1)
		{
			ai2_makeignoreplayer (ai_name,1)
			ai2_dopath (ai_name,patrol_12b) 
			ai2_setjobstate (ai_name)
			ai2_forget (ai_name)
			sleep 60
			ai2_makeignoreplayer (ai_name,0)
		}
	}
}

func void t83b(string ai_name)
{
	dprint t83B
	go_hide =  go_hide - 1;
}

func void t84(string ai_name)
{
	dprint checking
	go_hide2 =  go_hide2 + 1;
	sleep 60
	if(trigvolume_count (84) ne 0)
	{
		dprint t84
		if(go_hide2 eq 0)
		{
			ai2_makeignoreplayer (ai_name,1)
			ai2_dopath (ai_name,patrol_69)
			ai2_setjobstate (ai_name)
			ai2_forget (ai_name)
			sleep 60
			ai2_makeignoreplayer (ai_name,0)
		}
		if(go_hide2 eq 1)
		{
			ai2_makeignoreplayer (ai_name,1)
			ai2_dopath (ai_name,patrol_70) 
			ai2_setjobstate (ai_name)
			ai2_forget (ai_name)
			sleep 60
			ai2_makeignoreplayer (ai_name,0)
		}
		if(go_hide2 eq 2)
		{
			ai2_makeignoreplayer (ai_name,1)
			ai2_dopath (ai_name,patrol_71) 
			ai2_setjobstate (ai_name)
			ai2_forget (ai_name)
			sleep 60
			ai2_makeignoreplayer (ai_name,0)
		}
	}
}

func void t84b(string ai_name)
{
	dprint t84B
	go_hide2 =  go_hide2 - 1;
}

func void t85(string ai_name)
{
	dprint t85
	ai2_spawn sbg_ninja
}
func void t59(string ai_name)
{
	dprint t59
	strike2=1
	sleep 120
	if (strike2 eq 1)
	{
		ai2_dopath A_Sr3 patrol_52
		ai2_setjobstate A_Sr3
		ai2_dopath A_C5 patrol_52
		ai2_setjobstate A_C5
	}
}

func void t59b(string ai_name)
{
	dprint t59b
	strike2=0
}

func void t60(string ai_name)
{
	dprint t60
	strike3=1
	sleep 120
	if (strike3 eq 1)
	{
		ai2_dopath B_Sr12 patrol_53
		ai2_setjobstate B_Sr12
	}
}

func void t60b(string ai_name)
{
	dprint t60b
	strike3=0
}

func void t63(string ai_name)
{
	if (trigvolume_count(64) eq 0)
	{
		trigvolume_enable trigger_volume_63 0
		dprint t63
		chr_delete E_R32
		chr_delete E_Sr33
		chr_delete E_Sr30
		door_unlock 6
	}
}

func void t65(string ai_name)
{
	dprint t65
	chr_teleport C_R55 7013
	ai2_dopath C_R55 patrol_56
	ai2_setjobstate C_R55
}

func void t77(string ai_name)
{
	dprint t77
	ai2_dopath D_R21 patrol_58
}

func void t78(string ai_name)
{
	dprint t78
	ai2_dopath D_R21 patrol_59
}

func void minus_invading_counter(string ai_name)
{
	invading_counter = invading_counter - 1

	if (invading_counter eq 0)
	{
		invading_dialog();
	}
}

func void invading_dialog(void)
{
	invading_counter = 0;
	trigvolume_enable trigger_volume_95 0

	sleep 90
	# "It's like this is his territory, and I'm invading."
	sound_dialog_play c11_39_06konoko
}

func void t95(string ai_name)
{
	dprint t95

	invading_dialog();
}

func void t96(string ai_name)
{
	dprint t96
	# "He's... angry! I can _taste_ his frustration."
	sound_dialog_play c11_39_07konoko
}

func void patrolscript0077(string ai_name)
{
	dprint 0077
	ai2_dopath D_R21 patrol_21
	ai2_setjobstate D_R21
}

func void t80(string ai_name)
{
	dprint t78
	ai2_spawn E_C62
	playback E_C62 com
	
}

