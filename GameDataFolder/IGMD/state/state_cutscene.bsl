#
# state_cutscene.bsl
#

var int face_count_dead;

func void
state_cs_intro(
	void)
{
	trigvolume_enable trig_vol_17 0
	trigvolume_enable trig_vol_19 0
	trigvolume_enable trigger_volume_99 0
	begin_cutscene
	cutscene_sync off
	fade_out 0 0 0 0
	sleep 120
	#Griffin talks
	cinematic_start(GRIFtalkangry, 180, 180, 16, 3, 30, true)
	sound_dialog_play c10_34_01griffin
	sound_dialog_play_block pause
	#Kerr responds
	sleep 20
	#cinematic_start(KERRtalking, 180, 180, 19, 7, 10, false)
	cinematic_start(KERRtalking, 180, 180, 15, 1, 10, false)
	sound_dialog_play c10_34_02kerr
	sound_dialog_play_block pause
	#Griffin talks again
	sleep 20
	sound_dialog_play c10_34_03griffin
	sleep 400

	#Make characters for cut-scene
	sound_music_start mus_main02_hd 1.0
	chr_create 102 start
	sleep 10
	#ninja runs out of scene
	playback 102 IntroNinja
	playback 0 IntroKonoko
	chr_nocollision 0 1
	fade_in 120
	cm_anim both Camout01
	sleep 120
	cinematic_stop (GRIFtalkangry, 16, 10)
	cinematic_stop (KERRtalking, 15, 10)
	cm_wait
	chr_delete 102	
	cm_anim both Camout02
	cm_wait
	cm_interpolate Camin03 0
	#change this amount to work with cutscene
	sleep 170	
	sleep 60
	#security shows up behind Konoko
	ai2_spawn IntroSec1
	ai2_spawn IntroSec2
	sleep 10
	cm_interpolate Camin04 0
	playback 0 IntroKonoko02
	sleep 30
	sound_dialog_play c10_34_05secguard2
	sound_dialog_play_block pause
	chr_animate IntroSec2 SECURIlev11_intro
	cm_interpolate Camin05 0
	#put security guard talking here
	cinematic_start(SEC2talking, 180, 180, 15, 1, 30, true)
	sound_dialog_play c10_34_04secguard1
	sound_dialog_play_block pause
	#Konoko says I don't have time for this
	cm_interpolate IntroCamNotime 0
	cinematic_start (KONintense, 180, 180, 20, 8, 20, true)
	sound_dialog_play c10_34_06konoko
	sound_dialog_play_block pause
	#Security says something
	sound_dialog_play c10_34_07secguard1
	sound_dialog_play_block pause
	cinematic_stop (SEC2talking, 15, 30)
	#your call
	cm_interpolate IntroCamCall01 0
	cm_interpolate_block IntroCamCall02 90
	sleep 70
	sound_dialog_play c10_34_08konoko
	sound_dialog_play_block pause
	cinematic_stop (KONintense, 20,20)
	sleep 20
	cm_reset 0
	#chr_delete 102
	chr_nocollision 0 0
	trigvolume_enable trig_vol_17 1
	trigvolume_enable trig_vol_19 1
	trigvolume_enable trigger_volume_99 1
	end_cutscene
	set_objective_1
}


