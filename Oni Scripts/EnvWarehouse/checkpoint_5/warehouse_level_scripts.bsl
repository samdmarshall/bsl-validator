# warehouse_level_scripts.bsl
#
# LEVEL LOGIC
#
########################### START & SAVE ##############################
var int outro_has_started = 0;
var int count_alarm;
var int count_end_striker = 0;
var int count_end_console = 0;
var int td;
var int ns;
var int in_t64;
var int d6;
var int ul5;
# music #

func void music_train1(void)
{
	sound_music_start atm_gr06 0
	sound_music_volume atm_gr06 0.7 3.0
#	stopped by moving into combat rooms
}

func void music_train2(void)
{
	sound_music_start atm_ft68 0
	sound_music_volume atm_ft68 0.75 3.0
#	stopped by moving into firing range
}

func void music_train3(void)
{
	sound_music_start mus_amasian 0
	sound_music_volume mus_amasian 0.75 3.0
#	stopped by using last review console
}

func void music_firstfight(void)
{
	sound_music_start mus_ambgrv1 0
	sound_music_volume mus_ambgrv1 0.75 3.0
#	stopped by intro_enemies thug die or hurt scripts
}

func void music_timer(void)
{
	sound_music_start mus_chase 0
	sound_music_volume mus_chase 0.75 3.0
#	stopped in end_console or end_striker
}

func void music_stop(void)
{
	dprint STOP_THE_MUSIC
	sound_music_volume atm_gr06 0.0 2.0
	sound_music_stop atm_gr06
	sound_music_volume atm_ft68 0.0 2.0
	sound_music_stop atm_ft68
	sound_music_volume mus_amasian 0.0 2.0
	sound_music_stop mus_amasian
	sound_music_volume mus_ambgrv1 0.0 2.0
	sound_music_stop mus_ambgrv1
	sound_music_volume mus_chase 0.0 3.0
	sound_music_stop mus_chase
}

func void level_start(string ai_name)
{
# These functions are used when the game is restored.
	
	trigvolume_enable(intro_enemies_tv, 0);
	trigvolume_enable(setup_bay3_tv, 0);
	trigvolume_enable gotLSI_tv 0
	trigvolume_enable trigger_volume_06 0
	particle bigdoor_locklight02 do start

	my_save_point = save_point;

	if (my_save_point eq 0)
	{
		can_train_movement=1;
		dprint SAVE_POINT_0	
#		USE THIS FUNC TO SET UP TRAINING SEQUENCE AGAIN
		splash_screen training_splash_screen
		dprint hello
	}

	if (my_save_point eq 1)
	{
# this is a built in save point for 
		can_train_movement=0;
#		objective_set(1)
		door_lock(15);
		door_lock(16);
		particle(lock1_locklight01, do, stop);
		restore_game
		playback 0 SwingKonokoSet
		target_set(1,0.0)
		dprint RESTORE_SAVE_Point_1
		splash_screen warehouse_splash_screen
		swing_cutscene
	}

	if (my_save_point eq 2)
	{
		can_train_movement=0;
#		objective_set(1)
		door_lock(15);
		door_lock(16);
		particle(lock1_locklight01, do, stop);
		restore_game
		ai2_spawn A_t48
		playback 0 SwingKonokoSet
		target_set(1,0.0)
		dprint RESTORE_SAVE_Point_2_begin
		splash_screen warehouse_splash_screen
		cm_reset
		sleep 30
		chr_forceholster 0 0
	}

	if (my_save_point eq 3)
	{
		dprint RESTORE_SAVE_POINT_3
		can_train_movement=0;
		trigvolume_enable trigger_volume_03 0
		target_set(7053, 15.0)
		door_lock 16
		ai2_spawn Mid_Thug_2
		ai2_spawn Mid_Thug_1
		restore_game
		objective_set 2 silent
		splash_screen warehouse_splash_screen
	}

	if (my_save_point eq 4)
	{
		dprint RESTORE_SAVE_POINT_4
		can_train_movement=0;
		door_lock 65
		trigvolume_enable trigger_volume_68 0
		target_set(7054, 30.0)
	#	spawn_top	
		restore_game
		objective_set 2 silent
		splash_screen warehouse_splash_screen
	}

	if (my_save_point eq 5)
	{
		dprint RESTORE_SAVE_POINT_5
		can_train_movement=0;
		door_lock 48
		particle bigdoor_locklight02 do stop
		ai2_spawn WH_Thug_A 
		ai2_spawn WH_Striker_B
		ai2_spawn WH_Striker_C
		ai2_spawn WH_Striker_D
		ai2_dopath WH_Thug_A WH_Thug_A
		ai2_dopath WH_Striker_B WH_Striker_B
		ai2_dopath WH_Striker_D WH_Striker_D
		ai2_setjobstate WH_Thug_A 
		ai2_setjobstate WH_Striker_B
		ai2_setjobstate WH_Striker_D
		chr_teleport WH_Striker_D 95
		trigvolume_enable tv78 0
		trigvolume_enable mid_warehouse_target 0
		restore_game
		splash_screen warehouse_splash_screen
		sleep 7
		train_timer
	}
}

