#
# lab_cutscene.bsl
#

func void shin_intro_dialogue(void)
{
	sound_dialog_play c00_01_99shinatama
	cinematic_start (SHINtalking, 180, 180, 15, 1, 20, false)
	sound_dialog_play_block pause
	cinematic_stop (SHINtalking, 15, 20)
}

func void intro(void)
{
	fade_out 0 0 0 0
	cm_interpolate Camout01 0
	sleep 13
	begin_cutscene		
	#hide motorcycle gunk
	env_show 8 0
	env_show 9 0
	env_show 10 0
	chr_nocollision 0 1
	chr_forceholster 0 1
	sleep 60
	fade_in 120
	#fork camcontrol
	cm_anim both Camout01
	obj_create 8 10
	env_anim 8 10
	chr_envanim 0 KonBipedBox01
	chr_animate 0 KONOKOcycle_ride 880
	sleep 15
	cutscene_sync mark
	sound_ambient_start c02_02_01_motorcyclea
	cm_wait
	cm_anim both Camout02
	cutscene_sync mark

	fork shin_intro_dialogue

	sound_ambient_start c02_02_01_motorcycleb 0.7

	cm_wait
	cm_anim both Camout03
	cutscene_sync mark

	sound_ambient_start c02_02_01_motorcyclec 0.7

	ai2_spawn Barabus
	ai2_setmovementmode Barabus walk
	playback Barabus IntroSubboss01
	cm_wait
	cm_anim both Camout04
	sleep 20
	cutscene_sync mark

	sound_ambient_start c02_14_27_jump_land_skid

	sleep 40
	chr_animate Barabus STRIKElev3_startle
	cm_wait
	cm_anim both Camout05
	chr_animate 0 KONOKOlev3_intro_stop
	env_setanim 8 hubs_stop
	env_setanim 9 hubs_rear_stop
	env_setanim 10 motorcycle02_stop
	chr_envanim 0 KonBipedBox02 norotation
	cm_wait
	cm_interpolate Camout06 0
	#chr_create 1000 start
	#chr_neutral 1000 1
	cinematic_start (BOSS1talking, 180, 180, 20, 8, 20, false)
	sleep 20
	sound_dialog_play c03_10_01barabas
	sound_dialog_play_block pause
	sleep 20
	cinematic_stop (BOSS1talking, 19, 20)
	#hide motorcycle object
	obj_kill 8 10
	#unhide motorcycle gunk
	env_show 10 1
	env_show 9 1
	env_show 8 1
	#setup Konoko for scene
	playback 0 IntroKonoko01
	sleep 10
	cm_reset
	chr_nocollision 0 0
	end_cutscene
	set_objective_1
	trigvolume_enable save_1_trig 1
	ai2_attack Barabus konoko

	sound_music_start mus_main01_hd	0.8
}

func void camcontrol(void)
{
	cm_anim both Camout01
	cm_anim both Camout02
	cm_anim both Camout03
	cm_anim both Camout04
	cm_anim both Camout05
	cm_wait
	letterbox 0
	cm_jello 1
	cm_reset
	chr_nocollision 0 0
	input 1
}

func void rocket(void)
{
	sound_music_stop mus_main01_hd	

	begin_cutscene jello
	chr_animate Barabus STRIKEknockdown1
	sleep 60
	ai2_takecontrol 1
	ai2_lookatchar 0 Barabus
	chr_animate Barabus BARABstunned 1000
	sound_dialog_play c03_10_02barabas
	cinematic_start (BOSS1talking, 180, 180, 16, 1, 20, false)	
	sleep 280
	chr_nocollision Barabus 1
	chr_animate Barabus BARABrocket 250
	sleep 130
	cutscene_sync mark
	sound_ambient_start c01_00_02barjet
	#Barabas flies into the sky
	chr_animate_block Barabus BARABlev3_rocket
	chr_envanim Barabus RocketBox01
	cm_anim both RocketCam01
	sleep 90
	sound_dialog_play c03_11_01barabas
	sound_dialog_play_block pause
	sound_dialog_play c03_11_02muro
	cinematic_start (MUROtalking, 180, 180, 16, 3, 20, true)	
	sound_dialog_play_block pause
	sound_dialog_play c03_11_03barabas
	sound_dialog_play_block pause
	sound_dialog_play c03_11_04muro
	sound_dialog_play_block pause
	sound_dialog_play c03_11_05barabas
	sound_dialog_play_block pause
	sleep 30
	cinematic_stop (BOSS1talking, 15, 20)
	cinematic_stop (MUROtalking, 16, 20)
	sleep 10
	cm_reset
	end_cutscene
	ai2_takecontrol 0
	chr_delete Barabus
	set_objective_2
	trigvolume_enable floor1 1
	trigvolume_enable outside_left 1
	trigvolume_enable outside_right 1
	trigvolume_enable outside_back 1

	target_set(143, 30.0)

	sleep 180

	sound_ambient_start c00_01_98shinatama

#	dprint savegame_1	
#	save_game 1
}


