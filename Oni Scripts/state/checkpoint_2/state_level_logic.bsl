#
# state_spawn_guards.bsl
#
# LEVEL LOGIC
#
################## MUSIC TEST ################################
func void level_start(string ai_name)
{
# These functions are used when the game is restored.

	if (my_save_point eq 0)
	{
		dprint SAVE_POINT_0
#		USE THIS FUNC TO SET UP TRAINING SEQUENCE AGAIN

		ai2_spawn neutral_1
		ai2_spawn fl2_secguard_1
		powerup_spawn ammo 131
		powerup_spawn hypo 132
	}

	if (my_save_point eq 1)
	{
		dprint RESTORE_SAVE_POINT_1
		fl1_spawn_guards

		ai2_spawn neutral_1
		ai2_spawn fl2_secguard_1
		powerup_spawn ammo 131
		powerup_spawn hypo 132

		objective_set(1);
		particle(lock99_locklight01, do, start);
		console_deactivate 10
		trigvolume_enable(trigger_volume_09, 0);
		restore_game
	}

	if (my_save_point eq 2)
	{
		dprint RESTORE_SAVE_POINT_2

		particle obj1 create
		particle obj1 start

		trigvolume_enable(Cut_dog, 1);
		trigvolume_enable(trigger_volume_11, 1);
		trigvolume_enable(trigger_volume_12, 1);
		trigvolume_enable(trigger_volume_14, 1);
		trigvolume_enable(trigger_volume_15, 1);
		trigvolume_enable(trigger_volume_10, 1);

		trigvolume_enable(shut_off_vault_music, 0);
		trigvolume_enable(trigger_volume_09, 0);
		trigvolume_enable(trigger_volume_08, 0);
		trigvolume_enable(trigger_volume_02, 0);
		trigvolume_enable(trigger_volume_01, 0);

		trigvolume_enable(save_trig_right, 0);
		trigvolume_enable(save_trig_left, 0);

		objective_set 4 silent

		target_set(267, 30.0)

		#change_flGUARD_CORRIDOR_lights	

		door_lock(3);
		door_lock(77);

		door_unlock(15);
		door_unlock(14);
		door_unlock(7);
		door_unlock(5);
		door_unlock(75);
		door_unlock(59);
		door_unlock(54);
		door_unlock(67);
		door_unlock(68);
		door_unlock(76);
		door_unlock(23);
		door_unlock(42);

		trig_activate 1
		trig_activate 2
		#trig_activate 14

		#console_activate 6
		#console_activate 7
		#console_activate 9

		console_deactivate 11
		console_deactivate 4
		console_deactivate 88
		console_deactivate 82
		console_deactivate 5
		console_deactivate 3
		console_deactivate 6
		console_deactivate 1
		console_deactivate 2

		particle lock1_locklight01 do start
		particle lock2_locklight01 do start
		particle lock3_locklight01 do start
		particle lock4_locklight01 do start
		particle lock5a_locklight01 do start
		particle lock5b_locklight01 do start
		particle lock5c_locklight01 do start
		particle lock99_locklight01 do start

		particle lock6_locklight01 do stop

		env_shade 271 272 .4 .4 .2

		restore_game
#		objective_set(3);
	}
}

# This is an example of a save game console.

func void save_game_1(string player_name)
{
	dprint saveit_1
	save_game 1 autosave
}

func void save_game_2_right(string player_name)
{
	dprint saveit_2
	save_game 2 autosave
	trigvolume_enable save_trig_left 0
}

func void save_game_2_left(string player_name)
{
	dprint saveit_2
	save_game 2 autosave
	trigvolume_enable save_trig_right 0
}

##############################################################
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

func void die_for_art_1(string ai_name)
{
	dprint DFA_1
	music_counter = music_counter - 1

	if (music_counter eq 0)
	{
		all_music_counters();
	}

}
func void die_for_art_2(string ai_name)
{
	dprint DFA_2
	music_counter = music_counter - 1

	if (music_counter eq 0)
	{
		all_music_counters();
	}

}
func void all_music_counters(void)
{
	dprint STOP_THE_MUSIC
	sound_music_stop mus_main02
	sound_music_stop mus_heart
	sound_music_stop mus_main02_hd
}

func void fl1_spawn_guards(string ai_name)
{
#	dprint FL1_SPAWN_GUARDS
	ai2_spawn fl1_secguard_1
	ai2_spawn fl1_secguard_2
	ai2_spawn fl1_secguard_4
	trigvolume_enable shut_off_vault_music 0
}

func void fl2_spawn_secguard_2(string ai_name)
{
#	dprint FL2_SPAWN_GUARDS
	ai2_spawn fl2_secguard_2
	ai2_spawn fl2_secguard_7
	ai2_spawn fl2_balcony_2

	ai2_spawn neutral_2
	ai2_spawn neutral_4
}

