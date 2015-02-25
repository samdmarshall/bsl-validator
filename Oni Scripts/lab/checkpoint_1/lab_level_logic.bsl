################## RESEARCH LAB LEVEL LOGIC ##########################

################ SCRIPTS BY Hardy AND Joseph #########################

################# START, SAVE & OBJECTIVES ###########################


# creates counterS for stuff

var int door_counter=3;
var int passage_counter=3;
var int count_dead_end=2;

func void turnoffcompass(string ai_name)
{
	target_set(143, 0.0)
}

func void level_start(string ai_name)
{
	dprint func_void_start

	if (my_save_point eq 1)
		{
		dprint restore_game_1

		set_objective_1

		ai2_spawn Barabus

		dprint SPAWN_BARABUS

		ai2_attack Barabus konoko

		env_show 10 1
		env_show 9 1
		env_show 8 1

		#obj_kill 8 10

		trigvolume_enable save_1_trig 0
		trigvolume_enable floor1 0
		trigvolume_enable outside_left 0
		trigvolume_enable outside_right 0
		trigvolume_enable outside_back 0

		#chr_animate Barabus STRIKElev3_startle
		#ai2_setmovementmode Barabus walk
		#playback Barabus IntroSubboss01
		playback 0 IntroKonoko01

		sound_music_start mus_main01_hd	0.8

		restore_game
		}

	if (my_save_point eq 2)
		{
		dprint restore_game_2

		set_objective_2_from_save

		dprint restore_game_2_a

		door_lock 43

		dprint restore_game_2_b

		particle lock99_locklight01 do stop

		dprint restore_game_2_c

		spawn_floor1_guards

		dprint restore_game_2_d

		restore_game
		cm_reset
		}
	
	if (my_save_point eq 3)
		{
		dprint restore_game_3

		spawn_lobby_tctf

		trigvolume_enable save_3_trig 0

		door_lock 35
		dprint objective5
		objective_set(5, silent)
		target_set(142, 30.0)
		
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

func void save_game_1(string ai_name)
{
	dprint savegame_1	
	if (my_save_point ne 1)
	{
		save_game 1 autosave
	}
}

func void save_game_2(string ai_name)
{
	dprint savegame_2
	if (my_save_point ne 2)
	{
		save_game 2 autosave
	}
}

func void save_game_3(string ai_name)
{
	dprint savegame_3	

	if (my_save_point ne 3)
	{
		save_game 3 autosave
	}
}

########### GAME OBJECTIVES ############################3

func void set_objective_1(void)
{
	dprint objective_1
	objective_set(1)
}

func void set_objective_2_from_save(void)
{
	objective_set(2)	
}

func void set_objective_2(string chr_index)
{
	sleep 180
	dprint objective_2
	objective_set(2)
	particle lock99_locklight01 do start
	door_unlock 43
}

func void set_objective_3(string chr_index)
{
	dprint objective_3
	#sound_dialog_play_block c00_01_20shinatama
	#sound_dialog_play_block pause
	objective_set(3)
	target_set(205, 30.0)
}

func void set_objective_4(string chr_index)
{
	dprint objective_4
	sound_dialog_play_block c00_01_19shinatama
	sound_dialog_play_block pause
	objective_set(4)
	target_set(110, 30.0)
}

func void set_objective_5(string chr_index)
{
	dprint objective_5
	#sound_dialog_play_block c00_01_18shinatama
	#sound_dialog_play_block pause
	objective_set(5)
	target_set(142, 30.0)
}

func void set_objective_6(string chr_index)
{
	dprint objective_6
	sound_dialog_play_block c00_01_22shinatama
	sound_dialog_play_block pause
	objective_set(6)
	target_set(256, 30.0)
}

func void set_target_4(string chr_index)
{
	sound_dialog_play_block c00_01_26shinatama
	sound_dialog_play_block pause
	target_set(253, 30.0)
}

func void set_target_5(string chr_index)
{
	sound_dialog_play_block c00_01_28shinatama
	sound_dialog_play_block pause
	target_set(254, 30.0)
}

func void set_target_6(string chr_index)
{
	target_set(256, 30.0)
}


### MARTY'S HUGE SACK ###

var int music_counter;

func void music_force_stop(void)
{
	sleep 4500

	if (0 ne music_counter) 
	{
		dprint music_force_stop
		music_counter = 0
		all_music_counters
	}
}

func void music_script_start(void)
{
	music_counter = 2
}

func void striker_siesta_1(string ai_name)
{
	dprint striker_siesta1
	music_counter = music_counter - 1

	if (music_counter eq 0)
	{
		all_music_counters();
	}

}
func void striker_siesta_2(string ai_name)
{
	dprint striker_siesta2
	music_counter = music_counter - 1

	if (music_counter eq 0)
	{
		all_music_counters();
	}
}

func void all_music_counters(void)
{
	dprint WHEN_THE_LIGHTS_GO_DOWN_IN_THE_CITY
	
	sound_music_stop mus_trt
#	sound_music_stop mus_fiteb
#	sound_music_stop mus_asian
}


### TEXT CONSOLES ###

func void level3a(string chr_index)
{
	dprint text3a
	text_console level_3a
	console_reset 7
}

func void level3b(string chr_index)
{
	dprint text3b
	text_console level_3b
	console_reset 6
}

func void level3c(string chr_index)
{
	dprint text3c
	text_console level_3c
	console_reset 1
}

func void level3d(string chr_index)
{
	dprint text3d
	text_console level_3d
	day_264
}




### GAMEPLAY PROGRESSION ###

func void tower_lock_1(string chr_index)
{
	sound_music_stop mus_main03

	ai2_spawn Tower_MB_1
	trigvolume_enable towertrig_2 0
	door_lock 41
}

func void sapper_damage_on(string chr_index)
{
	dprint sapper_dmg_start
	particle sapper start
}

func void sapper_damage_off(string chr_index)
{
	dprint sapper_dmg_stop
	particle sapper stop
}

func void spawn_floor1_guards(string ai_name)
{
	dprint spawn_floor1
	particle lock1_locklight01 do stop
	particle lockA_locklight01 do start
	ai2_spawn Floor1_Striker_1
	ai2_spawn Floor1_Striker_2
	ai2_spawn Floor1_Sci_1
	ai2_spawn Floor1_Sci_2
	ai2_spawn Floor1_Sci_3
	ai2_spawn Floor1_Sci_4

	set_objective_3
}

func void spawn_right_patrol(string ai_name)
{
	dprint spawn_right_patrol
	ai2_spawn right_patrol_striker_1
}

func void spawn_left_patrol(string ai_name)
{
	dprint spawn_right_patrol
	ai2_spawn left_patrol_striker_1
}

func void spawn_back_patrol(string ai_name)
{
	dprint spawn_right_patrol
	ai2_spawn back_patrol_striker_1
	ai2_spawn back_patrol_striker_2
}

func void spawn_floor1_striker_10(string ai_name)
{
	dprint spawn_ambush_striker_10
#	trig_activate 1
	ai2_spawn Floor1_Striker_10
	ai2_spawn Floor1_Striker_12
}

func void spawn_floor1_striker_11(string ai_name)
{
	dprint spawn_ambush_striker_11
#	trig_activate 1
	ai2_spawn Floor1_Striker_11
	ai2_spawn Floor1_Striker_12
}

func void fake_console(string ai_name)
{
	sleep 180
	dprint fake_console

	door_unlock 2
	door_unlock 9
	door_unlock 12
	door_unlock 15
	door_unlock 18
	door_unlock 21
	door_unlock 24
	door_unlock 27

	particle lock2_locklight01 do start
}

func void spawn_floor2_guards(string ai_name)
{
	dprint spawn_floor2

	particle lock2_locklight01 do stop

	ai2_spawn Floor2_Striker_2
	ai2_spawn Floor2_Striker_3
	ai2_spawn Floor2_Striker_4

	sleep 15

	ai2_spawn Floor2_Striker_1
	ai2_doalarm Floor2_Striker_1 3

	sleep 15

	ai2_spawn Floor2_Sci_1
	ai2_spawn Floor2_Sci_2
	ai2_spawn Floor2_Sci_3
	ai2_spawn Floor2_Sci_4
	ai2_spawn Floor2_Sci_5

	trigvolume_enable attack_trigger 0
}

func void commence_attack(string ai_name)
{
	dprint commence_attack

	ai2_setalert Floor2_Striker_2 high
	ai2_setalert Floor2_Striker_3 high
	ai2_setalert Floor2_Striker_4 high

	ai2_dopath Floor2_Striker_1 Floor2_Stk_1
	ai2_dopath Floor2_Striker_2 scram_path
	ai2_dopath Floor2_Striker_3 attack_path_1
	ai2_dopath Floor2_Striker_4 attack_path_2

	ai2_setjobstate Floor2_Striker_1
	ai2_setjobstate Floor2_Striker_2
	ai2_setjobstate Floor2_Striker_3
	ai2_setjobstate Floor2_Striker_4

	ai2_attack Floor2_Striker_4 Floor2_Sci_4
	ai2_attack Floor2_Striker_3 Floor2_Sci_1
}

func void death_sentence_1(string ai_name)
{
	dprint death_sentence_1
	ai2_attack Floor2_Striker_4 Floor2_Sci_5
}

func void death_sentence_2(string ai_name)
{
	dprint death_sentence_2
	ai2_attack Floor2_Striker_3 Floor2_Sci_2
}

func void death_sentence_3(string ai_name)
{
	dprint death_sentence_2
	ai2_attack Floor2_Striker_3 Floor2_Sci_3
}

func void spawn_floor3_guards(string ai_name)
{
	dprint spawn_floor3

	ai2_spawn Floor3_Striker_1
	ai2_spawn Floor3_Striker_2
	ai2_spawn Floor3_Striker_3
	ai2_spawn Floor3_Striker_4

	ai2_spawn Floor3_Comguy_1
	
	particle lock3_locklight01 do stop
}

func void spawn_roof_guards(string ai_name)
{
	dprint spawn_roof_guards

	ai2_spawn Roof_Striker_1
	ai2_spawn Roof_Striker_2
	ai2_spawn Roof_Striker_3

#	particle lock3_locklight01 do start
}

func void roof_surprise(string ai_name)
{
	dprint roof_surprise
	ai2_dopath Roof_Striker_3 Roof_Striker_3b
	ai2_setjobstate	Roof_Striker_3
}

func void spawn_tower_guards(string ai_name)
{
	dprint spawn_tower_guards

	ai2_spawn Tower_Striker_1
	ai2_spawn Tower_Striker_2
#	particle lock3_locklight01 do start
}

func void spawn_lobby_tctf(string ai_name)
{
	dprint spawn_lobby_guards
	ai2_spawn Lobby_TCL_1
	ai2_spawn Lobby_TCL_2
	ai2_spawn Lobby_TCS_1

#	particle lock3_locklight01 do start
}

func void spawn_lobby_synd(string ai_name)
{
	dprint spawn_lobby_attackers

	sleep 600

	ai2_spawn Lobby_Striker_1
	ai2_spawn Lobby_Striker_2
	ai2_spawn Lobby_Striker_3
	ai2_spawn Lobby_Striker_4

	door_lock 35

#	particle lock3_locklight01 do start
}

func void spawn_lively_1(string ai_name)
{
	dprint spawn_lively_1

	ai2_spawn lively_striker_1
}

func void spawn_lively_2(string ai_name)
{
	dprint spawn_lively_2

	ai2_spawn lively_striker_2
}

func void spawn_lively_3(string ai_name)
{
	dprint spawn_lively_3

	ai2_spawn lively_striker_3
	ai2_spawn lively_striker_4
}

func void spawn_opposite_striker_1(string ai_name)
{
	dprint spawn_opposite_1

	ai2_spawn opposite_striker_1
	trigvolume_enable spawn_opposite_2 0
}

func void spawn_opposite_striker_2(string ai_name)
{
	dprint spawn_opposite_2

	ai2_spawn opposite_striker_2
	trigvolume_enable spawn_opposite_1 0
}

func void backdoor(string ai_name)
{
	dprint spawn_backdoor_squad

	ai2_spawn backdoor_striker_1
	ai2_spawn backdoor_striker_3
}

func void spawn_vats(string ai_name)
{
	dprint spawn_vats

	ai2_spawn Vat_Striker_1
	ai2_spawn Vat_Striker_2
	ai2_spawn Vat_Striker_3
	ai2_spawn Vat_Striker_4
	ai2_spawn Vat_Striker_5

	particle lock4_locklight01 do stop
	trigvolume_enable final_ambush 0
	trigvolume_enable outro_volume_1 0
	door_lock 49
	door_lock 50
}

func void gethelp(string ai_name)
{
	trigvolume_enable outro_volume_1 1
	sleep 120
	door_unlock 49
	door_unlock 50
	ai2_attack Ambush_Striker_2 Konoko
	particle lock177_locklight01 do start
	sound_music_stop mus_main03
}

func void final_ambush(string ai_name)
{
	dprint spawn_final_ambush
	ai2_spawn Ambush_Striker_1
	ai2_spawn Ambush_Striker_2
}

func void unlock_floor1_doors(string ai_name)
{
	dprint unlock_floor1_doors

	trigvolume_enable trigger_volume_10 0

	door_unlock 3
	door_unlock 8
	door_unlock 11
	door_unlock 14
	door_unlock 17
	door_unlock 20
	door_unlock 23
	door_unlock 26

	if(trigvolume_count(36) eq 0)
		{
		input 0
#		begin_cutscene
		cm_interpolate lock1 0
		sleep 60
		particle lock1_locklight01 do start
		sleep 150
		cm_interpolate tophint 0
		sleep 60
		particle lock4a_locklight01 do start
		sleep 150
		cm_reset
		end_cutscene
		input 1
		cm_reset
#		end_cutscene
		input 1
		}

	particle lock1_locklight01 do start
	particle lock4a_locklight01 do start

	door_counter = door_counter - 1
	if (door_counter eq 0)
		{
		unlock_roof();
		}
}

func void unlock_floor2_doors(string ai_name)
{
	dprint unlock_floor2_doors

	trigvolume_enable attack_trigger 1

	door_unlock 2
	door_unlock 9
	door_unlock 12
	door_unlock 15
	door_unlock 18
	door_unlock 21
	door_unlock 24
	door_unlock 27

	if(trigvolume_count(37) eq 0)
		{
		input 0
#		begin_cutscene
		cm_interpolate lock2 0
		sleep 60
		particle lock2_locklight01 do start
		sleep 150
		cm_interpolate tophint 0
		sleep 60
		particle lock4b_locklight01 do start
		sleep 150
		cm_reset
		end_cutscene
		input 1
		cm_reset
#		end_cutscene
		input 1
		}

	particle lock2_locklight01 do start
	particle lock4b_locklight01 do start

	door_counter = door_counter - 1
	if (door_counter eq 0)
		{
		unlock_roof();
		}

	sleep 60

	ai2_dopath Floor2_Striker_1 Floor2_Stk_1
	ai2_setjobstate	Floor2_Striker_1
}

func void unlock_floor3_doors(string ai_name)
{
	dprint unlock_floor3_doors

	door_unlock 28
	door_unlock 22
	door_unlock 16
	door_unlock 1
	door_unlock 10
	door_unlock 13
	door_unlock 19
	door_unlock 25

	if(trigvolume_count(37) eq 0)
		{
		input 0
#		begin_cutscene
		cm_interpolate lock3 0
		sleep 60
		particle lock3_locklight01 do start
		sleep 150
		cm_interpolate tophint 0
		sleep 60
		particle lock4c_locklight01 do start
		sleep 150
		cm_reset
#		end_cutscene
		input 1
		}

	particle lock3_locklight01 do start
	particle lock4c_locklight01 do start

	door_counter = door_counter - 1
	if (door_counter eq 0)
		{
		unlock_roof();
		}
}

func void unlock_roof(string ai_name)
{
	dprint unlock_roof
	door_unlock 4
	spawn_roof_guards
	door_unlock 56

	sound_music_start mus_main03	
}

func void passage_1(string ai_name)
{
	dprint unlock_floor1_doors

	input 0
	cm_interpolate passage 0
	sleep 60
	particle lock69a_locklight01 do start
	sleep 150
	cm_reset
	input 1

	passage_counter = passage_counter - 1
	if (passage_counter eq 0)
		{
		unlock_passage();
		}
}

func void passage_2(string ai_name)
{
	dprint unlock_floor1_doors

	input 0
	cm_interpolate passage 0
	sleep 60
	particle lock69b_locklight01 do start
	sleep 150
	cm_reset
	input 1

	passage_counter = passage_counter - 1
	if (passage_counter eq 0)
		{
		unlock_passage();
		}
}

func void passage_3(string ai_name)
{
	dprint unlock_floor1_doors

	input 0
	cm_interpolate passage 0
	sleep 60
	particle lock69c_locklight01 do start
	sleep 150
	cm_reset
	input 1

	passage_counter = passage_counter - 1
	if (passage_counter eq 0)
		{
		unlock_passage();
		}
}

func void unlock_passage(string ai_name)
{
	dprint unlock_passage

	sound_music_start mus_main03 1.0

	door_unlock 48
	#target_set(256, 0.0)
}

func void unlock_end_door(string ai_name)
{
	dprint unlock_end_door

	door_unlock 56

	trigvolume_enable final_ambush 1

	input 0
	cm_interpolate lock5 0
	sleep 60
	particle lockend_locklight02 do start
	sleep 150
	cm_reset
	input 1

	target_set(52, 30.0)
	sleep 30
	ai2_spawn Vat_MB_1
}


func void Lobby_Hurt_TCL_1(string ai_name)
{
	dprint Hurt_TCL_1
	ai2_dopath Lobby_TCL_1 Lobby_Hurt_TCL_1
}


func void Lobby_Hurt_TCL_2(string ai_name)
{
	dprint Hurt_TCL_2

	sleep 120

	ai2_dopath Lobby_TCL_2 Lobby_Hurt_TCL_2
}


### MISE EN SCENE ###


func void miseenscene_start(string ai_name)
{
	dprint scene_start
	particle scene create

	ai2_spawn scene_thug_1
	ai2_spawn scene_thug_2
}

func void miseenscene_stop(string ai_name)
{
	dprint scene_stop
	particle scene kill
}

func void day_264(string ai_name)
{
	dprint day264
	
	sleep 150
	particle day264 create
	particle dayafter create
	particle dayafter start

	ai2_dopath scene_thug_1 scene_flee_1 1
	ai2_dopath scene_thug_2 scene_flee_2 1

	sleep 300
	ai2_spawn arcy
	
	sleep 1000
	chr_delete scene_thug_1
	chr_delete scene_thug_2

	sleep 500
	chr_delete arcy
}