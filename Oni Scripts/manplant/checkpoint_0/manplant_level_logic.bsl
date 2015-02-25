### MANPLANT LEVEL LOGIC###

# START, SAVE & OBJECTIVES

func void func_start(string ai_name)
{
	dprint start_active	
	particle lock_1_locklight01 do start
	particle guardroom_2_locklight01 do start
	particle foyer_right_locklight01 do start
	particle brainlock_2_locklight01 do start
	chr_forceholster 0 1
	trig_hide 205	
	trig_hide 204
	trig_hide 2042	
	trig_hide 203
	trig_hide 2032		
	trig_hide 202
	trig_hide 2022
	trig_hide 2023
	trig_hide 201	
	trig_hide 2012
	trig_hide 2013
	particle febtober1_locklight01 do start
	particle save1a_locklight01 do start

	if (save_point eq 0)
		{
		my_save_point=0;	
		particle vent03 start
		}
	
	if (save_point eq 1)
		{
		my_save_point=1;	
		particle vent03 start
		ai2_spawn partner_cop_1
		ai2_spawn partner_cop_2
		ai2_spawn ambush_striker_1
		ai2_spawn ambush_striker_2
		ai2_spawn ambush_striker_3
		chr_delete Recep
		door_lock 1
		door_lock 4
		restore_game
		ai2_attack partner_cop_1 ambush_striker_1
		ai2_attack partner_cop_2 ambush_striker_3
		music_script_start();
		sleep 30
		set_objective_1
		}

	if (save_point eq 2)
		{
		my_save_point=2;	
		dprint restore2_active
		door_lock 1
		door_lock 4
		door_lock 11
		door_lock 12
		door_lock 13
		door_unlock 3
		door_unlock 19
		trigvolume_enable nook_1 0
		trigvolume_enable nookright 0
		trigvolume_enable tech_1 0
		trigvolume_enable bait_1 0
		trigvolume_enable tech_ambush_1 0
		chr_delete Recep
		chr_delete extra_thug_1
		ai2_spawn hall_striker_1
		console_deactivate 1
		console_deactivate 9
		particle lock_1b_locklight01 do start
		particle lock_1a_locklight01 do start
		particle save1b_locklight01 do stop
		particle febtober1_locklight01 do start
		particle vent01 start
		particle vent03 start
		restore_game
		sound_music_start atm_low_perc1 0.90
		sleep 30
		set_objective_1
		target_set (123,30)
		}

	if (save_point eq 3)
		{
		my_save_point=3;	
		dprint restore3_active
		door_lock 1
		door_lock 12
		door_lock 13
		door_lock 25
		door_unlock 19
		door_unlock 3
		trigvolume_enable nook_1 0
		trigvolume_enable nookright 0
		trigvolume_enable tech_1 0
		trigvolume_enable bait_1 0
		trigvolume_enable Griffin 0
		trigvolume_enable lowthug_1 0
		trigvolume_reset febtober
		trigvolume_reset febtober2
		chr_delete Recep
		console_deactivate 10
		particle lock_1b_locklight01 do start
		particle lock_1a_locklight01 do start
		particle vent01 start
		particle vent03 start
		ai2_spawn low_thug_1
		ai2_spawn low_thug_2
		restore_game
		sleep 30
		set_objective_3
		}

	if (save_point eq 4)
		{
		dprint save_point_4
		my_save_point=4;	
		dprint restore4_active
		particle brainlock_2_locklight01 do stop
		particle brainlock_3_locklight01 do start
		door_lock 26
		door_unlock 27
		trigvolume_reset lockit 
		trigvolume_enable save_point4 0
		brain_counter
		trig_show 202
		trig_show 204
		trig_speed 202 .2
		trig_speed 204 .2
		trig_hide 2023
		trig_hide 2013
		particle brain start
		particle brain1 start
		restore_game
		sound_ambient_start deadlybrain_sound 0.75
		sleep 30
		set_objective_4	
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
	win
}

func void save_point_1(string player_name)
{
	dprint save_point_1_active
	save_game 1 autosave
}

func void save_point_2(string player_name)
{
	dprint save_point_2_active
	save_game 2 autosave
}

func void save_point_3(string player_name)
{
	dprint save_point_3_active
	save_game 3
	door_lock 25 autosave
}

func void save_point_4(string player_name)
{
	dprint save_point_4_active
	save_game(4, autosave); 
	particle(brainlock_2_locklight01, do, stop);
	particle(brainlock_3_locklight01, do, start);
	door_lock(26);
	door_unlock(27);
	particle vent01 kill
	particle vent02 kill
}

func void set_objective_1(string ai_name)
{
	dprint set_objective1
	objective_set(1)
	target_set (38,30)
	sound_dialog_play c00_01_22shinatama
}

func void set_objective_2(string ai_name)
{
	dprint set_objective2
	objective_set(2)
	target_set (128,30)
	sound_dialog_play c00_01_26shinatama
}

func void set_target(string ai_name)
{
	dprint new_target
	target_set (124,30)
	sound_dialog_play c00_01_27shinatama
}

func void set_objective_3(string ai_name)
{
	dprint set_objective3
	objective_set(3)
	target_set (125,30)
	trigvolume_enable Griffin 0
	sound_dialog_play c00_01_18shinatama
}

func void set_objective_4(string ai_name)
{
	dprint set_objective4
	objective_set(4)
	sound_dialog_play c00_01_20shinatama
}

### MUSIC ###

var int music_counter=3;

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
	sound_music_start mus_fiteb_hd 0.75
	music_counter=3;
}

