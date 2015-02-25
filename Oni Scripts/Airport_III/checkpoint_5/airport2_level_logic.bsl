### AIRPORT III LEVEL LOGIC ###

### START, SAVE & OBJECTIVES ###

func void func_start(string ai_name)
{
	
	particle gas2 do stop
	particle gaslight1 do stop
	particle hanger5 do stop
	trig_hide 1
	trig_hide 2
	trig_hide 3
	trig_hide 4

	if (my_save_point eq 0)
		{
		fork target_thug
		}
	
	if (my_save_point eq 1)
		{
		dprint restore1_active
		door_lock 11
		tarmac
		bomber_off
		trigvolume_enable tarmac 0
		restore_game
		sound_music_start atm_gr09 0.75
		objective_set(2)
		target_set(7037,30.00)
		}

	if (my_save_point eq 2)
		{
		dprint restore1_active
		trigvolume_enable save2 0
		trigvolume_enable lowroad3 0
		door_lock 21
		door_lock 22
		door_lock 35
		particle lock5a_locklight01 do stop
		particle lock5b_locklight01 do stop
		particle lock35_locklight01 do stop
		particle rotorwash do stop
		particle room1 kill
		Back2	
		restore_game
		music_save_point2_start
		sleep 30
		objective_set(3)
		target_set(7085,30.00)
		}

	if (my_save_point eq 3)
		{
		dprint restore3_active
		door_lock 21
		door_lock 22
		door_lock 24
		particle lock5a_locklight01 do stop
		particle lock5b_locklight01 do stop
		trigvolume_enable save2 0
		trigvolume_enable save3 0
		Back2	
		door_open 48
		door_jam 48
		trig_show 1
		trig_show 2
		trig_show 3
		trig_show 4
		restore_game
		objective_set(3)
		target_set(7085,30.00)
		}
	
	if (my_save_point eq 4)
		{
		dprint restore4_active
		trigvolume_enable lowroad1 0
		trigvolume_enable lowroad2 0
		trigvolume_enable lowroad3 0
		trigvolume_enable lowroad4 0
		trigvolume_enable hidden1a 0
		trigvolume_enable hidden1b 0
		trigvolume_enable save2 0
		trigvolume_enable backcompound 0
		trigvolume_enable remote 0
		trigvolume_enable trigger_volume_08 1
		door_lock 21
		door_lock 22
		door_lock 35
		door_unlock 27
		particle lock6_locklight01 do start
		particle lock5a_locklight01 do stop
		particle lock5b_locklight01 do stop
		particle lock35_locklight01 do stop
		console_deactivate 10
		restore_game
		sleep 30
		set_objective_4
		}

	if (my_save_point eq 5)
		{
		dprint restore5_active
		particle muroplane_prop do start
		trigvolume_enable hangar2_setup 0
		door_lock 36
		particle lock7_locklight01 do stop
		set_objective_5
		ai2_spawn ambush_striker_2
		ai2_spawn ambush_commguy_2
		Hangar2a
		restore_game
		sound_music_start mus_space01 0.75
		music_script_start
		ai2_doalarm ambush_commguy_2 4
		sleep 30
		dprint set_objective5
		objective_set(5)
		target_set(1054,30.00)
		}
}

func void you_lose(string ai_name)
{
	all_music_counters	
	sleep 240
	fade_out 0 0 0 180 
	sleep 240
	lose
}

func void you_win(int char_index)
{
	all_music_counters
	win
}

func void save_point_1(string ai_name)
{
	dprint savegame_1	
	sound_music_stop mus_om03
	if (my_save_point ne 1)
		{
		save_game 1 autosave
		}
	sound_music_stop
	sound_music_start atm_gr09 0.75
}

func void save_point_2(string ai_name)
{
	dprint savegame_2
	if (my_save_point ne 2)
		{
		save_game 2 autosave
		}
	music_save_point2_start
	target_set(7085,30.00)
}