func void unholstergun(void)
{
	sleep 30
	chr_forceholster 0 0 
}

# This is an example of a save game console.

func void s1(string player_name)
{
	dprint saveit_1

	if (my_save_point ne 2)
	{
		save_game 2 autosave
	}
}

func void s2(string player_name)
{
	dprint saveit_2

	if (my_save_point ne 3)
	{
		save_game 3 autosave
	}
}

func void s3(string player_name)
{
	dprint saveit_3

	if (my_save_point ne 4)
	{
		save_game 4 autosave
	}
}

func void s4(string player_name)
{
	dprint saveit_4

	if (my_save_point ne 5)
	{
		save_game 5 autosave
	}
}

func void you_lose(string ai_name)
{
	sleep 240
	fade_out 0 0 0 180 
	sleep 240
	lose
}

func void unlock1(string ai_name)
{
	dprint unlock1
	target_set(33, 15.0)

	door_unlock 15
	door_unlock 16

	input 0
	cm_interpolate lock1 0
	sleep 60
	particle lock1_locklight01 do start
	sleep 150
	cm_reset
	input 1
	sleep 120
	ai2_spawn Bay1_Thug_1
	trigvolume_enable intro_enemies_tv 1
	trigvolume_enable trigger_volume_77 0
}

func void unlock2(string ai_name)
{
	dprint unlock2

	music_stop

	target_set(84, 15.0)

	door_unlock 24
	door_unlock 26

	input 0
	cm_interpolate lock2 0
	sleep 60
	particle lock2_locklight01 do start
	sleep 150
	cm_reset
	input 1
	trigvolume_enable(setup_bay3_tv, 1);
}

func void setup_bay3(string ai_name)
{
	dprint setup_bay_3
	target_set(84, 15.0)
#	particle lock3_locklight01 do start
}

func void checkLSI(string ai_name)
{
	var int has_lsi = chr_has_lsi(0);

	dprint checkLSI
	trigvolume_enable gotLSI_tv 0

	if (has_lsi eq 1)
	{
		input 0
		sleep 25
		chr_animate 0 KONOKOwatch_start 60 12
		sleep 59
		chr_animate 0 KONOKOwatch_idle 15
		text_console level_1e
		chr_animate 0 KONOKOwatch_stop
		sleep 15
		input 1
		sleep 15
		door_unlock 37
		particle lock3_locklight01 do start
		ai2_spawn Ambush_Striker_1
		ai2_spawn Mid_Thug_1
		ai2_spawn Mid_Thug_2
		target_set(7053,30.0)
		chung_music_stop
		objective_set(2)
		sound_dialog_play_block c00_01_21shinatama
		sound_dialog_play_block pause
	}

	if (has_lsi eq 0)
	{
		# sleep and turn the trigger volume back on later
		sleep 60
		trigvolume_enable gotLSI_tv 1
	}
}

