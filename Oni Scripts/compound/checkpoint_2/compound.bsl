#	mountain compound
#	scripts for level 19 by wu
#	
#	LEGEND
#
#	character naming convention: X_Yx
#	where X = area letter (A=first area, B=second area, etc.)
#	      Y = character type (N=ninja, T=tanker, S=striker, R=red, etc.)
#		x = character number, usually same as character's initial patrol id
#
#	trigger volume scripts: t##, where ## refers to trigger volume id
#	
#	CONTENTS
#	
#	0.temporary debugging scripts
#	1.variables defined
#	1b.music scripts
#	2.start and objectives scripts
#	3.save game scripts
#	4.cut scene scripts
#	5.console scripts
#	6.trigger volume scripts

#	temporary debugging scripts 	#

func void xxx(void)
{
	ParkLeft
	t11
	sleep 300
	Truck
}

func void truck(string ai_name)
{
#	ai2_ignore_player=1
	omnipotent=1
	invincible=1
	chr_teleport 0 4
}

func void computer(string ai_name)
{
#	ai2_ignore_player=1
	dprint WALK_BACKWARDS_DOWN_THE_STAIRS_TO_OPEN_DOOR
	omnipotent=1
	invincible=1
	chr_teleport 0 6
}

func void e(string ai_name)
{
	ai2_ignore_player=1
	chr_teleport 0 100
}

func void butcher_test(void)
{
	invincible = 1
	omnipotent = 1
	extra_guys = 1
	fork dish
}

func void test_setup(void)
{
	ai2_allpassive 1	

	playback GrifElite01 GrifElite01Set
	playback GrifElite02 GrifElite02Set
	playback GrifElite03 GrifElite03Set
	sleep f10
	playback GrifElite02 GrifElite02Set
	sleep f5
	playback GrifElite03 GrifElite03Set
	sleep f300


	chr_envanim Griffin GrifGrifBox01
	if (extra_guys eq 1) {
		chr_envanim GrifOps01 GrifOps01Box01
		chr_envanim GrifOps02 GrifOps02Box01
	}
	if (extra_guys eq 0) {
		chr_envanim GrifOps02 GrifOps01Box01
	}
	chr_envanim GrifOps03 GrifOps03Box01
	chr_animate Griffin COMGUYlev7_helistand 500
	chr_animate GrifOps01 STRIKEcrouch_idle 400
	chr_animate GrifOps02 STRIKEcrouch_idle 400
	chr_animate GrifOps03 STRIKEcrouch_idle 400
	sleep f90
	sleep f200
	chr_envanim Griffin GrifGrifBox02 norotation
	if (extra_guys eq 1) {
		chr_envanim GrifOps01 GrifOps01Box02 norotation
		chr_envanim GrifOps02 GrifOps02Box02 norotation
	}
	if (extra_guys eq 0) {
		chr_envanim GrifOps02 GrifOps01Box02 norotation
	}
	chr_envanim GrifOps03 GrifOps03Box02 norotation
	chr_animate Griffin COMGUYlev7_Grif
	if (extra_guys eq 1) {
		chr_animate GrifOps01 STRIKElev7_Ops01
		chr_animate GrifOps02 STRIKElev7_Ops02
	}
	if (extra_guys eq 0) {
		chr_animate GrifOps02 STRIKElev7_Ops01
	}
	chr_animate GrifOps03 STRIKElev7_Ops03
	sleep f240
	playback Griffin GrifGrifRunAlt
	if (extra_guys eq 1) {
		playback GrifOps01 GrifOps01Run
		playback GrifOps02 GrifOps02Run
	}
	if (extra_guys eq 0) {
		playback GrifOps02 GrifOps01Run
	}
	sleep f10
	playback_block GrifOps03 GrifOps03Run

	sleep f300

	playback GrifElite04 GrifWave2_Run1
	playback GrifElite06 GrifWave2_Run3
	playback_block GrifElite05 GrifWave2_Run1
	sleep f300
	

	ai2_allpassive 0
}

func void test_boyz(void)
{
	playback Griffin GrifGrifRunAlt
	if (extra_guys eq 1) {
		playback GrifOps01 GrifOps01Run
		playback GrifOps02 GrifOps02Run
	}
	if (extra_guys eq 0) {
		playback GrifOps02 GrifOps01Run
	}
	sleep f10
	playback_block GrifOps03 GrifOps03Run
}

###############################
#	variables defined 	#
###############################

var int counter=2;
var int my_save_point=0;
var int console_count=0;
var int stairs_open=0;
var int comdies_ok=0;
var int conused_ok=0;
var int platform_ok=0;
var int thru_door;
var int count_swat_dies=3;
var int console100used;
var int console200used;
var int console300used;
var int console101used;
var int count_attack3;
var int muro_in_danger=0;
var int round2_spawned=0;
var int extra_guys=0;

###############################
#		music		      #
###############################

func void music_intro(void)
{
	sound_music_start mus_om01 .9
#	stopped at set_objective_2
}

func void music_guns_timer(void)
{
	dprint OBSOLETE_music_guns_timer
}