func void
dog(string ai_name)
{
	particle obj1 kill
	begin_cutscene
	chr_forceholster 0 1
	chr_nocollision 0 1
	sleep 30
	#Konoko uses console
	playback 0 DogKonokoSet
	cm_interpolate DogCamLeftHigh 0
	cm_interpolate_block DogCamRightHigh 400
	sleep 10
	chr_animate 0 KONOKOlev11_cnsl_start 68
	chr_animate_block 0 KONOKOlev11_cnsl_idle 300
	#sleep 30
	#Konoko talks
	cinematic_start (KONintense, 180, 180, 19, 7, 20, false)
	sound_dialog_play c10_35_01aKonoko
	sleep 90
	chr_animate 0 KONOKOlev11_cnsl_type 120
	chr_animate_block 0 KONOKOlev11_cnsl_idle 800 8
	sleep 120
	cm_interpolate DogCamRight 0
	cm_interpolate_block DogCamLeft 500
	#Konoko senses the watchdog
	sound_dialog_play_block c10_35_01bKonoko
	chr_animate 0 KONOKOlev11_cnsl_type 120
	chr_animate_block 0 KONOKOlev11_cnsl_type 800 8
	#camera switches to show Ninja
	chr_create 1030 start
	playback 1030 DogNinjaSet
	chr_animate 1030 NINJAlev11_cnsl_type 400
	cm_interpolate DogCamNinjaRight 0
	cm_interpolate_block DogCamNinjaLeft 360
	sleep 360
	#Konoko says no
	cm_interpolate DogCamLeftHigh 0
	cm_interpolate_block DogCamRight 800
	sound_dialog_play_block c10_35_01cKonoko
	chr_animate 0 KONOKOlev11_cnsl_idle 240 8
	sleep 180
	#Konoko wonders who hacker was
	chr_animate_block 0 KONOKOlev11_cnsl_stop	
	#Gameplay resumes
	chr_delete 1030
	sound_dialog_play_block pause
	cinematic_stop (KONintense, 15, 30)
	end_cutscene
	cm_reset
	chr_nocollision 0 0
	playback DogKonokoEnd
#	save_game_2

	trig_activate 12
	trig_activate 13
	trig_activate 14

	door_unlock 82

	set_objective_5
	set_target_2

	console_activate 1
	console_activate 6
}

func void
Nwindow_ninja(string ai_name)
{
	#spawn character 1030 before Konoko enters the room
	chr_create 1030 start
	chr_neutral 1030 1
	playback 1030 WindowNinjaSet
}

func void
window_ninja(string ai_name)
{
	trigvolume_enable Cut_outro 0
	chr_create 1030 start
	chr_neutral 1030 1
	playback 1030 WindowNinjaSet
	begin_cutscene
	cm_interpolate WindowCamSet 70
	ai2_takecontrol 1
	ai2_setmovementmode 0 walk
	ai2_movetoflag 0 289
	sleep f60
	cm_interpolate WindowCamStart 120
	sound_music_start mus_pursuit_hd
	sleep 120
	#Ninja turns around
	cm_anim both WindowCam00
	ai2_takecontrol 0
	chr_envanim 1030 WindowNinjaBox02 norotation
	chr_animate 1030 NINJAlev11_windowturn
	obj_create 481 481
	obj_show 481 481
	env_anim 481 481
	#Konoko says give me back those files
	cm_wait
	playback 0 WindowKonoko01
	cm_interpolate WindowCam02 0
	sleep 30
	#cinematic_start (KONintense, 180, 180, 17, 6, 30, false)
	#sound_dialog_play lev11_WindowKon
	#sound_dialog_play_block pause
	#cinematic_stop (KONintense, 18, 30)
	sleep 60
	playback 0 WindowKonoko02
	#Ninja backs towards window and flies out)
	env_setanim 481 Disk02
	chr_envanim 1030 WindowNinjaBox01 norotation
	chr_animate 1030 NINJAlev11_window
	cm_anim both WindowCam03
	sleep 185
	#break glass here
	sound_impulse_play glass_big
	particle WindowCharge do explode
	cm_wait
	cm_reset
	end_cutscene
	sleep 60
	chr_delete 1030
	ai2_spawn WindowNinjaRun
	ai2_passive WindowNinjaRun 1
	chr_unstoppable WindowNinjaRun 1
	ai2_spawn creepy_ninja_4
	chr_lock_active WindowNinjaRun
	#make ninja no collision with particles
	playback WindowNinjaRun WindowNinjaRun
	obj_kill 481 481
	target_set(1030, 0.0)
	sleep f210
	playback WindowNinjaRun JumpNinjaSet
	sleep f10
	playback WindowNinjaRun JumpNinjaSet
	#chr_delete WindowNinjaRun
}

func void
WindowNinjaDelete(string ai_name)
{
	#chr_delete WindowNinjaRun 
}

func void
FaceSet(string ai_name)
{
	playback WindowNinjaRun
	ai2_spawn FaceNinja
	ai2_spawn FaceNinja2
	ai2_passive FaceNinja 1
	ai2_passive FaceNinja2 1
	ai2_passive FaceNinja3 1
	playback FaceNinja FaceNinjaSet
	playback FaceNinja FaceNinjaJump
	sleep 60
	#chr_delete WindowNinjaRun 
	ai2_passive FaceNinja 0
	ai2_passive FaceNinja2 0
	ai2_passive FaceNinja3 0
	trigvolume_enable Cut_outro 0
}

