### AIRPORT 1 LEVEL LOGIC ###

### START, SAVE & OBJECTIVES ###

func void func_start(string ai_name)
{
	dprint start_active

	trigvolume_enable hidden1 1
	trigvolume_enable hidden1 1

	if (save_point eq 0)
		{
		my_save_point=0;
		particle auto1 start
		particle auto1fire start
		particle auto1spark start
		particle door1spark start
		particle tctf1 start
		}

	if (save_point eq 1)
		{
		my_save_point=1;
		env_show 10 1
		env_show 11 1
		env_show 12 1
		dprint restore1_active
		particle auto1 start
		particle auto1fire start
		particle auto1spark start
		particle door1spark start
		particle tctf1 start
		sound_music_start mus_asian 0.5
		music_script_start();
		ai2_spawn IntroStriker01
		ai2_spawn IntroStriker02
		restore_game
		sleep 30
		set_target_1
		set_objective_1
		}

	if (save_point eq 2)
		{
		my_save_point=2;
		dprint restore_2
		particle fx3 do start
		particle exhaust create
		Tarmac1
		trigvolume_enable tarmac 0
		trigvolume_enable trigger_volume_03 0
		trigvolume_enable bomberboom 0
		trigvolume_enable madbomberbait 0
		door_lock 3
		obj_kill 991 992
		restore_game
		sleep 30
		set_target_3
		set_objective_2
		}	
	
	if (save_point eq 3)
		{
		my_save_point=3;	
		dprint restore3_active
		door_lock 3
		door_unlock 6
		particle lock1_locklight01 do stop
		particle lock2_locklight01 do start
		console_deactivate 5
		particle door7_locklight01 do start
		particle door2_locklight01 do start
		console_deactivate 6
		trigvolume_enable trigger_volume_02 0
		trigvolume_enable trigger_volume_03 0
		trigvolume_enable trigger_volume_04 0
		trigvolume_enable trigger_volume_08 0
		trigvolume_enable trigger_volume_10 0
		trigvolume_enable trigger_volume_11 0
		trigvolume_enable save_game 0
		trigvolume_enable secondcoming 0
		#TerminalTwo1
		particle auto1 stop
		particle auto1fire stop
		particle auto1spark stop
		particle door1spark stop
		particle tctf1 stop
		ai2_spawn TerminalTwo_Striker_1
		ai2_spawn TerminalTwo_Striker_2
		particle fx4 do start	
		particle fx5 do start
		particle fx6 do start
		particle fx1 do stop
		particle fx2 do stop
		particle fx3 do stop
		music_script_start();
		restore_game
		sleep 30
		set_objective_3
		set_target_5
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
	save_game 3 autosave
	ai2_spawn TerminalTwo_Striker_1
	ai2_spawn TerminalTwo_Striker_2
	particle fx5 do start
	particle fx6 do start
	particle fx3 do stop
	door_unlock 6
	particle door7_locklight01 do start 
	particle lock2_locklight01 do start 
	particle door2_locklight01 do start
}


func void set_objective_1(string chr_index)
{
	dprint objective_1
	objective_set(1)
	sound_dialog_play c00_01_22shinatama
}
func void set_objective_2(string chr_index)
{
	dprint objective_2
	objective_set(2)
	sound_dialog_play c00_01_19shinatama
}

func void set_objective_3(string chr_index)
{
	dprint objective_3
	objective_set(3)
	console_deactivate 2
	sound_dialog_play c00_01_18shinatama
}

func void set_objective_4(string chr_index)
{
	dprint objective_4
	objective_set(4)
	sound_dialog_play c00_01_20shinatama
}

func void set_target_1(string chr_index)
{
	dprint set_target1
	target_set(1095, 30.0)
	sound_dialog_play c00_01_28shinatama
}

func void set_target_2(string chr_index)
{
	dprint set_target2
	target_set(1132, 30.0)
	sound_dialog_play c00_01_27shinatama
}

func void set_target_3(string chr_index)
{
	dprint set_target3
	target_set(1109, 30.0)
	sound_dialog_play c00_01_26shinatama
}

func void set_target_4(string chr_index)
{
	dprint set_target4
	target_set(1112, 30.0)
	sound_dialog_play c00_01_25shinatama
}

func void set_target_5(string chr_index)
{
	dprint set_target5
	target_set(1115, 30.0)
	sound_dialog_play c00_01_24shinatama
}

func void set_target_6(string chr_index)
{
	dprint set_target6
	target_set(1139, 30.0)
	sound_dialog_play c00_01_28shinatama
}

func void set_target_blank(string chr_index)
{
	dprint set_targetblank
	target_set(0, 0.0)
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
		sleep f120
		}
}

func void striker_lullaby_2(string ai_name)
{
	dprint striker_lullaby2
	music_counter = music_counter - 1
	if (music_counter eq 0)
		{
		all_music_counters();
		sleep f120
		}
}

