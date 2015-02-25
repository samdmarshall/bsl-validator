#
#
# roof_cutscene.bsl
#

func void intro_roll_sounds(void)
{
	sleep 252
	sound_impulse_play kon_roll
	sleep 3
	sound_impulse_play kon_roll
}

func void
intro_taunt(
	void)
{
	chr_envanim_stop IntroNinja
	chr_teleport IntroNinja 600
	chr_facetoflag IntroNinja 600
	chr_animate IntroNinja NINCOMcrouch_idle

	ai2_passive IntroNinja 1
	ai2_setmovementmode IntroNinja creep
	sleep f40
	playback_block IntroNinja IntroNinja
	ai2_passive IntroNinja 0

	ai2_attack IntroNinja 0
}

func void
intro(
	void)
{
	fade_out 0 0 0 0
	cm_interpolate IntroCam01 0
	sleep 14
	begin_cutscene
	ai2_spawn IntroNinja
	#sound_ambient_start c08_11_19zip
	sleep 30
	fade_in 120
	obj_create 81 81
	env_anim 81 81
	cm_anim both IntroCam01
	chr_envanim 0 IntroKonBip01 norotation
	chr_animate 0 KONOKOlev12_Intro
	chr_envanim IntroNinja IntroNinBip01 norotation
	chr_animate IntroNinja NINJAlev12_Intro
	fork intro_roll_sounds
	sleep f30
	sound_ambient_start c08_11_19zip
	cm_anim_block both IntroCam02
	cm_wait
	cm_reset
	playback 0 IntroKonoko
	done_with_intro_cutscene = 1;
	trigvolume_reset death_fall_trigger_67
	end_cutscene
	fork intro_taunt
	s1
}

func void
camcontrol(
	void)
{
	cm_anim both IntroCam01
	cm_anim_block both IntroCam02
	cm_wait
}



func void
Elevator(
	void)
{
	begin_cutscene
	sleep 10
	# "It's strange, I can almost feel him out there, creeping from shadow to shadow..."
	sound_dialog_play c11_39_02konoko
	playback 0 ElevatorKonokoSet
	cm_interpolate ElevatorCam01 0
	sleep 10
	chr_envanim 0 ElevatorKonBox01
	obj_create 31 31
	obj_shade 31 31 .4 .4 .4
	env_anim 31 31
	sound_ambient_start first_elevator
	cm_anim both ElevatorCam01
	sleep 220
	obj_kill 31 31
	env_show 31 1
	cm_reset
	sleep 10
	end_cutscene
}




func void
NinjaZip(
	void)
{
	chr_envanim NinjaZip ZipNinjaBipBox norotation
	chr_animate NinjaZip NINJAlev12_zip
	obj_create 72 72
	env_anim 72 72
	sleep 60
	playback E_N14 Ninja02Jump
	sleep 80
	ai2_passive E_N14 0
	sleep 100
	playback NinjaZip NinjaZipLeave
	sleep 120
	chr_delete NinjaZip
}

func void
KonokoZip(
	void)
{
	particle obj_zip kill
	begin_cutscene
	sleep 10
	cm_anim both KonZipCam01
	chr_envanim 0 ZipKonBipBox norotation
	chr_animate 0 KONOKOlev12_zip
	obj_create 71 71
	env_anim 71 71
	sleep 55
	sound_ambient_start c08_11_19zip
	sleep 235

	# CB: kill ninja's zip so we don't get Z fighting on superposed objects
	obj_kill 72 72

	cm_reset
	end_cutscene
}

func void pretty_sayline(void)
{
	sleep 180
	# "I'm backing him into a corner. This isn't going to be pretty."
	sound_dialog_play c11_39_09konoko
	sound_dialog_play_block pause
	sleep 30
	door_open 2
	door_jam 2
}