func void bomber(void)
{
	chr_animate Tower_MB_1 STRIKEknockdown1
	chr_invincible Tower_MB_1 1
	chr_unstoppable Tower_MB_1 1
	dprint(ainame);
	begin_cutscene
	#input 0
	#cm_jello 0		
	#letterbox 1
	#add dialogue "Help Konoko!  We're pinned down!!"
	sleep f60
	sound_dialog_play c03_12_02tctfag1
	door_unlock 60
	door_unlock 61
	sleep 60
	cm_interpolate BomberCam01 0
	cm_interpolate_block BomberCam02 300
	ai2_spawn BombComguy
	ai2_setmovementmode BombComguy run
	playback BombComguy COMGUYfiring
	sleep 180
	#sound_dialog_play
	ai2_spawn BombTCTF1
	ai2_spawn BombTCTF2
	chr_create 1004 start
	ai2_setmovementmode BombTCTF1 run
	ai2_setmovementmode BombTCTF2 run
	playback BombTCTF1 TCTFfiring01
	playback BombTCTF2 TCTFfiring02
	playback 1004 TCTFradio
	playback BombComguy COMGUYfiring
	chr_animate 1004 COMGUYtalk_radio 380
	sound_dialog_play_block pause
	# CB: this sound file no longer exists (it was a duplicate)
	sound_dialog_play c03_12_12TCTFAG1

	cinematic_start (TCTFshouting, 180, 180, 16, 3, 20, true)	
	sound_dialog_play_block pause
	#env_show 777 1
	#env_show 778 0
	cinematic_stop (TCTFshouting, 16, 20)
	#back in the tower Bomber man staggers to his feet
	playback 0 KonBomb
	chr_envanim Tower_MB_1 BomberBox01 norotation
	chr_animate Tower_MB_1 BOMBlev3_stagger
	cm_interpolate BomberCam03 0
	cm_interpolate_block BomberCam04 330
	cinematic_start (KONtalkangryfront, 180, 180, 18, 6, 20, true)
	sleep 40
	sound_dialog_play c03_12_03konoko
	sound_dialog_play_block pause
	sleep 60
	cinematic_stop (KONtalkangryfront, 17, 20)
	chr_envanim_block Tower_MB_1 BomberBox02 norotation
	chr_animate Tower_MB_1 BOMBlev3_stand 1200
	cm_interpolate_block BomberCam05 0
	cinematic_start (BOMBbeatup, 180, 180, 18, 4, 30, false)
	sound_dialog_play c03_12_04bombgreen
	sound_dialog_play_block pause
	cinematic_stop (BOMBbeatup, 17, 30)
	playback BombComguy COMGUYfiring
	chr_envanim 0 KonBomBox01
	chr_animate 0 KONOKOlev3_bomber
	cm_interpolate BomberCam06 0
	sleep 195
	cm_anim both BomberCam07
	chr_envanim Tower_MB_1 BomberBox03 norotation
	sleep 110
	chr_animate Tower_MB_1 BOMBlev3_fall1 100
	sleep 13
	#break tower glass here
	#env_show 776 1

	sound_impulse_play glass_big 1.0

	env_show 777 1
	env_show 778 0
	particle BomberCharge01 do explode
	cm_wait
	cm_anim both BomberCam08
	chr_envanim Tower_MB_1 BomberBox04 norotation
	chr_animate Tower_MB_1 BOMBlev3_fall2
	sleep 50
	#break atrium glass here
	particle BomberCharge02 do explode
	sleep 105
	#explode bomber here
	particle BomberExplosion create
	chr_delete BombComguy
	cm_wait
	sleep 60
	playback 0 KonBomb02
	cm_interpolate BomberCam09 0
	cinematic_start (TCTFtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play c03_12_05tctfag1
	sound_dialog_play_block pause
	cinematic_stop (TCTFtalking, 20, 20)
	# sounds of TCTF saying "uhhhh, we're not pinned down.
	#cm_reset
	#end_cutscene
	set_objective_5
	door_unlock 38
	door_unlock 41
	door_unlock 42
	door_lock 60
	door_lock 61
	particle locktower_locklight01 do start
	chr_delete BombTCTF1
	chr_delete BombTCTF2
	chr_delete BombComguy
	chr_delete 1004
	chr_delete Tower_MB_1
	playback 0 BomberKonRun01
	sleep 120
	cm_interpolate BomberCamRun01 0
	playback 0 BomberKonRun02
	cm_interpolate_block BomberCamRun02 200
	sleep 210
	#begin_cutscene
	sleep 30
	chr_nocollision 0 1
	cm_anim both ElevCam01
	chr_envanim 0 ElevBox01
	chr_animate 0 KONOKOidle1

	sound_ambient_start rl_elevator 1.0

	env_show 540 0 
	cm_wait
	end_cutscene
	cm_reset
	chr_nocollision 0 0
	obj_create 2 7
	sapper_damage_off
#	save_game_3
}


func void fallinthevat(string char)
{
  var bool eggman;

  eggman = chr_is_player(char);

  if (eggman eq 0)
  {
    chr_animate(char, KONOKOacid);
    sleep 10
    chr_set_health(char, 0);
  }

  if (eggman eq 1)
  {
    cm_detach

    sound_impulse_play konoko_gruesome_death

    chr_animate(char, KONOKOacid);
    sleep 10
    chr_set_health(char, 0);
  }
}

func void outro(void)
{
	target_set(256, 0.0)
	ai2_allpassive=1
	#begin_cutscene
	#ai2_takecontrol 1
	#ai2_movetoflag 0 257
	env_anim 2 7
	sound_ambient_start truck_driveaway
	#cm_interpolate OutroCam01 360
	sound_dialog_play c03_13_01konoko
	cinematic_start (KONintense, 180, 180, 19, 7, 15, true)
	sound_dialog_play_block pause
	cm_interpolate OutroCam01 200
	sleep 30
	cinematic_stop (KONintense, 19, 30)
	begin_cutscene
	ai2_takecontrol 1
	ai2_movetoflag 0 257
	#camera cut to van
	sound_dialog_play c03_13_02synhench1
	cinematic_start (COMGUYtalking, 180, 180, 15, 1, 20, false)
	sound_dialog_play_block pause
	sound_dialog_play c03_13_03muro
	sleep 120
	fade_out 0 0 0 60
	cinematic_start (MUROtalking, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block pause
	cinematic_stop (MUROtalking, 16, 15)
	cinematic_stop (COMGUYtalking, 15, 15)
	sleep 30
	win
}