func void save_point_3(string ai_name)
{
	dprint savegame_3	
	if (my_save_point ne 3)
		{
		save_game 3 autosave
		}
	sound_music_start atm_cl09 0.75
}

func void save_point_4(string ai_name)
{
	dprint savegame_4	
	if (my_save_point ne 4)
		{
		save_game 4 autosave
		}
	sound_music_stop atm_cl09 0.75
}

func void save_point_5(string ai_name)
{
	particle muroplane_prop do start
	dprint savegame_5	
	if (my_save_point ne 5)
		{
		save_game 5 autosave
		target_set(1054,30.00)
		}
}

func void set_objective_1(string ai_name)
{
	dprint set_objective1
	objective_set(1)
	sound_music_start mus_om03
	music_script_start
	target_set(7124,30.00)
	#sleep 300
}

func void set_objective_2(string ai_name)
{
	dprint set_objective2
	objective_set(2)
	target_set(7037,30.00)
	sound_dialog_play c00_01_18shinatama
}

func void set_objective_3(string ai_name)
{
	dprint set_objective3
	objective_set(3)
	target_set(0,0)
	sound_dialog_play c00_01_20shinatama
}

func void set_objective_4(string ai_name)
{
	dprint set_objective4
	objective_set(4)
	target_set(7060,30.00)
	sound_dialog_play c00_01_19shinatama
}

func void target_change_1(string ai_name)
{
	target_set(7037,30.00)
}

func void target_change_2(string ai_name)
{
	target_set(7037,30.00)
}

func void low_target_set(string ai_name)
{
	target_set(7085,30.00)
}

func void low_target_clear(string ai_name)
{
	target_set(0,0)
}

func void high_target_set(string ai_name)
{
	target_set(7126,30.00)
}

func void high_target_clear(string ai_name)
{
	target_set(0,0)
}

### MUSIC ###

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

func void all_music_counters(void)
{
	dprint MARTY_HAS_LEFT_THE_BUILDING
	sound_music_stop mus_asian
	sound_music_stop mus_space01
	sound_music_stop mus_om03
	sound_music_stop mus_ot
	sound_music_stop atm_cl09
	sound_music_stop atm_gr09
}

func void music_save_point2_start(void)
{
	sound_music_start atm_cl09 1.0
}

### TEXT CONSOLES ###

func void level6a(void)
{
	dprint text6a
	text_console level_6a
	console_reset 16
}

func void level6b(void)
{
	dprint text6b
	text_console level_6b
	console_reset 9
}

func void level6c(void)
{
	dprint text6c
	text_console level_6c
	console_reset 13
}

func void level6d(void)
{
	dprint text6d
	text_console level_6d
	console_reset 17
}

func void level6e(void)
{
	dprint text6e
	text_console level_6e
	console_reset 5
}

func void level6f(void)
{
	dprint text6f
	text_console level_6f
	console_reset 2
}

### GAMEPLAY PROGRESSION ###

func void Start1(string char_index)
{
	dprint Start1
	ai2_spawn Start_Striker_1
	ai2_spawn Start_Striker_2
	ai2_spawn Start_Comguy_1
	particle room1 do start
}

# TARGET THUG
func void target_thug(void)
{
	sleep f120
	dprint target_thug
	sound_dialog_play c00_01_28shinatama
	ai2_spawn Start_Friend_1
	ai2_spawn Start_Striker_5
	ai2_makeaware Start_Striker_5 Start_Friend_1
	sleep 30
	set_objective_1
}

# TARGET THUG ROLL
func void patrolscript0200(string char_index)
{
	playback_block Start_Friend_1 roll fromhere
	ai2_dopath Start_Friend_1 Start_Friend_1b 1
	ai2_setjobstate Start_Friend_1
}

