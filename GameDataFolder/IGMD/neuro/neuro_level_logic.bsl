# neuro_spawn_guards.bsl
#
# SCRIPTS TO SPAWN SECURITY GUARDS
#

################# START GAME LOGIC #############################

# creates counterS for stuff
var int neuro_counter;
var int kerr_counter;
var int has_probed = 0;
var int ambush_counter = 2;
var int final_check = 0;
var int FTS_variable = 2;

func void level_start(void)
{
# set counter values

	neuro_counter = 3
#	end_counter = 2
	kerr_counter = 3

	############# SAVE GAME SCRIPTS #############

# These functions are used when the game is restored.

	if (save_point eq 0)
	{
		dprint SAVE_POINT_0
#		VOODOO COMPUTING
	}

	if (save_point eq 1)
	{
		fork Setup_Intro
		fork set_objective_1
		dprint Restore_Autosave_Point_1
		restore_game
	}

	if (save_point eq 2)
	{
		dprint Restore_Autosave_Point_2

		objective_set 1 silent
		target_set(1261, 30.0)

		dprint Restore_Pod_1
		ai2_spawn Pod1_TCL_1
		ai2_spawn Pod1_TCL_2
		ai2_spawn Pod1_TCL_3
		ai2_spawn Pod1_Scientist_1
		ai2_spawn Pod1_Scientist_2
		#particle lock1_locklight01 do start
		door_lock(11);
		trigvolume_enable(autosave_trigger_1, 0);

		restore_game

#		console_deactivate 10
#		trigvolume_enable(trig_train_saves, 0);
#		trigvolume_enable(trig_train_objectives, 1);
	}

	if (save_point eq 3)
	{
		dprint RESTORE_SAVE_POINT_3

		objective_set 2 silent
		target_set(366, 30.0)

		particle lock3_locklight02 do start
		particle lock4_locklight02 do start

		door_unlock(58);

		door_lock(32);
		door_lock(33);
		door_lock(34);
		door_lock(35);

		trig_deactivate 2

		trigvolume_enable(trigger_volume_76, 0);
		trigvolume_enable(trigger_volume_06, 1);
		trigvolume_enable(Kerr_trig, 0);
		console_deactivate 12
		console_deactivate 13

		restore_game

		kerr_console_music
	}

	if (save_point eq 4)
	{
		dprint RESTORE_SAVE_POINT_4

		env_show 823 0

		objective_set 3 silent
		target_set(346, 30.0)

		door_lock 58

		door_unlock(1);
		door_unlock(6);
		door_unlock(7);

		particle lock5a_locklight01 do start
		particle lock5b_locklight01 do start
		particle lock5c_locklight01 do start

		particle labalarm1_emlight01 do stop
		particle labalarm2_emlight01 do stop
		particle labalarm3_emlight01 do stop

		particle labalarm1 do stop
		particle labalarm2 do stop
		particle labalarm3 do stop

		particle lock6_locklight02 do start

		trigvolume_enable(trigger_volume_13, 0);
		trigvolume_enable(spawn_kerr_trig, 0);
		#trigvolume_enable(Setup_Security_Trig, 1);
		#trigvolume_enable(chase_trigger, 1);

		# CB: set up the monologue for konoko telling herself about her next objective
		prepare_vat_monologue();

		console_deactivate 3
		console_deactivate 4
		console_deactivate 5
		console_deactivate 14
		console_deactivate 88

		ai2_spawn Scan_BOS_1
		ai2_spawn Scan_BOS_2
		ai2_spawn Scan_BOS_3
		ai2_spawn Scan_BOS_4

		ai2_spawn CS_ScanOps01

		restore_game

		post_scan_music_start
	}
}

# This is an example of a save game console.

func void autosave_1(string player_name)
{
	dprint autosave_1
#	PLAY AUTOSAVE SOUND - ADD LATER!!!
	save_game 2 autosave
}

func void save_point_2(string player_name)
{
	dprint saveit_2
	save_game 3 autosave
}

func void save_point_3(string player_name)
{
	dprint saveit_3
	save_game 4 autosave
}

########################################################