func void t09(string ai_name)
{
	target_set(62,30.0)
}

func void spawn_top(string ai_name)
{
 	dprint spawn_top
	ai2_spawn Top_Striker_1
	ai2_spawn Top_Comguy_1
	ai2_spawn Top_Thug_3
	ai2_spawn Top_Thug_5
	ai2_spawn WH_Thug_A 
	ai2_spawn WH_Striker_B
	ai2_spawn WH_Striker_C
	ai2_spawn WH_Striker_D
}

func void spawn_mid2(string ai_name)
{
 	dprint spawn_mid2
	ai2_spawn Mid2_Striker_1
	ai2_spawn Mid2_Striker_2
	target_set(66, 15.0)
}

func void unlock4(string ai_name)
{
	dprint unlock4
	target_set(7054, 15.0)

	door_unlock 65

	input 0
	cm_interpolate lock4 0
	sleep 60
	particle lock4_locklight01 do start
	sleep 150
	cm_reset
	input 1

}

func void unlock5(string ai_name)
{
	dprint unlock5
	target_set(72, 30.0)
	console_deactivate 4
	door_unlock 73
	door_unlock 74
	door_unlock 81
	door_unlock 82
	ul5 = 1;
	input 0
	cm_interpolate lock5 0
	sleep 60
	particle lock5_locklight01 do start
	sleep 150
	cm_reset
	input 1
	console_deactivate 7
}

func void hurt1(string ai_name)
{
	dprint HURT
	ai2_makeignoreplayer Bay4_Comguy_1 1
	ai2_doalarm Bay4_Comguy_1 6
	ai2_dopath Bay4_Comguy_1 Run_To_Alarm
	ai2_setjobstate Bay4_Comguy_1
	sleep 60
	sound_dialog_play_block c00_01_96shinatama

}

func void patrolscript0001(string ai_name)
{
	dprint comguy_do_alarm
	ai2_doalarm Bay4_Comguy_1 6
}

func void unlock_alarm(void)
{
	dprint unlock_alarm
	door_unlock 73
	door_unlock 74
	door_unlock 81
	door_unlock 82
	ai2_dopath Alarm_Bay4_Striker_1 Alarm_Bay4_Striker_1
	sleep 107
	particle lock5_locklight01 do start
	console_deactivate 7
}

func void do_alarm_sound(void)
{
	sound_ambient_start alarm_loop
	sleep 900
	sound_ambient_stop alarm_loop
}