func void fl2_spawn_secguard_3(string ai_name)
{
#	dprint FL2_SPAWN_ASSAULT_GUARDS
	ai2_spawn fl2_secguard_3
	ai2_spawn fl2_secguard_6
	ai2_spawn fl2_balcony_1
}

# THESE ARE THE THIRD FLOOR/ROOF GUYS

func void spawn_fl3_guards(string ai_name)
{
#	dprint FLROOF_SPAWN_GUARDS
	ai2_spawn fl3_secguard_1
	ai2_spawn fl3_secguard_2
	ai2_spawn fl3_secguard_6
	ai2_spawn flROOF_sniper_1
	ai2_spawn Roof_BOSWAT_1

	ai2_spawn neutral_3
	ai2_spawn neutral_6
}

# THESE ARE THE COMPUTER ROOM GUYS

func void spawn_flBASEMENT_guards(string ai_name)
{
#	dprint FLROOF_SPAWN_GUARDS
	ai2_spawn flBASEMENT_guard_1
	ai2_spawn flBASEMENT_guard_2
}

# THESE ARE THE COMPUTER ROOM GUYS

func void spawn_flRAMP_guards(string ai_name)
{
#	dprint FLROOF_SPAWN_GUARDS
	ai2_spawn flRAMP_guard_1
	ai2_spawn flRAMP_guard_2
	trigvolume_enable ninja_ambush_top_trig 0
	trigvolume_enable ninja_ambush_bot_trig 0
	particle lock46_locklight01 do start
}

func void spawn_outside_left_snipers(string ai_name)
{
#	dprint FL2_SPAWN_GUARDS
	ai2_spawn flOUTSIDE_A_sniper_1
	ai2_spawn flOUTSIDE_A_sniper_2
	ai2_spawn flOUTSIDE_B_sniper_1
	ai2_spawn flOUTSIDE_C_sniper_1
}

func void spawn_outside_right_snipers(string ai_name)
{
#	dprint FL2_SPAWN_GUARDS
	ai2_spawn flOUTSIDE_E_sniper_1
	ai2_spawn flOUTSIDE_E_sniper_2
	ai2_spawn flOUTSIDE_D_sniper_1
	ai2_spawn flOUTSIDE_D_sniper_2
}

func void spawn_targets(string ai_name)
{
#	dprint FL2_SPAWN_GUARDS
	ai2_spawn fl2_target_2
}

func void do_neutral_1_run(string ai_name)
{
	ai2_neutralbehavior neutral_1 none
	ai2_setmovementmode neutral_1 run_noaim
	ai2_dopath neutral_1 neutral_1_run
	ai2_setjobstate neutral_1
}

func void do_neutral_2_run(string ai_name)
{
	ai2_neutralbehavior neutral_2 none
	ai2_dopath neutral_2 neutral_2_run
	ai2_setjobstate neutral_2
}

func void do_neutral_3_run(string ai_name)
{
	ai2_neutralbehavior neutral_3 none
	ai2_dopath neutral_3 neutral_3_run
	ai2_setjobstate neutral_3
}

func void unlock_secret_1(string ai_name)
{
	input 0
	cm_interpolate secret1 0
	sleep 60
	console_activate 7
	#particle lock69a_locklight01 do start
	sleep 150
	cm_reset
	input 1

	ai2_spawn secret_guard_1
	ai2_spawn secret_guard_2
}

func void unlock_secret_2(string ai_name)
{
	door_unlock 34
	door_unlock 36

	# CB: ensure ramp guards do not see ninja and go after him!
	ai2_passive flRAMP_guard_1 1
	ai2_passive flRAMP_guard_2 1

	ai2_spawn cutscene_ninja_1
	input 0
	cm_interpolate secret2 0
	sleep 60
	particle lock7_locklight01 do start
	sleep 15
	trig_deactivate 12
	sleep 150
	cm_reset
	input 1

	chr_delete cutscene_ninja_1
	ai2_passive flRAMP_guard_1 0
	ai2_passive flRAMP_guard_2 0

	trigvolume_enable ninja_ambush_top_trig 1
	trigvolume_enable ninja_ambush_bot_trig 1
}

func void ninja_ambush(string ai_name)
{
	trigvolume_enable ninja_ambush_top_trig 0	
	trigvolume_enable ninja_ambush_bot_trig 0	

	ai2_spawn ambush_ninja_1
	ai2_spawn creepy_ninja_1
	ai2_spawn creepy_ninja_3
}

func void hall_1(string ai_name)
{
	input 0
	cm_interpolate hall1 0
	sleep 60
	door_unlock 77
	door_unlock 38
	door_unlock 22
	door_unlock 3
	particle lock6_locklight01 do start
	particle lock7_locklight01 do stop
	sleep 150
	cm_reset
	input 1

	trig_deactivate 1
	trig_deactivate 2
}