func void start_trap_music(string ai_name)
{
	dprint martys_baby
	sound_music_start mus_space01 0.8
}

func void Die_For_Kerr_1(string ai_name)
{
	dprint DFK_1
	kerr_counter = kerr_counter - 1

	if (kerr_counter eq 0)
	{
		Kerr_Console_All_Counters();
	}
}

func void Die_For_Kerr_2(string ai_name)
{
	dprint DFK_2
	kerr_counter = kerr_counter - 1

	if (kerr_counter eq 0)
	{
		Kerr_Console_All_Counters();
	}
}

func void Die_For_Kerr_3(string ai_name)
{
	dprint DFK_3
	kerr_counter = kerr_counter - 1

	if (kerr_counter eq 0)
	{
		Kerr_Console_All_Counters();
	}
}

func void Kerr_Console_All_Counters(void)
{
	dprint START_KERR
	trigvolume_enable(Kerr_trig, 1);
	fork Pod3_Unlock_Doors
}

func void Setup_Intro(string ai_name)
{
# SETUP POD 1 AREA
	dprint Setup_Intro
	trig_activate 1
	particle lock99_locklight02 do start
	particle lock100_locklight01 do stop

	door_unlock 11
}

func void Setup_Pod1(string ai_name)
{
# SETUP POD 1 AREA
	dprint SetupPod1

	door_lock 20
	door_lock 21
	door_lock 22
	door_lock 23

	ai2_spawn Pod1_TCL_1
	ai2_spawn Pod1_TCL_2
	ai2_spawn Pod1_TCL_3
	ai2_spawn Pod1_Scientist_1
	ai2_spawn Pod1_Scientist_2

	particle lock1_locklight01 do stop
	#particle lock1_locklight01 do start
	sound_music_stop mus_space01
}
#########################################
func void Pod1_RTAlarm_A(string ai_name)
{
	dprint Guard_A_RTAlarm
	ai2_doalarm Pod1_TCL_1 10
}

func void Pod1_RTAlarm_B(string ai_name)
{
	dprint Guard_B_RTAlarm
	ai2_doalarm Pod1_TCL_2 10
}
#########################################

func void Pod1_Alarm_Sound(void)
{
	sound_ambient_start alarm_loop
	sleep 900
	sound_ambient_stop alarm_loop
}

func void Pod1_Alarm(string ai_name)
{
	dprint Pod1Alarm
	door_unlock(11);
	particle lock99_locklight02 do start
	sleep 180
# SPAWN ALARM CHARACTERS
	ai2_spawn Pod1_BOL_Alarm_1
	ai2_spawn Pod1_BOL_Alarm_2
	ai2_spawn pod1_a_1
	ai2_spawn pod1_a_2
# SET ALERT LEVELS
	ai2_setalert Pod1_TCL_1 high 
	ai2_setalert Pod1_TCL_2 high 
	ai2_setalert Pod1_TCL_3 high 
	ai2_setalert Pod1_BOL_Alarm_1 high 
	ai2_setalert Pod1_BOL_Alarm_2 high 
# EXECUTE ALARM PATHS
	ai2_dopath Pod1_TCL_1 Pod1_Final_Guard_A
	ai2_dopath Pod1_TCL_2 Pod1_Final_Guard_B
	ai2_dopath Pod1_TCL_3 Pod1_Final_Guard_C
	ai2_dopath Pod1_Scientist_1 Pod1_Final_Sci_A
	ai2_dopath Pod1_Scientist_2 Pod1_Final_Sci_B
# MAKE ALARM PATHS THEIR JOBS
	ai2_setjobstate Pod1_TCL_1
	ai2_setjobstate Pod1_TCL_2
	ai2_setjobstate Pod1_TCL_3

	ai2_setjobstate Pod1_Scientist_1
	ai2_setjobstate Pod1_Scientist_2

# TRIP ALARM FOR BADDIES TO PURSUE KONOKO

	ai2_tripalarm 11 Konoko

	particle lock1_locklight01 do stop

	particle alarm1_emlight01 do start

# DOOR LOCK COMMAND
	door_lock 20
	door_lock 21
	door_lock 22
	door_lock 23

# annoy the player with alarm sound
	fork Pod1_Alarm_Sound

	console_reset 1
}