func void
JumpNinja(string ai_name)
{
	chr_nocollision WindowNinjaRun 1
	chr_animate WindowNinjaRun KONOKOlev11_jump -1
	sleep f135
	chr_delete WindowNinjaRun
}

func void
JumpKonoko(string ai_name)
{
	begin_cutscene
	chr_animate 0 KONOKOlev11_jump -1
	sleep f135
}

#func void
#Face(string ai_name)
#{
#	playback FaceNinja FaceNinjaJump
#	sleep 60
#	#chr_delete WindowNinjaRun 
#	ai2_passive FaceNinja 0
#	sleep 60
#}


func void
outro_makeNinja(string ai_name)
{
	chr_create 111 start
	chr_create 110 start
	chr_neutral 110 1
	chr_neutral 111 1
	playback 110 OutroNinja
	playback 111 OutroSuperNinja
}

func void
outro(string ai_name)
{
	particle obj2 kill
	sound_music_stop mus_pursuit_hd
	begin_cutscene
	sleep f30
	chr_nocollision 0 1
	chr_create 111 start
	chr_create 110 start
	chr_neutral 110 1
	chr_neutral 111 1
	playback 110 OutroNinja
	playback 111 OutroSuperNinja
	cm_interpolate JumpCamKonoko01 0
	playback 0 JumpKonokoSet
	cm_interpolate_block JumpCamKonoko02 90
	sleep f10
	chr_animate 0 KONOKOlev11_jump -1
	sleep f100
	chr_nocollision 0 0
	sleep f10
	playback 0 JumpKonokoDown
	cm_interpolate OutroCamSet 0
	#chr_forceholster 0 1
	sleep f90
	cm_interpolate OutroCam01 140
	sleep 60
	chr_animate 111 NINCOMstartle_bk1
	sleep 80
	cinematic_start (BOSS2face, 180, 180, 17, 6, 30, false)
	sound_dialog_play c10_37_01superninja
	sound_dialog_play_block pause
	cinematic_stop(BOSS2face, 17, 30)
	#ninja jumps onto line
	obj_create 71 71
	cm_anim both OutroCam02
	env_anim 71 71
	chr_envanim 111 OutroNinjaBox01 norotation
	chr_animate 111 NINJAlev11_outrozip01
	playback 110 OutroNinja02
	cutscene_sync_mark
	sound_ambient_start c12_14_07zipa
	sleep 170
	cm_interpolate OutroCam03 0
	playback 0 OutroKonoko
	#kill character 111 here
	chr_delete 111
	sleep 60
	#KONOKO jumps on back of Ninja
	env_anim 71 71
	chr_envanim_block 110 OutroNinjaBox01 norotation
	chr_animate 110 NINJAlev11_outrozip01
	chr_envanim 0 OutroKonBox01 norotation
	chr_animate 0 KONOKOlev11_outrozip01
	cm_anim both OutroCam04
	cutscene_sync_mark
	sound_ambient_start c12_14_07zipb
	cm_wait
	cm_anim both OutroCam05
	env_setanim 71 Zipthing02
	chr_envanim 110 OutroNinjaBox02 norotation
	chr_animate 110 NINJAlev11_outrozip02
	chr_envanim 0 OutroKonBox02 norotation
	chr_animate 0 KONOKOlev11_outrozip02
	sleep 60
	fade_out 0 0 0 60
	sleep 90
	win
}

func void
Floor2Unlock(string ai_name)
{
	input 0
	cm_interpolate Floor2Unlock 0
	sleep 150
	cm_reset
	door_unlock 54
	particle lock1_locklight01 do start
	input 1
}

func void
DataArchiveUnlock(string ai_name)
{
	door_unlock 7
	ai2_spawn fl1_target_1
	input 0
	sound_music_start mus_heart
	fork music_force_stop
	cm_interpolate DataArchiveUnlock 0
	trigvolume_enable shut_off_vault_music 1
	particle obj1 create
	sleep 150
	cm_reset
	input 1
}

func void
you_lose(string ai_name)
{
	sound_music_stop mus_main02_hd
	sound_music_stop mus_heart
	sound_music_stop mus_pursuit
	sleep 240
	fade_out 0 0 0 180 
	sleep 240
	lose
}