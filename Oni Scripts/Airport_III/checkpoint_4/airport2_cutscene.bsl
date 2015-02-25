#
# airportiii_cs_intro.bsl
#

func
airportiii_cs_intro
{
	begin_cutscene
	#hides VTOL object
	fade_out 0 0 0 0
	playback 0 IntroKonokoSet
	sleep f60
	fade_in 60
	sleep f60
	end_cutscene
}


func void
camcontrol(
	void)
{
	#unhides VTOL object
	obj_create 61 67
	obj_create 72 79
	#vtol takes off
	env_anim 61 67
	env_anim 72 79
	#hides Vtol gunk
	env_show 161 0
	env_show 162 0
	env_show 163 0
	env_show 164 0
	env_show 165 0
	env_show 166 0
	env_show 167 0
	env_show 172 0
	env_show 173 0
	env_show 174 0
	env_show 175 0
	env_show 176 0
	env_show 177 0
	env_show 178 0
	env_show 179 0
	sleep 500
	#Muro and Cronie in plane talking
	#chr_create 101 start
	#chr_create 102 start
	#chr_envanim 101 OutroComBip
	#chr_envanim 102 OutroMuroBip
}

func void rappel_stop_old_music(void)
{
	sound_music_stop mus_space01
}

func void
rappel(
	void)
{
	rappel_stop_old_music

	begin_cutscene
	invincible=1
	obj_create 51 52
	env_anim 51 52
	chr_animate 0 KONOKOlev6_rappel
	chr_envanim 0 RapKonBipBox01 norotation
	cm_anim both RapCam01
	sleep f250
	cutscene_sync mark
	sound_ambient_start c04_32_23_misc
	sleep f260
	dprint CAMERA_RAP_CAM_02
	cm_interpolate_block RapCam02 0
	dprint CAMERA_RAP_CAM_03
	cm_interpolate_block RapCam03 240
	sleep f45
	chr_animate 0 KONOKOlev6_tracer
	sleep f180
	obj_kill 51 51
	#camera cut to show Konoko jumping off of plane
	playback 0 RappelKonRun
	cm_interpolate RappelCamRun01 0
	cm_interpolate_block RappelCamRun02 180
	sleep f180

	#VTOL takes off
	dprint VTOL_TAKES_OFF
	sound_ambient_start c04_28_22_helic
	fork camcontrol
	cm_anim both OutCam01
	cm_wait
	chr_create 101 start
	chr_create 102 start
	chr_envanim 101 OutroComBip
	chr_envanim 102 OutroMuroBip

	cm_anim both OutCam02
	dprint INSIDE_CAM
	particle muroplane_prop do stop
	sound_ambient_start propidle_2 0.4
	playback 0 OutroKonokoSet
	sleep f60
	ai2_allpassive 1
	sound_dialog_play c06_21_01SynHench2
	cinematic_start (COMGUYtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block c06_21_02muro
	cinematic_start (MUROtalking, 180, 180, 20, 9, 20, true)	
	sleep f200
	cm_anim both OutCam03
	dprint CAMERA_OUT_CAM_03
	sound_ambient_start c04_28_22_helie 0.75
	sound_ambient_volume propidle_2 0.0 0.0
	sound_ambient_stop propidle_2
#	playback 0 OutroKonSet
	chr_delete 101
	chr_delete 102
	cm_wait
	cinematic_stop (COMGUYtalking, 19, 20)
	cinematic_stop (MUROtalking, 20, 20)
	fade_out 0 0 0 60
	sleep f60
	end_cutscene
	sleep f60
	win
}

