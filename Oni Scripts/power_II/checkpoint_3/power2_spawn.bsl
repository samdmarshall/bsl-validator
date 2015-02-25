### POWER PLANT II LEVEL LOGIC ###

### START, SAVE & OBJECTIVES ###

var int inside_final_cutscene = 0;

func void start(string ai_name)
{
	particle save3_locklight01 do start

	if (save_point eq 0)
		{
		my_save_point = 0
		trigvolume_enable trigger_volume_07 0
		particle_room1_start
		particle doorA_locklight01 do stop
		ai2_spawn ambush_striker_10
		ai2_spawn ambush_striker_11
		set_objective_1
		chr_invincible ShinShin 1
		chr_unstoppable ShinShin 1
		}
	if (save_point eq 1)
		{
		my_save_point = 1;
		dprint restore1_active
		trigvolume_enable room3_particle_control 0
		door_lock 3
		particle Shindoor_locklight01 do stop
		particle room4 do start
		ai2_spawn A3_n05
		restore_game
		set_objective_3
		}
	if (save_point eq 2)
		{
		my_save_point = 2;
		dprint restore2_active
		particle doorA_locklight01 do stop
		particle doorB_locklight01 do start
		door_lock 15
		trigvolume_enable save2 0
		ai2_spawn vat_bot_1
		ai2_spawn vat_bot_2
		ai2_spawn vat_bot_3
		ai2_spawn vat_bot_4
		ai2_spawn vat_bot_5
		chr_weapon_immune(vat_bot_1);
		chr_weapon_immune(vat_bot_2);
		chr_weapon_immune(vat_bot_3);
		chr_weapon_immune(vat_bot_4);
		chr_weapon_immune(vat_bot_5);
		restore_game
		set_objective_4
		sound_music_start atm_cl12 0.75
		}
	if (save_point eq 3)
		{
		my_save_point = 3;
		dprint restore3_active
		particle save3_locklight01 do stop
		door_lock 23
		door_lock 28
		ai2_spawn E1_sr28
		ai2_spawn E1_sr30
		ai2_spawn E1_sb29
		ai2_spawn ambush_comguy_1
		ai2_spawn E1_n31
		ai2_spawn E1_n32
		ai2_spawn E1_n37
		trigvolume_enable save_point3 0
		trigvolume_enable p11b_vol 0
		restore_game
		pipe3_start
		set_objective_5
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

func void new_save1(string ai_name)
{
	if (my_save_point ne 1)
	{
		save_game 1 autosave
	}
}

func void save_point_1(string ai_name)
{
	dprint savegame_1	
	door_lock 3
	particle Shindoor_locklight01 do stop
}

func void save_point_2(string ai_name)
{
	dprint savegame_2
	save_game 2 autosave
}

func void save_point_3(string ai_name)
{
	dprint savegame_3	
	save_game 3 autosave
}

func void set_objective_1(string ai_name)
{
	dprint set_objective1
	objective_set(1)
}

func void set_objective_2(string ai_name)
{
	dprint set_objective2
	objective_set(2)
	target_set(7020,60.00)
}

func void set_objective_3(string ai_name)
{
	dprint set_objective3
	objective_set(3)
	target_set(0,0)
}

func void set_objective_4(string ai_name)
{
	dprint set_objective4
	objective_set(4)
	trigvolume_enable setobjective_4 0
}

func void set_objective_5(string ai_name)
{
	dprint set_objective5
	objective_set(5)
	trigvolume_enable setobjective_5 0
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
	dprint ELVIS_HAS_LEFT_THE_BUILDING
	sound_music_stop mus_trt
	sound_music_stop mus_sad1
	sound_music_stop atm_cl10
	sound_music_stop atm_ft66
	sound_music_stop atm_cl09
	sound_music_stop atm_cl11
	sound_music_stop mus_xtr2
	sound_music_stop mus_lz
}

### TEXT CONSOLES ###

func void level10a(string chr_index)
{
	dprint text10a
	text_console level_10a
	console_reset 2
}

func void level10b(string chr_index)
{
	dprint text10b
	text_console level_10b
	console_reset 7
}

### GAMEPLAY PROGRESSION ###

# STRIKER BACKUPS
func void backup_1(string ai_name)
{
	dprint backup1
	ai2_spawn backup_striker1
	particle blast1_locklight01 do start
	door_unlock 1
	door_open 1
}

func void backup_2(string ai_name)
{
	dprint backup2
	ai2_spawn backup_striker2
	particle blast2_locklight01 do start
	door_unlock 2
	door_open 2
}
	

# COME TO ME
func void come_to_me(string ai_name)
{
	dprint go_to_konoko
	ai2_dopath ambush_striker1 come_to_me 1
	ai2_dopath ambush_striker2 come_to_me 1
	ai2_dopath A1_t02 come_to_me 1
	ai2_dopath A1_sr01 come_to_me 1
	ai2_dopath ambush_striker1 come_to_me 1
	ai2_dopath ambush_striker2 come_to_me 1
}

# SHIN CUTSCENE CHECK
func void shin_check(string ai_name)
{
	var int inside_count;
	dprint shin_cutscene_check
	trigvolume_enable trigger_volume_03 0

	inside_count = trigvolume_count(32);

	if (inside_count ne 0)
	{
		sleep 60
		trigvolume_enable trigger_volume_03 1
	}

	if (inside_count eq 0)
	{
		Shin
	}
}

func void t43(string ai_name)
{
	dprint konoko_dies
	inroom = 1
}

func void t43b(string ai_name)
{
	dprint konoko_lives
	inroom = 0
}

func void delete_script(string ai_name)
{
	dprint dead_or_not
	chr_delete ai_name
}

func void shin_dies(void)
{
	dprint KABOOM
	particle ShinBomb do explode
	fade_out 1 1 1 30
	if (inroom eq 1)
	{
		chr_set_health 0 0
	}

	trigvolume_kill 64

	chr_delete ShinShin
	fade_in 60
	door_lock 3
	particle Shindoor_locklight01 do stop
	set_objective_3	
}

func void p1(string ai_name)
{
	dprint p1_trigger_entered
	sound_music_stop mus_trt
	sound_music_start atm_cl09 1.0
	ai2_spawn A1_sr01
	ai2_lookatme A1_sr01	
	ai2_spawn A1_t02
	ai2_lookatme A1_t02
	sleep 120
	door_lock 1
	door_lock 2
}

func void open_ambush1(string ai_name)
{
	dprint ambush_1
	particle blast1_locklight01 do start
	door_unlock 1
	ai2_spawn ambush_striker1
}

func void open_ambush2(string ai_name)
{
	dprint ambush_2
	particle blast2_locklight01 do start
	door_unlock 2
	ai2_spawn ambush_striker2
}

func void p2(string ai_name)
{
	dprint p2
	ai2_spawn A2_r03
	playback A2_r03 redjump
	ai2_lookatme A2_r03
	ai2_spawn aerial_red_2
	ai2_passive aerial_red_2 1
	playback aerial_red_2 redjump2
	ai2_passive aerial_red_2 0
	ai2_lookatme aerial_red_2
	ai2_spawn red_guard_1
	ai2_dopath A1_sr01 patrol_31
	ai2_dopath A1_t02	patrol_31
	ai2_setjobstate A1_sr01
	ai2_setjobstate A1_t02 patrol_31	
	sleep 120	
}

func void p5(string ai_name)
{
	dprint p5
	ai2_spawn A3_n05
	ai2_spawn A3_sb06
	ai2_spawn A4_n07
}

func void p6(string ai_name)
{
	dprint p6
	ai2_spawn A4_sr08
	ai2_spawn B1_c07
}

func void enableP7(string ai_name)
{
	dprint enableP7
	trigvolume_enable trigger_volume_07 1
}

func void do_console_1(string ai_name)
{
	dprint do_console
	ai2_doalarm A3_n05 1
}

func void p8(string ai_name)
{
	dprint p8
	ai2_spawn B2_sb09
	ai2_spawn B2_n10
	trigvolume_enable trigger_volume_07 0
	trigvolume_enable trigger_volume_08 0	
}

func void p9(string ai_name)
{
	dprint p9
	ai2_spawn C1_c16
	ai2_spawn C1_t11	
	ai2_spawn C1_sb12
	ai2_spawn C1_t13	
	ai2_spawn C2_sg15
	ai2_spawn C2_sr17
	ai2_spawn C2_sb14
	ai2_spawn C2_t19		
	particle room1 stop
}

func void red_ambush(string ai_name)
{
	dprint ambush_red
	ai2_spawn ambush_red_1
}

func void p10(string ai_name)
{
	dprint p10
	ai2_spawn D1_sr20
	ai2_spawn D1_sb21	
}

func void p11(string ai_name)
{
	dprint p11
	particle room6 do start
	pipe3_start
}
func void p11b(string ai_name)
{
	dprint p11b
	particle room6 do stop
}

func void striker_guards(string ai_name)
{
	dprint spawn_strikers
	ai2_spawn striker_guard_1
	ai2_spawn striker_guard_2
}

func void spawn_EC_guards(string ai_name)
{
	dprint spawn_guards
	ai2_spawn E1_sb29
	ai2_spawn E1_c33
	ai2_spawn E1_c40
	ai2_spawn E1_f34
	ai2_spawn E1_f40
	ai2_spawn E1_f35
}

func void final_guards(string ai_name)
{
	dprint last_guards_activated
	ai2_spawn final_guard_1
	ai2_spawn final_guard_2
}

func void p12(string ai_name)
{
	dprint p12
	ai2_spawn D2_sb26
	playback D2_sb26 piperun
	ai2_spawn pipe_guard_1
	ai2_spawn pipe_guard_2
}

func void p13(string ai_name)
{
	dprint p13
	ai2_spawn E1_sr28
	ai2_spawn E1_sb29
	ai2_spawn E1_sr30
	ai2_spawn ambush_comguy_1
	ai2_spawn E1_n31
	ai2_spawn E1_n32
	ai2_spawn E1_n37
	particle elev1_locklight01 do stop
	particle elev2_locklight01 do stop
}

func void p14(string ai_name)
{
	dprint p14
	chr_teleport 0 105
	ai2_spawn F_r40
	particle pipe3 do start
}

func void p36(string ai_name)
{
	dprint spawned_muro_runner_p36
	ai2_spawn muro_runner
	ai2_spawn muro_runner2
}

func void p39(string ai_name)
{
	dprint p39
	ai2_spawn F_r40
}

func void cross_fire(string ai_name)
{
	dprint crossfire
	ai2_spawn D2_sg24
	ai2_spawn D2_f25	
}

func void tctf_control(string ai_name)
{
	dprint tctfcontrol_start
	sound_music_start mus_amasian 1.0
	input 0
	letterbox 1
	door_unlock 38
	ai2_spawn E2_sr38
	ai2_spawn E2_sr39
	particle elev1_locklight01 do start
	particle elev2_locklight01 do start
	cm_interpolate tctf_3 0
	cm_interpolate_block tctf_1 300
	cm_interpolate_block tctf_2 150
	sleep 180
	cm_reset
	letterbox 0
	input 1
	door_unlock 37
}

func void warnbigroom(string ai_name)
{
	dprint warnbigroom
	ai2_tripalarm 1	
}

func void zap_cinematic(string ai_name)
{
	dprint doorA
	input 0
	begin_cutscene
	sound_music_start atm_cl12 0.75
	particle zap1 create
	particle zap1 start
	cm_interpolate zap_cinematic1 0
	cm_interpolate_block zap_cinematic3 700
	sleep 750
	cm_interpolate zap_cinematic4 0	
	sleep 60
	particle doorA_locklight01 do start
	sleep 150
	door_unlock 15	
	cm_reset
	end_cutscene
	input 1
	ai2_spawn vat_bot_1
	ai2_spawn vat_bot_2
	ai2_spawn vat_bot_3
	ai2_spawn vat_bot_4
	ai2_spawn vat_bot_5
	chr_weapon_immune(vat_bot_1);
	chr_weapon_immune(vat_bot_2);
	chr_weapon_immune(vat_bot_3);
	chr_weapon_immune(vat_bot_4);
	chr_weapon_immune(vat_bot_5);
	particle doorB_locklight01 do start
}

func void change_patrol_1(string ai_name)
{
	dprint change_patrol
	ai2_dopath vat_bot_2 vat_bot_2b 1
}

func void change_patrol_2(string ai_name)
{
	dprint change_patrol
	ai2_dopath vat_bot_3 vat_bot_3b 1
} 

func void change_patrol_3(string ai_name)
{
	dprint change_patrol
	ai2_dopath vat_bot_5 vat_bot_5b 1
}

func void spark_sound_off(string ai_name)
{
	dprint spark_music_off
	sound_music_stop atm_cl12
}

# YOUR DEATH IS ASSURED
func void dont_even_try_it(string ai_name)
{
	chr_set_health 0 0
}

### SPECIAL PARTICLES ###

func void killmuro(string ai_name)
{
	dprint killedmuro
	chr_delete muro_runner
	chr_delete muro_runner2
	sound_music_stop atm_cl11
	ai2_spawn A4_n07
}

func void pipe1a(string ai_name)
{	
	dprint pipe1_discharged
	ai2_passive A3_n05 1
	particle room4 do stop
	timer_start 30 pipe1b
	sound_music_start atm_cl11
}

func void pipe1b(void)
{	
	dprint pipe1_recharged
	particle room4 do start
	console_reset 1

	pipe1_music_off();
}

func void pipe1_music_off(void)
{	
	dprint pipe1_music_off
	sound_music_stop atm_cl11
}

func void pipe2a(void)
{	
	dprint pipe2_discharged
	particle room6 do stop
	timer_start 29 pipe2b
	sound_music_start atm_cl11
}

func void pipe2b(void)
{	
	dprint pipe2_recharged
	particle room6 do start
	console_reset 8

	pipe2_music_off();
}

func void pipe2_music_off(void)
{	
	dprint pipe2_music_off
	sound_music_stop atm_cl11
}

func void pipe3(void)
{	
	dprint pipe_discharged
	timer_start 19 pipe3b
	sound_music_volume mus_amasian 0.0 2.0
	particle pipe3 kill
	sound_music_start atm_cl11
	sound_music_stop mus_amasian
}

func void pipe3b(void)
{	
	if (inside_final_cutscene eq 0)
		{
		dprint pipe_recharged
		particle pipe3 create
		particle pipe3 do start
		console_reset 15
		}
}

func void final_cutscene_trumps_particles(void)
{
	inside_final_cutscene = 1;
	particle pipe3 kill
}

### Level scripted by Joseph ###