func void alarm_trig(string ai_name)
{
	dprint alarm_trig
	trigvolume_enable alarm_trigvol 0
	target_set(72,30.0)
	if(ul5 eq 0)
	{
	#watch comguy set alarm, doors initially locked
	if(count_alarm eq 0)
	{	
		ai2_passive Bay4_Comguy_1 1
		ai2_spawn Alarm_Bay4_Striker_1
		ai2_makeignoreplayer Alarm_Bay4_Striker_1 1
		ai2_spawn Alarm_Bay4_Striker_2
		ai2_makeignoreplayer Alarm_Bay4_Striker_2 1
	#	ai2_spawn Bay5_Thug_1
		ai2_spawn Bay5_Thug_2
		ai2_doalarm Alarm_Bay4_Striker_1 4
		input 0
		chr_animate Bay4_Comguy_1 COMGUYconsole 
		fade_out 0 0 0 30
		letterbox 1
		sleep 30
		cm_interpolate alarm5 0
		fade_in
		sleep 90
		fade_out 0 0 0 15
		chr_teleport Alarm_Bay4_Striker_1 7033
		sleep 15
		cm_interpolate alarm1 0
		fork do_alarm_sound
		fade_in
		sleep 40
		cm_interpolate alarm2 240
		sleep 320
		cm_interpolate alarm3 90
		sleep 70
		particle lock5_locklight01 do start
		sleep 20
		cm_interpolate alarm4 0
		sleep 60
		fade_out 0 0 0 60
		sleep 60
		ai2_passive Bay4_Comguy_1 0
	}

	#no watch comguy set alarm, doors initially locked
	if(count_alarm eq 1)
	{	
		ai2_spawn Alarm_Bay4_Striker_1
		ai2_makeignoreplayer Alarm_Bay4_Striker_1 1
		ai2_spawn Alarm_Bay4_Striker_2
		ai2_makeignoreplayer Alarm_Bay4_Striker_2 1
	#	ai2_spawn Bay5_Thug_1
		ai2_spawn Bay5_Thug_2
		input 0
		fade_out 0 0 0 30
		sleep 15
		chr_teleport Alarm_Bay4_Striker_1 7033
		ai2_doalarm Alarm_Bay4_Striker_1 4
		sleep 15
		letterbox 1
		cm_interpolate alarm1 0
		fork do_alarm_sound
		fade_in
		sleep 40
		cm_interpolate alarm2 240
		sleep 320
		cm_interpolate alarm3 90
		sleep 70
		particle lock5_locklight01 do start
		sleep 20
		cm_interpolate alarm4 0
		sleep 60
		fade_out 0 0 0 60
		sleep 60		
	}
	}

	#watch comguy set alarm, doors already unlocked
	if(ul5 eq 1)
	{
		if(trigvolume_count (66) eq 0)
		{
			if(count_alarm eq 0)
			{	
				ai2_passive Bay4_Comguy_1 1
				ai2_spawn Alarm_Bay4_Striker_1
				ai2_makeignoreplayer Alarm_Bay4_Striker_1 1
				input 0
				chr_animate Bay4_Comguy_1 COMGUYconsole 
				fade_out 0 0 0 30
				letterbox 1
				sleep 30
				cm_interpolate alarm5 0
				fade_in
				sleep 90
				fade_out 0 0 0 15
		#		chr_teleport Alarm_Bay4_Striker_1 7033
				sleep 15
				cm_interpolate alarm1 0
				fork do_alarm_sound
				fade_in
				sleep 90
				fade_out 0 0 0 60
				sleep 60	
				ai2_passive Bay4_Comguy_1 0
			}

	#no watch comguy set alarm, doors already unlocked
			if(count_alarm eq 1)
			{	
				ai2_spawn Alarm_Bay4_Striker_1
				ai2_makeignoreplayer Alarm_Bay4_Striker_1 1
				input 0
				fade_out 0 0 0 30
				sleep 7
				chr_teleport Alarm_Bay4_Striker_1 7033
				sleep 23
				letterbox 1
				cm_interpolate alarm1 0
				fork do_alarm_sound
				fade_in
				sleep 90
				fade_out 0 0 0 60
				sleep 60
			}
		}
	}

	cm_reset
	fade_in
	letterbox 0
	input 1
	#sleep 15
	ai2_makeignoreplayer Alarm_Bay4_Striker_1 0
	ai2_makeignoreplayer Alarm_Bay4_Striker_2 0
	ai2_makeignoreplayer Bay4_Comguy_1 0
	ai2_dopath Bay4_Comguy_1 patrol_42
	ai2_setjobstate Bay4_Comguy_1 
#	ai2_attack Alarm_Bay4_Striker_1 char_0
	ai2_attack Alarm_Bay4_Striker_2 char_0

}

func void set_bay6_objective(string ai_name)
{
	dprint set_bay6_objective
	target_set(92, 15.0)

}

func void spawn_bay6_top(string ai_name)
{
	ai2_spawn Bay6_Striker_1
	ai2_spawn Bay6_Neutral_1
	ai2_spawn Bay6_Neutral_2
	ai2_spawn guard1
	trigvolume_enable spawn_bay6_bot_tv 0

	train_neutral();
}

func void spawn_bay6_bot(string ai_name)
{
	ai2_spawn Bay6_Striker_1b
	ai2_spawn Bay6_Neutral_1b
	ai2_spawn Bay6_Neutral_2
	ai2_spawn guard1
	trigvolume_enable spawn_bay6_top_tv 0

	train_neutral();
}