# UNLOCK DOORS FROM CONSOLE
func void Pod1_UnlockDoors(string ai_name)
{
	dprint Pod1UnlockDoors

	door_unlock 20
	door_unlock 21
	door_unlock 22
	door_unlock 23
	door_lock(11);
	particle lock99_locklight02 do stop

	input 0
	cm_interpolate lock1 0
	sleep 30
	particle alarm1_emlight01 do stop
	sleep 30
	particle lock1_locklight01 do start
	sleep 150
	cm_reset
	input 1

	console_reset 10
}
###################### POD 2 #################################
func void Pod2_Setup(string ai_name)
{
	dprint SetupPod2
	ai2_spawn Pod2_TCL_1
	ai2_spawn Pod2_TCL_2
	ai2_spawn Pod2_Sci_1

	particle lock2_locklight01 do stop
}
##############################################################
func void Pod2_RTAlarm_A(string ai_name)
{
	dprint Guard_A_RTAlarm
	ai2_doalarm Pod2_TCL_1 11
}

func void Pod2_RTAlarm_B(string ai_name)
{
	dprint Guard_B_RTAlarm
	ai2_doalarm Pod2_TCL_2 11
}
##############################################################

func void Pod2_Alarm_Sound(void)
{
	sound_ambient_start alarm_loop
	sleep 900
	sound_ambient_stop alarm_loop
}

func void Pod2_Alarm(string ai_name)
{
	dprint Pod2Alarm
	door_unlock(11);
	particle lock99_locklight02 do start
	sleep 180

# SPAWN ALARM CHARACTERS
	#ai2_spawn Pod2_BOS_1
	ai2_spawn Pod2_BOL_Alarm_1
	ai2_spawn pod2_a_1
	ai2_spawn pod2_a_2

# SET ALERT LEVELS
	ai2_setalert Pod2_TCL_1 high 
	ai2_setalert Pod2_TCL_2 high 
	ai2_setalert Pod2_BOS_1 high 

# EXECUTE ALARM PATHS
	ai2_dopath Pod2_TCL_1 Pod2_End_TCL_1
	ai2_dopath Pod2_TCL_2 Pod2_End_TCL_2
	ai2_dopath Pod2_BOS_1 Pod2_End_BOS_1
	ai2_dopath Pod2_Sci_1 Pod2_End_Sci_1

# MAKE ALARM PATHS THEIR JOBS
	ai2_setjobstate Pod2_TCL_1
	ai2_setjobstate Pod2_TCL_2
	ai2_setjobstate Pod2_BOS_1

	ai2_setjobstate Pod2_Sci_1

# TRIP ALARM FOR BADDIES TO PURSUE KONOKO

	ai2_tripalarm 12 Konoko

	particle lock2_locklight01 do stop

	particle alarm2_emlight01 do start

# DOOR LOCK COMMANDS
	door_lock 28
	door_lock 29
	door_lock 30
	door_lock 31

	console_reset 2

	fork Pod2_Alarm_Sound
}

# UNLOCK DOORS FROM CONSOLE

func void Pod2_UnlockDoors(string ai_name)
{
	dprint Pod2UnlockDoors

	door_unlock 28
	door_unlock 29
	door_unlock 30
	door_unlock 31
	door_lock(11);
	particle lock99_locklight02 do stop

	input 0
	cm_interpolate lock2 0
	sleep 30
	particle alarm2_emlight01 do stop
	sleep 30
	particle lock2_locklight01 do start
	sleep 150
	cm_reset
	input 1

	console_reset 11
}

func void chase_after_scan(string ai_name)
{
	ai2_dopath Scan_BOS_3 chase_after_3
	ai2_dopath Scan_BOS_4 chase_after_4

	ai2_setjobstate Scan_BOS_3
	ai2_setjobstate Scan_BOS_4

	ai2_tripalarm 11 Konoko

	sleep 1200

	ai2_dopath Scan_BOS_1 chase_after_1
	ai2_dopath Scan_BOS_2 chase_after_2

	ai2_setjobstate Scan_BOS_1
	ai2_setjobstate Scan_BOS_2

	ai2_tripalarm 9 Konoko
}
###################### POD 3 #################################
func void Pod3_Setup(string ai_name)
{
	dprint SetupPod3
	ai2_spawn Pod3_BOS_1
	ai2_spawn Pod3_BOS_2
	ai2_spawn Pod3_BOL_1

	#door_lock 59

	trigvolume_enable Kerr_trig 1
}