# RETURN OF MAD BOMBER
func void mad_bomber1(string ai_name)
{
	dprint boom
	ai2_spawn mad_bomber1
	sleep 150
	particle bomb1 do explode
	particle squib1a do explode
	particle squib1b do explode
	sleep 60
	particle bomb2 do explode
	particle squib2 do explode
	sleep 30
	particle bomb_damage1 do start
}

# SAVE THE THUG
func void victim_thug1(string ai_name)
{
	dprint save_the_thug
	ai2_spawn victim_thug1
	ai2_spawn cruel_striker1
}

# HIDDEN FRIENDS
func void hidden_thugs(string ai_name)
{
	ai2_spawn Start_Friend_2
	ai2_spawn Start_Friend_3
}

# TARMAC
func void tarmac(string ai_name)
{
	dprint tarmac_setup
	ai2_spawn tarmac_striker_1
	ai2_spawn tarmac_striker_2
	ai2_spawn tarmac_striker_3
	ai2_spawn tarmac_tanker_1
	ai2_spawn tarmac_tanker_2
	ai2_spawn tarmac_commguy_1

	particle compound create
}

# ROOM 1 CLEAN-UP
func void room1_cleanup(string ai_name)
{
	dprint room_1_clean
	door_lock 11
	chr_delete Start_Friend_2
	chr_delete Start_Friend_3
}

# STRIKER TEE-OFF
func void striker_tee_off(string ai_name)
{
	dprint I_pity_the_fool
	ai2_dopath tarmac_striker_4 tarmac_striker_3b 1
}

# TANKER BACKUP
func void tanker_backup(string ai_name)
{
	dprint tanker_backup
	ai2_dopath tarmac_tanker_2 tarmac_tanker_2b 1
}

# UNLOCK COMMGUY
func void unlock_commguy(string ai_name)
{
	dprint you_may_feel_a_zapping_sensation
	ai2_dopath tarmac_commguy_1 tarmac_commguy_2 1
	ai2_dopath tarmac_tanker_2 tarmac_tanker_2c 1
	sound_music_stop atm_gr09
}

### WIL E. MURO ###

# FIRST MURO
func void muro_bait(string ai_name)
{
	dprint there_goes_muro
	door_close 12
	door_lock 12
	begin_cutscene
	ai2_spawn muro1
	ai2_spawn escort_striker1
	ai2_spawn escort_striker2
	playback muro1 muro1 interp 30
	playback escort_striker1 escort_striker1 interp 30
	playback escort_striker2 escort_striker2 interp 30
	sleep 30
	dprint muro2_bait
	chr_peace 0
	input 0
	particle compound kill
	sound_music_start mus_asian 0.75
	music_script_start	
	cm_interpolate_block muro_2 0
	sleep 90
	cm_interpolate_block muro_3 400
	sleep 430
	particle garage1_locklight02 do start
	door_open 26
	door_jam 26
	ai2_spawn Hangar1_A_Striker_1
	ai2_spawn Hangar1_A_Striker_2
	ai2_spawn Hangar1_A_Striker_3
	playback Hangar1_A_Striker_2 hangar1_striker2 interp 30
	playback Hangar1_A_Striker_3 hangar1_striker3 interp 30	
	playback Hangar1_A_Striker_1 hangar1_striker1 interp 30
	cm_interpolate_block muro_4 0
	cm_interpolate_block muro_5 300
	sleep 300
	chr_delete muro1
	chr_delete escort_striker1
	chr_delete escort_striker2
	cm_reset
	end_cutscene
	trigvolume_enable murobait_a 0
	trigvolume_enable murobait_b 0
	input 1
	set_objective_3
	particle lock3_locklight01 do stop
	save_game_2
}