func void striker_lullaby_1(string ai_name)
{
	dprint striker_lullaby1
	music_counter = music_counter - 1

	if (music_counter eq 0)
	{
		all_music_counters();
	}

}

func void striker_lullaby_2(string ai_name)
{
	dprint striker_lullaby2
	music_counter = music_counter - 1

	if (music_counter eq 0)
	{
		all_music_counters();
	}
}

func void striker_lullaby_3(string ai_name)
{
	dprint striker_lullaby3
	music_counter = music_counter - 1

	if (music_counter eq 0)
	{
		all_music_counters();
	}
}


func void all_music_counters(void)
{
	dprint ELVIS_HAS_LEFT_THE_BUILDING
	sound_music_stop mus_ambgrv1b
	sound_music_stop mus_fiteb_hd
	sound_music_stop atm_low_perc1
	sound_music_stop atm_cl12
	sound_music_stop atm_cl11
	sound_music_stop mus_sv
}

# SCRAMBLE SOUND ON
func void scramble_sound_on(void)
{
	dprint scramble_sound_start
	sound_music_start atm_cl12 0.75
}

# SCRAMBLE SOUND OFF
func void scramble_sound_off(void)
{
	dprint scramble_sound_end
	sound_music_stop atm_cl12
}

### TEXT CONSOLES ###

func void level2a(string chr_index)
{
	dprint text2a
	text_console level_2a
	console_reset 2
}

func void level2b(string chr_index)
{
	dprint text2b
	text_console level_2b
	console_reset 12
}

func void level2c(string chr_index)
{
	dprint text2c
	text_console level_2c
	console_reset 13
}

func void level2d(string chr_index)
{
	dprint text2d
	text_console level_2d
	console_reset 14
}

func void level2e(string chr_index)
{
	dprint text2e
	text_console level_2e
	console_reset 11
}

### GAMEPLAY PROGRESSION ###

# FIRST ROOM GUARDS
func void tech_1(string ai_name)
{

	dprint trigger_tech_1_active
	ai2_spawn tech_thug_1
	ai2_spawn tech_thug_1a
	ai2_dopath partner_cop_1 cop_backup_1a 1
	ai2_dopath partner_cop_2 cop_backup_1b 1
}

# FIRST CONSOLE
func void door_1(string ai_name)
{

	dprint trigger_door_1_active
	input 0
	begin_cutscene
	door_unlock 19
	door_unlock 3
	cm_interpolate lock_1a 0
	sleep 60
	particle lock_1a_locklight01 do start
	sleep 150
	cm_interpolate lock_1b 0
	sleep 60
	particle lock_1b_locklight01 do start
	sleep 150
	cm_reset
	end_cutscene
	input 1
	target_set (123,30)
}

# NOOK 1
func void nook_1(string ai_name)
{
	dprint nook_1_active
	ai2_spawn nookleft_thug_1
}

# FOYER RETURN REWARD
func void nookright(string ai_name)
{
	dprint nookright_active
	ai2_spawn nookright_thug_1
}

# FLYWAY AMBUSH
func void flyway_1(string ai_name)
{
	dprint flyway_1_active
	ai2_spawn flyway_striker_1
}

