### DREAMLAB LEVEL LOGIC ###

### START, SAVE & OBJECTIVES ###

# START
func void start(string ai_name)
{
	door_lock 3
	door_lock 1
	env_show 1976 0
	trigvolume_enable splash_trigger 0

	if (save_point eq 0)
		{
		my_save_point=0;
		trigvolume_enable shinatama1a 1
		trigvolume_enable shinatama1b 1
		#env_show 999 0
		ai2_spawn ghost_1
		ai2_spawn ghost_2
		set_objective_1
		}

	if (save_point eq 1)
		{
		my_save_point=1;
		dprint restore1
		ai2_spawn IntroMuro
		playback IntroMuro IntroMuroSet
		ai2_passive IntroMuro 1
		playback 0 IntroKonokoSet
		env_show 200 0
		env_show 201 0
		env_show 227 0
		env_show 231 1
		env_show 232 1
		env_show 999 0
		particle fog_floor1 do start
		sound_music_start mus_om01 .75
		trigvolume_enable shinatama1a 1
		trigvolume_enable shinatama1b 1
		set_objective_1
		restore_game
		ai2_spawn ghost_1
		ai2_spawn ghost_2
		}

	if (save_point eq 2)
		{
		my_save_point=2;	
		dprint restore2
		particle fog_room1 do start
		ai2_spawn griffin
		playback griffin GrifGriffinSet
		door_lock 3
		trigvolume_enable room1a 0
		trigvolume_enable room1b 0
		set_objective_2
		restore_game
		sound_music_start mus_wls .75
		}
}

func void you_lose(string ai_name)
{
	sleep 240
	fade_out 0 0 0 180 
	sleep 240
	all_music_counters
	lose
}

func void you_win(string char_index)
{
	sound_music_volume mus_wls 0.0 2.0
	sleep 180
	fade_out 0 0 0 180 
	outro
}

func void save_point_1(string player_name)
{
	dprint save_1
	save_game 1 autosave
}

func void save_point_2(string player_name)
{
	dprint save_2
	save_game 2 autosave
	chr_delete liliput_striker_1
	chr_delete liliput_striker_2
	chr_delete liliput_striker_3
	set_objective_2
}

func void set_objective_1(string chr_index)
{
	dprint objective_1
	objective_set(1)
}

func void set_objective_2(string chr_index)
{
	dprint objective_2
	objective_set(2)
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
	dprint STOP_THE_MUSIC
	sound_music_stop atm_cl16
	sound_music_stop mus_om01
	sound_music_stop atm_gr09
	sound_music_stop mus_wls
	sound_music_stop atm_ft81
}

### FOLLOW THE WHITE SHINATAMA ###

# SHINATAMA 1a
func void shinatama_1a(string ai_name)
{
	sound_dialog_play c12_63_01shinatama
	ai2_spawn shinatama_1a
	ai2_lookatme shinatama_1a
}

# SHINATAMA 1b
func void shinatama_1b(string ai_name)
{
	ai2_dopath shinatama_1a shinatama_flee_1
	door_lock 8
}

# SHINATAMA 1a DEATH
func void patrolscript0100(string ai_name)
{
	chr_delete shinatama_1a
	door_lock 7	
}

# SHINATAMA 2
func void shinatama_2(string ai_name)
{
	sound_dialog_play c12_63_03shinatama
	dprint shinatama_2
	ai2_spawn shinatama_2
	ai2_spawn liliput_striker_1
	ai2_spawn liliput_striker_2
	ai2_spawn liliput_striker_3
	chr_lock_active shinatama_2
	door_lock 8
	door_open 11
	door_open 12
}

# SHINATAMA 2 DEATH
func void patrolscript0101(string ai_name)
{
	chr_delete shinatama_2
}

# SHINATAMA 3
func void shinatama_3(string ai_name)
{
	chr_delete ghost_1
	chr_delete ghost_2
	sound_dialog_play c12_63_04shinatama
	ai2_spawn shinatama_3
	ai2_spawn shin_striker_1
	ai2_spawn shin_striker_2
	ai2_spawn shin_striker_3
	ai2_spawn shin_striker_4
}