func void top_1(string ai_name)
{
	input 0
	#cm_interpolate hall1 0
	sleep 60
	door_unlock 35
	door_unlock 38
	door_unlock 22
	door_unlock 3
	particle lock6_locklight01 do start
	sleep 150
	cm_reset
	input 1

	trig_activate 12
	trig_activate 13
	trig_activate 14

	trig_deactivate 1
	trig_deactivate 2
}

func void downstairs(string ai_name)
{
	trig_deactivate 14
	door_unlock 8
	door_unlock 9
	particle lock23_locklight01 do start
	ai2_spawn creepy_ninja_5
	ai2_spawn creepy_ninja_6
}

func void upstairs(string ai_name)
{
	trig_deactivate 13
	door_unlock 35
	particle lock65_locklight01 do start
}

var int door_counter=3;

func void seclock_music_start(void)
{
	if (door_counter eq 3)
	{
		sound_music_start mus_lz 0.75
	}
}

func void seclock_decrement_counter(void)
{
	door_counter = door_counter - 1


	if (door_counter eq 0)
	{
		sound_music_stop mus_lz
		unlock_roof();
	}
}

func void seclock1(string ai_name)
{
	seclock_music_start

	input 0
	cm_interpolate security 0
	sleep 60
	particle lock5a_locklight01 do start
	sleep 150
	cm_reset
	input 1

	seclock_decrement_counter
}

func void seclock2(string ai_name)
{
	seclock_music_start

	input 0
	cm_interpolate security 0
	sleep 60
	particle lock5b_locklight01 do start
	sleep 150
	cm_reset
	input 1

	seclock_decrement_counter
}

func void seclock3(string ai_name)
{
	seclock_music_start

	input 0
	cm_interpolate security 0
	sleep 60
	particle lock5c_locklight01 do start
	sleep 150
	cm_reset
	input 1

	seclock_decrement_counter
}

func void unlock_roof(string ai_name)
{
	door_unlock 23
	door_unlock 42
}

#
# state_door_lock_lights.bsl
#
# SCRIPTS TO CHANGE THE LOCKED LIGHTS ON DOORS
#
# TURN FROM GREEN TO RED: do stop

func void change_fl2_lights(string ai_name)
{
#	dprint WHATEVER YOU WANT
	sleep 60
	particle lock2_locklight01 do start
}

func void change_fl3_lights(string ai_name)
{
	particle lock3_locklight01 do start
	ai2_spawn fl3_mook_1
	ai2_spawn fl3_mook_2
}

func void change_flDATA_ARCHIVE_lights(string ai_name)
{
	sleep 60
	particle lock4_locklight01 do start
}

func void change_flCOMMAND_CENTER_lights(string ai_name)
{
	particle lock5_locklight01 do start
}

func void change_flGUARD_CORRIDOR_lights(string ai_name)
{
	particle lock6_locklight01 do start
}

func void change_flDIG_OFFICES_lights(string ai_name)
{
	particle lock7_locklight01 do start
}


func void grifftext(string chr_index)
{
	dprint text2a
	text_console level_11a
	console_reset 9
}


#
# state_spawn_guards.bsl
#
# SCRIPTS TO SPAWN SECURITY GUARDS
#

func void set_objective_1(string ai_name)
{
#	dprint WHATEVER I WANT
	objective_set(1)
	target_set(127, 30.0)
}

func void set_objective_2(string ai_name)
{
#	dprint WHATEVER I WANT
	objective_set(2)
}

func void set_objective_3(string ai_name)
{
#	dprint WHATEVER I WANT
	objective_set(3)
}

func void set_objective_4(string ai_name)
{
#	dprint WHATEVER I WANT
	objective_set(4)
	target_set(267, 30.0)
}

func void set_objective_5(string ai_name)
{
#	dprint WHATEVER I WANT
	objective_set(5)
}

func void set_objective_6(string ai_name)
{
#	dprint WHATEVER I WANT
	objective_set(6)
}

func void set_target_1(string ai_name)
{
#	dprint WHATEVER I WANT
	target_set(267, 30.0)
}

func void set_target_2(string ai_name)
{
#	dprint WHATEVER I WANT
	target_set(1030, 30.0)
}
###wuscripts
func void check_outro(string ai_name)
{
	trigvolume_enable tv_check_outro 0
	if(trigvolume_count (24) eq 0)
	{
		trigvolume_enable Cut_outro 1
		particle obj2 create
		target_set(126,30.0)
	}
	if(trigvolume_count (24) ne 0)
	{
		sleep 60
		trigvolume_enable tv_check_outro 1
	}
}
		