# COMMGUY BAIT
func void bait_1(string ai_name)
{
	dprint bait_1_active
	trigvolume_enable alarm_1 1
	ai2_spawn bait_commguy_1
	ai2_spawn tech_thug_2
	sleep 120
	ai2_doalarm bait_commguy_1 15
	sound_music_start atm_low_perc1 0.90
}

# ALARM 
func void patrolscript0300(string ai_name)
{
	dprint alarm
	ai2_doalarm bait_commguy_1 1
}

# PLASMA STRIKER 1
func void plasma_striker_1(string ai_name)
{
	dprint plasma_striker_1_active
	ai2_spawn plasma_striker_1
}

# ALARM 1 AMBUSH
func void alarm_1(string ai_name)
{
	dprint alarm_1_active
	alarm_counter = alarm_counter + 1
	sound_ambient_start alarm_loop
	sleep 900
	sound_ambient_stop alarm_loop
}



### CUTSCENE COUNTDOWN

func void hall_striker_var(string ai_name)
{
	dprint striker_var
	striker_counter = striker_counter - 1

	if (striker_counter eq 0)
	{		
		sayonara_strikey();
	}
}

func void hall_commguy_var(string ai_name)
{
	dprint commguy_var
	striker_counter = striker_counter - 1

	if (striker_counter eq 0)
	{		
		sayonara_strikey();
	}
}

func void hall_thug1_var(string ai_name)
{
	dprint thug1_var
	striker_counter = striker_counter - 1

	if (striker_counter eq 0)
	{		
		sayonara_strikey();
	}
}

func void sayonara_strikey
{
	dprint sayonara
	Chase
}

### BACK TO THE LOGIC

# TECH AMBUSH
func void tech_ambush_1(string ai_name)
{
	dprint tech_ambush_1_active
	ai2_spawn hall_striker_1
}

# SECOND CONSOLE
func void door_2(string ai_name)
{
	dprint trigger_door_2_active
	letterbox 1
	door_lock 4
	input 0
	cm_interpolate lock_2 0
	sleep 60
	particle lock88_locklight02 do start
	door_unlock 23
	door_open 23
	ai2_spawn patrol_striker_2
	sleep 350
	cm_reset
	letterbox 0
	input 1
	door_lock 12
	particle save1a_locklight01 do stop
	target_set (124,30)
	console_activate 4 1	
}

# THIRD CONSOLE
func void door_3(string ai_name)
{
	dprint trigger_door_3_active
	door_unlock 4
	input 0
	cm_interpolate lock_3 0
	sleep 60
	particle lock_3_locklight01 do start
	sleep 150
	cm_reset
	input 1
	set_objective_2
	sound_music_stop atm_low_perc1
}

# CRUEL COMMGUY
func void cruel_1(string ai_name)
{

	dprint cruel_1_active_active
	ai2_spawn cruel_commguy_1
	ai2_spawn victim_femsci_1
}

# TECH 3 PATROL
func void tech_3(string ai_name)
{
	dprint tech_3_active_active
	ai2_spawn tech_thug_3
}

# NEW TARGET 1
func void new_target_1(string ai_name)
{
	dprint new_target_1_active
	target_set (54,30)
}

# BEATER ROOM 1
func void beaters_1(string ai_name)
{
	dprint beaters_1_active
	ai2_spawn scram_striker_1
	ai2_spawn beater_thug_1
	particle vent01 start
	chr_delete plasma_striker_1
}

# BEATER THUG 2
func void beater_thug_2(string ai_name)
{
	dprint beater_thug_2_active
	ai2_spawn beater_thug_2
}


# BEATER BACKUP 1
func void backup_1(string ai_name)
{
	dprint backup_1_active
	ai2_spawn backup_thug_1
	ai2_tripalarm 1 0
}

# BEATER BACKUP 2
func void backup_2(string ai_name)
{
	dprint backup_2_active
	ai2_spawn backup_thug_2
	ai2_tripalarm 2 0
}

# NEW TARGET 2
func void new_target_2(string ai_name)
{
	dprint new_target_2_active
	target_set (54,30)
}

# NEW TARGET 3
func void new_target_3(string ai_name)
{
	dprint new_target_3_active
	target_set (126,30)
}

# LOW THUGS 1
func void lowthug_1(string ai_name)
{
	dprint lowthug_1_active
	ai2_spawn low_thug_1
	ai2_spawn low_thug_2
}