# FINAL MURO
func void final_muro(string char_index)
{
	dprint last_muro_cutscene
	sound_music_stop mus_ot 0.75
	input 0
	letterbox 1
	cm_interpolate muro2a 0
	ai2_spawn muro2
	ai2_spawn escort_striker3
	ai2_spawn escort_striker4
	playback escort_striker3 final_escort3
	playback escort_striker4 final_escort4
	playback muro2 final_muro
	cm_interpolate muro2a 0
	cm_interpolate_block muro2b 300
	sleep 300
	cm_interpolate muro2c 0
	cm_interpolate_block muro2d 300
	sleep 350
	cm_interpolate muro2e 0
	cm_interpolate_block muro2f 300
	sleep 300
	chr_delete muro2
	chr_delete escort_striker3
	chr_delete escort_striker4
	cm_reset
	letterbox 0
	input 1
}
		
### BACK TO GAMEPLAY ###

func void Hangar1_A(void)
{
	dprint open_sesame
	door_unlock 12
	particle lock3_locklight01 do start
	trigvolume_enable murobait_a 1
	target_set(7085,30.00)
}

func void hangar1a(string char_index)
{
	dprint hangar_1a
	ai2_spawn Hangar1_B_Striker_1
	ai2_spawn Hangar1_B_Striker_4
}

func void hangar1b(string ai_name)
{
	dprint hangar_1b
	ai2_spawn superball_striker
}

func void hangar1c(string char_index)
{
	dprint hangar_1c
	ai2_spawn Hangar1_B_Striker_5
	ai2_spawn Hangar1_B_Striker_9
	ai2_spawn Hangar1_A_Tanker_1
	ai2_spawn Hangar1_B_Comguy_12
}

# HANGAR 1 ROOM D OPEN
func void hangar1d_var(string ai_name)
{
	dprint hangar1d
	hangar1d_counter = hangar1d_counter - 1
	if (hangar1d_counter eq 0)
		{
		access_hangar1d_granted();
		}
}

func void access_hangar1d_granted(string ai_name)
{
	dprint access_granted_d
	particle garage2_locklight02 do start
	door_unlock 19
	door_open 19
	door_jam 19
	ai2_spawn hangar1d_enemy_1
	ai2_spawn hangar1d_enemy_2
}

# HANGAR 1 ROOM F OPEN
func void hangar1f_var(string ai_name)
{
	dprint hangar1f
	hangar1f_counter = hangar1f_counter - 1
	if (hangar1f_counter eq 0)
		{
		access_hangar1f_granted();
		}
}

func void access_hangar1f_granted(string ai_name)
{
	dprint access_granted_f
	particle garage3_locklight02 do start
	door_unlock 20
	door_open 20
	door_jam 20
	ai2_spawn hangar1f_enemy_1
	ai2_spawn hangar1f_enemy_3
	ai2_spawn rat_thug_4
}

func void skip_ratscene(string ai_name)
{
	dprint no_ratscene
	door_unlock 24
	particle lock9_locklight02 do start
	console_deactivate
}

func void hangar1d_backup(string ai_name)
{
	dprint backup
	ai2_spawn hangar1f_enemy_2
}

func void patrolscript0500(string ai_name)
{
	dprint jump_bomber
	playback_block hangar1f_enemy_2 bomber_jump interp 30
}

func void secret_striker(string char_index)
{
	dprint striker_ambush
	ai2_spawn secret_striker_1
}

func void secret_tanker(string char_index)
{
	dprint tanker_ambush
	ai2_spawn secret_tanker_1
}

func void sos_1(string char_index)
{
	dprint sos1
	ai2_spawn sos_badman_1
}

func void sos_2(string char_index)
{
	dprint sos2
	ai2_spawn sos_badman_2
}


func void carpool_backup(string char_index)
{
	dprint carpool_ambush
	ai2_spawn carpool_striker_2
}

func void Back1(string char_index)
{
	dprint Back1
	ai2_spawn Roof1_Striker_1
	ai2_spawn Roof1_Striker_2
	ai2_spawn Hangar1_C_Striker_1
	ai2_spawn Hangar1_C_Striker_2
	ai2_spawn Hangar1_C_Friend_1
}

