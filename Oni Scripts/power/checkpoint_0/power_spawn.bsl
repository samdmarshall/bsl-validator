#	power_spawn
#	spawn units and trigger volumes

var int counter = 8;
var int my_save_point = 0;
var int blue01 = 1;
var int music_counter = 0;
var int pipe;
var int pipe2;
var int count_respawn1=0;
var int count_respawn2=0;

# music #

func void music_intro(void)
{
	sound_music_start mus_main01 .75
	music_counter = 2
}

func void music_muro(void)
{
	sound_music_start mus_sad1 .8
#	this music stopped in target05 in objective scripts
}

func void music_pipe(void)
{
	sound_music_start mus_asian .75
#	this music stopped in target13 in objective scripts
}

func void music_battle(void)
{
	sound_music_start mus_fiteb .75
#	this music stopped in check_death script
}

func void music_intro_timer(void)
{
	sleep 4500

	if (music_counter ne 0) 
	{
		dprint music_force_stop
		music_counter = 0
		music_stop
	}
}

func void die_for_art(string ai_name)
{
	dprint DFA_1
	music_counter = music_counter - 1

	if (music_counter eq 0)
	{
		music_stop
	}

}

func void music_stop(void)
{
	dprint STOP_THE_MUSIC
	sound_music_stop mus_main01
	sound_music_stop mus_sad1
	sound_music_stop mus_asian
	sound_music_stop mus_fiteb
}

# start and objectives #

func void start(string ai_name)
{
	dprint XXX_start_script_XXX
	particle power1 do start
	particle power2 do start
	trigvolume_enable trigger_volume_02 0
	trigvolume_enable trigger_volume_06 0
	trigvolume_enable trigger_volume_12 0
	trigvolume_enable trigger_volume_13 0
	trigvolume_enable trigger_volume_40 0

	if (my_save_point eq 0)
	{
		set_objective_1
	}

	if (my_save_point eq 1)
	{
		dprint restore1
		ai2_spawn A1_intro01
		ai2_spawn A1_intro02
		restore_game
		music_intro	
		objective_set 1 silent
		target_set(5007, 30.0)
		music_intro_timer
	}

	if (my_save_point eq 2)
	{
		dprint restore2
		env_show 802 1
		ai2_spawn B1_s_green01
		ai2_spawn new_dummy1
		ai2_spawn C2_blue25
		chr_delete A1_intro01
		chr_delete A1_intro02
		chr_delete A1_s_blue01
		target_set(1083,30.0)
		trigvolume_enable trigger_volume_35 0
		music_muro
		ai2_spawn B1_s_blue05
		ai2_dopath B1_s_blue05 patrol_08_blue05b
		ai2_setjobstate B1_s_blue05
		chr_teleport B1_s_blue05 1046
		restore_game
		objective_set 1 silent
	}

	if (my_save_point eq 3)
	{
		dprint restore3
		particle red_locklight01 do start
		door_unlock 38
		console_deactivate 7
		ai2_spawn D2_blue60
		ai2_spawn D1_neut10
		ai2_spawn new_5
		ai2_spawn D2_blue61
		chr_delete A1_intro01
		chr_delete A1_intro02
		chr_delete A1_s_blue01
		target_set(125,30.0)
		trigvolume_enable trigger_volume_25 0
		restore_game
		objective_set 2 silent
	}

	if (my_save_point eq 4)
	{
		dprint restore4
		particle red_locklight01 do start
		door_unlock 38
		console_deactivate 7
		ai2_spawn D2_blue61
		ai2_spawn D2_blue60
		ai2_spawn new_5
		ai2_spawn D1_neut10
		chr_delete A1_intro01
		chr_delete A1_intro02
		chr_delete A1_s_blue01
		target13
		trigvolume_enable trigger_volume_30 0
		trigvolume_enable trigger_volume_17 0
		trigvolume_enable trigger_volume_25 0
		restore_game
		objective_set 2 silent
		pipe = 100;
	}

	if (my_save_point eq 5)
	{
		dprint restore5
		counter = 7;
		target20
		ai2_spawn F_blue1
		chr_delete A1_intro01
		chr_delete A1_intro02
		chr_delete A1_s_blue01
		console_deactivate 8
		door_unlock 4
		particle bwhite_locklight01 do start
		trigvolume_enable trigger_volume_07 0
		restore_game
		objective_set 3 silent
		pipe = 100;
	}
}