# DISABLE OBJECTIVE TRIGGER 1
func void disable_obj_trig_1(string ai_name)
{
	dprint_disable_obj_trig_1_active
	trigvolume_enable low_thug_1 1
}

# HIDDEN LOCK 1
func void hidden_1(string ai_name)
{
	dprint trigger_door_3_active
	door_unlock 22
	ai2_spawn hidden_sci_1
	particle vent02 start
	input 0
	begin_cutscene
	cm_interpolate hlock_1 0
	sleep 60
	particle hlock_1_locklight01 do start
	sleep 150
	cm_interpolate ShinatamaCam01 0
	cm_interpolate_block ShinatamaCam02 900
	chr_animate 0 KONOKOwatch_start 60
	sleep f40
	cinematic_start (SHINtalking, 180, 180, 16, 3, 20, true)
	sleep f19
	chr_animate 0 KONOKOwatch_idle 3000
	sound_dialog_play c02_08_01shinatama
	sound_dialog_play_block pause
	sound_dialog_play c02_08_02konoko
	cinematic_start(KONtalking, 180, 180, 15, 1, 20, false)
	sound_dialog_play_block pause
	sound_dialog_play c02_08_03shinatama
	sound_dialog_play_block pause
	cm_interpolate brain_off_1b 0
	cm_interpolate_block brain_off_1a 1000
	particle brain start
	particle brain1 start	
	sound_ambient_start deadlybrain_sound 0.75		
	sound_dialog_play c02_08_04konoko
	sound_dialog_play_block pause
	sound_dialog_play c02_08_05shinatama
	sound_dialog_play_block pause
	sound_dialog_play c02_08_06konoko
	sound_dialog_play_block pause
	chr_animate 0 KONOKOwatch_stop 15
	cinematic_stop(KONtalking, 15, 20)
	cinematic_stop(SHINtalking, 16, 20)
	sleep f15
	sound_ambient_volume deadlybrain_sound 0
	cm_reset
	end_cutscene
	particle brain stop
	particle brain1 stop
	target_set (127,30)
	sleep 10
	sound_ambient_stop deadlybrain_sound
}

# HIDDEN TRIGGER 1A
func void hidden_1a(string ai_name)
{
	dprint hidden_1a_active
	trigvolume_enable hidden_1b 1
	particle vent02 start
}

# HIDDEN TRIGGER 1B
func void hidden_1b(string ai_name)
{
	dprint hidden_1b_active
	ai2_spawn patrol_striker_3
}

# TRIGGER DEACTIVATE 4
func void trigger_deactivate_4(string ai_name)
{
	dprint trigger_deactivate_4_active
	input 0
	cm_interpolate trigger_4 0
	sleep 90
	trig_deactivate 4
	sleep 150
	cm_reset
	input 1
	target_set (125,30)
}

# LOW STRIKER 1
func void low_striker_1(string ai_name)
{
	dprint low_striker_1_active
	ai2_spawn low_striker_1
	ai2_spawn low_striker_2
}

# HALL TRIGGER ACTIVATE
func void trigger_active_1(string ai_name)
{
	dprint trigger_active_1_active
	trig_activate 2
}

# GUARD ROOM 1
func void guardroom_1(string ai_name)
{
	dprint guardroom_1_active
	door_unlock 14
	input 0
	cm_interpolate guardroom_1 0
	sleep 60
	particle guardroom_1_locklight01 do start
	sleep 150
	cm_reset
	input 1
	target_set (65,30)
}

# BRAIN COMMGUY 1
func void brain_commguy_1(string ai_name)
{
	dprint brain_commguy_1_active
	ai2_spawn brain_commguy_1
	ai2_spawn brain_commguy_2
}

# BRAIN LOCK 1
func void brainlock_1(string ai_name)
{
	dprint brainlock_1_active
	door_unlock 6
	input 0
	cm_interpolate brainlock_1 0
	sleep 60
	particle brainlock_1_locklight02 do start
	sleep 150
	cm_reset
	input 1
	target_set (129,30)
	trigvolume_enable cruel_striker_1 1
}

# BRAIN DEFEAT
func void braindefeat(string ai_name)
{
	target_set (130,30)
}

