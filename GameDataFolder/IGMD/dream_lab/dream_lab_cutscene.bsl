#
# dreamlab_cutscene.bsl
#

func void stop_xtr2_in_15(void)
{
	sleep 720
	sound_music_stop mus_xtr2
}


func void
intro(
	void)
{
	fade_out 0 0 0 0
	obj_create 131 132
	cm_interpolate IntroCamOpen 0
	sleep f14
	begin_cutscene
	env_show 231 0
	env_show 232 0
	sleep f90
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev13_Sit 8000
	cm_interpolate IntroCamOpen 0
	fade_in 120
	sleep f180
	#Konoko opens up laptop
	cm_anim both IntroCamOpen
	sound_dialog_play c12_42_01konoko
	
	sound_music_start atm_cl16 0.75

	sleep f285
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev13_Open
	env_anim 131 132
	#Konoko puts in disk
	cm_wait
	obj_create 481 481
	cm_anim both IntroCamDisk
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev13_Disk
	env_anim 481 481
	sleep f83
	obj_kill 481 481
	cm_wait
	#Konoko reads
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev13_Sit 8000
	cm_anim both ImageCam01
	sound_dialog_play c12_43_01hasegawa
	sleep f120
	obj_create 101 107
	env_anim 101 101
	sleep f60
	fadefog
	sound_dialog_play_block pause
	sound_dialog_play c12_43_02hasegawa
	sound_dialog_play_block pause
	sleep f15
	sound_dialog_play c12_43_03hasegawa
	env_anim 102 102
	sound_dialog_play_block pause
	sleep f15
	sound_dialog_play c12_43_04hasegawa
	env_anim 103 103
	obj_kill 101 101
	sound_dialog_play_block pause
	sleep f15
	sound_dialog_play c12_43_05hasegawa
	sound_dialog_play_block pause
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev13_Sit 8000
	env_anim 104 104
	sleep f90
	sound_dialog_play c12_43_06hasegawa
	sound_dialog_play_block pause
	sleep f60
	sound_dialog_play c12_43_07hasegawa

	sound_music_volume atm_cl16 0.0 6.0
	sound_music_start atm_cl05 0.1
	sound_music_volume atm_cl05 0.5 6.0

	obj_kill 102 102
	sound_dialog_play_block pause
	sleep f15
	env_anim 105 105
	sleep f50
	sound_dialog_play c12_43_08hasegawa
	obj_kill 103 103
	sound_dialog_play_block pause
	sleep f45
	sound_dialog_play c12_43_09hasegawa
	env_anim 106 106
	obj_kill 104 104
	sound_dialog_play_block pause
	sleep f60
	sound_dialog_play c12_43_10hasegawa
	env_anim 107 107
	obj_kill 105 105
	sound_dialog_play_block pause
	sleep f120
	#put gunshot and sobbing in here

	sound_ambient_start gunshot
	sound_music_stop atm_cl16
	sound_music_volume atm_cl05 0.0 0.25

	sleep 120
	
	sound_music_stop atm_cl05
	sound_music_start mus_xtr2 0.6

	sleep 120
	#sound_dialog_play hasegawa_cry
	#sound_dialog_play_block pause
	#sleep f90
	#Konoko reads more
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev13_Sit 8000
	cm_interpolate IntroCamHighLeft 0
	cm_interpolate_block IntroCamHighRight 1000
	fork stop_xtr2_in_15
	sound_dialog_play c12_43_11hasegawa
	sound_dialog_play_block pause
	#camera pans to see wall missing and Konoko looks up
	env_show 200 0
	env_show 227 0
	env_show 201 0
	env_show 999 0
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev13_Sit 8000
	cm_interpolate IntroCamLowLeft 0
	obj_kill 106 106
	obj_kill 107 107
	gl_fog_end=1
	gl_fog_start=.975
	cm_interpolate_block IntroCamLook 800
	sound_dialog_play c12_44_01konoko

	particle fog_floor1 do start
	
	sleep f360

	ai2_spawn IntroMuro
	chr_lock_active IntroMuro
	ai2_passive IntroMuro 1
	playback IntroMuro IntroMuroEnter
	chr_nocollision IntroMuro 1
	sound_dialog_play_block pause
	cinematic_start (MUROevilgrin, 180, 180, 15, 1, 20, false)
		
	sound_music_start mus_om01 .75
	
	sound_dialog_play c12_44_02muro
	chr_animate 0 KONOKOlev13_Look
	sleep f75
	#Konoko gets up
	chr_envanim 0 IntroKonBox02 norotation
	chr_animate 0 KONOKOlev13_Getup
	cm_anim both IntroCamGetup
	sound_dialog_play_block pause
	sleep f60
	sound_dialog_play c12_44_03konoko
	cinematic_start (KONlistening, 180, 180, 20, 9, 20, true)
	cm_wait
	#Camera pans to show Konoko from behind
	env_show 231 1
	env_show 232 1
	obj_kill 131 132
	playback 0 IntroKonokoSet
	cm_interpolate IntroCamDoor01 0
	cm_interpolate_block IntroCamDoor02 180
	sound_dialog_play_block pause
	sound_dialog_play c12_44_04muro
	sleep f240
	cinematic_stop (KONlistening, 20, 20)
	cinematic_stop (MUROevilgrin, 15, 20)
	#gameplay resumes
	cm_reset
	end_cutscene
	ai2_passive IntroMuro 1
	chr_nocollision IntroMuro 0

	save_point_1
}