func void blue01_dies(string ai_name)
{
	blue01 = 0
}

func void script_respawn1(void)
{
	if(trigvolume_count (42) eq 0)
	{
		count_respawn1 = count_respawn1 + 1;
		if(count_respawn1 eq 1)
		{
			dprint rs1a
			ai2_spawn respawn1
			chr_giveweapon respawn1 w7_scc
		}
		if(count_respawn1 eq 2)
		{
			dprint rs1b
			ai2_spawn respawn1
			chr_giveweapon respawn1 w3_phr
			ai2_dopath patrol_08_blue05
			ai2_setjobstate respawn1
		}
		if(count_respawn1 eq 3)
		{
			dprint rs1c
			ai2_spawn respawn1
			chr_giveweapon respawn1 w2_sap
		}
	}
}

func void script_respawn2(void)
{
	if(trigvolume_count (42) eq 0)
	{
		count_respawn2 = count_respawn2 + 1;
		if(count_respawn2 eq 1)
		{
			dprint rs2a
			ai2_spawn respawn2
			chr_giveweapon respawn2 w3_phr
		}
		if(count_respawn2 eq 2)
		{
			dprint rs2b
			ai2_spawn respawn2
			chr_giveweapon respawn2 w2_sap
			ai2_dopath patrol_19_blue20b
			ai2_setjobstate respawn2
		}
		if(count_respawn2 eq 3)
		{
			dprint rs2c
			ai2_spawn respawn2
			chr_giveweapon respawn2 w2_sap
		}
	}
}

func void script_respawn3(void)
{
	if(trigvolume_count (42) eq 0)
	{
		ai2_spawn C1_red21
	}
}
func void tv01(string ai_name)
{
	dprint tv01 B2
	ai2_spawn C1_blue22
	ai2_spawn B2_s_blue08
	ai2_spawn B2_s_tank04
		
}

func void tv02(string ai_name)
{
	dprint tv02

	if (trigvolume_count(32) ne 0)
	{
		trigvolume_reset trigger_volume_02
	}

	if (trigvolume_count(32) eq 0)
	{
	ai2_makeignoreplayer sniper1 1
	ai2_dopath sniper1 patrol_53
	ai2_setjobstate sniper1
#	ai2_spawn B2_s_blue06
	ai2_spawn B1_s_blue05
#	ai2_spawn B1_s_Red01
	ai2_spawn B1_s_green01
	ai2_spawn new_dummy1
	ai2_spawn C1_blue22
	ai2_spawn C2_blue25
#	ai2_spawn B1_neut01
	trigvolume_corpse 32
	Muro
	target_set(1083, 30.0)
	chr_delete A1_intro01
	chr_delete A1_intro02
	chr_delete A1_s_blue01
	chr_delete A1_s_red01
	chr_delete A1_s_red02
	chr_delete A2_s_blue01
	chr_delete A2_s_blue03
	chr_delete A2_s_blue09
#	chr_delete A2_s_blue10
	chr_delete A2_s_tank01
	chr_delete A2_s_tank02
	chr_delete char_1
	chr_delete sniper1
	chr_delete A2_s_blue13
	chr_delete A2_s_red03
	chr_delete A2_s_red04
	chr_delete new_1
	chr_delete new_2
	chr_delete new_3
	chr_delete new_4
	chr_delete whiteneut
	chr_delete B3_s_green02
	}
}

func void tv03(string ai_name)
{
	dprint tv03
	ai2_spawn A2_s_blue09
#	ai2_spawn A2_s_blue10
#	ai2_spawn A2_s_red04

}

func void ontv02(string ai_name)
{
	dprint ontv02
	trigvolume_enable trigger_volume_02 1
	particle el_red1 kill
	particle el_1_locklight01 do start
}

func void tv04(string ai_name)
{
	dprint tv04
	ai2_spawn A2_s_tank01
	ai2_spawn A2_s_blue13
#	ai2_spawn A2_s_tank02
	ai2_spawn A2_s_blue01
	ai2_spawn A2_s_red03
#	ai2_spawn A2_s_blue03
		
}