func void open_warehouse(string ai_name)
{
	trigvolume_enable trigger_volume_06 0
	objective_set(3)
	sleep 10
	target_set(93,15.0)
	ai2_dopath Bay6_Neutral_2 Open_Warehouse
	ai2_setjobstate Bay6_Neutral_2
	ai2_spawn WH_Thug_A 
	ai2_spawn WH_Striker_B
	ai2_spawn WH_Striker_C
	ai2_spawn WH_Striker_D
	particle lock7_locklight01 do start
	door_unlock 84
	door_unlock 85
	door_unlock 86

	ai2_spawn Final_Thug_1
	ai2_spawn Final_Thug_2
	ai2_spawn Final_Thug_3
	ai2_spawn Final_Thug_5

	ai2_dopath WH_Thug_A WH_Thug_A
	ai2_dopath WH_Striker_B WH_Striker_B
	ai2_dopath WH_Striker_D WH_Striker_D

	ai2_setjobstate WH_Thug_A 
	ai2_setjobstate WH_Striker_B
	ai2_setjobstate WH_Striker_D
}

func void t47(string ai_name)
{
	ai2_spawn Bay5_Thug_1
	ai2_spawn Bay5_Thug_2
}

func void mid_warehouse_target(string ai_name)
{
#	Reset Target
	target_set(96, 15.0)
}
func void stair1_target(string ai_name)
{
#	Reset Target
	target_set(31,15.0)
}

func void stair2_target(string ai_name)
{
#	Reset Target
	target_set(81,15.0)
}

func void enable_end(string ai_name)
{
#	trigvolume_enable end 1
	timer_stop
}

func void gotoconsole(string ai_name)
{
#	dprint Guard_A_RTAlarm
	console_activate 9
	sleep 7
	ai2_doalarm Bay6_Neutral_2 9
	sleep 180
	trigvolume_enable trigger_volume_06 1
}

func void t06(string ai_name)
{
	dprint t06
	ai2_doalarm Bay6_Neutral_2 9
}

func void t10(string ai_name)
{
	dprint t10
	ai2_makeignoreplayer Bay6_Neutral_1 1
	ai2_makeignoreplayer Bay6_Neutral_1b 1
	ai2_dopath Bay6_Neutral_1 Bay6_Thug_1
	ai2_dopath Bay6_Neutral_1b Bay6_Thug_1_copy
	sleep 240
	ai2_makeignoreplayer Bay6_Neutral_1 0
	ai2_makeignoreplayer Bay6_Neutral_1b 0	
}

func void final_striker_attack(void)
{
	ai2_attack WH_Striker_C char_0
}

func void end_console(string ai_name)
{
	dprint end_console
	count_end_console = 1;
	music_stop
	timer_stop

	if (count_end_striker eq 0)
	{
		final_striker_attack
	}

	if (count_end_striker eq 1)
	{
		outro_start
	}

}

func void end_striker(string ai_name)
{
	dprint end_striker
	count_end_striker =  1
	music_stop

	if (count_end_console eq 1)
	{
		outro_start
	}
}

# we can only start the trigger volume once
# and only if there are no bad guys in the area

func void outro_start2(void)
{
	dprint READY_TO_BATTLE
	outro_has_started = 1;
	sleep 20
	outro
}

func void outro_start(void)
{
	if (outro_has_started eq 0)
	{
		if (trigvolume_count (76) eq 0)
		{
			if (trigvolume_count (70) eq 1)
			{
				outro_start2
			}
		}
	}
}

# once every 2/3 of a second, check to see if we are in the 
# trigger and have no badguys near us