func void
murodeath(
	void)
{
	dprint WE_KILLED_MURO

	env_show 999 0
	env_show 1010 0
	gs_farclipplane_set 2000

	# ensure that muro doesn't get knocked out of his "death" anim
	chr_unstoppable IntroMuro 1

	chr_animate IntroMuro COMCOMlev13_death 120
	gl_fog_start_changeto .995 30
	sleep f24
	chr_delete IntroMuro

	sound_music_volume mus_om01 0.0 1.0
	sound_music_start atm_gr09 0.75

	objective_set(1)

	sleep 60
	sound_music_stop mus_om01
}


func void
griffindeath(
	void)
{
	# ensure that griffin doesn't get knocked out of his "death" anim
	chr_unstoppable griffin 1

	chr_animate griffin COMCOMlev13_death 120
	sleep f20
	chr_delete griffin
	door_unlock 3
}

func void
fadefog(
	void)
{
	gl_fog_start_changeto .8 45
}


func void
murofog(
	void)
{
	ai2_passive IntroMuro 0
	env_show 201 1
	env_show 999 1
	env_show 250 0
	env_show 252 0
	gl_fog_start_changeto .95 12
	sleep f12
	gs_farclipplane_set 75
}	





func void
Griffin01(
	void)
{
	begin_cutscene
	door_lock 2
	chr_lock_active griffin
	playback griffin GrifGriffinSet
	cm_interpolate GrifCamGriffin 200
	#griffin talks
	sleep f120
	sound_dialog_play c12_45_01griffin
	cinematic_start (GRIFtalkangry, 180, 180, 16, 3, 20, true)
	playback 0 GrifKonokoSet
	sound_dialog_play_block pause
	cm_interpolate GrifCamKonoko01 0
	cm_interpolate_block GrifCamKonoko02 800
	sound_dialog_play c12_45_02konoko
	cinematic_start (KONintense, 180, 180, 19, 7, 20, true)
	sound_dialog_play_block pause
	sound_dialog_play c12_45_03griffin
	sound_dialog_play_block pause
	cm_interpolate GrifCamBoth01 0
	cm_interpolate_block GrifCamBoth02 800
	sound_dialog_play c12_45_04konoko
	sound_dialog_play_block pause
	sound_dialog_play c12_45_05griffin
	sound_dialog_play_block pause
	cinematic_stop (KONintense, 20, 20)
	cinematic_stop (GRIFtalkangry, 15, 20)
	cm_reset
	end_cutscene
	save_point_2
}