func void music_truck(void)
{
	sound_music_start mus_asianb
#	this music stopped at the end of the truck cutscene
}

func void stop_music_truck(void)
{
	sound_music_stop mus_asianb
#	this music stopped at the end of the truck cutscene
}

func void music_guns(void)
{
	sound_music_start mus_main03_hd
#	this music stopped in console301 or console300
}

func void music_guns_stop(void)
{
	sound_music_stop mus_main03_hd
}

func void music_battle(void)
{
	dprint MUSIC_BATTLE
	sound_music_start mus_ot
#	this music stopped in Outro
}

func void music_stop(void)
{
	dprint STOP_THE_MUSIC
	sound_music_stop mus_om01
	sound_music_stop mus_asianb
	sound_music_stop mus_main03
	sound_music_stop mus_main03_hd
}

###############################
#	start and objectives	#
###############################
func void paths(string ai_name)
{
	ai2_dopath GrifOps01 patrol_521
	ai2_dopath GrifOps02 patrol_515
	ai2_dopath GrifOps03 patrol_517
	ai2_dopath GrifElite01 patrol_513
	ai2_dopath GrifElite02 patrol_514
	ai2_dopath GrifElite03 patrol_518
}

func void spawnA(void)
{
	ai2_spawn A_S1
	ai2_spawn A_S2
	ai2_spawn A_E3
	ai2_spawn A_E5
	ai2_spawn A_E5b
}

func void start(string ai_name)
{
	dprint start	

	trigvolume_enable trigger_volume_21 0
	trigvolume_enable trigger_volume_21_copy 0
	trigvolume_enable trigger_volume_44 0
	trigvolume_enable trigger_volume_45 0
	trigvolume_enable attack_1tv 0
	trigvolume_enable attack_2tv 0
	trigvolume_enable attack_3tv 0
	trigvolume_enable attack_3tv_copy 0
	trigvolume_enable attack_4tv 0

	particle door12_locklight01 do start

	door_lock 35
	door_lock 36
	door_lock 37
	door_lock 39
	door_lock 40
	door_lock 41

	if (my_save_point eq 0)
	{
		objective_set(1)
		spawnA()
	}

	if (my_save_point eq 1)
	{
		save_point=1;	
		objective_set(1)
		music_intro
		ai2_dopath A_S1 patrol_01b
		ai2_setjobstate A_S1
		spawnA()
		restore_game
		chr_set_health 0 400
	}

	if (my_save_point eq 2)
	{
		save_point=2;	
		dprint restore2_beforetruck
		objective_set(2)
		door_lock 12
		particle door12_locklight01 do stop
		ai2_spawn C_Sr18
		ai2_dopath C_Sr18 patrol_18
		ai2_spawn C_Sr17
		ai2_spawn C_Sr19
		ai2_spawn C_Sb75
		ai2_spawn C_Sb76
		trigvolume_enable trigger_volume_39 0
		restore_game
	}

	if (my_save_point eq 3)
	{
		save_point=3;	
		dprint restore3_aftertruck
		objective_set(4)
		target_set (501,30.0)
		env_show 151 0
		env_show 152 0
		env_show 153 0
		env_show 154 0
		env_show 155 0
		env_show 156 0
		env_show 157 0
		env_show 158 0
		env_show 159 0
		#Hides door, unhides broken door 
		env_show 911 1
		env_show 912 0
		env_show 913 0
		#Shows Gunk truck
		env_show 251 1
		env_show 252 1
		env_show 253 1
		env_show 254 1
		env_show 255 1
		env_show 256 1
		env_show 257 1
		env_show 258 1
		env_show 259 1
		env_show 911 1
		env_show 912 0
		env_show 913 0
		env_show 914 1
		env_show 915 1
		env_show 916 1 

		ai2_spawn D_R33
		restore_game
	}

	if (my_save_point eq 4)
	{
		dprint restore4_finalbattle
		#hides original dish 
		env_show 301 0
		env_show 302 0
		env_show 303 0
		env_show 304 0
		env_show 305 0
		env_show 306 0
		env_show 307 0
		env_show 308 0
		env_show 309 0
		#Shows in place dish 
		env_show 401 1
		env_show 402 1
		env_show 403 1
		env_show 404 1
		env_show 405 1
		env_show 406 1
		env_show 407 1
		env_show 408 1
		env_show 409 1
		music_battle
		gs_farclipplane_set 3000
		particle dishpulse do start
		particle sturm_ambient start

		# start the dish loop
		sp_start_dish_loop
	

		if (did_kill_griffen() eq 1)
		{
			dprint restoreMutant
			ai2_spawn MutantMuro
			chr_boss_shield MutantMuro
			restore_game
			objective_set(7,silent)
		}

		if (did_kill_griffen() eq 0)
		{
			dprint restoreGriffin
			ai2_boss_battle = 1
			ai2_spawn Griffin
			if (extra_guys eq 1) 
			{
				ai2_spawn GrifOps01
			}
			ai2_spawn GrifOps02
			ai2_spawn GrifOps03			
			ai2_spawn Muro
			chr_boss_shield Muro
			if (extra_guys eq 1) 
			{
				ai2_spawn GrifElite01
			}
			ai2_spawn GrifElite02
			ai2_spawn GrifElite03
			chr_set_health Muro 500
			fork wait_to_help
			restore_game
			objective_set(6,silent)
			paths			
		}
	}
}

