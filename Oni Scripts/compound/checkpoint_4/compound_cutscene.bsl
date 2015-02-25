#
# Compound_cutscene.bsl

func void intro(void)
{
	fade_out 0 0 0 0
	cm_interpolate IntroCam00 0
	sleep f14
	begin_cutscene	
	ai2_allpassive 0
	gs_farclipplane_set 10000
	letterbox 1
	cm_interpolate IntroCam00 0
	sleep f60
	chr_super 0 1
	fade_in 120
	music_intro
	sleep f240
	#Konoko drops from sky
	cm_interpolate IntroCam01 300
	sleep f300
	cm_anim both IntroCam01
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev7_Intro
	sleep f90
	cutscene_sync mark
	sound_ambient_start c05_05_15kon_land
	sleep f60
	particle IntroImpact do explode
	#close up of Konoko
	cm_anim_block both IntroCam02
	ai2_allpassive 1
	#Vista shot
	cm_wait
	playback 0 IntroKonokoSet
	cm_reset
	end_cutscene
	chr_set_health 0 400
	chr_super 0 0
	s1
}


func void ParkLeft(void)
{
	begin_cutscene
	chr_teleport C_b74 541
	ai2_dopath C_b74 patrol_74
	chr_teleport C_Eb73 528
	ai2_dopath C_Eb73 patrol_73
	trigvolume_corpse 29
	sleep f30
	obj_create 51 59
	env_anim 51 59
	sleep f2
	cm_interpolate ParkLeftCam01 0
	#Show Truck objects
	#see van entering from tunnel
	sleep f8
	cutscene_sync mark
	sound_ambient_start c05_26_17_trucka
	sleep f270
	#Striker exits van
	ai2_spawn ParkStriker
	chr_lock_active ParkStriker
	chr_neutral ParkStriker 1
	cm_anim both ParkCam01
	env_setanim 51 truckbackstop
	env_setanim 52 truckcabstop
	env_setanim 53 truckdoorstop
	env_setanim 54 truckdoor2stop
	env_setanim 55 truckwheel03stop
	env_setanim 56 truckwheel04stop
	env_setanim 57 truckwheel05stop
	env_setanim 58 truckwheel06stop
	env_setanim 59 truckwheel07stop
	chr_envanim ParkStriker ParkStrikeBox01 norotation
	sleep f40
	cutscene_sync mark
	sound_ambient_start c05_31_21_brake_doorsa
	sleep f60
	chr_animate ParkStriker STRIKElev7_Park
	playback 0 ParkLeftKonoko
	ai2_spawn C_Sb25
	ai2_spawn C_Sb26
	ai2_spawn C_Eb27
	playback C_Sb25 truckers
	sleep 40
	playback C_Sb26 truckers
	sleep 30
	playback C_Eb27 truckers
	sleep 60
	#hide object van and unhide gunk van
	obj_kill 51 59
	env_show 151 1
	env_show 152 1
	env_show 153 1
	env_show 154 1
	env_show 155 1
	env_show 156 1
	env_show 157 1
	env_show 158 1
	env_show 159 1
	#cm_wait
	playback 0 ParkLeftKonoko01
	#sleep f240
	cm_reset
	#chr_delete ParkStriker
	#konoko talks
	sleep f120
	sound_dialog_play c15_57_05konoko
	cinematic_start (KONlistening, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block
	cinematic_stop (KONlistening, 19, 20)
	end_cutscene
	music_truck
}

func void ParkRight(void)
{
	begin_cutscene
	chr_teleport C_b74 541
	ai2_dopath C_b74 patrol_74
	chr_teleport C_Eb73 528
	ai2_dopath C_Eb73 patrol_73
 	trigvolume_corpse 29
	sleep f30
	obj_create 51 59
	env_anim 51 59
	sleep f2
	cm_interpolate ParkRightCam01 0
	#Show Truck objects
	#see van entering from tunnel
	sleep f8
	cutscene_sync mark
	sound_ambient_start c05_26_17_trucka
	sleep f270
	#Striker exits van
	ai2_spawn ParkStriker
	chr_lock_active ParkStriker
	chr_neutral ParkStriker 1
	cm_anim both ParkCam01
	env_setanim 51 truckbackstop
	env_setanim 52 truckcabstop
	env_setanim 53 truckdoorstop
	env_setanim 54 truckdoor2stop
	env_setanim 55 truckwheel03stop
	env_setanim 56 truckwheel04stop
	env_setanim 57 truckwheel05stop
	env_setanim 58 truckwheel06stop
	env_setanim 59 truckwheel07stop
	chr_envanim ParkStriker ParkStrikeBox01 norotation
	sleep f40
	cutscene_sync mark
	sound_ambient_start c05_31_21_brake_doorsa
	sleep f60
	chr_animate ParkStriker STRIKElev7_Park
	playback 0 ParkRightKonoko
	ai2_spawn C_Sb25
	ai2_spawn C_Sb26
	ai2_spawn C_Eb27
	playback C_Sb25 truckers
	sleep 40
	playback C_Sb26 truckers
	sleep f30
	playback C_Eb27 truckers
	sleep 60
	#hide object van and unhide gunk van
	obj_kill 51 59
	env_show 151 1
	env_show 152 1
	env_show 153 1
	env_show 154 1
	env_show 155 1
	env_show 156 1
	env_show 157 1
	env_show 158 1
	env_show 159 1
	#cm_wait
	playback 0 ParkRightKonoko01
	#sleep f240
	cm_reset
	#chr_delete ParkStriker
	#kononko talks
	sleep f120
	sound_dialog_play c15_57_05konoko
	cinematic_start (KONlistening, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block
	cinematic_stop (KONlistening, 19, 20)
	end_cutscene
	music_truck
}


func void Truck(void)
{
	trigvolume_corpse 29
	begin_cutscene

	#hide gunk and show object
	obj_create 51 59
	env_show 151 0
	env_show 152 0
	env_show 153 0
	env_show 154 0
	env_show 155 0
	env_show 156 0
	env_show 157 0
	env_show 158 0
	env_show 159 0
	#Konoko enters Truck
	cm_anim both TruckCam01
	cutscene_sync mark
	sound_ambient_start c05_26_17_truckb
	chr_envanim 0 TruckKonBox01 norotation
	chr_animate 0 KONOKOlev7_TruckEnter
	env_setanim 54 truckdoor2enter
	sound_dialog_play c15_57_06konoko
	cinematic_start (KONintense, 180, 180, 19, 7, 20, false)

	#Truck exhaust starts and truck peels out
	#sleep f10
	sound_ambient_start c05_31_21_brake_doorsb
	cm_anim_block both TruckCam02
	playback 0 TruckKonokoHide
	ai2_allpassive 0
	cinematic_stop (KONintense, 19, 20)
	sleep f80
	chr_teleport C_Sb25 238
	ai2_dopath C_Sb25 patrol_70
	chr_teleport C_Sb26 195
	ai2_dopath C_Sb26 patrol_84
	chr_teleport C_Eb27 227
	ai2_dopath C_Eb26 patrol_85
	env_setanim 51 truckbackdrive01
	env_setanim 52 truckcabdrive01
	env_setanim 53 truckdoordrive01
	env_setanim 54 truckdoor2drive01
	env_setanim 55 truckwheel03drive01
	env_setanim 56 truckwheel04drive01
	env_setanim 57 truckwheel05drive01
	env_setanim 58 truckwheel06drive01
	env_setanim 59 truckwheel07drive01

	#Truck heads towrads camera
	cm_interpolate_block TruckCam04 0
	env_setanim 51 truckbackdrive02
	env_setanim 52 truckcabdrive02
	env_setanim 53 truckdoordrive02
	env_setanim 54 truckdoor2drive02
	env_setanim 55 truckwheel03drive02
	env_setanim 56 truckwheel04drive02
	env_setanim 57 truckwheel05drive02
	env_setanim 58 truckwheel06drive02
	env_setanim 59 truckwheel07drive02
	sleep f160
	fade_out 0 0 0 15
	fade_in 15

	#Truck heads towrads door
	cm_anim both TruckCam03	
	env_setanim 51 truckbackdrive02
	env_setanim 52 truckcabdrive02
	env_setanim 53 truckdoordrive02
	env_setanim 54 truckdoor2drive02
	env_setanim 55 truckwheel03drive02
	env_setanim 56 truckwheel04drive02
	env_setanim 57 truckwheel05drive02
	env_setanim 58 truckwheel06drive02
	env_setanim 59 truckwheel07drive02

	#Truck crashes through door
	cm_anim_block both TruckCam05
	env_setanim 51 truckbackcrash
	env_setanim 52 truckcabcrash
	env_setanim 53 truckdoorcrash
	env_setanim 54 truckdoor2crash
	env_setanim 55 truckwheel03crash
	env_setanim 56 truckwheel04crash
	env_setanim 57 truckwheel05crash
	env_setanim 58 truckwheel06crash
	env_setanim 59 truckwheel07crash

	#break door here
	sleep f35
	cutscene_sync mark
	sound_ambient_start c05_53_27_crash
	sleep f10
	particle TruckDoor do explode
	env_show 911 1
	env_show 912 0
	env_show 913 0
	env_show 914 1

	#Konoko exits truck
	sleep f125
	cutscene_sync mark
	sound_ambient_start c05_31_21_brake_doorsc
	cm_anim_block both TruckCam06
	chr_envanim 0 TruckKonBox02 norotation
	chr_animate 0 KONOKOlev7_TruckExit
	env_setanim 54 truckdoor2exit

	#gameplay resumes
	cm_wait
	env_show 915 1
	env_show 916 1
	env_show 251 1
	env_show 252 1
	env_show 253 1
	env_show 254 1
	env_show 255 1
	env_show 256 1
	env_show 257 1
	env_show 258 1
	env_show 259 1
	obj_kill 51 59
	cm_reset
	playback 0 TruckExitKonoko
	end_cutscene

	stop_music_truck
}

func void sp_start_dish_loop(void)
{
	sound_ambient_start mc_dish_loop 0.6
}

func void sp_start_dish_and_wait(void)
{
	sleep 320
	sound_ambient_start mc_dish_loop 0.1
	sound_ambient_volume mc_dish_loop 0.6 4.0
}

func void dish(void)
{
	begin_cutscene
	gs_farclipplane_set 5000
	sleep f60
	#hide and unhide dish stuff
	obj_create 201 209
	obj_shade 201 209 .5 .5 .5
	env_show 301 0
	env_show 302 0
	env_show 303 0
	env_show 304 0
	env_show 305 0
	env_show 306 0
	env_show 307 0
	env_show 308 0
	env_show 309 0
	cm_anim both DishCam01
	chr_peace 0
	chr_envanim 0 DishKonokoBox01
	sleep f60
	obj_force_draw 201 209
	cutscene_sync mark
	sound_ambient_start c06_08_03_basic
	sleep f440
	#dish thing starts to raise
	env_anim 201 209
	cm_anim_block both DishCam02
	cm_anim_block both DishCam03
	cm_anim_block both DishCam04
	sleep f120
	cutscene_sync mark
	sound_ambient_start c06_35_00_servo
	cm_anim_block both DishCam05
	sleep f300
	#close up of Konoko
	env_show 401 1
	env_show 402 1
	env_show 403 1
	env_show 404 1
	env_show 405 1
	env_show 406 1
	env_show 407 1
	env_show 408 1
	env_show 409 1
	obj_kill 201 209
	#Vista shot
	particle dish do explode
	cutscene_sync mark
	sound_ambient_start c16_49_01_amb2
	gs_farclipplane_set 3000
	cm_interpolate DishCam06 0
	cm_interpolate_block DishCam07 940
	sleep f600
	cutscene_sync mark
	sound_ambient_start c16_49_01_effectsa
	sleep f330
	cutscene_sync mark
	sound_ambient_start c16_49_01_effectsb
	fork sp_start_dish_and_wait
	cm_wait
	cm_interpolate DishCam08 0
	particle dishpulse do start
	particle sturm_ambient start
	sleep f300
	playback 0 GrifKonokoSet
	cm_interpolate GrifCam01 180
	sleep f120

	#cm_reset
	if (did_kill_griffen() eq 1)
	{
		mutant
	}
	if (did_kill_griffen() eq 0)
	{
		grif
	}
}


func void grif(void)
{
	begin_cutscene
	cutscene_sync mark
	sound_ambient_start c07_17_19heli
	#camera pans to see Konoko looking at dish
	#playback 0 GrifKonokoSet
	#cm_interpolate GrifCam01 180
	#sleep f240

	# CB: this sets up the AI target selection parameters for the group battle
	ai2_boss_battle = 1

	#camera pans to see Muro
	ai2_spawn Muro
	ai2_passive Muro 1
	if (extra_guys eq 1) {
		ai2_spawn GrifElite01
		counter = counter + 1;
	}
	ai2_spawn GrifElite02
	ai2_spawn GrifElite03
	playback Muro GrifMuroSet
	playback GrifElite01 GrifElite01Set
	playback GrifElite02 GrifElite02Set
	playback GrifElite03 GrifElite03Set
	cm_interpolate GrifCam02 150
	sleep f10
	playback GrifElite02 GrifElite02Set
	sleep f5
	playback GrifElite03 GrifElite03Set
	sleep f150
	#Muro says  you shouldn't have come here alone
	cm_interpolate GrifCamMuro01 0
	sound_dialog_play c15_60_01muro
	cinematic_start (MUROtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block pause
	cinematic_stop (MUROtalking, 19, 20)
	#Konoko looks pissed
	playback 0 GrifKonokoSet02
	cm_interpolate GrifCamKon01 0
	sleep f15
	#griffin appears in a helicopter behind her
	cm_interpolate GrifCamHeli 240
	sleep f20
	obj_create 901 906
	env_anim 901 906
	ai2_spawn Griffin
	if (extra_guys eq 1) {
		ai2_spawn GrifOps01
		count_swat_dies = count_swat_dies + 1;
	}
	ai2_spawn GrifOps02
	ai2_spawn GrifOps03
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
	sound_dialog_play c15_60_02griffin
	cinematic_start (GRIFshouting, 180, 180, 15, 1, 20, false)
	sleep f200
	cinematic_stop (GRIFshouting, 15, 20)
	#Guys jump out of helicopter
	env_setanim 901 heli_doors_rt08
	env_setanim 902 heli_doors_lt08
	env_setanim 903 heli_rotorblades08
	env_setanim 904 heli_body08
	env_setanim 905 heli_canopy08
	env_setanim 906 heli_interior08
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
	cm_anim both GrifCamOut
	ai2_allpassive 1
	sleep f240
	#Guys run to help Konoko
	playback Griffin GrifGrifRunAlt
	if (extra_guys eq 1) {
		playback GrifOps01 GrifOps01Run
		playback GrifOps02 GrifOps02Run
	}
	if (extra_guys eq 0) {
		playback GrifOps02 GrifOps01Run
	}
	sleep f10
	playback GrifOps03 GrifOps03Run
	cm_wait
	#sleep f20
	cm_interpolate GrifCamHelp01 0
	sleep f20
	cm_interpolate_block GrifCamHelp02 180
	sleep f180
	cm_interpolate GrifCamWatch01 0
	cm_interpolate_block GrifCamWatch02 210
	playback 0 GrifKonokoWatch
	sleep f210

	#Muro says you gonna trust him?
	obj_kill 901 906
	cm_interpolate GrifCamFace01 0
	cm_interpolate_block GrifCamFace02 700
	sound_dialog_play c15_60_03muro
	cinematic_start (MUROtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block pause 

	#Konoko says he dreamed of life
	cm_interpolate GrifCamKonFace01 0
	cm_interpolate_block GrifCamKonFace02 800
	sound_dialog_play c15_60_04konoko
	cinematic_start (KONintense, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause
	sound_dialog_play c15_60_05konoko
	sound_dialog_play_block pause

	sound_music_start mus_ot

	cm_interpolate GrifCamMuroFace01 0
	sound_dialog_play c15_60_06muro
	sound_dialog_play_block pause
	cinematic_stop (MUROtalking, 19, 20)

	chr_set_health Muro 500

	cinematic_stop (KONintense, 20, 20)
	end_cutscene
	ai2_passive Muro 0
	chr_boss_shield Muro
	cm_reset
	s4
	fork wait_to_help
	paths
	objective_set(6)
}


func void mutant(void)
{
	begin_cutscene
	#camera pans to see Konoko looking at dish
	#playback 0 GrifKonokoSet
	#cm_interpolate GrifCam01 180
	#sleep f240
	#camera pans to see Muro
	ai2_spawn Muro
	ai2_passive Muro 1
	playback Muro GrifMuroSet
	cm_interpolate GrifCam02 150
	sleep f150
	#Muro says  you shouldn't have come here alone
	cm_interpolate GrifCamMuro01 0
	cm_interpolate_block MutantCam01 900
	sound_dialog_play c15_59_01muro
	cinematic_start (MUROtalking, 180, 180, 19, 7, 20, false)
	sleep f500
	#Konoko looks pissed
	playback 0 GrifKonokoSet02
	cm_interpolate GrifCamKon01 0
	sleep f150
	cinematic_stop (MUROtalking, 19, 20)
	#muro transforms
	cm_interpolate GrifCam02 0
	particle MutantTransform do explode
	cutscene_sync mark
	sound_ambient_start c08_06_25muro
	sleep f150
	chr_animate Muro MUROtransform
	cm_interpolate_block MutantCam01 200
	sleep f170
	#show Konoko protecting herself from the blast
	cm_interpolate MutantCamKon 0
	chr_animate 0 KONOKOlev7_blown
	sleep f100
	#kill muro and spawn mutant muro
	chr_delete Muro 
	ai2_spawn MutantMuro
	playback MutantMuro MutantMuroEnd01
	sleep 1
	ai2_allpassive=1
	chr_neutral MutantMuro 1
	sleep f10
	chr_animate MutantMuro MUTCOMtransform
	cm_interpolate MutantCam01 0
	cm_interpolate_block  MutantCam03 240
	sleep f60
	sound_dialog_play c15_59_02muro
	cinematic_start (MUTANTMUROface, 180, 180, 19, 7, 20, false)
	cm_interpolate MutantCam04 700
	sound_dialog_play_block pause
	#Konoko says surrender
	cm_interpolate MutantCamKonTalk 0
	sound_dialog_play c15_59_03konoko
	cinematic_start (KONangryfront, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause

	sound_music_start mus_ot

	#Muro says never
	#playback MutantMuro MutantMuroEnd01
	#cm_interpolate MutantCamMuroEnd 0
	#sleep f60
	#playback MutantMuro MutantMuroEnd02
	#sleep f120
	#gameplay resumes
	cinematic_stop (KONangryfront, 20, 20)
	cinematic_stop (MUTANTMUROface, 19, 20)
	cm_reset	
	end_cutscene
	chr_boss_shield MutantMuro
	ai2_passive MutantMuro 0
	s4
	objective_set(7)
}



func void
Outro(
	void)
{
	sound_music_stop mus_ot

	begin_cutscene jello

	#slowmo
	#weird particle effect
	sleep f120
	chr_animate 0 KONOKOendpowerup
	sleep f120
	cm_interpolate EndCam 600
	sound_ambient_volume mc_dish_loop 1.0 4.0
	sleep f500
	fade_out 0 0 0 120
	sleep f120
	win
}
