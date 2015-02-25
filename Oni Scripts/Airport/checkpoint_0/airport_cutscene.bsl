#
# airport_cutscene.bsl
#

func
airport_cs_intro
{
	#creates the cars, van
	obj_create 633 633
	obj_create 6331 6331
	obj_create 647 647
	obj_create 6471 6471 
	obj_create 960 960
	obj_create 9601 9602
	obj_create 2 7
	fade_out 0 0 0 0
	cm_interpolate Camout01 0
	sleep f7
	
	begin_cutscene

	cm_jello 0
	#fade_out 0 0 0 0
	letterbox 1
	fade_in 120
	fork camcontrol

	sound_music_start mus_asian 0.5
	music_script_start();

	sleep 120
	fork intro_cars
	#van start
	env_anim 2 7
	
	fork shinatama_comm

	sleep 855
	chr_nocollision 0 1
	#konoko on bike start
	chr_envanim 0 IntroKonokoBox01
	chr_animate 0 KONOKOcycle_ride 500
	obj_create 10 12
	env_anim 10 12
	sleep 6
	chr_create 100 start
	ai2_spawn IntroStriker01
	ai2_spawn IntroStriker02	

	chr_forceholster IntroStriker02 1
	
	sleep 1
	playback 100 IntroMuro01
	playback IntroStriker01 IntroComguy01
	playback IntroStriker02 IntroStriker01
	sleep 498
	#kill van object
	obj_kill 2 7
	#konoko off bike
	chr_envanim 0 IntroKonokoBox02 norotation
	chr_animate 0 KONOKOlev4_intro
	
	sound_music_volume mus_asian .25 0.5

	cinematic_start(KONtalkangryfront, 180, 180, 15, 3, 10, false)
	sleep 60
	sound_dialog_play c04_14_02konoko
	sleep 120
	cinematic_stop (KONtalkangryfront, 16, 20)
	playback 100 IntroMuro02
	playback IntroStriker01 IntroComguy02
	playback IntroStriker02 IntroStriker02
	sleep 60
	cinematic_start(MUROtalking, 180, 180, 15, 1, 15, false)
	sleep f50
	sound_dialog_play c04_14_01muro
	sound_dialog_play_block pause
	cinematic_stop (MUROtalking, 15, 30)

	sound_music_volume mus_asian 0.8 2.0

	playback 0 IntroKonoko01
	chr_nocollision 0 0
	obj_kill 10 12
	env_show 10 1
	env_show 11 1
	env_show 12 1
	
	chr_forceholster IntroStriker02 0
	
	sleep 60
	set_objective_1
	set_target_1	

	save_point_1

	sleep 260
	chr_delete 100
}

func
camcontrol
{
	cm_anim both Camout01
	sleep f80
	sound_ambient_start c03_44_03truckby
	cm_anim_block both Camout02
	sound_ambient_start c03_49_16_truck
	cm_anim_block both Camout03
	sound_ambient_start c03_49_16_motorcycle
	cm_anim_block both Camout04
	cm_wait
	sleep 2
	cm_interpolate Camout05 0
	sleep 1
	cm_interpolate Camout06 120
	sleep 300
	cm_reset
	cm_jello 1
	letterbox 0
	end_cutscene
}

func
intro_cars
{
	sleep 633
	env_anim 633 633
	env_anim 6331 6331
	sleep 14
	env_anim 647 647
	env_anim 6471 6471
	sleep 203
	sleep 110
	env_anim 960 960
	env_anim 9601 9602
	sleep 560
	obj_kill 633 633
	obj_kill 6331 6331
	obj_kill 647 647
	obj_kill 6471 6471 
	obj_kill 960 960
	obj_kill 9601 9602
}

func shinatama_comm
	{
	sleep 90
	sound_music_volume mus_asian 0.35 1.0
	sound_dialog_play c00_01_104shinatama
	cinematic_start (SHINtalking, 180, 180, 15, 1, 20, false)
	sound_dialog_play_block pause
	cinematic_stop (SHINtalking, 15, 20)
	sound_music_volume mus_asian 0.5 1.0
	}

func
Booth(string wazzzup)
{
	begin_cutscene weapon
	#make Konoko run to a flag
	ai2_takecontrol 1
	ai2_movetoflag 0 1091
	cm_interpolate BoothCamMuroWalk 240
	ai2_spawn BoothMuro01
	playback BoothMuro01 BoothMuroWalk
	#Muro just stands there and talks for a while
	sleep f180
	cinematic_start(MUROtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play c04_17_01muro
	sound_dialog_play_block pause
	#Konoko looks to see Strikers
	ai2_takecontrol 0
	cm_interpolate BoothCamKonokoLook 0
	playback 0 BoothKonokoLook
	ai2_spawn BoothStriker01
	ai2_spawn BoothStriker02
	sleep 30
	playback BoothStriker01 BoothStriker01
	playback BoothStriker02 BoothStriker02
	sleep 50
	#Strikers rush in
	cm_interpolate BoothCamStrike01 0
	cm_interpolate_block BoothCamStrike02 180
	sleep f60
	sound_dialog_play c04_17_02muro
	sleep 140
	#Muro walks out the door
	playback BoothMuro01 BoothMuroLeave
	sleep 30
	cm_interpolate BoothCamLeave01 0
	cm_interpolate_block BoothCamLeave02 300
	sleep f30
	sleep f50
	sound_dialog_play c04_17_03muro
	sound_dialog_play_block pause
	sleep f30

	sound_music_start mus_asian 0.8
	music_script_start
	trigvolume_enable stop_booth_music_tv 1

	cinematic_stop (MUROtalking, 15, 20)
	sleep 120
	cm_reset
	fork FixDoors
	
	particle door2_locklight01 do stop
	particle door7_locklight01 do stop
	door_lock 7
	set_target_blank

	chr_delete TerminalTwo_Striker_1
	chr_delete TerminalTwo_Striker_2
	chr_delete Tarmac_Striker_2
	chr_delete Tarmac_Striker_4

	chr_delete BoothMuro01
	end_cutscene
}

func void stop_booth_music(string who)
{
	sound_music_stop mus_asian
}

func
outro(string wazzup)
{
	begin_cutscene
	#cm_interpolate OutroCam01 0
	#playback 0 OutroKonoko
	#sleep 400
	fade_out 0 0 0 60
	sleep f120
	win
}