func void deathfall(void)
{
	cm_detach
	sleep f90
	chr_set_health 0 0
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

func void set_objective_1(string ai_name)
{
	dprint set_objective_1
	objective_set(1)
	target_set (1,0.0)
}

func void set_objective_2(string ai_name)
{
	dprint set_objective_2
	ai2_spawn B_Eb11
	ai2_spawn B_Eb16
	ai2_spawn B_Esb15
	ai2_spawn B_N1
	ai2_spawn B_Sr9
	ai2_spawn C_Sr17
	ai2_spawn C_Sr18
	ai2_spawn C_Sb75
	ai2_spawn C_Sb76
#	ai2_spawn C_Sb77
	ai2_spawn C_Sb78
	objective_set(2)
	target_set (558,30.0)
	music_stop
}

func void set_objective_5(string ai_name)
{
	dprint set_objective_5
	objective_set(5)
#	target_set (258,30.0)
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

	ai2_dopath C_Sr17 patrol_17
	ai2_setjobstate C_Sr17
	ai2_dopath C_Sr18 patrol_18
	ai2_setjobstate C_Sr18

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

##########################
#	cut scene scripts  #
##########################

var int run_truck_once = 0;

func void runTruck(string ai_name)
{
	dprint runTruck_check
	if (run_truck_once eq 0)
	{
		ai2_tripalarm 1 char_0
	}
	run_truck_once = 1;

	if (chr_has_lsi(0))
	{
		dprint LSI_OK
		if (trigvolume_count(29) eq 0)
		{
			trigvolume_enable trigger_volume_23 0
			dprint truck_ok
			chr_delete C_b74
			chr_delete C_Eb73
			Truck
			sleep 30
			ai2_spawn D_R33	
			chr_delete C_Eb21
			chr_delete C_Eb22
			chr_delete C_Eb27			
			chr_delete C_Eb29
			chr_delete C_Eb30
			chr_delete C_N23
			chr_delete C_N24
			chr_delete C_Sb25
			chr_delete C_Sb26
			chr_delete C_Sr17
			chr_delete C_Sr18
			chr_delete C_Tb20
			chr_delete C_Tr28	
			#chr_delete C_Sb77
			chr_delete C_Sb78		
			objective_set(4)
			target_set (501,30.0)
			particle obj1 kill
			s3
		}	
	}
}


func void t10(string ai_name)
{

	dprint t10
	if (trigvolume_count(25) eq 0)
	{
		if (stairs_open eq 1)
		{
			trigvolume_enable trigger_volume_10 0
			trigvolume_enable trigger_volume_12 0
			trigvolume_enable trigger_volume_26 0
			dprint ParkLeft
			ParkLeft	
			particle obj1 create
			objective_set(3)
			target_set(511,30.0)
#			ai2_makeignoreplayer ParkStriker 1
		}
	}
}

func void t12(string ai_name)
{

	dprint t12
	if (trigvolume_count(26) eq 0)
	{	
		if (stairs_open eq 1)
		{
			trigvolume_enable trigger_volume_12 0
			trigvolume_enable trigger_volume_10 0
			trigvolume_enable trigger_volume_25 0
			dprint ParkRight
			ParkRight
			particle obj1 create
			objective_set(3)
			target_set(511,30.0)
#			ai2_makeignoreplayer ParkStriker 1
		}
	}
}

func void patrolscript0027(string ai_name)
{
	dprint patrolscript0027
	ai2_dopath C_Sb25 patrol_52
	ai2_setjobstate C_Sb25
	ai2_dopath C_Sb26 patrol_53
	ai2_setjobstate C_Sb26
	ai2_dopath C_Eb27 patrol_27b
	ai2_setjobstate C_Eb27
}

func void com_ok(string ai_name)
{
	dprint final_ok
	comdies_ok = 1
}

func void fconsole_ok(string ai_name)
{
	dprint fconsole_ok
	conused_ok = 1
	objective_set(6)
	text_console level_19d
	target_set(502,30.0)
	particle green create
	sleep 400
	particle green2 create
	particle green3 create
}

func void t31(string ai_name)
{
	dprint t31
	if (conused_ok eq 1)
	{
#		if (comdies_ok eq 1)
#		{
			dprint TO_FINAL_BATTLE
			target_set(1,0.0)
			music_stop
			dish
#		}
	}
}

func void check_death1a(string ai_name)
{
	dprint death1a
	Round2a
}

func void check_death1b(string ai_name)
{
	dprint death1a
	Round2b
}

func void final_round(string ai_name)
{
	dprint check_ROUND_3
	counter = counter - 1
	if(counter eq 0)
	{
		Round3
	}
}

func void check_death2(string ai_name)
{
	Outro
}

func void Round2a(string ai_name)
{
	dprint ROUND_2a
	round2_spawned = round2_spawned + 1;

	ai2_spawn GrifElite04

	ai2_passive GrifElite04 1

	playback_block GrifElite04 GrifWave2_Run1

	ai2_passive GrifElite04 0

	if (muro_in_danger eq 1) {
		# force the backup to go after konoko only
		ai2_attack GrifElite04 char_0
	}
	if (muro_in_danger eq 0) {
		ai2_makeaware GrifElite04 char_0
	}
}

func void Round2b(string ai_name)
{
	dprint ROUND_2b
	round2_spawned = round2_spawned + 1;

	ai2_spawn GrifElite05

	ai2_passive GrifElite05 1

	playback_block GrifElite05 GrifWave2_Run1

	ai2_passive GrifElite05 0

	if (muro_in_danger eq 1) {
		# force the backup to go after konoko only
		ai2_attack GrifElite05 char_0
	}
	if (muro_in_danger eq 0) {
		ai2_makeaware GrifElite05 char_0
	}
}

func void Round3(string ai_name)
{
	dprint ROUND_3
	round2_spawned = round2_spawned + 1;

	ai2_spawn GrifElite06

	ai2_passive GrifElite06 1

	playback_block GrifElite06 GrifWave2_Run3

	ai2_passive GrifElite06 0


	if (muro_in_danger eq 1) {
		# force the backup to go after konoko only
		ai2_attack GrifElite06 char_0
	}
	if (muro_in_danger eq 0) {
		# go after other dudes
		ai2_makeaware GrifElite06 char_0
	}
}

func void wait_to_help(void)
{
	chr_wait_health Muro 200
	
	dprint MURO_IN_DANGER
	ai2_boss_battle = 0;
	muro_in_danger = 1;
	ai2_attack GrifElite01 char_0
	ai2_attack GrifElite02 char_0
	ai2_attack GrifElite03 char_0
	ai2_attack GrifElite04 char_0
	ai2_attack GrifElite05 char_0
	ai2_attack GrifElite06 char_0
}

###################
#	console	#
###################

func void console_truckinfo(void)
{
	text_console level_19e
	console_reset 6
}

func void unlock44(string ai_name)
{
#	begin_cutscene
#	ai2_makeignoreplayer C_Sb77 1
#	ai2_makeignoreplayer C_Sb78 1
#	ai2_makeignoreplayer C_Eb22 1
#	ai2_makeignoreplayer C_Eb21 1
#	ai2_makeignoreplayer C_Tb20 1
#	ai2_makeignoreplayer C_Sr19 1
#	ai2_makeignoreplayer C_Sr18 1
#	ai2_makeignoreplayer C_Sr17 1
#	ai2_makeignoreplayer C_Sb76 1
#	ai2_makeignoreplayer C_Sb75 1
	input 0
	chr_invincible char_0 1
	letterbox 1
	fade_out 0 0 0 30
	ai2_spawn C_Er79
	music_guns
	cm_interpolate door44 0
	fade_in 30
	target_set(559,30.0)
}

func void patrolscript0079(string ai_name)
{
	particle d1_locklight01 do start
#	sleep 60
	door_unlock 44
	sleep 60
	sound_dialog_play c18_70_13elite
	sound_dialog_play_block
}

func void patrolscript0080(string ai_name)
{
	sleep 90
	cm_interpolate door44b 300
	sleep 160
	sound_dialog_play c18_74_05elite
#	sound_dialog_play_block
	sleep 80
	fade_out 0 0 0 60
	sleep 60
	cm_reset
	fade_in 30
	input 1
#	end_cutscene
	letterbox 0
	chr_invincible char_0 0
#	ai2_makeignoreplayer C_Sb77 0
#	ai2_makeignoreplayer C_Sb78 0
#	ai2_makeignoreplayer C_Eb22 0
#	ai2_makeignoreplayer C_Eb21 0
#	ai2_makeignoreplayer C_Tb20 0
#	ai2_makeignoreplayer C_Sr19 0
#	ai2_makeignoreplayer C_Sr18 0
#	ai2_makeignoreplayer C_Sr17 0
#	ai2_makeignoreplayer C_Sb76 0
#	ai2_makeignoreplayer C_Sb75 0
#	ai2_dopath C_Sr17 patrol_81
#	ai2_dopath C_Sb75 patrol_81
#	ai2_dopath C_Sb76 patrol_81
	ai2_tripalarm 1 char_0
}

func void run1(string ai_name)
{
	dprint run1
	ai2_doalarm A_Sb7 1
	ai2_dopath A_Sb7 patrol_00
#	ai2_setjobstate A_Sb7
}

func void patrolscript0054(string ai_name)
{
	dprint doalarm
	ai2_doalarm A_Sb7 1
}

func void do_alarm_sound(void)
{
	sound_ambient_start alarm_loop
	sleep 900
	sound_ambient_stop alarm_loop
}

func void run1_alarm(string ai_name)
{
	dprint run1_alarm
	fork do_alarm_sound
	ai2_dopath A_E3 patrol_49	
	ai2_dopath A_E4 patrol_49
	ai2_dopath A_E5 patrol_49
	ai2_dopath A_E6 patrol_49
	ai2_spawn B_Sr9
	sleep 7
	ai2_dopath B_Sr9 patrol_10
	ai2_spawn B_Eb11
	sleep 60
	ai2_dopath B_Eb11 patrol_10
}

func void driverhurt(string ai_name)
{
	dprint driverhurt
	ai2_tripalarm 1 char_0
}

func void AreaF(string ai_name)
{
	console_count = console_count + 1
	if(console_count eq 1)
	{
		text_console level_19a
		sound_dialog_play_block c15_57_01konoko
		sound_dialog_play_block pause
		end_cutscene
	}
	if(console_count eq 2)
	{
		text_console level_19b
		sound_dialog_play_block c15_57_02konoko
	}
	if (console_count eq 3)
	{
		dprint Area_F_now_open
		trigvolume_enable attack_1tv 1
		trigvolume_enable attack_2tv 1
		trigvolume_enable attack_3tv 1
		trigvolume_enable attack_3tv_copy 1
		trigvolume_enable attack_4tv 1
		text_console level_19c
		set_objective_5
		sound_dialog_play_block c15_57_03konoko
		sound_dialog_play_block pause
		sleep 60
		music_guns
	}
}

func void target100(void)
{
	console100used = 1;
	if(console200used eq 0)
	{
		target_set(556,30.0)
	}
	if(console200used eq 1)
	{
		if(console300used eq 0)
		{
			target_set(557,30.0)
		}
	}
	if(console200used eq 1)
	{
		if(console300used eq 1)
		{
			target_set(547,30.0)
		}
	}
}
	
func void target200(void)
{
	console200used = 1;
	if(console300used eq 0)
	{
		target_set(557,30.0)
	}
	if(console300used eq 1)
	{
		if(console100used eq 0)
		{
			target_set(555,30.0)
		}
	}
	if(console300used eq 1)
	{
		if(console100used eq 1)
		{
			target_set(547,30.0)
		}
	}
}

func void target300(void)
{
	console300used = 1;
	if(console200used eq 0)
	{
		target_set(556,30.0)
	}
	if(console200used eq 1)
	{
		if(console100used eq 0)
		{
			target_set(555,30.0)
		}
	}
	if(console200used eq 1)
	{
		if(console100used eq 1)
		{
			target_set(547,30.0)
		}
	}
}

#func void console100(string ai_name)
#{
#	dprint console100
#	console_deactivate 101
#	AreaF
#	target100
#}

func void console101(string ai_name)
{
	dprint console101
	console101used = 1;
	target100
#	console_deactivate 100
	AreaF
}

func void console200(string ai_name)
{
	dprint console200
	target200
	AreaF
}

func void console300(string ai_name)
{
	music_guns_stop
	dprint console300
	console_deactivate 301
	target300
	AreaF
}

func void console301(string ai_name)
{
	music_guns_stop
	dprint console301
	console_deactivate 300
	target300
	AreaF
}

func void purp2(void)
{
	input 0
	fade_out 0 0 0 30
	cm_interpolate unlock_door 0
	fade_in 30
	sleep 60
	particle purple2_locklight01 do start
	door_unlock 20
	door_unlock 21
	door_unlock 22
	door_unlock 23
	door_unlock 24
	door_unlock 25
	door_unlock 26
	door_unlock 27
	door_unlock 28
	sleep 90
	fade_out 0 0 0 30
	cm_reset
	fade_in 30
	input 1
}

func void purple2_unlock(string ai_name)
{
	dprint purple2_unlock
	purp2()
	trigvolume_enable trigger_volume_21 1
	trigvolume_enable trigger_volume_21_copy 1
	trigvolume_enable trigger_volume_44 1
	trigvolume_enable trigger_volume_45 1
	console_deactivate 100
}

func void purple2_unlock_b(string ai_name)
{
	dprint purple2_unlockb
	purp2()
	if(console101used eq 0)
	{
		target_set(555,30.0)
	}
	console_deactivate 200
}

func void unlock_stairs(string ai_name)
{
	dprint unlock_stairs
	music_stop
	door_unlock 10
	door_unlock 15
	door_unlock 16
	door_unlock 17
	particle stair_locklight01 do start
	ai2_spawn S_Tr41
	console_deactivate 4
#	console_deactivate 5
	console_deactivate 3
	stairs_open = 1
	target_set(1,0.0)
}


func void unlock_stairs2(string ai_name)
{
	dprint unlock_stairs
	music_stop
	door_unlock 10
	door_unlock 15
	door_unlock 16
	door_unlock 17
	particle stair_locklight01 do start
	console_deactivate 3
#	console_deactivate 5
	ai2_spawn S_Tr41
	ai2_spawn C_b74
	ai2_spawn C_Eb73
	chr_teleport C_b74 224
	ai2_dopath C_b74 patrol_80
	chr_teleport C_Eb73 237
	ai2_dopath C_Eb73 patrol_80
	stairs_open = 1
}


#########################
#  trigger volume stuff #
#########################
func void t8(string ai_name)
{
	dprint t8
#	ai2_spawn C_Sb77
	ai2_spawn C_Sb78
	ai2_spawn C_Sr19
	ai2_spawn C_Tb20
	ai2_spawn C_Eb21
	ai2_spawn C_Eb22
	ai2_spawn C_N23
	ai2_spawn C_N24
	ai2_spawn C_Eb29
	ai2_spawn C_Eb30
}


func void t9(string ai_name)
{
	dprint t9
	ai2_spawn B_Eb16
}

func void t11(string ai_name)
{
	dprint t11
	ai2_dopath C_Sb25 patrol_48
	sleep 60
	ai2_dopath C_Sb26 patrol_48
	sleep 60
	ai2_dopath C_Eb27 patrol_48

}


func void t13(string ai_name)
{
	dprint t13
	ai2_spawn E_Er34
	sleep 60
	door_unlock 24
#	door_unlock 23
#	door_unlock 22
	particle purple_locklight01 do start
	ai2_dopath E_Er34 patrol_34
	ai2_setjobstate E_Er34
	ai2_spawn E_Eb35
	target_set(501,30.0)	
}

func void t14(string ai_name)
{
	dprint t14
	ai2_spawn E_N36
	ai2_spawn E_Tr40
	trigvolume_enable trigger_volume_15 0	
}

func void t15(string ai_name)
{
	dprint t15
	ai2_spawn E_N35
	ai2_spawn E_Nr46
	trigvolume_enable trigger_volume_14 0	
}

func void t16(string ai_name)
{
	dprint t16
	ai2_spawn E_Nr36
	ai2_spawn E_Nb37
	ai2_spawn E_Nr39
	target_set (556,30.0)
	door_unlock 22
	particle purple3_locklight01 do start
}

func void t20(string ai_name)
{
	dprint t20
	ai2_spawn E_N42
	trigvolume_enable trigger_volume_18 0
#	console_deactivate 100	
	
}

func void t18(string ai_name)
{
	dprint t18
	ai2_spawn E_N44
	ai2_spawn E_R46
	trigvolume_enable trigger_volume_20 0	
#	console_deactivate 101	

}

func void t19(string ai_name)
{
	dprint t19
	ai2_spawn E_Er45
	ai2_spawn E_N41
	trigvolume_enable trigger_volume_17 0
#	console_deactivate 300	
}

func void t17(string ai_name)
{
	dprint t17
	ai2_spawn E_N43
	trigvolume_enable trigger_volume_19 0
#	console_deactivate 301	
	
}

func void t45(string ai_name)
{
	ai2_makeignoreplayer E_Eb35 1
	ai2_makeignoreplayer E_Er34 1
	ai2_makeignoreplayer E_Er45 1
	ai2_makeignoreplayer E_Nb37 1
	ai2_makeignoreplayer E_Nb38 1
	ai2_makeignoreplayer E_Nr36 1
	ai2_makeignoreplayer E_Nr39 1
	ai2_makeignoreplayer E_Nr46 1
	ai2_makeignoreplayer E_R46 1
	ai2_makeignoreplayer E_Tr40 1
	sleep 600
	if(thru_door eq 0)
	{
		dprint DIDNOTGOTHRUDOOR
	ai2_makeignoreplayer E_Eb35 0
	ai2_makeignoreplayer E_Er34 0
	ai2_makeignoreplayer E_Er45 0
	ai2_makeignoreplayer E_Nb37 0
	ai2_makeignoreplayer E_Nb38 0
	ai2_makeignoreplayer E_Nr36 0
	ai2_makeignoreplayer E_Nr39 0
	ai2_makeignoreplayer E_Nr46 0
	ai2_makeignoreplayer E_R46 0
	ai2_makeignoreplayer E_Tr40 0
	}
}

func void t21(string ai_name)
{
	dprint t21
	input 0
	letterbox 1
	cm_interpolate red1 260
	music_guns
	sleep 90
	particle mainchamber_locklight01 do start
	door_unlock 18
	door_unlock 19
	ai2_spawn D_R31
	ai2_spawn D_R32
	ai2_spawn D_E83
	door_open 18
	door_open 19
	sleep 180
	door_lock 18
	door_lock 19
	particle mainchamber_locklight01 do stop
	sleep 15
	cm_interpolate red2 400
	sleep 90
	fade_out 0 0 0 30
	sleep 30
	cm_reset
	fade_in 30
	letterbox 0
	input 1
	trigvolume_enable trigger_volume_21_copy 0
	trigvolume_enable trigger_volume_45 0
	sleep 60
	ai2_makeignoreplayer E_Eb35 0
	ai2_makeignoreplayer E_Er34 0
	ai2_makeignoreplayer E_Er45 0
	ai2_makeignoreplayer E_Nb37 0
	ai2_makeignoreplayer E_Nb38 0
	ai2_makeignoreplayer E_Nr36 0
	ai2_makeignoreplayer E_Nr39 0
	ai2_makeignoreplayer E_Nr46 0
	ai2_makeignoreplayer E_R46 0
	ai2_makeignoreplayer E_Tr40 0
	thru_door = 1;
	sleep 300
}

func void t22(string ai_name)
{
	dprint t22
	ai2_makeignoreplayer E_Eb35 1
	ai2_makeignoreplayer E_Er34 1
	ai2_makeignoreplayer E_Er45 1
	ai2_makeignoreplayer E_Nb37 1
	ai2_makeignoreplayer E_Nb38 1
	ai2_makeignoreplayer E_Nr36 1
	ai2_makeignoreplayer E_Nr39 1
	ai2_makeignoreplayer E_Nr46 1
	ai2_makeignoreplayer E_R46 1
	ai2_makeignoreplayer E_Tr40 1
	input 0
	letterbox 1
	cm_interpolate red3 260
	music_guns
	sleep 90
	particle mainchamber_locklight01 do start
	door_unlock 18
	door_unlock 19
	ai2_spawn D_R31
	ai2_spawn D_R32
	ai2_spawn D_E83
	door_open 18
	door_open 19
	sleep 180
	door_lock 18
	door_lock 19
	particle mainchamber_locklight01 do stop
	sleep 15
	cm_interpolate red4 400
	sleep 90
	fade_out 0 0 0 30
	sleep 30
	cm_reset
	fade_in 30
	letterbox 0
	input 1
	trigvolume_enable trigger_volume_21 0
	trigvolume_enable trigger_volume_44 0
	sleep 60
	ai2_makeignoreplayer E_Eb35 0
	ai2_makeignoreplayer E_Er34 0
	ai2_makeignoreplayer E_Er45 0
	ai2_makeignoreplayer E_Nb37 0
	ai2_makeignoreplayer E_Nb38 0
	ai2_makeignoreplayer E_Nr36 0
	ai2_makeignoreplayer E_Nr39 0
	ai2_makeignoreplayer E_Nr46 0
	ai2_makeignoreplayer E_R46 0
	ai2_makeignoreplayer E_Tr40 0
	thru_door = 1;
	sleep 300
	music_stop
}

func void wake_E(string ai_name)
{
	sleep 60
	ai2_makeignoreplayer E_Eb35 0
	ai2_makeignoreplayer E_Er34 0
	ai2_makeignoreplayer E_Er45 0
	ai2_makeignoreplayer E_Nb37 0
	ai2_makeignoreplayer E_Nb38 0
	ai2_makeignoreplayer E_Nr36 0
	ai2_makeignoreplayer E_Nr39 0
	ai2_makeignoreplayer E_Nr46 0
	ai2_makeignoreplayer E_R46 0
	ai2_makeignoreplayer E_Tr40 0
}

func void sleep_E(string ai_name)
{
	ai2_makeignoreplayer E_Eb35 1
	ai2_makeignoreplayer E_Er34 1
	ai2_makeignoreplayer E_Er45 1
	ai2_makeignoreplayer E_Nb37 1
	ai2_makeignoreplayer E_Nb38 1
	ai2_makeignoreplayer E_Nr36 1
	ai2_makeignoreplayer E_Nr39 1
	ai2_makeignoreplayer E_Nr46 1
	ai2_makeignoreplayer E_R46 1
	ai2_makeignoreplayer E_Tr40 1
}

func void fpath(string ai_name)
{
	ai2_dopath F_Eb43 patrol_43
	ai2_setjobstate F_Eb43
	sleep 30
	ai2_dopath F_Eb44 patrol_44
	ai2_setjobstate F_Eb44
	sleep 30
	ai2_dopath F_Eb47 patrol_47
	ai2_setjobstate F_Eb47
	music_stop
}

func void attack_1(string ai_name)
{
	dprint attack_1
	sleep_E
	chr_invincible char_0 1
	letterbox 1
	sleep 15
	input 0
	cm_interpolate attack1 90
	ai2_spawn F_Eb43
	ai2_spawn F_Eb44
	ai2_spawn F_Eb47
	door_unlock 43	
#	sleep 60
	sleep 90
	particle F_locklight01 do start
	fpath

	cm_interpolate attack2 240
	sleep 300
	cm_interpolate attack1 600
	chr_teleport 0 506
	sleep 90
	letterbox 0
	cm_reset
	chr_invincible char_0 0
	trigvolume_enable attack_2tv 0
	trigvolume_enable attack_3tv 0
	trigvolume_enable attack_3tv_copy 0
	trigvolume_enable attack_4tv 0
	input 1
	ai2_dopath F_Eb43 patrol_43b
	ai2_setjobstate F_Eb43
	ai2_dopath F_Eb44 patrol_44b
	ai2_setjobstate F_Eb44
	ai2_dopath F_Eb47 patrol_47b
	ai2_setjobstate F_Eb47
	wake_E
}

func void attack_2(string ai_name)
{
	dprint attack_2
	sleep_E
	chr_invincible char_0 1
	letterbox 1
	sleep 15
	input 0
	cm_interpolate attack2b 120
	sleep 120
	cm_interpolate attack2 400
	sleep 100
	particle F_locklight01 do start
	sleep 80
	ai2_spawn F_Eb43
	ai2_spawn F_Eb44
	ai2_spawn F_Eb47
	door_unlock 43
	fpath
	sleep 290
	cm_interpolate attack2b 500
	chr_teleport 0 507
	sleep 90
	letterbox 0
	cm_reset
	chr_invincible char_0 0
	trigvolume_enable attack_1tv 0
	trigvolume_enable attack_3tv 0
	trigvolume_enable attack_3tv_copy 0
	trigvolume_enable attack_4tv 0
	input 1
	ai2_dopath F_Eb43 patrol_43b
	ai2_setjobstate F_Eb43
	ai2_dopath F_Eb44 patrol_44b
	ai2_setjobstate F_Eb44
	ai2_dopath F_Eb47 patrol_47b
	ai2_setjobstate F_Eb47
	wake_E
}


func void attack_3(string ai_name)
{
  if(count_attack3 eq 0)
  {
	count_attack3 = count_attack3 + 1;
	dprint attack_3
	chr_invincible char_0 1
	sleep_E
	letterbox 1
	sleep 15
	input 0
	cm_interpolate attack3 90
	ai2_spawn F_Eb43
	ai2_spawn F_Eb44
	ai2_spawn F_Eb47
	door_unlock 43	
	sleep 90
	cm_interpolate attack4 210
	particle F_locklight01 do start
	fpath
	sleep 150
	cm_interpolate attack3 400
	chr_teleport 0 508
	sleep 90
	letterbox 0
	cm_reset
	chr_invincible char_0 0
	trigvolume_enable attack_2tv 0
	trigvolume_enable attack_3tv_copy 0
	trigvolume_enable attack_3tv 0
	trigvolume_enable attack_1tv 0
	trigvolume_enable attack_4tv 0
	input 1
	ai2_dopath F_Eb43 patrol_43b
	ai2_setjobstate F_Eb43
	ai2_dopath F_Eb44 patrol_44b
	ai2_setjobstate F_Eb44
	ai2_dopath F_Eb47 patrol_47b
	ai2_setjobstate F_Eb47
	wake_E
  }
}

func void attack_4(string ai_name)
{
	dprint attack_4
	chr_invincible char_0 1
	sleep_E
	letterbox 1
	sleep 15
	input 0
	cm_interpolate attack3b 120
	sleep 120
	cm_interpolate attack4 300
	sleep 240
	particle F_locklight01 do start
	ai2_spawn F_Eb43
	ai2_spawn F_Eb44
	ai2_spawn F_Eb47
	door_unlock 43
	fpath
	sleep 160
	cm_interpolate attack3b 500
	chr_teleport 0 509
	sleep 90
	letterbox 0
	cm_reset
	chr_invincible char_0 0
	trigvolume_enable attack_2tv 0
	trigvolume_enable attack_3tv 0
	trigvolume_enable attack_3tv_copy 0
	trigvolume_enable attack_1tv 0
	input 1
	ai2_dopath F_Eb43 patrol_43b
	ai2_setjobstate F_Eb43
	ai2_dopath F_Eb44 patrol_44b
	ai2_setjobstate F_Eb44
	ai2_dopath F_Eb47 patrol_47b
	ai2_setjobstate F_Eb47
	wake_E
}


func void t27(string ai_name)
{
	dprint t27
	ai2_dopath C_Sb25 patrol_54
	ai2_dopath C_Sb26 patrol_54
	ai2_dopath C_Eb27 patrol_54
}

func void t30(string ai_name)
{
	dprint t30
	ai2_makeignoreplayer F_C62 0
	ai2_spawn F_Er89
}

func void t33(string ai_name)
{
	dprint t33
	ai2_spawn F_Er86
	ai2_spawn F_Nr87
	target_set(258,30.0)
	sound_dialog_play c15_57_04konoko
}
func void t41(string ai_name)
{
	dprint t41
	ai2_spawn F_Er59
}

func void t42(string ai_name)
{
	dprint t42
	ai2_spawn F_Nr60
}

func void t43(string ai_name)
{
	dprint t43
	ai2_spawn F_R61
	ai2_spawn F_Er88
	ai2_spawn F_C62
	ai2_makeignoreplayer F_C62 1
}

func void comalarm(string ai_name)
{
	dprint comalarm
	ai2_tripalarm 2 char_0
}

func void t38(string ai_name)
{
	dprint t38
	ai2_spawn A_E4
	ai2_spawn A_Sb63
	ai2_spawn A_E6
	ai2_spawn A_Sb7
	ai2_spawn new_2
}

func void t40(string ai_name)
{
	dprint t40
	input 0
	letterbox 1
	cm_interpolate red1 240
	sleep 60
	particle purple2_locklight01 do start
	sleep 90
	fade_out 0 0 0 30
	cm_reset
	fade_in 30
	input 1
}

func void swat_dies(void)
{
	count_swat_dies = count_swat_dies - 1;
	if(count_swat_dies eq 0)
	{
		ai2_attack GrifElite01 char_0
		ai2_attack GrifElite02 char_0
		ai2_attack GrifElite03 char_0
		ai2_attack GrifElite04 char_0
		ai2_attack GrifElite05 char_0
	}
}