func void
ninja(
	void)
{
	begin_cutscene
	sleep 10
	fork pretty_sayline
	fork storm
	ai2_spawn OutroNinja
	chr_boss_shield OutroNinja
	ai2_allpassive 1
	playback OutroNinja SuperNinjaSet
	chr_nocollision OutroNinja 1
	#konokoenters elevator
	#cm_interpolate SuperCam00 0
	#playback 0 SuperKonokoEnter
	chr_envanim 0 SuperKonBox01
	gs_farclipplane_set 500
	obj_create 41 41
	obj_shade 41 41 .4 .4 .4
	env_anim 41 41
	sound_ambient_start c08_20_27elevator
	cm_anim both SuperCam00
	cm_wait
	obj_kill 41 41
	env_show 41 1
	cm_interpolate SuperNinjaCam01 180
	sleep 120
	#all you have done is force me to fight
	sound_dialog_play c11_40_01superninja
	cinematic_start (BOSS2face, 180, 180, 19, 7, 20, false)
	sleep 60
	playback 0 SuperKonokoSet
	sound_dialog_play_block pause
	#Konoko who are you
	cm_interpolate SuperCamKonokoSet 0
	door_close 2
	door_lock 2
	sound_dialog_play c11_40_02konoko
	cinematic_start (KONtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause
	cinematic_stop (KONtalking, 20, 20)
	#Super Ninja goes around
	playback OutroNinja SuperNinjaWalk
	sleep 40
	playback 0 SuperKonokoWalk
	#ninja talks
	sound_dialog_play c11_40_03superninja
	cinematic_stop (BOSS2face, 7, 0)
	cinematic_start (BOSS2face, 180, 180, 7, 9, 2, false)
	cm_interpolate SuperCamWalkOut02 0
	cm_interpolate_block SuperCamWalkOut02b 800
	sound_dialog_play_block pause
	#konoko answers
	sound_dialog_play c11_40_04konoko
	cinematic_start (KONtalking, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block pause
	cinematic_stop (KONtalking, 16, 20)
	#super ninja we writhe
	sound_dialog_play c11_40_05superninja
	#cm_interpolate_block SuperCamWalkOut02b 800
	sound_dialog_play_block pause
	cm_interpolate SuperCamWalkOut02b 800
	#Konoko says you're a thug
	sound_dialog_play c11_40_06konoko
	cinematic_start (KONangry, 180, 180, 16, 3, 20, true)
	cm_interpolate SuperCamWalkOut03 0
	cm_interpolate_block SuperCamWalkOut03b 600
	sound_dialog_play_block pause
	cinematic_stop (KONtalking, 16, 20)
	#ninja says we'll see about that
	sound_dialog_play c11_40_07superninja
	sound_dialog_play_block pause
	cinematic_stop (BOSS2face, 19, 15)
	#gameplay setup
	playback 0 SuperKonokoEnd
	cm_reset
	end_cutscene
	sleep 20
	chr_animate OutroNinja NINCOMteleport_in 47
	music_battle
	sleep 40
	playback OutroNinja SuperNinjaDone
	chr_animate OutroNinja NINCOMteleport_out 31
	chr_nocollision OutroNinja 0

	dprint SAVEDGAME4	
	save_game 4 autosave
}


func void
test(
	void)
{
	chr_envanim 0 ZipKonBipBox norotation
	sleep 120
	playback 0 IntroKonoko
}


func void
deathfall(
	void)
{
	if (done_with_intro_cutscene eq 1)
	{
		sleep 30
		cm_detach
		sleep 30
		chr_set_health 0 0
	}
}


func void
outro(
	void)
{
	sound_music_volume mus_fitec 0.0 1.0
	music_stop
	begin_cutscene
	chr_animate OutroNinja NINCOMteleport_in 31	
	sleep 10
	#spawn teleported Ninja and add some glowy bits
	chr_envanim OutroNinja OutroNinjaBox01
	chr_animate OutroNinja NINCOMteleport_out 31
	sleep 10
	cm_interpolate OutroCam01 0
	sleep 10
	chr_envanim OutroNinja OutroNinjaBox01 norotation
	chr_animate OutroNinja NINJAlev12_Outro1
	sound_ambient_start ninja_cd_scene
	cm_anim both OutroCam01
	sleep 208
	obj_create 481 481
	env_anim 481 481
	cm_interpolate OutroCamDisk 90
	chr_envanim OutroNinja OutroNinjaBox02 norotation
	chr_animate OutroNinja NINJAlev12_Outro2 900
	#Konoko patrol to flag 2000
	#chr_teleport 0 2000
	playback 0 OutroKonoko01
	sleep 100
	sleep 70
	#camera cut here to Konoko's face
	cm_interpolate OutroCam02 0
	#sleep 30
	#playback 0 OutroKonoko02
	sleep 50
	cinematic_start (KONtalking, 180, 180, 18, 6, 15, true)
	sound_dialog_play c11_41_01konoko
	sleep 300
	#camera cut here to Konoko and Ninja
	cm_interpolate OutroCam03 0
	cm_interpolate_block OutroCam04 800
	chr_envanim OutroNinja OutroNinjaBox02 norotation
	chr_animate OutroNinja NINJAlev12_Outro2 1300
	sound_dialog_play_block
	# Camera cut as Konoko steps on Ninja
	#Add sound of Konoko saying she has nothing in common
	sound_dialog_play c11_41_01bkonoko
	cinematic_stop (KONtalking, 18, 20)
	cinematic_start (KONintense, 180, 180, 18, 6, 15, true)
	cm_anim both OutroCam05
	chr_envanim 0 OutroKonBox01 norotation
	chr_animate 0 KONOKOlev12_Outro1
	chr_envanim OutroNinja OutroNinjaBox03 norotation
	chr_animate OutroNinja NINJAlev12_Outro3
	sleep 175
	sound_ambient_start c09_36_26neckbreak
	sleep 100
	#Camera cut to Konoko's face
	playback 0 OutroKonoko02
	chr_animate OutroNinja STRIKEfallen_front 540
	cm_interpolate OutroCam06 0
	sleep 60
	sound_dialog_play c11_41_02konoko
	cinematic_stop (KONintense, 18, 10)
	sleep 60
	fade_out 0 0 0 120	
	sleep 120
	win
}