func void tv05(string ai_name)
{
	dprint tv05_B3_C1
	ai2_spawn B3_s_green02
	ai2_spawn C1_blue20
#	Torture
}

func void ontv06(string ai_name)
{
	dprint ontv06
	trigvolume_enable trigger_volume_06 1
	particle el_2_locklight01 do start
}

func void start_elevator2_music(void)
{
	sound_music_start mus_space01 0.75
}

func void stop_elevator2_music(void)
{
	sound_music_stop mus_space01
}

func void tv06(string ai_name)
{
	dprint tv06_C3

	if (trigvolume_count(31) ne 0)
	{
		trigvolume_reset trigger_volume_06
	}

	if (trigvolume_count(31) eq 0)
	{
		start_elevator2_music

		ai2_spawn D1_neut05
		trigvolume_corpse 31
		Elev2
		target_set(128,30.0)
		chr_delete respawn1
		chr_delete respawn2
		chr_delete B1_neut01
		chr_delete B1_s_blue05
		chr_delete B1_s_green01
		chr_delete B1_s_Red01
		chr_delete B2_s_blue06
		chr_delete B2_s_blue07
		chr_delete B2_s_blue08
		chr_delete B2_s_tank04
		chr_delete B3_green02
		chr_delete C1_blue20
		chr_delete C1_blue22
		chr_delete C1_red21
		chr_delete C2_blue25
		chr_delete C2_red26
		chr_delete C2_tank24
		chr_delete new_dummy1
		objective_set(2)
	}
}

func void power_lull_1(string ai_name)
{	
	dprint pipe_discharged
	ai2_neutralbehavior D1_neut02 none
	pipe = pipe + 1

	if (pipe eq 1)
	{
		stop_elevator2_music

		input 0
		music_pipe
		cm_interpolate pipe_view 180
		particle power1 do stop
		sleep 270
		cm_reset
		input 1
		timer_start 25 power_lull_1b
		if(my_save_point ne 3)
		{
			s3
		}
	}

	if(pipe ne 1)
	{
		particle power1 do stop
		timer_start 20 power_lull_1b
	}	
}

func void power_lull_1b(void)
{	
	dprint pipe_recharged
	music_stop
	particle power1 do start
	sleep 300
	console_reset 9
}

func void power_deactivate(void)
{	
	dprint power_deactivate
	ai2_doalarm D1_neut02 9
	ai2_dopath D1_neut02 patrol_80
	ai2_setjobstate D1_neut02
}

func void power_lull_2(string ai_name)
{	
	dprint pipe_discharged
	pipe2 =  pipe2 + 1
	if (pipe2 eq 1)
	{
		music_pipe
		ai2_spawn new_67
	}
	particle power2 do stop
	ai2_spawn new_10
	ai2_spawn D3_tank65
	timer_start 20 power_lull_2b
}

func void power_lull_2b(void)
{	
	dprint pipe_recharged
	music_stop
	particle power2 do start
	sleep 300
	console_reset 11
}

func void tv07(string ai_name)
{
	dprint tv07
	target20
	chr_delete sci_maniac
	chr_delete D1_blue50
	chr_delete D1_neut02
	chr_delete D1_neut05
	chr_delete D1_neut10
	chr_delete D1_red30
	chr_delete D2_blue60
	chr_delete D2_blue61
	chr_delete new_5
	chr_delete D2_red62
	chr_delete D2_tank63
	chr_delete new_8
	chr_delete D3_red66
	chr_delete D3_tank65
	chr_delete new_1
	chr_delete new_2
	chr_delete new_3
	chr_delete new_4
	chr_delete new_6
	chr_delete new_7
	ai2_spawn F_friend
	ai2_spawn F_blue73
	ai2_spawn F_blue1

}