func void Pod3_Unlock_Doors(string ai_name)
{
	dprint Pod3UnlockDoors

	door_unlock 59

	input 0
	sleep 90
	cm_interpolate lock3 0
	sleep 60
	particle lock3_locklight01 do start
	sleep 150
	cm_reset
	input 1
}

func void Kerr_Console(string ai_name)
{
	dprint Kerr_Console

	door_unlock 58

	input 0
	cm_interpolate lock4 0
	sleep 60
	particle lock4_locklight02 do start
	sleep 150
	trig_deactivate 2
	sleep 75
	cm_reset
	input 1
}

###################### LAB 1 #################################
func void Setup_Lab(string ai_name)
{
	dprint SetUpLab

	particle lock5_locklight01 do stop

	door_lock 6
	door_lock 7

	ai2_spawn LabHall_BOL_1
	ai2_spawn LabHall_BOL_2
	ai2_spawn LabHall_BOL_3
	ai2_spawn LabHall_BOL_4
	ai2_spawn LabHall_BOL_5

	ai2_spawn Hall_TCS_33

	ai2_spawn Lab1_Sci_1
	ai2_spawn Lab1_Sci_2

	ai2_spawn Lab2_Sci_1
	ai2_spawn Lab2_Sci_2

	ai2_spawn Lab3_Sci_1
	ai2_spawn Lab3_Sci_2

	trigvolume_enable Setup_Security_Trig 0
	trigvolume_enable(chase_trigger, 0);
}

func void Lab_Console_1(string ai_name)
{
	dprint LabConsole1

	#particle create labalarm1_emlight02
	particle labalarm1 do start

	ai2_spawn lab_BOS_1

	#ai2_spawn lab_BOS_2

	ai2_tripalarm 1 Konoko

	particle lock4_locklight02 do stop
	door_lock 58

	neuro_counter = neuro_counter - 1

	input 0
	cm_interpolate lock5 0
	sleep 60
	particle lock5a_locklight01 do start
	sleep 150
	cm_reset
	target_set(1009, 30.0)
	input 1

	if (neuro_counter eq 0)
	{
		Lab_Console_All_Counters();
	}
}

func void Lab_Console_2(string ai_name)
{
	dprint LabConsole2

	particle labalarm2 do start

	ai2_spawn lab_BOS_2

	#ai2_spawn lab_BOS_4

	ai2_tripalarm 1 Konoko

	target_set(268, 30.0)

	particle lock4_locklight02 do stop
	door_lock 58

	neuro_counter = neuro_counter - 1

	input 0
	cm_interpolate lock5 0
	sleep 60
	particle lock5b_locklight01 do start
	sleep 150
	cm_reset
	target_set(1009, 30.0)
	input 1

	if (neuro_counter eq 0)
	{
		Lab_Console_All_Counters();
	}
}

func void Lab_Console_3(string ai_name)
{
	dprint LabConsole3

	ai2_spawn lab_BOS_3

	#ai2_spawn lab_BOS_6

	particle labalarm3 do start

	ai2_tripalarm 1 Konoko

	particle lock4_locklight02 do stop
	door_lock 58

	target_set(367, 30.0)

	neuro_counter = neuro_counter - 1

	input 0
	cm_interpolate lock5 0
	sleep 60
	particle lock5c_locklight01 do start
	sleep 150
	cm_reset
	target_set(1009, 30.0)
	input 1

	if (neuro_counter eq 0)
	{
		Lab_Console_All_Counters();
	}
}

func void Lab_Console_All_Counters(void)
{
	dprint PROBE_ROOM_OPEN
	door_unlock 6
	door_unlock 7

	kerr_console_music_stop
}