func void low_roadies_1(string ai_name)
{
	dprint roadies_1
	ai2_spawn Back_Striker_1
	ai2_spawn Back_Striker_2
	ai2_spawn Back_Striker_3
	ai2_spawn Back_Thug_1
}

func void low_roadies_2(string ai_name)
{
	dprint roadies_2
	ai2_spawn Back_Tanker_1
	ai2_spawn Back_Thug_2
	ai2_spawn Back_Thug_3
}

func void Back2(string char_index)
{
	dprint Back2
	ai2_spawn Roof2_Striker_1
	ai2_spawn Roof2_Striker_2
	ai2_spawn Roof2_Striker_3
	ai2_spawn Back2_Comguy_1
	ai2_spawn Back2_Tanker_1
	ai2_spawn carpool_striker_1
	ai2_spawn ahah_badman_1
	ai2_spawn ahah_badman_2
	particle roof2 do start
}

func void Rat_Guards(string char_index)
{
	dprint rat_guard
	ai2_spawn Rat_Comguy_1
	ai2_spawn Rat_Tanker_1
	particle lock35_locklight01 do start
}

func void Back3(string char_index)
{
	dprint Back3
	ai2_spawn Roof3_Striker_1
	ai2_spawn Roof3_Striker_2
	ai2_spawn Roof3_Tanker_1
	particle roof3 do start
}

func void remote_lot(string ai_name)
{
	dprint remote_lot_guards
	ai2_spawn remote_striker_1
}

func void roof3_backup1(string char_index)
{
	dprint roof_backup1
	ai2_dopath Roof3_Striker_1 Roof3_Striker_1b 1
}

func void back_compound(string char_index)
{
	dprint compound
	ai2_spawn compound_tanker_1
	ai2_spawn compound_bomber_1
	sound_music_stop atm_cl09
}

func void remote_parking(string ai_name)
{
	dprint remote_action
	ai2_spawn hostage_thug_1
	ai2_spawn hostage_thug_2
	ai2_spawn hostage_thug_3
	ai2_spawn squad_tanker_1
	ai2_spawn squad_tanker_2
}

func void remote_backup_1(string ai_name)
{
	dprint remote_backup1
	ai2_spawn hostage_striker_1
}

func void remote_backup_2(string ai_name)
{
	dprint remote_backup2
	ai2_spawn hostage_striker_2
}

func void Office1(string char_index)
{
	dprint Office1
	ai2_spawn Office1_Comguy_1
	ai2_spawn Office1_Comguy_11
	ai2_spawn Office2_Striker_1
	ai2_spawn Office2_Striker_3
	ai2_spawn Office3_Tanker_12
	ai2_spawn neutral_1
	ai2_spawn neutral_2
	sound_music_start atm_gr09
	particle muroplane_prop do
}

# HANGAR 2 AMBUSH
func void ambush(string ai_name)
{
	dprint ambush_active
	particle lock7_locklight01 do start
	door_unlock 36
	ai2_spawn ambush_striker_1
	ai2_spawn ambush_commguy_1
	sleep 220
	ai2_doalarm ambush_commguy_1 4
	sound_music_stop atm_gr09
	sound_music_start mus_space01 0.75
	music_script_start
}

func void Hangar2a(string char_index)
{
	dprint Hangar2a
	ai2_spawn Hangar2_tanker_1
	ai2_spawn alarm_striker_1
}

func void Hangar2b(string char_index)
{
	dprint Hangar2b
	ai2_spawn Hangar2_Striker_3
	ai2_spawn Hangar2_Striker_4
	ai2_spawn Hangar2_Striker_5
}

func void alarm_sound_script(void)
{
	sound_ambient_start alarm_loop
	sleep 900
	sound_ambient_stop alarm_loop
}