func void tv08(string ai_name)
{
	dprint tv08_chamber_four
	ai2_spawn end01
	ai2_spawn end02
	ai2_spawn end03
	sleep 60
	ai2_dopath F_tank70 patrol_5004
	ai2_setjobstate F_tank70
	ai2_dopath F_blue69 patrol_5005
	ai2_setjobstate F_blue69
	ai2_dopath F_blue2 patrol_5004
	ai2_setjobstate F_blue2
	ai2_dopath F_blue1 patrol_5006
	ai2_setjobstate F_blue1
	ai2_dopath F_blue73 patrol_5006
	ai2_setjobstate F_blue73
	ai2_attack F_tank70 char_0
	ai2_attack F_blue69 char_0
	ai2_attack F_blue2 char_0
	ai2_attack F_blue1 char_0
	ai2_attack F_blue73 char_0
}

func check_death(string ai_name)
{
	dprint check_death
	counter = counter - 1
	if (counter eq 0)
	{
		dprint counterdone
		sound_music_volume mus_fiteb 0 3
		music_stop
		sleep 120		
		you_win
	}
}

func void tv09(string ai_name)
{
	dprint tv09_chamber_one

}

func void tv10(string ai_name)
{
	dprint tv10_chamber_two
	ai2_spawn F_blue69
	ai2_spawn F_blue2
}

func void spawn2tube(string ai_name)
{
	dprint spawn2tube
	ai2_spawn D2_tank63
	ai2_spawn new_8
	ai2_spawn sci_maniac
}

func void tv11(string ai_name)
{
	dprint tv11_chamber_three
	ai2_spawn F_tank70

}

func void tv25(string ai_name)
{
	dprint tv25
#	ai2_spawn D1_blue50
	ai2_spawn D1_red30
	ai2_spawn D1_neut02
	ai2_spawn D2_blue60
	ai2_spawn D1_neut10
	ai2_spawn new_5
	ai2_spawn D2_blue61
}

func void change_patrol(string ai_name)
{
	dprint change_patrol
	ai2_dopath A1_s_red02 patrol_45
	ai2_setjobstate A1_s_red02
}

func void spawn_sniper1(string ai_name)
{
	dprint spawn_sniper1
	ai2_spawn sniper1
	ai2_makeignoreplayer sniper1 1
	playback_block sniper1 sniper1_jump
	ai2_makeignoreplayer sniper1 0
	ai2_dopath sniper1 patrol_52
	ai2_setjobstate sniper1
	sleep 600
	hurt_sniper1
}

func void hurt_sniper1(string ai_name)
{
	dprint hurt_sniper1
	ai2_makeignoreplayer sniper1 1
	ai2_dopath sniper1 patrol_53
	ai2_setjobstate sniper1
}

func void tv33(string ai_name)
{
	dprint neutral_leaves
	ai2_makeignoreplayer A2_s_red04 1
	ai2_dopath A2_s_red04 patrol_54
	ai2_setjobstate A2_s_red04
}

func void tv34(string ai_name)
{
	dprint spawnneutral
	ai2_spawn A2_s_red04 
}

func void t36(string ai_name)
{
	dprint t36
	ai2_spawn sbg_1
	ai2_spawn sbg_2
	ai2_spawn sbg_3
}

func void t37(string ai_name)
{
	dprint t37
	ai2_spawn new_1
	ai2_spawn new_2
}

func void t38(string ai_name)
{
	dprint t38
	ai2_spawn new_3
	ai2_spawn new_4
}

func void t39(string ai_name)
{
	dprint t39
	trigvolume_enable trigger_volume_40 1 
}

func void t40(string ai_name)
{
	dprint t40
	ai2_spawn new_6
	ai2_spawn new_7
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

func void s5(string ai_name)
{
	dprint SAVEDGAME5

	if (my_save_point ne 5)
	{
		save_game 5 autosave
	}
}
###################
# 	console	#
###################

func void console_pipe(void)
{
	text_console level_9d
	console_reset 13
}

func void text9a(void)
{
	dprint level_9a
	text_console level_9a
	console_reset 2
}

func void text9b(void)
{
	dprint level_9b
	text_console level_9b
	console_reset 5
}

func void text9c(void)
{
	dprint level_9c
	text_console level_9c
	console_reset 14
}

func void patrolscript0031(string ai_name)
{
	dprint sayline
	sound_dialog_play c18_70_04striker
	sound_dialog_play_block
}