func void Lab_Unlock_Door_5(string ai_name)
{
	dprint Probe_Room_Unlock_Doors
	door_unlock 1
# CB: no idea what this was, maybe it was the same as the current 66_01
#	sound_dialog_play c13_49a_01konoko
	input 0
	cm_interpolate lock6 0
	sleep 60
	particle lock6_locklight02 do start
	sleep 150
	cm_reset
	input 1

	trigvolume_enable Setup_Security_Trig 1
	trigvolume_enable(chase_trigger, 1);
}
#######################DURING THE SCAN#########################
func void Scan_Guards(string ai_name)
{
	dprint Scan_Guards

	ai2_spawn Scan_BOS_1
	ai2_spawn Scan_BOS_2
	ai2_spawn Scan_BOS_3
	ai2_spawn Scan_BOS_4

	#chr_teleport LabHall_BOL_1 274
	#chr_teleport LabHall_BOL_4 275

	chr_teleport LabHall_BOL_5 272
	chr_teleport Hall_TCS_33 7018

	#chr_teleport LabHall_BOL_2 264
	#chr_teleport LabHall_BOL_3 7004

	#ai2_forget LabHall_BOL_1
	#ai2_forget LabHall_BOL_2
	#ai2_forget LabHall_BOL_3
	#ai2_forget LabHall_BOL_4

	ai2_forget LabHall_BOL_5
	ai2_forget Hall_TCS_33

	ai2_dopath LabHall_BOL_1 Scan_BOL_1
	ai2_dopath LabHall_BOL_2 Scan_BOL_2
	ai2_dopath LabHall_BOL_3 Scan_BOL_3
	ai2_dopath LabHall_BOL_4 Scan_BOL_4
	ai2_dopath LabHall_BOL_5 Scan_BOL_5
	ai2_dopath Hall_TCS_33 Scan_Hall_TCS_33

	ai2_setjobstate LabHall_BOL_1
	ai2_setjobstate LabHall_BOL_2
	ai2_setjobstate LabHall_BOL_3
	ai2_setjobstate LabHall_BOL_4
	ai2_setjobstate Hall_TCS_33

	fork get_her
}

func void get_her(string ai_name)
{
	dprint get_her_timer_start

	sleep 18000

	ai2_tripalarm 5 Konoko

	ai2_dopath LabHall_BOL_1 get_her_1
	ai2_dopath LabHall_BOL_2 get_her_2

	ai2_setjobstate LabHall_BOL_1
	ai2_setjobstate LabHall_BOL_2

	sleep 18000

	ai2_tripalarm 7 Konoko

	ai2_dopath LabHall_BOL_3 Scan_BOL_3
	ai2_dopath LabHall_BOL_4 Scan_BOL_4

	ai2_setjobstate LabHall_BOL_3
	ai2_setjobstate LabHall_BOL_4

	sleep 18000

	ai2_tripalarm 9 Konoko

	ai2_dopath Scan_BOS_1 get_her_1
	ai2_dopath Scan_BOS_2 get_her_2

	ai2_setjobstate Scan_BOS_1
	ai2_setjobstate Scan_BOS_2

	sleep 18000

	ai2_tripalarm 11 Konoko

	ai2_dopath Scan_BOS_3 get_her_3
	ai2_dopath Scan_BOS_4 get_her_4

	ai2_setjobstate Scan_BOS_3
	ai2_setjobstate Scan_BOS_4
}

func void endgether(string ai_name)
{
	ai2_attack Final_BOL_1 Konoko
}
########################### SECURITY #########################
func void Setup_Security(string ai_name)
{
	dprint Setup_Security

	ai2_spawn Sec_BOS_1
	ai2_spawn Sec_BOS_2
	ai2_spawn Sec_BOL_1

	trigvolume_enable Ambush_Trigger_1 1

	door_lock 7

	particle lock8_locklight02 do stop

	door_lock 54
	particle lock7_locklight02 do stop

	post_scan_music_stop
}

func void Unlock_Door_7(string ai_name)
{
	dprint Unlock_Door_7

	door_unlock 54

	input 0
	cm_interpolate lock7 0
	sleep 60
	particle lock7_locklight02 do start
	sleep 150
	cm_reset
	target_set(360, 30.0)
	input 1

	post_scan_music_stop
}