# CRUEL STRIKER
func void cruel_striker_1(string ai_name)
{
	dprint cruel_striker_1_active
	ai2_spawn cruel_striker_1
	ai2_spawn victim_mansci_1
	particle vent01 stop
	particle vent02 stop
	particle brain start
	particle brain1 start
}

# AAIIEE!
func void flee(string ai_name)
{
	dprint we_are_in_flee
	chr_talk victim_mansci_1 c02_62_11sci 0 0
	ai2_dopath victim_mansci_1 victim_2
	sleep 300
	set_objective_4
}

# LOCKIT
func void lockit(string ai_name)
{
	dprint lockit_active
	particle brainlock_3_locklight01 do stop
	door_close 27
	door_jam 27
	particle vent01 kill
	if (mus_cool4_playing eq 0)
		{
		sound_music_start mus_cool4_hd 1
		mus_cool4_playing = 1;
		}
}

### GLORIOUS DEADLY BRAIN FIGHT ###

var int console_count = 4;

func void brain_counter(string player_name)
{
	console_count = console_count - 1;

	if (console_count eq 0)
	{
		console_count = 4;

		dprint brain_counter_active
		brain_counter_var = brain_counter_var + 1;

		if (brain_counter_var eq 0)
		{
			brain_round_1
		}

		if (brain_counter_var eq 1)
		{
			brain_round_2
		}

		if (brain_counter_var eq 2)
		{
			brain_round_3
		}

		if (brain_counter_var eq 3)
		{
			brain_round_4
		}
	}
}

# BRAIN ROUND 1
func void brain_round_1(string ai_name)
{
	ai2_allpassive 1
	turret_deactivate 20
	input 0
	begin_cutscene jello
	#sound_music_start atm_cl11 0.75
	sound_ambient_start deadlybrain_sound 1.0
	sleep 60
	cm_interpolate brain_off_1b 0
	sleep 30
	cm_interpolate brain_off_1a 800
	sleep 5
	trig_show 202
	trig_show 204
	trig_speed 202 .2
	trig_speed 204 .2
	trig_hide 2023
	trig_hide 2013
	cinematic_start (SHINtalking, 180, 180, 16, 3, 20, true)
	sound_dialog_play c00_01_106Shinatama
	sound_dialog_play_block pause
	sound_dialog_play c00_01_107Shinatama
	sound_dialog_play_block pause
	sleep 30
	sound_dialog_play c00_01_108Shinatama
	sound_dialog_play_block pause
	cinematic_stop(SHINtalking, 16, 20)
	cm_interpolate_block brain_closeup 0
	sleep 30
	sound_dialog_play brain07final
	sleep 200 
	sound_music_stop atm_cl11
	cm_reset
	end_cutscene
	input 1
	sleep 90
	ai2_allpassive 0
	save_point_4
	console_reset 21
	console_reset 22
	console_reset 23
	console_reset 24
}

# BRAIN ROUND 2
func void brain_round_2(string ai_name)
{
	ai2_allpassive 1
	turret_deactivate 20
	input 0
	begin_cutscene jello	
	#sound_music_start atm_cl11 0.75
	sound_music_volume mus_cool4_hd 0.7 1
	sleep 60
	cm_interpolate brain_off_1a 0
	sleep 30
	cm_interpolate brain_off_1b 850
	cinematic_start (SHINtalking, 180, 180, 16, 3, 20, true)
	sound_dialog_play c00_01_113Shinatama
	sleep 120
	trig_hide 204
	trig_hide 202
	sleep 120
	trig_speed 2012 0
	trig_speed 2022 0
	trig_show 2012
	trig_show 2022
	sleep 90
	trig_speed 2012 .2
	trig_speed 2022 .2
	sound_dialog_play_block pause
	cinematic_stop(SHINtalking, 16, 20)
	sleep 60
	cinematic_start (SHINscared, 180, 180, 16, 3, 20, true)
	sound_dialog_play c00_01_114Shinatama
	sound_dialog_play_block pause
	cinematic_stop(SHINscared, 16, 20)
	cm_interpolate_block brain_closeup 0
	sleep 30
	sound_dialog_play brain03final
	sleep 200
	end_cutscene
	#sound_music_stop atm_cl11
	sound_music_volume mus_cool4_hd 1 1
	cm_reset
	input 1
	sleep 90
	ai2_allpassive 0
	console_reset 21
	console_reset 22
	console_reset 23
	console_reset 24
}