func void t70(string ai_name)
{
	var int count_end_both = 0;

	dprint t70_END

	count_end_both = count_end_both + count_end_console;
	count_end_both = count_end_both + count_end_striker;

	trigvolume_enable trigger_volume_70 0

	if (count_end_console eq 1)
	{
		outro_start
	}

	if (outro_has_started eq 0)
	{
		if (count_end_console eq 1)
		{
			final_striker_attack
		}
	}

	if(outro_has_started eq 0)
	{
		sleep 40
		trigvolume_enable trigger_volume_70 1	
	}
}

func void t01(string ai_name)
{
	dprint t01
	ai2_spawn A_t50
}

func void compass(void)
{
	target_set(44, 30.0)
	ui_flash_element compass 1
	sound_dialog_play_block c00_01_26shinatama
	message xincoming 130
	sleep 60
	input 0
	sleep 30
	chr_animate 0 KONOKOwatch_start 60
	sleep 59
	chr_animate 0 KONOKOwatch_idle 15
	text_console level_1d
	ui_flash_element compass 0
	chr_animate 0 KONOKOwatch_stop
	input 1
	sleep 60
	objective_set (1)
}

func void t48_dead(string ai_name)
{
	dprint t48dead
	td = 1;	
	door_unlock 108
	if(in_t64 eq 1)
	{
		sleep 180
		compass
	}
}

func void t63(string ai_name)
{
	dprint t63
#	ai2_spawn A_t47
	ai2_spawn A_t48
}

func void t64(string ai_name)
{
	dprint t64
	if(in_t64 eq 0)
	{	
		in_t64 = 1;
		ai2_dopath A_t48 patrol_49
		ai2_setjobstate A_t48
		ai2_attack A_t48 char_0
	}
	if(td eq 1)
	{
		trigvolume_enable trigger_volume_64 0
		compass
	}
}

func void t65(string ai_name)
{
	
	dprint t65
	if(d6 eq 0)
	{
		message xdoorislocked
		dprint door_is_locked
	}
}

func void t65b(string ai_name)
{
	
	dprint t65b
	if(d6 eq 0)
	{
		message_remove xdoorislocked
	}
}
func void t67(string ai_name)
{
	
	dprint t67
	chr_changeteam guard1 Syndicate
}

func void t07(string ai_name)
{
	
	dprint t07
	ai2_spawn Top_Thug_5
	ai2_spawn WH_Striker_C
	ai2_spawn WH_Striker_D
}

func void t69(string ai_name)
{
	
	dprint t69
	ai2_spawn Top_Striker_1
	ai2_spawn Top_Comguy_1
	ai2_spawn Top_Thug_3
}

func void unlock6(string ai_name)
{
	dprint unlock6
	d6 = 1
	door_unlock 6
	particle d1_locklight01 do start
	trigvolume_enable trigger_volume_65 1
}

func void yhealth(string ai_name)
{
	dprint yhealth
	message_remove
	lock_keys 
	input 1
	ui_show_element right 1
	sound_dialog_play_block c00_01_92shinatama
	sound_dialog_play_block pause
	ui_flash_element health 1
	chr_animate 0 KONOKOwatch_start 60
	sleep 59
	chr_animate 0 KONOKOwatch_idle 15
	text_console level_1m
	ui_flash_element health 0
	chr_animate 0 KONOKOwatch_stop
	chr_forceholster 0 0
	lock_keys keys_all
	end_cutscene
	if (trigvolume_count (63) eq 1)
	{
		ai2_spawn A_t48
	}
}

func void console_evidence1(string ai_name)
{
	text_console level_1a
	console_reset 19
}

func void console_evidence2(string ai_name)
{
	text_console level_1b
	console_reset 20
}

func void t02(string ai_name)
{
	dprint t02
	sleep 60
	if(trigvolume_count (2) eq 1)
	{
		dprint spawned_secret
		ai2_spawn secret2
		trigvolume_enable trigger_volume_01 0
		ai2_spawn A_t50
		ai2_dopath A_t50 patrol_secret1
		ai2_setjobstate A_t50
	}
}

func void t05(string ai_name)
{
	dprint t05
	ai2_spawn ambush_striker
}