# SHINATAMA 3 DEATH
func void patrolscript0102(string ai_name)
{
	chr_delete shinatama_3
	sleep 400
	chr_delete shin_striker_1
	chr_delete shin_striker_2
	chr_delete shin_striker_3
	chr_delete shin_striker_4
	chr_delete shin_striker_5
	chr_delete shin_striker_6
	chr_delete shin_striker_7
}

func void delay_and_play_shin(void)
{
	sleep 240
	sound_dialog_play c12_63_05shinatama
}

# SHINATAMA NO-GRAV
func void shinatama_nograv(string ai_name)
{
	dprint shinatama_nograv
	sound_music_volume atm_gr09 0.0 2.0
	sound_music_stop atm_gr09
	sound_music_start atm_ft81 .75	
	particle fog_room1 do stop
	particle fog_room2 do start
	door_lock 5
	door_lock 6
	ai2_spawn shinatama_nograv
	chr_invincible shinatama_nograv 1
	chr_nocollision shinatama_nograv 1
	sound_music_start atm_cl22 0.1
	sound_music_volume atm_cl22 1.0 4
	fork delay_and_play_shin
	playback_block shinatama_nograv shinatama_nograv interp 30
	chr_delete shinatama_nograv
	door_unlock 6
	door_close 5
	door_jam 5
	invincible = 0
	sound_music_volume atm_cl22 0.0 6
	sleep 250
	sound_music_stop atm_cl22
}

### AMBUSHES, BACKUPS ###

func void ghost_1(string ai_name)
{
	dprint vanish_ghost1
	chr_delete ghost_1
}

func void ghost_2(string ai_name)
{
	dprint vanish_ghost2
	chr_delete ghost_2
}

# AMBUSH 1a
func void ambush_1a(string ai_name)
{
	dprint ambush_1a
	ai2_spawn ambush_tanker_1a
	sound_music_stop atm_gr09
	sound_music_start mus_wls .75
}

# AMBUSH 1b
func void ambush_1b(string ai_name)
{
	dprint ambush_1b
	ai2_spawn ambush_tanker_1b
	door_open 8
	door_jam 8
}

# AMBUSH 2
func void ambush_2(string ai_name)
{
	dprint ambush_2
	ai2_spawn ambush_red_1
	sound_music_stop atm_ft81 
	sound_music_start mus_wls .75
}

# TANKER VARIABLE
func void tanker_1_var(string ai_name)
{
	dprint tanker_var1
	tanker_counter = tanker_counter - 1
	chr_inv_reset ambush_tanker_1a
	if (tanker_counter eq 0)
		{
		new_music();
		}
}

func void tanker_2_var(string ai_name)
{
	dprint tanker_var2
	tanker_counter = tanker_counter - 1
	chr_inv_reset ambush_tanker_1b
	if (tanker_counter eq 0)
		{
		new_music();
		}
}

func void new_music(string ai_name)
{
	dprint change_the_track
	door_unlock 9
	sound_music_stop mus_wls
	sound_music_start atm_ft81 .75
}

# RED VARIABLE
func void red_1_var(string ai_name)
{
	dprint red_var
	red_counter = red_counter - 1
	if (red_counter eq 0)
		{
		redbackup();
		}
}

# RED BACKUP
func void redbackup(string ai_name)
{
	dprint red_backup
	ai2_spawn ambush_red_2
	door_unlock 1
	door_lock 2
	door_unjam 8
	chr_delete liliput_striker_1
	chr_delete liliput_striker_2
	chr_delete liliput_striker_3
}

# RED RETREAT
func void red_retreat(string ai_name)
{
	dprint retreat_reds
	ai2_makeignoreplayer ambush_red_1 1
	ai2_makeignoreplayer ambush_red_2 1
	ai2_dopath ambush_red_1 red_retreat_1 1
	ai2_dopath ambush_red_2	red_retreat_2 1
}

func void patrolscript0007(string ai_name)
{
	dprint red_react
	ai2_makeignoreplayer ambush_red_1 0
	ai2_makeignoreplayer ambush_red_2 0
}

# RED (MUSIC) SHIFT
func void redmusic_1_var(string ai_name)
{
	dprint redmusic_1
	rmusic_counter = rmusic_counter - 1
	if (rmusic_counter eq 0)
		{		
		red_shift();
		}
}

func void redmusic_2_var(string ai_name)
{
	dprint redmusic_2
	rmusic_counter = rmusic_counter - 1
	if (rmusic_counter eq 0)
		{		
		red_shift();
		}
}