func void all_music_counters(void)
{
	dprint STOP_THE_MUSIC
	sound_music_stop mus_fitec_hd
	sound_music_stop mus_fitec
	sound_music_stop mus_fiteb
	sound_music_stop mus_asian
	sound_music_stop atm_gr06
}

### TEXT CONSOLES ###

func void level_4a(void)
{
	dprint set_text_4a
	text_console level_4a
	console_reset 7
}

func void level_4b(void)
{
	dprint set_text_4b
	text_console level_4b
	console_reset 7
}

func void level_4c(void)
{
	dprint set_text_4c
	text_console level_4c
	console_reset 8
}

### GAMEPLAY PROGRESSION ###

func void FixDoors(string char_index)
{
	dprint Fix_Doors
	particle door2_locklight01 do stop
	door_lock 10
}

func void hidden_civilian1(string ai_name)
{
	dprint hidden_civilian
	ai2_spawn hidden_civ_1
}

func void panic1a(string char_index)
{
	dprint panic_1a

	ai2_spawn civ_victim_6
	playback civ_victim_6 civ_victim6_flee interp 30
	ai2_spawn civ_victim_4
	playback civ_victim_4 civ_victim4_flee interp 30
	sleep 30
	ai2_spawn Intro_Striker_4
	playback Intro_Striker_4 striker4_advance interp 30
	ai2_spawn Intro_Comguy_1
}

func void panic1b(string char_index)
{
	dprint panic_1b
	ai2_passive Intro_Striker_4 1
	ai2_spawn civ_victim_2
	ai2_spawn civ_victim_3
	playback civ_victim_3 civ_victim3_flee interp 30
	sleep 120
	ai2_spawn Intro_Striker_3
	ai2_attack Intro_Striker_3 civ_victim_2
	ai2_spawn Friend_Thug_1
	ai2_spawn Neutral_Thug_1
	ai2_spawn Neutral_Thug_3
	particle fx1 do start
	particle fx2 do start
	chr_delete civ_victim_4
	chr_delete civ_victim_6
}

func void hide_1(string char_index)
{
	dprint hide1
	ai2_spawn civ_victim_5
	playback_block civ_victim_5 civ_victim5_flee interp 30
	ai2_dopath civ_victim_5 civ_victim_5
}

func void horror_1(string char_index)
{
	dprint horror1
	ai2_passive Intro_Striker_4 0
	ai2_spawn civ_victim_10
	ai2_spawn civ_victim_11
	ai2_spawn civ_victim_20
	ai2_spawn civ_victim_21
	particle fx1 do start
	particle fx2 do start
}
	
func void ambush_striker_1(string char_index)
{
	dprint ambush_1
	ai2_spawn Terminal_Striker_1
	ai2_spawn Terminal_Striker_2
	ai2_spawn mad_bomber_1
	obj_create 991 992
}

func void civ_victim_20s_flee(string char_index)
{
	dprint civ_victim_20s
	ai2_dopath civ_victim_20 civ20s_flee1
	ai2_dopath civ_victim_21 civ20s_flee2
}

func void LoadingBay1(string char_index)
{
	dprint spawn_guards
	ai2_spawn LoadingBay_Thug_1
	ai2_spawn LoadingBay_Thug_2
	ai2_spawn LoadingBay_Striker_2
	ai2_spawn LoadingBay_Comguy_1
	particle fx3 do start
}

func void bomber_boom(string char_index)
{
	dprint bomberboom
	particle bomb1 do explode
	obj_kill 991 992
	sleep 300
	particle bomb1 stop
}
	
func void mad_bomber_bait(string char_index)
{
	dprint bomber_bait
	ai2_dopath mad_bomber_1 bomber_flee 1
}

func void patrolscript0200(string char_index)
{
	dprint bomber1_death
	chr_delete mad_bomber_1
}

func void Tarmac1(string char_index)
{
	dprint spawn_guards
	ai2_spawn Tarmac_Striker_1
	ai2_spawn Tarmac_Striker_2
	ai2_spawn Tarmac_Striker_3
	ai2_spawn Tarmac_Striker_4
	ai2_spawn Tarmac_Friend_1
	ai2_spawn LoadingBay_Striker_1
	sound_music_start atm_gr06 0.75
	particle tarmacfire do start
	particle exhaust create
}

func void back9a(string ai_name)
{
	dprint hidden_striker1
	ai2_spawn hidden_striker1
}

func void back9b(string ai_name)
{
	dprint hidden_striker1
	ai2_spawn hidden_striker2
}

func void bay1_particles(void)
{
	dprint bay1_fires_on
	particle fx3 do start
	particle fx4 do stop
}

func void fire_damage(string ai_name)
{	
	dprint fire_hurt_konoko
	chr_poison (ai_name, 5, 30, 30);
}

func void bay2_particles(void)
{
	dprint bay2_fires_on
	particle fx3 do stop
	particle fx4 do start
}

