#
#
# power_cutscene.bsl
#

func void
intro(
	void)
{
	# CB: begin_cutscene does a silent ai2_allpassive 1 as part of its cutscene setup,
	# so we need to remove this if we want to have AIs walking around under their own
	# control during a cutscene
	fade_out 0 0 0 0
	cm_interpolate Camout01 0
	obj_create 100 104
	chr_create 1000 start
	chr_create 1001 start
	playback 1000 IntroGrifTCTF
	playback 1001 IntroKonTCTF
	sleep f7
	begin_cutscene
	cutscene_sync off 
	ai2_allpassive 0

	ai2_spawn A1_intro01
	ai2_spawn A1_intro02
	ai2_makeignoreplayer A1_intro01 1
	ai2_makeignoreplayer A1_intro02 1			
	#fade_out 0 0 0 0
	#Setup Konoko and Griffin talking			
	sleep f60

#	Force holster by Wu
	chr_forceholster char_0 1

	fade_in 120
	chr_nocollision(0, 1);
	#Setup shot
	cm_anim both Camout01
	cm_wait
	#KOnoko standing on top
	cm_anim both Camout02
	chr_envanim 0 KonBipedBox01
	chr_animate 0 KONOKOidle1 300
	env_setanim 100 StandRightWing
	env_setanim 101 StandLeftWing
	env_setanim 102 StandBody
	env_setanim 103 StandRightTail
	env_setanim 104 StandLeftTail
	#Konoko and Griffin talking
	sleep f120
	sound_dialog_play c08_27_01konoko
	cinematic_start (KONtalking, 180, 180, 15, 1, 15, false)
	sound_dialog_play_block pause
	sound_dialog_play c08_27_02griffin
	cinematic_start (GRIFtalking, 180, 180, 16, 3, 15, true)
	cm_interpolate_block IntroCamTBoth 0
	sound_dialog_play_block pause
	sound_dialog_play c08_27_03konoko
	cinematic_stop (KONtalking, 15, 20)
	cinematic_start (KONintense, 180, 180, 15, 1, 20, false)
	sound_dialog_play_block pause
	sound_dialog_play c08_27_04griffin
	sound_dialog_play_block pause
	sound_dialog_play c08_27_05konoko
	sound_dialog_play_block pause
	cm_interpolate_block IntroCamTGrif 0
	sound_dialog_play c08_27_06griffin
	cinematic_stop (GRIFtalking, 16, 20)
	cinematic_start (GRIFtalkangry, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block pause
	cm_interpolate IntroCamTKon 0

	# start the wind as the dialog ends, sync to that
	cutscene_sync on
	sound_dialog_play c08_27_07konoko
	cinematic_stop (GRIFtalkangry, 16, 20)
	cinematic_stop (KONintense, 15, 20)
	cinematic_start (KONangry, 180, 180, 15, 1, 20, false)
	sleep 200
	sound_ambient_start pp_wind_loop 0.1
	sound_ambient_volume pp_wind_loop 0.8 1.0
	sleep 50
	cutscene_sync off
	#Jumping off the building
	chr_envanim 0 KonBipedBox02 norotation
	cm_anim both Camout03
	#sound_ambient_start pp09_wingsa
	chr_animate 0 KONOKOlev9_intro_jump
	env_setanim 100 JumpRightWing
	env_setanim 101 JumpLeftWing
	env_setanim 102 JumpBody
	env_setanim 103 JumpRightTail
	env_setanim 104 JumpLeftTail
	sleep f120
	sound_ambient_start pp09_wingsa
#	october 25, 2000 this pause was breaking the scene
#	sound_dialog_play_block pause
	cinematic_stop (KONangry, 15, 20)
	#sleep f100	
	cm_anim_block both Camout04
	#Transport A1_intro02 to new location
	chr_teleport A1_intro02 1105
	#Gliding
	#music_intro
	sleep f100
	sound_ambient_start pp09_wingsb
	chr_envanim_block 0 KonBipedBox03
	cm_anim both Camout05
	chr_animate 0 KONOKOlev9_intro_glide 360
	env_setanim 100 GlideRightWing
	env_setanim 101 GlideLeftWing
	env_setanim 102 GlideBody
	env_setanim 103 GlideRightTail
	env_setanim 104 GlideLeftTail
	#Landing
	chr_envanim_block 0 KonBipedBox04 norotation
	#gl_fog_start=.98
	#gs_farclipplane_set 2000
	cm_anim both Camout06
	chr_animate 0 KONOKOlev9_intro_land

	env_setanim 100 LandRightWing
	env_setanim 101 LandLeftWing
	env_setanim 102 LandBody
	env_setanim 103 LandRightTail
	env_setanim 104 LandLeftTail
	sleep 30
	sound_ambient_volume pp_wind_loop 0.0 1.0
	sleep 60
	sound_ambient_stop pp_wind_loop
	sound_ambient_start pp09_wingsc
	cm_wait
	playback 0 IntroKonokoSet01
	obj_kill 100 104
	sleep f5
	cm_reset
	chr_nocollision 0 0
	end_cutscene
	env_show 100 1
	env_show 101 1
	env_show 102 1
	env_show 103 1
	env_show 104 1
	chr_delete ai_12
	chr_delete ai_13
	chr_delete 1000
	chr_delete 1001
	ai2_makeignoreplayer A1_intro01 0
	ai2_makeignoreplayer A1_intro02 0
	#Transport A1_intro02 to new location again
	chr_teleport A1_intro02 1104
	s1
	music_intro
	music_intro_timer
}

func void
camcontrol(
	void)
{
	cm_anim both Camout01
	cm_anim both Camout02
	cm_anim both Camout03
	cm_anim both Camout04
	cm_anim both Camout05
	cm_anim both Camout06
	cm_wait
	letterbox 0
	cm_jello 1
	cm_reset
	chr_nocollision 0 0
	input 1
}

func void
Muro(
	void)
{
	begin_cutscene

	sound_music_start mus_sad1 0.1
	sound_music_volume mus_sad1 0.3 2

	cutscene_sync off
	sleep f10
	cm_anim both Elev1Cam01
	playback 0 Elev1KonokoSet01
	cutscene_sync on
	sound_ambient_start c12_20_16elevator
	sleep f5
	chr_nocollision 0 1
	chr_envanim 0 Elev1KonBox01 norotation
	obj_create 801 801
	obj_shade 801 801 .4 .4 .4
	env_show 801 0
	env_setanim 801 Elev101
	sleep 200

	#Shinatama crying here

	sound_dialog_play c08_28_05shinscream1
	sound_music_volume mus_sad1 1.0 0.5

	cinematic_start (SHINtortured, 180, 180, 20, 7, 15, false)

	sleep 60
	sound_music_volume mus_sad1 0.8 0.5	
	sleep 100

	fade_out 0 0 0 10
	sleep f10
	#Muro torturing shinatama
	fade_in 10
	particle torture do start
	ai2_spawn MuroMuro
	ai2_spawn MuroShinatama
	ai2_spawn MuroComguy
	playback MuroMuro MuroMuroSet
	playback MuroComguy MuroComguySet

	sound_dialog_play c08_28_06shinscream2

	chr_envanim MuroShinatama ShinBox02 norotation
	chr_animate MuroShinatama SHINATlev9_Shin02 180
	cutscene_sync off
	cm_interpolate MuroCamShin02 0
	sound_ambient_start c12_26_20shin_tort
	cm_interpolate_block MuroCamShin01 800
	sleep f120
	chr_envanim MuroShinatama ShinBox03 norotation
	chr_animate MuroShinatama SHINATlev9_Shin03 12
	sleep f12
	particle torture do stop
	chr_envanim MuroShinatama ShinBox04 norotation
	chr_animate MuroShinatama SHINATlev9_Shin04 1000 12
	sound_dialog_play_block pause
	cinematic_stop (SHINtortured, 19,20)
	##Muro talks
	sound_dialog_play c08_28_01muro
	cinematic_start (MUROtalking, 180, 180, 16, 3, 15, true)
	cm_interpolate MuroCamMuro 0
	sound_dialog_play_block pause
	##Shin screams
	particle torture do start
	sound_ambient_start c12_26_20shin_torta
	#chr_envanim MuroShinatama ShinBox01 norotation
	#chr_animate MuroShinatama SHINATlev9_Shin01 12
	#sleep f12
	chr_envanim MuroShinatama ShinBox02 norotation
	chr_animate MuroShinatama SHINATlev9_Shin02 180

	sound_dialog_play shinscream_new

	cinematic_start (SHINtortured, 180, 180, 19, 20, 10, false)
	sleep f130
	particle torture do stop
	chr_envanim MuroShinatama ShinBox04 norotation
	chr_animate MuroShinatama SHINATlev9_Shin04 1200 10
	sleep f30
	##Muro talks again
	cm_interpolate MuroCamMuro01 0
	cm_interpolate_block MuroCamMuro02 1400
	sound_dialog_play c08_28_02muro
	cinematic_stop (SHINtortured, 18,20)
	sound_dialog_play_block pause
	sleep f10
	particle torture do start
	sound_ambient_start c12_26_20shin_torta

	sound_dialog_play shinscream_new2

	sound_dialog_play_block pause
	particle torture do stop
	sleep f10
	sound_dialog_play c08_28_03muro
	sound_dialog_play_block pause
	chr_envanim MuroShinatama ShinBox04 norotation
	chr_animate MuroShinatama SHINATlev9_Shin04 1200 10
	sleep f5

	sound_dialog_play shinscreams_6

	sound_dialog_play_block pause
	sound_dialog_play c08_28_04muro
	sound_dialog_play_block pause
	cinematic_stop (MUROtalking, 16,15)

	sound_dialog_play muro_laff2

	sleep f80
	particle torture do start
	sound_ambient_start c12_26_20shin_torta
	sleep f15

	sound_dialog_play_interrupt shinscreams_4

	cinematic_start (SHINtortured, 180, 180, 20, 19, 10, false)
	sleep f20
	fade_out 0 0 0 10
	sleep f10
	particle torture do stop
	fade_in 10
	#Konoko finishes riding elevator
	chr_envanim 0 Elev1KonBox02 norotation
	env_setanim 801 Elev102
	cm_anim both Elev1Cam02
	sound_ambient_start c13_07_22elevatora 
	sleep f295
	env_show 802 1
	obj_kill 801 801
	cm_reset
	playback 0 Elev1KonokoSet
	sleep f1
	chr_nocollision 0 0
	end_cutscene

	chr_delete MuroComguy
	chr_delete MuroMuro
	chr_delete MuroShinatama
}



func void
Elev2(
	void)
{
	begin_cutscene
	sleep f30
	cutscene_sync off
	chr_nocollision 0 1
	playback 0 Elev2KonokoSet
	cm_anim both Elev2Cam01
	cutscene_sync on
	sound_ambient_start c13_07_22elevator
	chr_envanim 0 Elev2KonBox01
	env_show 821 0
	obj_create 821 821
	obj_shade 821 821 .4 .4 .4
	env_setanim 821 Elev201
	cm_wait
	obj_kill 821 821
	env_show 822 1
	chr_nocollision 0 0
	cm_reset
	end_cutscene
}



func void
Torture(
	void)
{
	#input 0
	cm_interpolate TortureCam01 80
	sleep f180
	cm_reset 80
	#input 1
}


func void
outro(
	void)
{
	sleep f30
	begin_cutscene jello
	cutscene_sync off
	#oni SPECcial effect
	chr_animate 0 KONOKOpowerup
	cinematic_start (KONtransform, 180, 180, 15, 2, 15, false)
	sleep f220
	fade_out 0 0 0 10
	sleep f10
	fade_in 10
	ai2_spawn OutroKerr
	ai2_spawn OutroGrif
	ai2_spawn OutroCop
	playback OutroCop ShinCopSet
	playback OutroGrif ShinGrifSet
	playback OutroKerr ShinKerrSet
	cinematic_stop (KONtransform, 16, 30)
	cm_interpolate ShinCamCop 0
	cm_interpolate_block ShinCamCopFace 1600
	sleep f20
	sound_dialog_play c08_29_01scigoon1
	cinematic_start (COPtalking, 180, 180, 16, 3, 20, false)
	sound_dialog_play_block pause
	cinematic_stop (COPtalking, 16, 20)
	cm_interpolate ShinCamGrif 0
	cm_interpolate_block ShinCamGrifFace 1800
	sound_dialog_play c08_29_02griffin
	cinematic_start (GRIFtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block pause
	sleep f20
	playback 0 OutroKonoko01
	cinematic_stop (GRIFtalking, 19, 20)
	fade_out 0 0 0 10
	sleep f10
	fade_in 10
	#doors start to open
	obj_create 131 133
	env_anim 131 133
	env_show 134 0
	env_show 135 0
	env_show 136 0
	cm_interpolate OutroCam01 0
	cutscene_sync on
	sound_ambient_start c03_55_18bigdoor
	cm_interpolate_block OutroCam02 700
	sleep f200
	playback 0 OutroKonoko02
	sleep f200
	#Konoko sees doors opening
	#playback 0 OutroKonoko02
	cm_interpolate OutroCam03 0
	sleep f90
	#playback 0 OutroKonoko02
	sleep f40
	cm_interpolate OutroCam04 0
	sleep f180
	fade_out 0 0 0 120
	sleep f120
	win
}