func void red_shift(string player_name)
{
	dprint redshift
	sound_music_stop mus_wls
	sound_music_start atm_gr09 0.75
	door_unlock 2
}


# SWAT VARIABLE
func void swat_1_var(string ai_name)
{
	dprint swat_var
	swat_counter = swat_counter - 1
	if (swat_counter eq 0)
		{
		swatbackup();
		}
}

# SWAT BACKUP
func void swatbackup(string ai_name)
{
	dprint swat_backup
	door_unlock 2
	ai2_spawn griffin_b1
	ai2_spawn griffin_b2
}

# ROOM 1 END VAR
func void end_1a_var(string ai_name)
{
	dprint swat_var
	end1_counter = end1_counter - 1
	if (end1_counter eq 0)
		{
		room1_end();
		}
}

func void end_1b_var(string ai_name)
{
	dprint swat_var
	end1_counter = end1_counter - 1
	if (end1_counter eq 0)
		{
		room1_end();
		}
}

func void end_1c_var(string ai_name)
{
	dprint swat_var
	end1_counter = end1_counter - 1
	if (end1_counter eq 0)
		{
		room1_end();
		}
}

# ROOM 1 END
func void room1_end(string ai_name)
{
	dprint room1_end
	door_unlock 3
	trigvolume_enable nodark 1
}

### GOTTA CATCH 'EM ALL! (WITH NO APOLOGIES TO YOU KNOW WHAT) ###

# MINISTRIKE
func void mini_strike(string ai_name)
{
	dprint mini_strike
	ai2_spawn mini_strike_1
	ai2_spawn mini_strike_2
	ai2_spawn mini_strike_3
	ai2_spawn mini_strike_4
	chr_delete ghost_1
	chr_delete ghost_2
}

# MINISTRIKE 1 FLEE
func void mini_strike_flee_1(string ai_name)
{
	ai2_dopath mini_strike_1 mini_strike_flee_1
}

# MINISTRIKE 2 FLEE
func void mini_strike_flee_2(string ai_name)
{
	ai2_dopath mini_strike_2 mini_strike_flee_2
}

# MINISTRIKE 3 FLEE
func void mini_strike_flee_3(string ai_name)
{
	ai2_dopath mini_strike_3 mini_strike_flee_3
}

# MINISTRIKE 4 FLEE
func void mini_strike_flee_4(string ai_name)
{
	ai2_dopath mini_strike_4 mini_strike_flee_4
}

# SWISS CHEESE

func void patrolscript0001(string ai_name)
{
	dprint swisscheese_1
	chr_nocollision mini_strike_1 1
	playback_block mini_strike_1 cheese1 interp 30
	chr_delete mini_strike_1
}
func void patrolscript0002(string ai_name)
{
	dprint swisscheese_2
	chr_nocollision mini_strike_2 1
	playback_block mini_strike_2 cheese2 interp 30
	chr_delete mini_strike_2
}

func void patrolscript0003(string ai_name)
{
	dprint swisscheese_3
	chr_nocollision mini_strike_3 1
	playback_block mini_strike_3 cheese3 interp 30
	chr_delete mini_strike_3
}

func void patrolscript0004(string ai_name)
{
	dprint swisscheese_4
	chr_nocollision mini_strike_4 1
	playback_block mini_strike_4 cheese4 interp 30
	chr_delete mini_strike_4
}

# MINISTRIKE 1 HOLE
func void patrolscript0110(string ai_name)
{
	chr_delete mini_strike_1
}

# MINISTRIKE 2 HOLE
func void patrolscript0111(string ai_name)
{
	chr_delete mini_strike_2
}

# MINISTRIKE 3 HOLE
func void patrolscript0112(string ai_name)
{
	chr_delete mini_strike_3
}

# MINISTRIKE 4 HOLE
func void patrolscript0113(string ai_name)
{
	chr_delete mini_strike_4
}

### EVERYBODY WAS DREAM LAB FIGHTIN' ###

# ROOM 1
func void room_1(string ai_name)
{
	dprint room_1
	sound_music_stop atm_gr09
	sound_music_start mus_wls .75
	particle fog_room1 do start
	ai2_spawn griffin
	Griffin01
	trigvolume_enable room1a 0
	trigvolume_enable room1b 0
	trigvolume_enable room1c 0
}