# COME TO ME
func void come_to_me(string ai_name)
{
	dprint go_to_konoko
	ai2_dopath Tarmac_Striker_2 come_to_me 1
	ai2_dopath Tarmac_Striker_3 come_to_me 1
	ai2_dopath mad_bomber_2 come_to_me 1
}

# COME TO ME REDUX
func void second_coming(string ai_name)
{
	dprint go_to_konoko_again
	ai2_dopath Tarmac_Striker_2 come_to_me 1
	ai2_dopath Tarmac_Striker_3 come_to_me 1
	ai2_dopath mad_bomber_2 come_to_me 1
}

# PROGRESS CHECK

var int progress_counter=2;

func void progress_check_1(string ai_name)
{
	dprint progress_check1
	progress_counter = progress_counter - 1
	if (progress_counter eq 0)
		{
		pass_go_collect_whupass();
		}
}

func void progress_check_2(string ai_name)
{
	dprint progress_check2
	progress_counter = progress_counter - 1
	if (progress_counter eq 0)
		{
		pass_go_collect_whupass();
		}
}

func void progress_check_3(string ai_name)
{
	dprint progress_check3
	progress_counter = progress_counter - 1
	if (progress_counter eq 0)
		{
		pass_go_collect_whupass();
		}
}

func void progress_check_4(string ai_name)
{
	dprint progress_check4
	progress_counter = progress_counter - 1
	if (progress_counter eq 0)
		{
		pass_go_collect_whupass();
		}
}

func void exhaust_on(string ai_name)
{
	dprint start_exhaust
	particle exhaust create
}

func void exhaust_off(string ai_name)
{
	dprint stop_exhaust
	particle exhaust kill
}

func void pass_go_collect_whupass(string ai_name)
{
	dprint let_the_whupping_continue
	trigvolume_enable save_game_2 1
	trigvolume_enable secondcoming 0
}

func void patrolscript000(string ai_name)
{
	dprint do_my_bidding
	particle lock2_locklight01 do start
	door_unlock 6
}
	
func void BayTwo1(string char_index)
{
	dprint spawn_guards
	ai2_spawn BayTwo_Striker_1
	ai2_spawn hidden_friend2
	ai2_spawn mad_bomber_2
	sound_music_stop atm_gr06
}

func void Repair1(string char_index)
{
	dprint spawn_guards
	ai2_spawn Repair_Striker_1
	ai2_spawn Repair_Comguy_1
	ai2_spawn alamo_thug_1	
}

func void Repair2(string char_index)
{
	dprint spawn_guards
	ai2_spawn Repair_Striker_2
	ai2_spawn Repair_Comguy_2	
}

func void console_2_activate(string char_index)
{
	dprint console2_activate
	console_activate 2
}

func void final_ambush(string char_index)
{
	dprint finalambush
	input 0
	begin_cutscene
	sleep 60
	cm_interpolate ambush1 0
	sleep 150
	console_activate 4
	sleep 150
	sound_music_start mus_fitec_hd 0.91
	music_script_start
	cm_interpolate ambush2 0
	cm_interpolate_block ambush3 300
	sleep 350	
	cm_interpolate ambush4 300	
	door_unlock 14
	particle door3_locklight01 do start
	ai2_spawn finalam_striker_1
	ai2_spawn finalam_striker_2
	ai2_setmovementmode finalam_striker_1 walk
	ai2_setmovementmode finalam_striker_2 walk
	playback finalam_striker_1 finalam_striker1 interp 30
	playback finalam_striker_2 finalam_striker2 interp 30
	sleep 300
	particle door3_locklight01 do stop
	sleep 300
	door_lock 14	
	ai2_dopath finalam_striker1 finalam_1 1
	ai2_dopath finalam_striker2 finalam_2 1
	trigvolume_enable i_uh_heheheh1 1
	cm_reset
	end_cutscene
	input 1
}

func void i_uh_heheheh(string char_index)
{
	dprint iuh_heheheh
	ai2_dopath finalam_striker_1 strategic_retreat1
	ai2_dopath finalam_striker_2 strategic_retreat2
} 
	
### DOOR LOCK LIGHTS ###

func void change_terminaldoor_light(void)
{
	dprint door1
	input 0
	cm_interpolate door1 0
	sleep 60
	particle door1_locklight01 do start
	sleep 150
	cm_reset
	input 1
}

func void change_door2_light(void)
{
	dprint door2
	input 0 
	cm_interpolate door2 0
	sleep 60
	particle door2_locklight01 do start
	sleep 150
	set_objective_3
	set_target_6
	cm_reset
	input 1
}

func void change_enddoor_light(void)
{
	dprint end_door
	input 0
	cm_interpolate ambush4 0	
	sleep 60
	particle door3_locklight01 do start
	sleep 150
	door_unlock 14
	cm_reset
	input 1
}

### Level scripted by Joseph ###