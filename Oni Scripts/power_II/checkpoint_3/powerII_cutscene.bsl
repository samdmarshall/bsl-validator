#
#
# power_cutscene.bsl
#

func void
intro(
	void)
{
	ai2_passive ShinShin 1
	ai2_makeblind ShinShin 1
	ai2_makedeaf ShinShin 1
	chr_lock_active ShinShin
	chr_unstoppable ShinShin 1
	fade_out 0 0 0 0
	cm_interpolate IntroCam01 0
	sleep f14
	begin_cutscene
	sleep f60
	#Konoko in big space
	playback 0 IntroKonoko01

	sound_music_start mus_trt
	music_script_start

	cm_interpolate IntroCam01 0
	fade_in 60
	sleep f60
	cm_interpolate IntroCam02 300
	sleep f400
	cm_reset
	letterbox 0
	chr_nocollision ShinShin 1
	sleep f10
	playback ShinShin ShinShinSet
	end_cutscene
	sleep f90
	ai2_setmovementmode ShinShin creep
}



func void
Shin(
	void)
{
	sleep 60
	begin_cutscene
	
	sound_music_stop atm_cl09
	sound_music_start mus_xtr2 0.50

	#Shinatama sitting in chair
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_sit 1000 12
	cm_interpolate ShinCam00 120
	sleep f180
	#Konoko kneels next to Shinatama
	chr_envanim 0 ShinKonBox01 norotation
	chr_animate 0 KONOKOlev10_Kneel
	cm_anim both ShinCam01
	cm_wait
	sound_dialog_play c09_31_01konoko
	cinematic_start (KONtalking, 180, 180, 20, 9, 20, true)
	chr_envanim 0 ShinKonBox02 norotation
	chr_animate 0 KONOKOlev10_Kneeling 1000
	sound_dialog_play_block
	#Konoko kneeling next to Shinatama
	cm_interpolate ShinCam02 0
	cm_interpolate_block ShinCam03 1200
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_sit 1000
	chr_envanim 0 ShinKonBox02 norotation
	chr_animate 0 KONOKOlev10_Kneeling 1000
	sound_dialog_play c09_31_02shinatama
	cinematic_start (SHINdamaged, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block
	sound_dialog_play c09_31_03konoko
	sound_dialog_play_block
	sound_dialog_play c09_31_04shinatama
	sound_dialog_play_block
	sound_dialog_play c09_31_05konoko
	sound_dialog_play_block
	#Camera showing both of them	
	cm_interpolate ShinCamBoth01 0
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_sit 1000
	chr_envanim 0 ShinKonBox02 norotation
	chr_animate 0 KONOKOlev10_Kneeling 1000
	cm_interpolate_block ShinCam01 1500
	sound_dialog_play c09_31_06shinatama
	sound_dialog_play_block
	sound_dialog_play c09_31_07konoko
	sound_dialog_play_block
	cm_interpolate ShinCamShinNo 0
	cm_interpolate ShinCamShinNo2 900
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_sit 1000
	chr_envanim 0 ShinKonBox02 norotation
	chr_animate 0 KONOKOlev10_Kneeling 1000
	sound_dialog_play c09_31_08shinatama
	sound_dialog_play_block
	sound_dialog_play c09_31_09konoko
	sound_dialog_play_block
	cinematic_stop (KONtalking, 20, 20)
	cinematic_stop (SHINdamaged, 19, 20)
	#TCTF Griffin talking
	chr_create 1010 start
	chr_create 1011 start
	chr_create 1012 start
	ai2_spawn Honey
	ai2_passive Honey 1
	playback Honey ShinFemSet
	playback 1010 ShinCopSet
	playback 1011 ShinGrifSet
	playback 1012 ShinKerrSet
	sleep f20
	chr_animate 1010 COMGUYlev10_console1 120
	cm_interpolate ShinCamCop 0
	chr_animate_block 1010 COMGUYlev10_console2 1000
	sound_dialog_play c09_31_10scigoon3
	cinematic_start (COPtalking, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block
	cm_interpolate ShinCamGrif 1600
	sound_dialog_play c09_31_11griffin
	cinematic_start (GRIFtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block
	sound_dialog_play c09_31_12scigoon1
	sound_dialog_play_block
	cinematic_stop (COPtalking, 16, 20)
	cm_interpolate ShinCamKerrFace 0
	sound_dialog_play c09_31_13kerr
	cinematic_start (KERRtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block
	cinematic_stop (KERRtalking, 20, 20)
	cm_interpolate ShinCamGrifFace 0
	sound_dialog_play c09_31_14griffin
	sound_dialog_play_block
	cm_interpolate ShinCamCopFace 2400
	sound_dialog_play c09_31_15scigoonwom
	cinematic_start (CIVIL4talking, 180, 180, 15, 1, 20, true)
	sound_dialog_play_block
	cinematic_stop (CIVIL4talking, 15, 20)
	cm_interpolate ShinCamKerrFace 0
	sound_dialog_play c09_31_16kerr
	cinematic_start (KERRtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block
	cm_interpolate ShinCamGrif 0
	cm_interpolate_block ShinCamGrif02 1200
	sound_dialog_play c09_31_17griffin
	cinematic_stop (GRIFtalking, 19, 20)
	cinematic_start (GRIFtalkangry, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block
	cinematic_stop (KERRtalking, 20, 20)
	cinematic_stop (GRIFtalkangry, 19, 20)
	#Shinatama tenses up
	playback 0 ShinKonokoSet
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_sit 1000
	chr_envanim 0 ShinKonBox02 norotation
	chr_animate 0 KONOKOlev10_Kneeling 1000
	cm_interpolate ShinCamShinNo2 0
	cm_interpolate_block ShinCamShinNo 800
	sleep f60
	chr_animate ShinShin SHINATlev10_SitSpaz 60
	cutscene_sync mark
	sound_ambient_start c05_46_24shinwake
	sleep f60
	chr_animate ShinShin SHINATlev10_Sit2 200
	sound_dialog_play c09_31_18konoko
	cinematic_start (KONtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block
	#Konoko asks what's wrong
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_Sit2 1000
	chr_envanim 0 ShinKonBox02 norotation
	chr_animate 0 KONOKOlev10_Kneeling 1000
	cm_interpolate ShinCamKonNo3 0
	#Shinatama says to get the flock out of there
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_Sit2 1000
	chr_envanim 0 ShinKonBox02 norotation
	chr_animate 0 KONOKOlev10_Kneeling 1000
	cm_interpolate ShinCamShinNo 800
	sound_dialog_play c09_31_19shinatama
	cinematic_start (SHINdamaged, 180, 180, 19, 7, 20, false)
	cm_interpolate ShinCamKonNo 0
	#I can't delay it much longer
	cm_interpolate ShinCamShinNo3 2000
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_Sit2 1000
	sound_dialog_play c09_31_21shinatama
	sound_dialog_play_block
	#KONOKO I won't leave you
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_Sit2 1000
	chr_animate 0 KONOKOlev10_Kneeling 1000
	sound_dialog_play c09_31_22konoko
	sound_dialog_play_block
	#bye Konoko
	cm_interpolate ShinCamShinNo3 0
	chr_envanim 0 ShinKonBox02 norotation
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_Sit2 1000
	sound_dialog_play c09_31_23shinatama
	sound_dialog_play_block
	#KONOKO says no
	chr_animate 0 KONOKOlev10_Kneeling 1000
	sound_dialog_play c09_31_24konoko
	sound_dialog_play_block
	chr_envanim ShinShin ShinBox01 norotation
	chr_animate ShinShin SHINATlev10_Sit2 1000
	sound_dialog_play c09_31_25shinatama
	sound_dialog_play_block
	cinematic_stop (SHINdamaged, 19, 20)
	#goodbye shinatama
	chr_envanim 0 ShinKonBox04 norotation
	chr_animate 0 KONOKOlev10_Kneel_end
	sleep f30
	cm_interpolate ShinCamKonNo 180
	sleep f30
	playback 0 ShinKonokoSet
	sleep f70
	sound_dialog_play c09_31_26konoko
	sound_dialog_play_block
	cinematic_stop (KONtalking, 20, 20)

	sound_music_volume mus_xtr2 0.0 5.0
	sound_music_start atm_cl10 0.0
	sound_music_volume atm_cl10 1.0 5.0
	sound_music_stop mus_xtr2

	set_objective_2	

	cm_reset
	end_cutscene
	chr_delete 1010
	chr_delete 1011
	chr_delete 1012
	chr_delete Honey	
#	START TIMER (added by wu)

	particle blast1_locklight01 do stop
	particle blast2_locklight01 do stop
	door_lock 1
	door_lock 2

	door_unlock 3
	particle Shindoor_locklight01 do start
	ai2_spawn A2_sb04
	sound_dialog_play c09_31_27shinatama
	sound_dialog_play_block pause
	#timer_start 30 shin_dies
	sleep f600
	sound_dialog_play c09_31_28shinatama
	sleep f600
	sound_dialog_play c09_31_29shinatama
	sleep f330
	sound_dialog_play_block pause
	sleep f15
	
	sound_music_stop atm_cl10
	cutscene_sync mark
	sound_ambient_start c06_45_04_explo
	sleep f10
	shin_dies
	#particle ShinBomb do explode
	
		
}


func void
elevator(
	void)
{
	begin_cutscene
	sleep f40
	chr_envanim 0 ElevatorKonBox01
	cm_anim both ElevatorCam01
	sleep 40
	cutscene_sync mark
	sound_ambient_start c07_21_20elevator
	cm_wait
	env_show 778 1
	env_shade 778 778 .3 .3 .3
	playback 0 ElevatorTop
	cm_reset
	end_cutscene
}

func void
temp(
	void)
{
	chr_envanim 0 ShinKonBox04 norotation
	chr_animate 0 KONOKOlev10_Kneeling 1000
	sleep f40
	chr_animate 0 KONOKOlev10_Kneel_end
}

func void
outro(
	void)
{
	# if you didn't disable the console, we still need to kill that music
	sound_music_volume mus_amasian 0.0 2.0
	sound_music_stop mus_amasian

	final_cutscene_trumps_particles

	begin_cutscene
	chr_delete F_r40
	
	sound_music_volume atm_cl11 0.0 1.0
	sound_music_start mus_lz 1.0
	sound_music_stop atm_cl11

	particle pipe3 kill
	
	cm_interpolate OutroCamEnter01 0
	cm_interpolate_block OutroCamEnter02 500
	ai2_spawn TCTF1053
	ai2_spawn TCTF1054
	ai2_spawn TCTF1051
	ai2_spawn TCTF1052
	chr_lock_active 1051
	chr_lock_active 1052
	chr_lock_active 1053
	chr_lock_active 1054
	#ai2_passive 1053 1
	#ai2_passive 1054 1
	#ai2_makeblind 1053 1
	#ai2_makeblind 1054 1
	playback TCTF1053 OutroLiteEnter
	sleep f30
	playback TCTF1054 OutroLiteEnter
	sleep f60
	playback TCTF1051 OutroSwatEnter
	sleep f30
	chr_nocollision TCTF1052 1
	playback TCTF1052 OutroSwatEnter
	sleep f180
	chr_nocollision TCTF1052 0
	#TCTF says I know How to Stop Her
	playback 0 OutroKonokoRun
	cm_interpolate OutroCamBooth01 0
	sleep f5
	cm_interpolate OutroCamBooth02 400
	#chr_create 1053 start
	#chr_create 1054 start
	playback TCTF1053 OutroTCTF3Set
	playback TCTF1054 OutroTCTF4Set
	sleep f60
	#chr_create 1051 start
	#chr_create 1052 start
	playback TCTF1051 OutroTCTF1Enter
	playback TCTF1052 OutroTCTF2Enter
	sleep f380
	#TCTF Guys hit the fan
	cm_interpolate OutroCamBooth03 0
	sleep f20
	sound_dialog_play c09_32_03tctf
	cinematic_start (TCTFtalking, 180, 180, 15, 1, 15, false)
	sleep 240
	chr_animate TCTF1054 COMGUYlev10_console
	sleep f60
	#sound_ambient_start console
	sleep f30
	cinematic_stop (TCTFtalking, 15, 25)
	#Konoko stops in front as fan starts
	playback 0 OutroKonokoStop
	sleep f70
	cm_anim both OutroCam01
	env_anim 81 82
	cutscene_sync mark
	sound_ambient_start c14_14_26_basic
	sound_ambient_start c14_42_09_effectsa
	sleep f300
	#TCTF guys run towards the Fan and then Stop
	playback TCTF1051 OutroTCTFTurn
	playback TCTF1052 OutroTCTF2Turn
	sleep f120
	cm_interpolate OutroCamTurn01 0
	env_setanim 81 FanHub02
	env_setanim 82 FanBlade02
	cm_interpolate_block OutroCamTurn02 180
	sleep f240
	#Those Dudes run away 
	particle OutroWind do start
	playback TCTF1051 OutroTCTF2Flee
	playback TCTF1052 OutroTCTFBlown
	chr_envanim 0 OutroKonBox01 norotation
	chr_animate 0 KONOKOlev10_Blown01
	cm_interpolate OutroCamBlow01 0
	cm_interpolate_block OutroCamBlow02 240
	sleep f100
	cutscene_sync mark
	sound_ambient_start c14_30_15_wind
	sleep f130
	chr_animate TCTF1052 TCTFlev10_Blown 240 8
	sleep f235
	#Konoko starts to get blown away
	sleep f2
	cm_anim both OutroCamBlown
	chr_envanim 0 OutroKonBox01 norotation
	chr_animate 0 KONOKOlev10_Blown01
	#Konoko Grabs handrail, tctf flies into fan
	cm_wait
	chr_envanim 0 OutroKonBox02 norotation
	chr_animate 0 KONOKOlev10_Grab
	chr_envanim TCTF1052 OutroTCTFBox01
	chr_animate TCTF1052 STRIKEjump_flail 340
	cm_anim both OutroCamGrab
	#Konoko work her way up rail
	cm_wait
	cutscene_sync mark
	sound_ambient_start c14_42_09_effectsb
	chr_set_health TCTF1052 0
	chr_envanim 0 OutroKonBox05 norotation
	chr_animate 0 KONOKOlev10_OutroHand
	cm_anim both OutroCamHand05
	#Konoko works her way up rail
	#cm_wait
	#chr_envanim 0 OutroKonBox06 norotation
	#chr_animate 0 KONOKOlev10_OutroHand
	#cm_anim both OutroCamHand06
	#TCTF says she got away	
	#Konoko makes it towards safety
	#cm_wait
	#chr_envanim 0 OutroKonBox07 norotation
	#chr_animate 0 KONOKOlev10_OutroHand
	#cm_anim both OutroCamHand07
	#sleep f240
	#TCTF Griffin talking
	cm_wait
	chr_create 1010 start
	chr_create 1011 start
	chr_create 1012 start
	playback 1010 ShinCopSet
	playback 1011 ShinGrifSet
	playback 1012 ShinKerrSet
	cm_interpolate ShinCamGrifFace 0
	sound_ambient_volume c14_14_26_basic 0 .5
	sound_ambient_volume c14_30_15_wind 0 .5
	sleep f20
	sound_ambient_stop c14_14_26_basic
	sound_ambient_stop c14_30_15_wind
	sound_dialog_play c09_33_01griffin
	cinematic_start (GRIFtalking, 180, 180, 19, 7, 20, false)
	#chr_animate 1010 COMGUYlev10_console1 120
	sound_dialog_play_block
	cm_interpolate ShinCamCop 0
	cm_interpolate_block ShinCamCopFace 2000
	chr_animate 1010 COMGUYlev10_console2 1500

	sound_music_volume mus_lz 0.65 2.0

	sound_dialog_play c09_33_02scigoon1
	cinematic_start (COPtalking, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block
	sound_dialog_play c09_33_03griffin
	sound_dialog_play_block
	sound_dialog_play c09_33_04scigoon1
	sound_dialog_play_block
	cinematic_stop (COPtalking, 16, 20)
	sound_dialog_play c09_33_05griffin
	sound_dialog_play_block
	cm_interpolate ShinCamKerrFace 0
	sound_dialog_play c09_33_06kerr
	cinematic_start (KERRtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block
	cinematic_stop (KERRtalking, 20, 20)
	cm_interpolate ShinCamGrifFace 0
	sound_dialog_play c09_33_07griffin
	sound_dialog_play_block
	sound_dialog_play c09_33_09griffin
	sound_dialog_play_block
	sleep 30
	#Konoko overhears that she's rogue
	playback 0 OutroKonokoWatch
	chr_animate 0 KONOKOwatch_radio 400
	sound_ambient_start c14_30_15_wind
	cm_interpolate OutroCamWatch01 0
	cm_interpolate_block OutroCamWatch02 300
	sound_dialog_play c09_33_09agriffin
	sound_dialog_play_block
	cinematic_stop (GRIFtalking, 19, 20)

	sound_music_volume mus_lz 1.0 1.0

	chr_animate 0 KONOKOlev10_watch_run 60
	sleep f60
	fade_out 0 0 0 120
	sound_ambient_volume c14_30_15_wind 0 2
	sleep f120
	sound_ambient_stop c14_30_15_wind
	end_cutscene
	win
}



func void splash(string character)
{
  var bool eggman;

  eggman = chr_is_player(character);

  if (eggman eq 0)
  {
    chr_animate(character, KONOKOacid);
    sleep f10
    chr_set_health(character, 0);
  }

  if (eggman eq 1)
  {
    	cm_detach
    	chr_animate(character, KONOKOacid);
	sleep f10
	sound_impulse_play konoko_gruesome_death
	chr_set_health(character, 0);
  }
}

func void
detachcam(
	void)
{
	#cm_detach
}