# ROOM 2
func void room_2(string ai_name)
{
	dprint room_2
	ai2_spawn evilkonoko
	Konoko02
	door_lock 6
	trigvolume_enable room2 0
}

# ROOM 2 MUSIC
func void room2_music(string ai_name)
{
	dprint room2music
	sound_music_volume atm_ft81 0.0 2.0
	sound_music_stop atm_ft81 .75
	sound_music_start mus_wls .75
}

### GENERAL CHICANERY ###

# MURO'S WALL
func void bring_the_wall(string char)
{
	dprint oops
	env_show 1010 1
}

# FOG ON 1
func void fog_floor1on(void)
{
	dprint fog_on
	particle fog_floor1 do start
	particle fog_floor2a do stop
}

# FOG OFF 1
func void fog_floor1off(void)
{
	dprint fog_off
	particle fog_floor1 do stop
	particle fog_floor2a do start
}

# FOG ON 2
func void fog_floor2boff(void)
{
	dprint fog_on
	particle fog_floor2a do start
	particle fog_floor2b do stop
}

# FOG OFF 2
func void fog_floor2bon(void)
{
	dprint fog_off
	particle fog_floor2a do stop
	particle fog_floor2b do start
}

func void show_the_acid(string char)
{
	dprint show_acid
	sound_music_volume mus_wls 0.0 2.0	
	sound_music_stop mus_wls
	sound_music_start atm_gr09 0.75
	env_show 1976 1
	trigvolume_enable splash_trigger 1
	particle fog_floor1 do stop
}

# ACID DOOOOOM
func void splash(string char)
{
  	var bool eggman;
	eggman = chr_is_player(char);
  	if (eggman eq 0)
  		{
    		chr_animate(char, KONOKOacid);
    		sleep f10
    		chr_set_health(char, 0);
  		}

  	if (eggman eq 1)
  		{
		input 0
		chr_animate(char, KONOKOacid);
		cm_detach

		sound_impulse_play konoko_gruesome_death

		sleep f5
		chr_set_health(char, 0);
  		}
}

func void laser_cutscene_fog(void)
{
	gs_farclipplane_set 2000
	gl_fog_start_changeto .995 45
}

# LASER CUTSCENE
func void laser_cutscene(string ai_name)
{
	dprint laser_cutscene
	fork laser_cutscene_fog
	begin_cutscene
	sleep 90
	trig_activate 1 
	cm_interpolate laser_4 0
	door_close 4
	door_jam 4
	cm_interpolate_block laser_3 250
	sleep 250
	cm_interpolate laser_2 0
	cm_interpolate_block laser_8 200
	ai2_spawn laser_ops_1
	playback_block laser_ops_1 lstriker_1 interp 30
	sleep 60
	ai2_allpassive 0
	cm_reset
	door_lock 4
	door_lock 5
	trigvolume_enable lasercutscene 0
	trigvolume_enable death_by_bungie 1
	trigvolume_enable splash 1
	sleep 15
	end_cutscene
}

func void laser_cleanup(string ai_name)
{
	dprint laser_unlock
	door_unlock 5
}

# BIG HEAD VAR
func void bighead_1a_var(string ai_name)
{
	dprint bighead_var
	bighead_counter = bighead_counter - 1
	if (bighead_counter eq 0)
		{
		big_head();
		}
}

func void bighead_1b_var(string ai_name)
{
	dprint bighead_var
	bighead_counter = bighead_counter - 1
	if (bighead_counter eq 0)
		{
		big_head();
		}
}

func void bighead_1c_var(string ai_name)
{
	dprint bighead_var
	bighead_counter = bighead_counter - 1
	if (bighead_counter eq 0)
		{
		big_head();
		}
}

func void bighead_1d_var(string ai_name)
{
	dprint bighead_var
	bighead_counter = bighead_counter - 1
	if (bighead_counter eq 0)
		{
		big_head();
		}
}

# BIG HEAD
func void big_head(string ai_name)
{
	dprint bighead
	sleep 200
	chr_big_head = 1
	timer_start 120 small_head
}

func void small_head(string ai_name)
{
	dprint smallhead
	chr_big_head = 0
}

### Level scripted by Joseph ###