func void Sec_Ambush_1(string ai_name)
{
	dprint AMBUSH
	trig_deactivate 3
	trig_deactivate 4
	turret_deactivate 2
	turret_deactivate 3

	door_unlock 7
	door_unlock 36
	particle lock8_locklight02 do start

	door_lock 54
	particle lock7_locklight02 do stop
	
	ai2_spawn Sec_Ambush_BOS_1
	ai2_spawn Sec_Ambush_BOL_1

	ai2_attack Sec_Ambush_BOS_1 Konoko
	ai2_attack Sec_Ambush_BOL_1 Konoko

	#ai2_spawn Sec_Ambush_BOS_2
	#ai2_spawn Sec_Ambush_BOL_2
}


func void nextwave_1(string ai_name)
{
	ambush_counter = ambush_counter - 1

	if (ambush_counter eq 0)
	{
		Sec_Ambush_2();
	}
}

func void nextwave_2(string ai_name)
{
	ambush_counter = ambush_counter - 1

	if (ambush_counter eq 0)
	{
		Sec_Ambush_2();
	}
}

func void closethedoor(string ai_name)
{
	door_lock 7
	door_lock 36

	particle lock8_locklight02 do stop
}

func void Sec_Ambush_2(string ai_name)
{
	dprint AMBUSH2

	door_unlock 7
	door_unlock 36

	particle lock8_locklight02 do start

	ai2_spawn Sec_Ambush_BOS_2
	ai2_spawn Sec_Ambush_BOL_2

	ai2_attack Sec_Ambush_BOS_2 Konoko
	ai2_attack Sec_Ambush_BOL_2 Konoko
}

######################### FINAL #########################

func void Setup_Final(string ai_name)
{
	dprint Setup_Final

	ai2_spawn Final_BOS_1
	ai2_spawn Final_BOL_1

	ai2_spawn Final_Thug_1
	ai2_spawn Final_Thug_2

	trigvolume_enable end 0
}

func void end(string ai_name)
{
	dprint END

	fork Outro
	
	ai2_forget Final_BOS_1
	ai2_forget Final_BOL_1
	ai2_forget Final_BOL_2

	ai2_forget Sec_Ambush_BOS_1
	ai2_forget Sec_Ambush_BOS_2
	ai2_forget Sec_Ambush_BOL_1
	ai2_forget Sec_Ambush_BOL_1

	ai2_forget Final_Thug_1
	ai2_forget Final_Thug_2

	ai2_dopath Final_BOS_1 End_BOS_1
	ai2_dopath Final_BOL_1 End_BOL_1
	ai2_dopath Final_BOL_2 End_BOL_2

	ai2_dopath Sec_Ambush_BOS_1 End_BOS_1
	ai2_dopath Sec_Ambush_BOS_2 End_BOS_1
	ai2_dopath Sec_Ambush_BOL_1 End_BOL_1
	ai2_dopath Sec_Ambush_BOL_2 End_BOL_1

	ai2_dopath Final_Thug_1 End_Thug_1
	ai2_dopath Final_Thug_2 End_Thug_1

	ai2_setjobstate Final_BOS_1
	ai2_setjobstate Final_BOL_1
	ai2_setjobstate Final_BOL_2

	ai2_setjobstate Sec_Ambush_BOS_1
	ai2_setjobstate Sec_Ambush_BOS_2

	ai2_setjobstate Sec_Ambush_BOL_1
	ai2_setjobstate Sec_Ambush_BOL_2

	ai2_setjobstate Final_Thug_1
	ai2_setjobstate Final_Thug_2
}

##############################################################

# COUNTDOWN TO FINAL CUTSCENE

func void check_1(string ai_name)
{
	dprint circle_squared
	final_count = final_count - 1
	if (final_count eq 0)
	{
	trigvolume_enable ending 1
	}
}

func void check_2(string ai_name)
{
	dprint circle_squared
	final_count = final_count - 1
	if (final_count eq 0)
	{
	trigvolume_enable ending 1
	}
}