func void raise_alarm(string char_index)
{
	dprint alarm_raised
	ai2_dopath alarm_striker_1 alarm_striker_1a 1
	fork alarm_sound_script
}

func void alarm_patrol(string char_index)
{
	dprint patrol_begun
	ai2_dopath alarm_striker_1 alarm_striker_1b 1
}

#STRIKER SHOWDOWN
var int striker_counter=3;

func void striker_showdown_1(string ai_name)
{
	dprint striker_showdown1
	striker_counter = striker_counter - 1
	if (striker_counter eq 0)
		{
		total_striker_count();
		}

}

func void striker_showdown_2(string ai_name)
{
	dprint striker_showdown2
	striker_counter = striker_counter - 1
	if (striker_counter eq 0)
		{
		total_striker_count();
		}
}

func void striker_showdown_3(string ai_name)
{
	dprint striker_showdown3
	striker_counter = striker_counter - 1
	if (striker_counter eq 0)
		{
		total_striker_count();
		}
}

func void total_striker_count(string ai_name)
{
	dprint rappel_point_active
	trigvolume_enable rappel_point 1
	particle rappel create
	target_set(1054,30.00)
	sound_music_stop mus_space01
}

# OBJECTIVE CHECK
func void objective_check(string ai_name)
{
	dprint check_for_objective
		if (chr_has_lsi(0))
		{	
		dprint set_objective5
		objective_set(5)
		target_set(7127,30.00)
		trigvolume_enable objectivecheck 0
		}
}

# LSI CHECK 1
func void lsi_check_1(string ai_name)
{
	dprint check_lsi_1
	if (chr_has_lsi(0))
		{	
		trigvolume_enable tripwire 1
		}
}

# LSI CHECK 2
func void lsi_check_2(string ai_name)
{
	dprint check_lsi_2
	if (chr_has_lsi(0))
		{	
		particle rappel kill
		rappel
		}
}

### RATS IN THE SEWER ###

# RAT DOOR
func void rat_door(string ai_name)
{
	dprint open_rat_door
	particle lock9_locklight02 do start
	door_unlock 24
	door_open 24
	door_jam 24	
	letterbox 1		
	input 0
	ai2_spawn rat_thug_1
	ai2_spawn rat_thug_2
	ai2_spawn rat_thug_3
	cm_interpolate rat_door1 0
	cm_interpolate_block rat_door2 300
	sleep 250
	playback rat_thug_1 rat_thug_1 interp 30
	playback rat_thug_2 rat_thug_2 interp 30
	playback rat_thug_3 rat_thug_3 interp 30
	sleep 90
	sleep 200
	cm_reset
	letterbox 0
	input 1
	door_unjam 24
	door_close 24
	sleep 250
	chr_delete rat_thug_1
	chr_delete rat_thug_2
	chr_delete rat_thug_3
}

# GAS START
func void gas_trig_show(string ai_name)
{
	dprint gastrig_show
	trig_show 1
	trig_show 2
	trig_show 3
	trig_show 4
}

func void gas(string ai_name)
{
	dprint rats_take_cover
	particle gas1 do start
	particle gas2 do start
	particle gaslight1 do start
	console_activate 14
	console_activate 15
	door_unjam 48
	door_close 48
	trigvolume_enable gas 1
	timer_stop
}

# GAS OFF
func void gas_off(string ai_name)
{
	dprint rats_scurry_on
	particle gas1 do stop
	particle gas2 do stop
	particle gaslight1 do stop
	console_reset 14
	console_reset 15
	door_open 48
	door_jam 48
	trigvolume_enable gas 0
	timer_start 10 gas_on
}

# GAS ON
func void gas_on(string ai_name)
{
	dprint rats_take_cover_again
	door_lock 24
	particle gas1 do start
	particle gas2 do start
	particle gaslight1 do start
	console_activate 14
	console_activate 15
	door_unjam 48
	trigvolume_enable gas 1
}