# BRAIN ROUND 3
func void brain_round_3(string ai_name)
{
	ai2_allpassive 1
	turret_deactivate 20
	input 0
	begin_cutscene jello	
	#sound_music_start atm_cl11 0.75
	sound_music_volume mus_cool4_hd 0.7 1
	sleep 60
	cm_interpolate brain_off_1b 0
	sleep 30
	cm_interpolate brain_off_1a 1200
	cinematic_start (SHINtalking, 180, 180, 16, 3, 20, true)
	sound_dialog_play c00_01_115Shinatama
	sleep 120
	trig_hide 2012	
	trig_hide 2022
	sleep 120
	trig_speed 205 0	
	trig_speed 2042 0	
	trig_speed 2032 0	
	trig_speed 2023 0	
	trig_speed 2013 0		
	trig_show 205
	sleep 60	
	trig_show 2042
	sleep 60	
	trig_show 2032
	sleep 60	
	trig_show 2023
	sleep 60	
	trig_show 2013
	sound_dialog_play_block pause
	sleep 60
	sound_dialog_play c00_01_117Shinatama
	sound_dialog_play_block pause	
	trig_speed 205 .4
	trig_speed 2042 .4
	trig_speed 2032 .4
	trig_speed 2023 .4
	trig_speed 2013 .4
	cinematic_stop(SHINtalking, 16, 20)
	cm_interpolate_block brain_closeup 0
	sleep 30
	sound_dialog_play brain08final
	sleep 200
	end_cutscene
	#sound_music_stop atm_cl11
	sound_music_volume mus_cool4_hd 1.0 1
	cm_reset
	input 1
	sleep 90
	ai2_allpassive 0
	console_reset 21
	console_reset 22
	console_reset 23
	console_reset 24
}

# BRAIN ROUND 4
func void brain_round_4(string ai_name)
{
	ai2_allpassive 1
	turret_deactivate 20
	input 0
	sound_music_stop mus_cool4_hd
	sound_music_start mus_sv 0.75
	begin_cutscene jello	
	sleep 60
	cm_interpolate brain_off_1a 0
	sleep 30
	cm_interpolate brain_off_1b 1000 
	sleep 90
	trig_speed 205 1
	sleep 90	
	trig_speed 2042 2
	sleep 90	
	trig_speed 2032 1
	sleep 90
	trig_speed 2023 2
	sleep 90
	trig_speed 2013 2
	sleep 60
	trig_hide 205
	trig_hide 2013
	sleep 60	
	trig_hide 2042
	sleep 60	
	trig_hide 2032
	trig_hide 2023
	sleep 60
	trig_hide 402
	sound_ambient_stop deadlybrain_sound
	particle brain1 kill
	sleep 10
	particle brain1 create
	particle brain1 start
	sleep 20
	particle brain1 kill
	particle brain1 create
	particle brain1 start
	sleep 30
	particle brain1 kill
	sleep 30
	particle brain kill
	sleep 250
	trigvolume_enable febtober 0
	door_unlock 1
	door_unlock 4
	particle lock_3_locklight01 do start
	outro
}

### FEBTOBER ###

# FEBTOBER TRIGGER 1
func void feb_tober(string ai_name)
{
	dprint febtober_active

	all_music_counters();

	door_lock 10
	door_lock 13
	door_unlock 25
	door_unlock 23
	ai2_spawn febtober_striker_1
	trigvolume_reset feb_tober2
	trigvolume_enable cruel_1 0
	trigvolume_enable flyway_1 0
	trigvolume_enable beaters_1 0
	console_deactivate 1
	console_deactivate 4
	particle lock_3_locklight01 do start
	particle lock88_locklight02 do start
	particle febtober1_locklight01 do stop
}

# FEBTOBER TRIGGER 2
func void feb_tober2(string ai_name)
{
	dprint febtober_2_active
	trigvolume_reset febtober
}

### I NEED SOME BACKUP ###

func void calling_all_cars(string ai_name)
{
	dprint callingallcars
	ai2_dopath partner_cop_1 cop_backup_2a 1
	ai2_dopath partner_cop_2 cop_backup_2b 1
}

func void calling_all_cars2(string ai_name)
{
	dprint callingallcars
	
	ai2_dopath partner_cop_1 cop_backup_2a 1
	ai2_dopath partner_cop_2 cop_backup_2b 1
}

### Level scripted by Joseph ###
