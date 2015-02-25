#
# warehouse_cutscene.bsl
#

########################
func void
Kon(
	void)
{
	cm_interpolate KonCamFoot01 0
	cm_interpolate_block KonCamFoot02 300
	sleep f260
	#cm_interpolate KonCamChest01 0
	#cm_interpolate_block KonCamChest02 180
	#sleep f120
	cm_interpolate KonCamBack01 0
	cm_interpolate_block KonCamBack02 180
	sleep f150
	cm_interpolate KonCamSide01 0
	cm_interpolate_block KonCamSide02 210
	sleep f190
	cm_interpolate KonCamFinish01
	cm_interpolate_block KonCamFinish02 200
	sleep 345
	fade_out 0 0 0 15
	sleep 15
	cm_reset
	fade_in 15
	sleep 15
}

############################

func void
animate(string me)
{
	#chr_animate me KONCOMpunch_fw
}

func void swing(void)
{
	how_far_along = 0;
	fade_out 0 0 0 30
	sleep 30
	splash_screen warehouse_splash_screen
	swing_cutscene
}

func void jumping_sounds(void)
{
	sleep 97
	# first hit on ledge
	sound_impulse_play kon_land_con
}

func void
swing_cutscene(
	void)
{
	fade_out 0 0 0 0
	sleep 15
	how_far_along = 0;
	begin_cutscene
	cutscene_sync off
	ai2_spawn kerr
	ai2_spawn griffin
	playback kerr KerrSet
	playback griffin GriffinSet
	cm_interpolate GriffinCam 0
	sleep 30
		chr_changeteam char_0 Konoko
		chr_inv_reset 0
		chr_giveweapon 0 w1_tap
		chr_forceholster 0 1
	cm_interpolate GriffinCam 0
	fade_in 30
	sleep 60
	#griffin talks
	cinematic_start (GRIFnametag, 180, 180, 15, 1, 20, false)
	sound_dialog_play c01_01_01griffin
	sound_dialog_play_block pause
	sound_dialog_play c01_01_02shinatama
	cinematic_start (SHINnametagM, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block pause
	cinematic_stop (SHINnametagM, 16, 20)
	cm_interpolate OfficeCam02 0
	cm_interpolate_block OfficeCam01 900
	sleep 15
	sound_dialog_play c01_01_03kerr
	cinematic_start (KERRnametagM, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block pause
	sound_dialog_play c01_01_04griffin
	sound_dialog_play_block pause
	playback 0 KonokoSet
	sleep 10
	cinematic_stop (KERRnametagM, 16, 20)
	#camera of Konoko
	#cm_reset
	cm_interpolate KonokoCam01 0
	cm_interpolate_block KonokoCam02 360
	cinematic_start (KONnametagM, 180, 180, 16, 3, 20, true)
	chr_animate 0 KONOKOwatch_idle 3000
	sleep 10
	sound_dialog_play c01_01_05griffin
	sound_dialog_play_block pause
	#cinematic_start (KONnametagM, 180, 180, 16, 3, 20, true)
	sleep 30
	sound_dialog_play c01_01_06konoko	
	sound_dialog_play_block pause
	sleep 20
	cinematic_stop (KONnametagM, 16, 20)
	sleep 15
	#griffin cam
	#sleep 30
	cm_interpolate GriffinCam 0
	sleep 30
	sound_dialog_play c01_01_07griffin
	sound_dialog_play_block pause
	sound_dialog_play c01_01_08shinatama
	cinematic_start (SHINnametagM, 180, 180, 16, 3, 20, true)		
	sound_dialog_play_block pause
	cinematic_stop (SHINnametagM, 16, 20)
	#office cam
	cm_interpolate OfficeCam01 0
	cm_interpolate_block OfficeCam02 900
	sound_dialog_play c01_01_09kerr
	cinematic_start (KERRnametagM, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block pause
	sound_dialog_play c01_01_10griffin
	sound_dialog_play_block pause
	#cinematic_stop (KERRnametagM, 16, 20)
	cinematic_stop (GRIFnametag, 15, 20)
	sleep 60
	#KerrCam
	cm_interpolate KerrCam 0
	#cinematic_start (KERRnametagM, 180, 180, 16, 3, 20, true)
	sleep 40
	sound_dialog_play c01_01_11kerr
	sound_dialog_play_block pause
	cutscene_sync on
	sleep 40
	cinematic_stop (KERRnametagM, 16, 20)
	cm_anim both Cam4
	cutscene_sync mark
	chr_envanim 0 KonBipedBox02 norotation
	chr_animate 0 KONOKOlev1_intro
	fork jumping_sounds
	env_anim 20 20
	sleep f180
	sound_ambient_start c00_20_07window
	sleep f154
	playback 0 SwingKonokoSet
	# hit on the floor
	sound_impulse_play kon_land_con
	sleep 30
	cm_reset
	sleep f30
#	end_cutscene
	letterbox 0
	chr_full_health 0
	give_powerup ammo
	give_powerup ammo
	give_powerup ammo
	chr_delete griffin
	chr_delete kerr
	s1
	yhealth
}

func void chung_music_start(void)
{
	sound_music_start atm_low1 0.7
}

# we stop this music when we spawn the lsi striker (a tad after actually)
func void chung_music_stop(void)
{
	sound_music_stop atm_low1
}


func void
Chung(
	void)
{
	begin_cutscene

	chung_music_start

	sleep 30
	cm_jello 1
	sound_dialog_play_block pause
	sound_dialog_play c01_02_01konoko
	sound_dialog_play_block pause
	sleep 60
	chr_animate 0 KONOKOwatch_start 60
	sleep 40
	cinematic_start (KONnametag, 180, 180, 15, 1, 20, false)
	cinematic_start (GRIFnametagM, 180, 180, 16, 3, 20, true)
	sleep 19
	chr_animate 0 KONOKOwatch_idle 3000
	sound_dialog_play c01_02_02konoko
	sound_dialog_play_block pause
	sound_dialog_play c01_02_03griffin
	sound_dialog_play_block pause
	sleep 30
	sound_dialog_play c01_02_04konoko
	sound_dialog_play_block pause
	sleep 60
	sound_dialog_play c01_02_05griffin
	sound_dialog_play_block pause
	chr_animate 0 KONOKOwatch_stop
	cinematic_stop (KONnametag, 15,20)
	cinematic_stop (GRIFnametagM, 16,20)
	sleep 15
	cm_reset
	end_cutscene
	trigvolume_enable gotLSI_tv 1
	target_set(1,0)
	input 1
}

func void
outro(
	void)
{
	chr_delete WH_Thug_A 
	chr_delete WH_Striker_B
	chr_delete WH_Striker_D
	begin_cutscene
	#forklift raises into position
	obj_create 101 109
	env_show 101 0
	env_show 102 0
	env_show 103 0
	env_show 104 0
	env_show 105 0
	env_show 106 0
	env_show 107 0
	env_show 108 0
	env_show 109 0
	env_anim 101 109
	cm_anim both OutroCam01
	cutscene_sync mark
	sound_ambient_start c00_38_24_forklifta
	sound_ambient_start c00_38_24_truck
	playback 0 OutroKonokoWalk
	cm_wait
	#Konoko enters booth
	cm_anim both OutroCam02
	chr_envanim 0 OutroKonokoBox01 norotation
	chr_animate 0 KONOKOlev1_Outro1
	cm_wait
	#Forklift starts down
	cm_anim both OutroCam03
	chr_envanim 0 OutroKonokoBox02
	chr_animate 0 KONOKOlev1_Outro2 770
	env_setanim 101 TwoForkLift01
	env_setanim 102 TwoForkLift02
	env_setanim 103 TwoForkLift03
	env_setanim 104 TwoForkLift04
	env_setanim 105 TwoForkLift05
	env_setanim 106 TwoForkLift06
	env_setanim 107 TwoForkLift07
	env_setanim 108 TwoForkLift08
	env_setanim 109 TwoForkLift09
	env_show 201 0
	env_show 202 0
	env_show 203 0
	env_show 204 0
	env_show 205 0
	env_show 206 0
	env_show 207 0
	obj_create 201 207
	env_anim 201 207
	cutscene_sync mark
	sound_ambient_start c00_38_24_forkliftb
	cm_anim_block both OutroCam04
	cm_anim_block both OutroCam05
	cutscene_sync mark
	sound_ambient_start c00_52_13_crash_doors
	cm_anim_block both OutroCam06
	cm_wait
	door_unlock 48
	particle bigdoor_locklight02 do start
	ai2_spawn OutroTCTF01
	ai2_spawn OutroTCTF02
	ai2_spawn OutroTCTF03
	sleep 21
	playback 0 OutroKonokoWalk
	ai2_setmovementmode OutroTCTF01 run
	ai2_setmovementmode OutroTCTF02 run
	ai2_setmovementmode OutroTCTF03 run
	cm_interpolate OutroCam07 0
	cm_interpolate_block OutroCam08 240
	playback OutroTCTF01 OutroTCTF01
	playback OutroTCTF02 OutroTCTF02
	playback OutroTCTF03 OutroTCTF03
	sleep 230
	playback 0 OutroKonokoJump
	sleep 120
	cm_interpolate OutroCam09 0
	sleep 120
	cm_reset
	cm_orbit .1
	chr_animate 0 KONOKOwatch_start 60
	sleep 40
	cinematic_start (KONnametag, 180, 180, 15, 1, 20, false)
	cinematic_start (GRIFnametagM, 180, 180, 16, 3, 20, true)
	sleep 19
	chr_animate 0 KONOKOwatch_idle 3000
	sound_dialog_play c01_03_01konoko
	sound_dialog_play_block pause
	sound_dialog_play c01_03_02griffin
	sound_dialog_play_block pause
	ai2_spawn griffin
	playback griffin GriffinSet
	sound_dialog_play c01_03_03konoko
	sound_dialog_play_block pause
	#griffin Cam
	cm_interpolate GriffinCam 0
	cm_interpolate_block GriffinCam01 500
	sound_dialog_play c01_03_04griffin
	sound_dialog_play_block pause
	sound_dialog_play c01_03_05konoko
	sound_dialog_play_block pause
	cinematic_stop (KONnametag, 15, 20)
	sleep 20
	sound_dialog_play c01_03_06shinatama
	cinematic_start (SHINtalking, 180, 180, 15, 1, 20, false)
	sound_dialog_play_block pause
	cinematic_stop (SHINtalking, 15, 20)
	sleep 20
	#konoko camera
	chr_animate 0 KONOKOwatch_idle 3000
	cm_reset
	sleep 20
	sound_dialog_play c01_03_07griffin
	sound_dialog_play_block pause
	sound_dialog_play c01_03_08konoko
	cinematic_start (KONnametag, 180, 180, 15, 1, 20, false)
	sound_dialog_play_block pause
	sleep 15
	chr_animate 0 KONOKOwatch_stop
	cinematic_stop (KONnametag, 15,20)
	cinematic_stop (GRIFnametagM, 16,20)
	fade_out 0 0 0 120
	sleep 120
	win
}

func void
camcontrol(
	void)
{
	cm_anim both OutroCam03
	cm_anim both OutroCam04
	cm_anim both OutroCam05
	cm_anim both OutroCam06
	cm_wait
	end_cutscene
}

func void
OutroLose(
	void)
{
	begin_cutscene weapon
	ai2_spawn LoseTCTF01
	ai2_spawn LoseTCTF02
	ai2_spawn LoseTCTF03
	sleep f30
	fade_out 0 0 0 15
	door_unlock 48
	particle bigdoor_locklight02 do start
	sleep f15
	playback 0 OutroLoseKonoko
	ai2_setmovementmode LoseTCTF01 run
	ai2_setmovementmode LoseTCTF02 run
	ai2_setmovementmode LoseTCTF03 run
	playback LoseTCTF01 OutroLoseTCTF01
	playback LoseTCTF02 OutroLoseTCTF02
	playback LoseTCTF03 OutroLoseTCTF03
	sleep f25
	fade_in 20
	##show tctf guys stormin the place
	cm_interpolate OutroLoseCam01 0
	cm_interpolate_block OutroLoseCam011 120
	sleep f150
	##show and Hide truck stuff
	env_show 201 0
	env_show 202 0
	env_show 203 0
	env_show 204 0
	env_show 205 0
	env_show 206 0
	env_show 207 0
	obj_create 201 207
	##Truck starts up
	env_setanim 201 Losetruckwheel01
	env_setanim 202 Losetruckwheel02
	env_setanim 203 Losetruckwheel03
	env_setanim 204 Losetruckwheel04
	env_setanim 205 Losetruckwheel05
	env_setanim 206 Losetruckback
	env_setanim 207 Losetruckcab
	cm_anim both OutroLoseCam02
	cutscene_sync mark
	sound_ambient_start truckleave
	###Truck leaves
	cm_anim_block both OutroLoseCam03
	playback LoseTCTF01 OutroLoseRoll
	playback LoseTCTF02 OutroLoseDie
	playback LoseTCTF03 OutroLoseDodge
	sleep f20
	cutscene_sync mark
	sound_ambient_start gar_dr_up
	###
	sleep f105
	chr_set_health LoseTCTF02 0
	#door_jam 48
	sleep f105
	cutscene_sync mark
	sound_ambient_start gar_dr_down
	cm_wait
	sleep f30
	fade_out 0 0 0 90
	sleep f90
	lose
}
	