# GAS OFF FOR GOOD
func void gas_kill(string ai_name)
{
	particle gas1 do stop
	particle gas2 do stop
	particle gaslight1 do stop
	door_unjam 48
}

func void gas_trig_hide(string ai_name)
{
	dprint gastrig_hide
	trig_hide 1
	trig_hide 2
	trig_hide 3
	trig_hide 4
	door_lock 48
}

func void poison_konoko(string ai_name)
{	
	chr_poison (konoko, 10, 60, 90);
}

func void fire_damage(string ai_name)
{	
	chr_poison (ai_name, 5, 30, 30);
}

### LOCKS & LIGHTS ###

func void lock1(void)
{
	input 0
	cm_interpolate lock1 0
	sleep 60
	particle lock1_locklight01 do start
	sleep 150
	cm_reset
	input 1
	target_set(7125,30.00)
}

func void lock2(string ai_name)
{
	input 0
	cm_interpolate lock2 0
	sleep 60
	particle lock2_locklight01 do start
	sleep 150
	cm_reset
	input 1
	trigvolume_enable hidden_friends1 1
}

func void lock4(void)
{
	input 0
	cm_interpolate lock4 0
	sleep 60
	particle lock4_locklight01 do start
	sleep 150
	cm_reset
	input 1
}

func void lock5_counter_decrement(void)
{
	dprint ENTERING_LOCK_5_DECREMENT
	lock5_counter = lock5_counter - 1
	if (lock5_counter eq 2)
		{
		sound_music_start mus_cool13 1.0
		}
	if (lock5_counter eq 0)
		{
		sound_music_stop mus_cool13
		lock5_end();
		}
}

func void lock5a_var(string ai_name)
{
	dprint lock5a
	lock5_counter_decrement
	input 0
	cm_interpolate lock5d 0
	sleep 60
	particle lock5a_locklight01 do start
	sleep 150
	cm_reset
	input 1
}

func void lock5b_var(string ai_name)
{
	dprint lock5b
	lock5_counter_decrement
	input 0
	cm_interpolate lock5d 0
	sleep 60
	particle lock5b_locklight01 do start
	sleep 150
	cm_reset
	input 1
}

func void lock5c_var(string ai_name)
{
	dprint lock5c
	lock5_counter_decrement
}

# LOCK 5 END
func void lock5_end(string ai_name)
{
	dprint room1_end
	door_unlock 21
	door_unlock 22
	trigvolume_enable nodark 1
}

func void lock5(void)
{
	lock5c_var
	letterbox 1
	input 0
	cm_interpolate lock5a 0
	cm_interpolate_block lock5b 300
	sleep 350
	cm_interpolate_block lock5c 0
	sleep 30
	cm_interpolate_block lock5d 300
	sleep 300
	particle lock5c_locklight01 do start
	sleep 60
	cm_reset
	letterbox 0
	input 1
}

func void lock6(void)
{
	input 0
	cm_interpolate lock6 0
	sleep 60
	particle lock6_locklight01 do start
	sleep 150
	cm_reset
	input 1
	set_objective_4
	trigvolume_enable trigger_volume_08 1
	door_unlock 27
}

### PARTICLE CONTROL ###

# MAD BOMBER DAMAGE OFF
func void bomber_off(string ai_name)
{
	dprint mad_bomber_particles_off
	particle bomb_damage1 do stop
	particle room1 do stop
	particle bomber1a kill
}

# PLANE ROTOR WASH ON
func void rotor_wash(string ai_name)
{
	dprint rotorwash_on
	particle rotorwash do start
}

# CARPOOL FIRE ON
func void carpool_start(string ai_name)
{
	dprint carpool_particles_on
	particle carpool create
	particle carpool do start
}

# CARPOOL FIRE OFF
func void carpool_stop(string ai_name)
{
	dprint carpool_particles_off
	particle carpool kill
	particle carpool do stop
}

### Level scripted by Joseph ###