func void mid_guards(string ai_name)
{
	dprint final_guards
	ai2_spawn Final_BOL_2
	ai2_spawn Final_Thug_9

	ai2_attack Final_BOL_2 Konoko
}

func void end_guards(string ai_name)
{
	dprint final_guards
	ai2_spawn end_guard_1
	ai2_spawn end_guard_2
	ai2_spawn Final_Thug_10
}


####################################################################

func void set_objective_1(void)
{
	dprint set_objective_1
	objective_set(1)
	target_set(1261, 30.0)
}

func void set_objective_2(string chr_index)
{
	dprint set_objective_2
	objective_set(2)
	target_set(366, 30.0)
}

func void set_objective_3(string chr_index)
{
	dprint set_objective_3
	objective_set(3)
	target_set(346, 30.0)
}

func void set_objective_4(string chr_index)
{
	dprint set_objective_4
	objective_set(4)
	target_set(222, 30.0)
}

func void kerr_died(string ai_name)
{
	if (has_probed eq 0)
	{
		you_lose();
	}
}

func void you_lose(string ai_name)
{
	sleep 240
	fade_out 0 0 0 180 
	sleep 240
	lose
}

func void level_14a(void)
{
	dprint set_text_14a
	text_console level_14a
	console_reset 12
}

func void level_14b(void)
{
	dprint set_text_14b
	text_console level_14b
	console_reset 6
}


################## ANIM SCRIPTS ##########################################
func void patrolscript0001 (string ai_name)
{
	playback_block Pod1_TCL_1 alarm1 interp 20
}

func void patrolscript0002 (string ai_name)
{
	playback_block Pod1_TCL_2 alarm2 interp 20
}

func void patrolscript0003 (string ai_name)
{
	playback_block Pod2_TCL_1 pod2alarm1 interp 20
}

func void patrolscript0004 (string ai_name)
{
	playback_block Pod2_TCL_2 pod2alarm2 interp 20
}

func void patrolscript0009 (string ai_name)
{
	particle lock99_locklight02 do start
	door_unlock 11
	sleep 540
	particle lock99_locklight02 do stop
	door_lock 11
}

func void patrolscript0010 (string ai_name)
{
	particle lock99_locklight02 do start
	door_unlock 11
# WAIT AND RELOCK DOORS
	sleep 540
	particle lock99_locklight02 do stop
	door_lock 11
}

func void kerr_console_music(void)
{
	sound_music_start mus_ambgrv2 0.8
}

func void kerr_console_music_stop(void)
{
	dprint stopping_kerr_console_music
	sound_music_stop mus_ambgrv2
}

func void post_scan_music_start(void)
{
	dprint startting posctuscene
	sound_music_start mus_xtr1 0.7
}

func void post_scan_music_stop(void)
{
	sound_music_stop mus_xtr1
}

################## VAT MONOLOGUE LOGIC ##########################

var int played_vat_monologue = 0;

func void prepare_vat_monologue(void)
{
	trigvolume_enable tv_vat_monologue_1 1
	trigvolume_enable tv_vat_monologue_2 1
}

func void set_vat_monologue_variable(void)
{
	played_vat_monologue = 1;
}

func void play_vat_monologue(string ai_name)
{
	if (played_vat_monologue eq 0)
	{
		# this is a hack to get around the way that the scripting
		# language mistakenly sets variables that are inside an
		# if clause that isn't being run
		set_vat_monologue_variable();

		sleep 90

		EndScan();
	}
}

################## END LEVEL LOGIC FOR TRIGGER ###################

func void check_outro(string ai_name)
{
	trigvolume_enable tv_check_outro 0
	
	if(FTS_variable eq 0)
	{
		if(trigvolume_count (77) eq 0)
		{
			sleep 120
			trigvolume_enable ending 1
			trigvolume_enable ending2 1
		}
		if(trigvolume_count (77) ne 0)
		{
			sleep 90
			trigvolume_enable tv_check_outro 1
		}
	}
	sleep 90
	trigvolume_enable tv_check_outro 1
}

func void final_check_for_crane(string ai_name)
{
	final_check = final_check + 1
}

func void FTS(string ai_name)
{
	FTS_variable = FTS_variable - 1
}