func void
Konoko01(
	void)
{
	begin_cutscene weapon
	chr_lock_active evilkonoko
	playback evilkonoko KonKonoko01Set
	cm_interpolate KonCamKon01 200
	#griffin talks
	sleep f120
	sound_dialog_play c12_46_01badasskon
	cinematic_start (KONevil, 180, 180, 15, 1, 20, true)
	playback 0 KonKonokoSet
	sound_dialog_play_block pause
	cm_interpolate KonCamBoth01 0
	cm_interpolate_block KonCamBoth02 1000
	sound_dialog_play c12_46_02konoko
	cinematic_start (KONintense, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause
	sound_dialog_play c12_46_03badasskon
	sound_dialog_play_block pause
	sound_dialog_play c12_46_04konoko
	sound_dialog_play_block pause
	sound_dialog_play c12_46_05badasskon
	sound_dialog_play_block pause
	sound_dialog_play c12_46_06konoko
	sound_dialog_play_block pause
	sound_dialog_play c12_46_07badasskon
	cinematic_stop (KONintense, 20, 20)
	sound_dialog_play_block pause
	cinematic_stop (KONevil, 15, 20)
	cm_reset
	chr_animate evilkonoko KONOKOpowerup 0
	chr_set_health evilkonoko 400
	sleep f245
	end_cutscene
	env_show 250 1
	env_show 252 1
}

func void
Konoko02(
	void)
{
	begin_cutscene
	chr_lock_active evilkonoko
	playback evilkonoko Kon2Konoko02Set
	cm_interpolate Kon2CamKon201 140
	sleep f120
	cm_interpolate Kon2CamKon202 180	
	#griffin talks
	sleep f120
	sound_dialog_play c12_46_01badasskon
	cinematic_start (KONevil, 180, 180, 15, 1, 20, true)
	playback 0 Kon2KonokoSet
	sound_dialog_play_block pause
	cm_interpolate Kon2Both01 0
	cm_interpolate_block Kon2Both02 1000
	sound_dialog_play c12_46_02konoko
	cinematic_start (KONintense, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause
	sound_dialog_play c12_46_03badasskon
	sound_dialog_play_block pause
	sound_dialog_play c12_46_04konoko
	sound_dialog_play_block pause
	sound_dialog_play c12_46_05badasskon
	sound_dialog_play_block pause
	sound_dialog_play c12_46_06konoko
	sound_dialog_play_block pause
	sound_dialog_play c12_46_07badasskon
	cinematic_stop (KONintense, 20, 20)
	sound_dialog_play_block pause
	cinematic_stop (KONevil, 15, 20)
	cm_reset
	chr_animate evilkonoko KONOKOpowerup 0
	chr_set_health evilkonoko 400
	sleep f245
	end_cutscene
}


func void
Griffin02(
	void)
{
	begin_cutscene
	chr_lock_active griffin_2
	playback griffin_2 Grif2GrifSet
	cm_interpolate Kon2CamKon201 140
	sleep f120
	cm_interpolate Kon2CamKon202 180
	#griffin talks
	sleep f120
	sound_dialog_play c12_45_01griffin
	cinematic_start (GRIFtalkangry, 180, 180, 15, 1, 20, true)
	playback 0 Kon2KonokoSet
	sound_dialog_play_block pause
	cm_interpolate Kon2Both01 0
	cm_interpolate_block Kon2Both02 1000
	sound_dialog_play c12_45_02konoko
	cinematic_start (KONintense, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause
	sound_dialog_play c12_45_03griffin
	sound_dialog_play_block pause
	sound_dialog_play c12_45_04konoko
	sound_dialog_play_block pause
	sound_dialog_play c12_45_05griffin
	sound_dialog_play_block pause
	cinematic_stop (KONintense, 20, 20)
	cinematic_stop (GRIFtalkangry, 15, 20)
	cm_reset
	end_cutscene
}


func void delay_then_play_wakeup(void)
{
	sleep 5
	sound_impulse_play konoko_wakeup

}

func void
outro(
	void)
{
	begin_cutscene
	env_show 252 1
	env_show 250 1
	env_show 200 1
	env_show 227 1
	env_show 231 0
	env_show 232 0
	fade_out 0 0 0 10
	sleep f10
	delay_then_play_wakeup
	ai2_spawn outro_konoko
	chr_envanim outro_konoko OutroKonBox01 norotation
	chr_animate outro_konoko KONOKOlev13_outro
	cm_anim both OutroCam01
	fade_in 5
	sleep f240
	fade_out 0 0 0 60
	sleep 90
	end_cutscene
	win
}