#
# tctf_cutscene.bsl
#

func void
Cut01(
	void)
{
	fade_out 0 0 0 0
	cm_interpolate IntroCam01 0
	sleep 8
	begin_cutscene
	sleep 1
	sound_ambient_start cs_tctf8_01
	fork Soundcue
	env_show 99 0	
	sleep 40
	#hides motorcycle gunk
	env_show 110 0
	env_show 111 0
	env_show 112 0
	#hides	van	gunk
	env_show 444 0
	env_show	101	0
	env_show	103	0
	env_show	104	0
	env_show	105	0
	env_show	106	0
	env_show	107	0
	env_show	108	0	
	#hides	curtain	wall
	#start cutscene	
	#fade_in 120
	cm_anim both IntroCam01	
	#cycle	and	konoko	animate					
	chr_envanim 0 IntroKonBox01			
	chr_animate 0 KONOKOcycle_ride 560
	obj_create 10 12
	obj_create 1 8		
	env_anim	10	12
	fade_in 120
	#sound_ambient_start cs_tctf8_01
	#fork Soundcue
	#Konoko looking at TCTF
	chr_envanim_block 0 IntroKonBox02
	cm_anim both IntroCam02
	chr_animate 0 KONOKOlev8_IntroKon01
	#show helicopters circling
	cm_anim_block both IntroCam03
	obj_create 601 606
	obj_create 701 706
	env_anim 601 606
	env_anim 701 706
	#sleep 
	#sound_ambient_play cs_tctf8_02
	#Van animate
	cm_anim_block both IntroCam04
	env_anim 1 8
	#sleep 20
	particle object_Blackvan_FB_VanHeadlight do start
	#Vancrash
	cm_anim_block both IntroCam05
	#sound_ambient_start cs_tctf8_03
	env_setanim 1 Blackvan_FB01
	env_setanim 3 Blackvan_LR01
	env_setanim 4 Blackvan_TB01
	env_setanim 5 Blackvan_W01
	env_setanim 6 Blackvan_WB01
	env_setanim 7 Blackvan_doors0201
	env_setanim 8 Blackvan_doors0301
	sleep 287
	#turn off unbroken curtain wall
	env_show 98 0
	env_show 398 0
	particle LobbyWall do explode
	#turn on broken	curtain	wall
	env_show 99 1
	#camera shows lobby doors closing and lights flashing
	cm_interpolate_block IntroLobbyCam00 0
	particle LobbyAlarm create
	#hide	object	van		
	obj_kill 1 8
	#show	gunk	van		
	env_show	101	1				
	env_show	103	1
	env_show	104	1
	env_show	105	1
	env_show	106	1
	env_show	107	1
	env_show	108	1
	env_show 444 1
	#Strikers run into Lobby space
	ai2_spawn IntroStriker01
	ai2_spawn IntroStriker02
	playback IntroStriker01 IntroStrikerLobby
	cm_interpolate_block IntroLobbyCam01 220
	env_show 97 0
	sleep 50
	obj_create 321 325
	env_anim 321 322
	playback IntroStriker02 IntroStrikerLobby
	sleep 190
	#Show alarms flashing and blast doors closing
	cm_interpolate_block IntroDoorCam02 0
	cutscene_sync mark 
	sound_ambient_start cs_tctf8_03
	env_anim 323 325
	sleep 200
	#Konoko sees doors closing
	chr_delete IntroStriker01
	chr_delete IntroStriker02
	cm_anim_block both IntroCam06
	chr_envanim 0 IntroKonBox03 norotation
	chr_animate 0 KONOKOlev8_IntroKon03
	env_setanim 10 motorcycle03
	env_setanim 11 hubs03
	env_setanim 12 hubs_rear03
	env_anim 323 325
	#Konoko rides towards closing doors
	chr_envanim_block 0 IntroKonBox04
	chr_animate 0 KONOKOcycle_ride 246
	env_setanim 10 motorcycle04
	env_setanim 11 hubs04
	env_setanim 12 hubs_rear04
	cm_anim both IntroCam07
	#Konoko slides under the doors
	chr_envanim_block 0 IntroKonBox05 norotation
	chr_animate 0 KONOKOlev8_IntroKon05
	env_setanim 10 motorcycle05
	env_setanim 11 hubs05
	env_setanim 12 hubs_rear05
	cm_anim both IntroCam08
	#Konoko game start
	cm_wait
	playback 0 IntroKonoko
	cinematic_start(KONintense, 180,180,15, 1, 15, false)
	sound_dialog_play c07_22_01konoko
	cm_reset
	sleep 1
	#hide motorcycle object
	obj_kill 10 12
	#kill helicopter objects
	obj_kill 601 606
	obj_kill 701 706
	#hide door objects
	obj_kill 321 325
	#show gunk motorcycle
	env_show 110 1
	env_show 111 1
	env_show 112 1
	#show door gunk
	env_show 321 1
	env_show 322 1
	env_show 323 1
	env_show 324 1
	env_show 325 1
	env_shade 321 325 .3 .3 .3
	#gameplay	settings			
	end_cutscene
	sound_dialog_play_block pause
	music_intro
	sleep 60
	cinematic_stop(KONintense, 15, 15)
	ai2_spawn lobby_striker_01
	ai2_spawn lobby_striker_02
	ai2_spawn lobby_striker_03
	s1
	sleep 120
	particle LobbyAlarm kill
}

func void
Soundcue(void)
{
	sleep 1146
	sound_ambient_start cs_tctf8_02
	cutscene_sync mark 

}

func void
Attack(void)
{
	begin_cutscene
	particle Attack do start
	fade_out 0 0 0 30
	ai2_spawn AttackCivil01
	ai2_spawn AttackCivil02
	ai2_spawn AttackStriker01
	ai2_spawn AttackStriker02
	ai2_setmovementmode AttackStriker01 run
	ai2_setmovementmode AttackStriker02 run
	chr_create 1054 start
	playback AttackCivil01 AttackGeneric01
	playback AttackCivil02 AttackCop01
	playback AttackStriker01 AttackStriker01
	playback AttackStriker02 AttackStriker02
	playback 1054 AttackComguy01
	sleep 30
	chr_animate AttackCivil01 KONPANcrouch_idle1 1000
	fade_in 30
	sleep 1
	chr_animate 1054 COMGUYtalk_radio 1660
	cm_interpolate AttackCam01 0
	sleep 60
	cm_interpolate AttackCam02 400
	sleep 300
	cinematic_start(COMGUYtalking, 180,180, 19, 7, 20, false)
	sound_dialog_play c07_23_01synhench1
	sound_dialog_play_block pause
	cinematic_stop (COMGUYtalking, 19, 30)
	sleep 10
	end_cutscene
	fade_out 0 0 0 30
	sleep 30
	cm_reset
	fade_in 30
	#kill characters 1050-1054
	chr_delete AttackCivil01
	chr_delete AttackCivil02
	chr_delete AttackStriker01
	chr_delete AttackStriker02
	chr_delete 1054
	particle Attack do stop
	music_attack

	# CB: after 10 seconds, play shinatama dialog "they're attacking the command center"
	sleep 600
	sound_dialog_play c00_01_105shinatama
	sound_dialog_play_block
}



func void
Kidnap(
	void)
{
	particle Kidnap do start
	begin_cutscene
	fade_out 0 0 0 30
	sleep 30
	
	#Shinatama caught up in destruction
	chr_create 1101 start
	chr_envanim 1101 KidnapShinBox02
	chr_animate 1101 SHINATsit_idle 3000

	#create the strikers
	chr_create 1103 start
	chr_create 1104 start
	playback 1103 KidnapStriker01
	playback 1104 KidnapStriker02

	#run the camera
	dprint run_the_camera
	cm_interpolate KidnapCam01 0
	cm_interpolate_block KidnapCam02 300
	fade_in 30
	sleep 360

	#Shinatama looks up to see SubBoss1
	dprint shinatama_looks_up
	chr_envanim 1101 KidnapShinBox02
	chr_animate 1101 SHINATsit_idle 610

	#cm_anim both KidnapCam03
	cm_interpolate KidnapCam03 0
	cm_interpolate_block KidnapHelpCam02 300
	cinematic_start(SHINhelpme, 180,180, 15, 1, 20, false)
	sound_dialog_play c07_24_02shinatama

	#create barabus as passsive
	dprint create_barabus
	ai2_spawn barabus
	chr_boss_shield barabus
	ai2_passive barabus 1
	chr_lock_active barabus
	playback barabus KidnapSubBoss01

	dprint sound_dialog_pause
	sound_dialog_play_block pause
	cinematic_stop (SHINhelpme, 19, 30)

	#SubBoss grabs Shinatama
	dprint barabus_grabs_shinatama
	chr_envanim 1101 KidnapShinBox01 norotation
	chr_animate 1101 SHINATlev8_Kidnap01 -1
	chr_envanim barabus KidnapStrBox01 norotation
	chr_animate barabus STRIKElev8_Kidnap01 -1
	cutscene_sync mark
	sound_ambient_start c09_32_09shin_kidnap
	cinematic_start(BOSS01menacing, 180,180, 20, 9, 20, false)
	sound_dialog_play c07_24_01barabas
	cm_anim both KidnapCam04
	sleep 60
	particle KidnapSpark do start
	sleep 5
	particle KidnapSpark do stop
	sleep 20
	cinematic_stop (BOSS01menacing, 19, 30)
	fade_out 0 0 0 30
	chr_delete 1101
	chr_delete 1103
	chr_delete 1104
	sleep 30
	chr_delete barabus
	cm_reset
	fade_in 30
	end_cutscene
	particle Kidnap do stop
}


func void
Elevator(
	void)
{
	begin_cutscene
	#hide gunk and show elevator objects
	env_show 501 0
	env_show 502 0
	env_show 503 0
	env_show 504 0
	obj_create 781 781
	obj_create 501 504
	obj_force_draw 781 781
	obj_force_draw 501 504
	#KONOKO cuts the cables
	chr_invincible 0 1
	chr_nocollision 0 1
	cm_anim both ElevatorCam01
	chr_envanim 0 ElevatorKonBox01 norotation
	chr_animate 0 KONOKOlev8_Elevator01
	env_anim 781 781
	env_anim 501 504
	sleep f40
	cutscene_sync mark
	sound_ambient_start c10_00_10_torch
	sleep 100
	particle ElevatorSpark do start
	sound_ambient_start c09_32_09shin_kidnap
	sleep 85
	particle ElevatorSpark do stop
	cutscene_sync mark
	sound_ambient_start c10_01_29_elevator
	sleep 45
	particle ElevatorSpark2 do start
	sound_ambient_start c09_32_09shin_kidnap
	sleep 70
	particle ElevatorSpark2 do stop
	#Elevator falls and KONOKO rises
	chr_envanim_block 0 ElevatorKonBox02 norotation
	obj_kill 781 781
	chr_animate 0 KONOKOlev8_Elevator02
	env_setanim 501 Elevator_fall
	env_setanim 502 Elevator_brace_fall
	env_setanim 503 Elevator_cable01_fall
	env_setanim 504 Elevator_cable02_fall
	cm_anim both ElevatorCam02
	sleep 60
	particle ElevatorDust do explode
	sleep 5
	particle ElevatorDust do explode
	#KONOKO stops at top
	chr_envanim_block 0 ElevatorKonBox03 norotation
	chr_animate 0 KONOKOlev8_Elevator03
	env_setanim 503 Elevator_cable01_stop
	cm_anim both ElevatorCam03
	#KONOKOleaps out of shaft
	chr_envanim_block 0 ElevatorKonBox04 norotation
	chr_animate 0 KONOKOlev8_Elevator04
	cm_anim both ElevatorCam04
	#hide objects and show gunk
	obj_kill 501 504
	env_show 601 1
	env_show 602 1
	cm_wait
	playback 0 ElevatorEndSet
	cm_reset
	chr_invincible 0 0
	chr_nocollision 0 0
	end_cutscene
	sleep 5
}


func void
helicopter(
	void)
{
	obj_create 901 906
	particle EndDust create
}

func void helicopter_sound_start(void)
{
	sound_ambient_start c08_heli 1.0
}

func void helicopter_sound_stop(void)
{
	sleep 680
	sound_ambient_volume c08_heli 0.0 12
	sleep 600
	sound_ambient_stop c08_heli
}

func void helicopter_fly_away(void)
{
	fork helicopter_sound_stop

	#helicopter
	chr_create 1019 start
	chr_create 1020 start
	chr_create 1021 start						
	chr_envanim 1019 HeliOutroShinBox01						
	chr_envanim 1020 HeliOutroStrBox01						
	chr_envanim 1021 HeliOutroStrBox02						
	chr_animate 1019 SHINATstand_heli 1000
	chr_animate 1020 STRIKEstand_heli 1000				
	chr_animate 1021 STRIKEcrouch_idle 1000
	env_anim 901 906
}

func void
HeliOutroRight(
	void)
{
	cutscene_sync mark
	helicopter_sound_start
	ai2_takecontrol 1
	ai2_passive sh_s12b 1
	ai2_passive sh_s12 1
	ai2_passive sh_s12c 1
	ai2_movetoflag 0 1900
	begin_cutscene
	chr_delete sh_s12b
	chr_delete sh_s12
	chr_delete sh_s12c
	ai2_kill
	sleep 10
	helicopter_fly_away
	cm_interpolate HeliOutroRight 200
	sleep 200
	cm_anim both HeliOutroCam012
	sleep 100
	ai2_takecontrol 0
	input 0
	playback 0 HeliOutroKonoko02
	cinematic_start(KONtalking, 180,180, 16, 3, 15, true)
	sound_dialog_play c07_25_01konoko
	sound_dialog_play_block pause
	fork HeliOutro
}


func void
HeliOutroMid(
	void)
{
	cutscene_sync mark
	helicopter_sound_start
	ai2_takecontrol 1
	ai2_passive sh_s12b 1
	ai2_passive sh_s12c 1
	ai2_passive sh_s12 1
	ai2_movetoflag 0 1900
	begin_cutscene
	chr_delete sh_s12c
	chr_delete sh_s12b
	chr_delete sh_s12
	ai2_kill
	sleep 10
	helicopter_fly_away
	cm_interpolate HeliOutroMid 100
	sleep 100
	cm_interpolate HeliOutroCam01 100
	cm_anim_block both HeliOutroCam01
	sleep 200
	ai2_takecontrol 0
	input 0
	playback 0 HeliOutroKonoko02
	cinematic_start(KONtalking, 180,180, 16, 3, 15, true)
	sound_dialog_play c07_25_01konoko
	sound_dialog_play_block pause
	fork HeliOutro
}

func void
HeliOutroMidLt(
	void)
{
	cutscene_sync mark
	helicopter_sound_start
	ai2_takecontrol 1
	ai2_passive sh_s12c 1
	ai2_passive sh_s12b 1
	ai2_passive sh_s12 1
	ai2_movetoflag 0 1900
	begin_cutscene
	chr_delete sh_s12c
	chr_delete sh_s12b
	chr_delete sh_s12
	ai2_kill
	sleep 10
	helicopter_fly_away
	cm_interpolate HeliOutroMidLt 100
	sleep 100
	cm_interpolate HeliOutroCam01 100
	cm_anim_block both HeliOutroCam01
	#patrol Konoko to flag #1010
	sleep 200
	ai2_takecontrol 0
	input 0
	playback 0 HeliOutroKonoko02
	cinematic_start(KONtalking, 180,180, 16, 3, 15, true)
	sound_dialog_play c07_25_01konoko
	sound_dialog_play_block pause
	fork HeliOutro
}

func void
HeliOutroLeft(
	void)
{
	cutscene_sync mark
	helicopter_sound_start
	ai2_takecontrol 1
	ai2_passive sh_s12c 1
	ai2_passive sh_s12b 1
	ai2_passive sh_s12 1
	ai2_movetoflag 0 1900
	begin_cutscene
	chr_delete sh_s12c
	chr_delete sh_s12b
	chr_delete sh_s12
	ai2_kill
	sleep 10
	helicopter_fly_away
	cm_interpolate HeliOutroLeft 200
	sleep 200
	cm_anim both HeliOutroCam012
	sleep 200
	ai2_takecontrol 0
	input 0
	playback 0 HeliOutroKonoko02
	cinematic_start(KONtalking, 180,180, 20, 9, 15, true)
	sound_dialog_play c07_25_01konoko
	sound_dialog_play_block pause
	fork HeliOutro
}


func void
HeliOutro(
void)
{
	particle EndDust kill
	target_set(1,0.0)
	#Subboss shows up behind konoko
	cm_interpolate_block HeliOutroCam02 0
	chr_delete 1019
	chr_delete 1020
	chr_delete 1021
	playback 0 HeliOutroKonoko01
	ai2_spawn barabus
	chr_boss_shield barabus
	playback barabus HeliOutroBoss01
	sleep 40
	chr_animate 0 KONCOMstartle_bk2
	cinematic_stop (KONtalking, 20, 40)
	cinematic_start(KONintense, 180,180, 20, 9, 40, false)
	sound_dialog_play c07_25_02konoko
	sound_dialog_play_block pause
	#subboss taunts Konoko
	cm_interpolate HeliOutroCam03 0
	sleep 30
	cinematic_start(BOSS1talking, 180,180,19, 7, 25, false)
	sound_dialog_play c07_25_03barabas
	sound_dialog_play_block pause
	#"KONOKO, let's get it on!!!!!"
	cinematic_stop (BOSS1talking, 19, 40)
	#camera of Konoko's face
	cm_interpolate HeliCamKonFace 60
	sound_dialog_play c07_25_04konoko
	sound_dialog_play_block pause
	sleep 30
	cinematic_stop (KONintense, 19, 30)
	#resume gameplay
	cm_reset
	letterbox 0
	input 1
	chr_neutral 1010 0
	obj_kill 901 906
	ai2_takecontrol 0
	end_cutscene
	music_battle
	s4
}


func void
final(
void)
{
	music_stop
	begin_cutscene
	sleep 120
	sound_dialog_play c07_26a_01konokofx
	chr_animate 0 KONOKOpowerup
	sleep 240
	cinematic_start (KONtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play c07_26_01konoko
	sound_dialog_play_block
	cinematic_stop (KONtalking, 19, 20)
	fade_out 0 0 0 120
	sleep 120
	win
}

func void
BarabasNorth(string barabas)
{
	cutscene_sync mark
	sound_ambient_start c11_10_14bar_jet
	playback barabus BarabasNorth
	ai2_barabbas_retrievegun barabus
	sleep 60
	chr_envanim barabus BarabasNorthBox norotation
	chr_animate barabus BARABnorth
	sleep 105
	#particle BarabasNorth do start
}



func void
BarabasSouth(string barabas)
{
	cutscene_sync mark
	sound_ambient_start c11_10_14bar_jet
	playback barabus BarabasSouth
	ai2_barabbas_retrievegun barabus
	sleep 60
	chr_envanim barabus BarabasSouthBox norotation
	chr_animate barabus BARABsouth
	sleep 105
	#particle BarabasSouth do start
}


func void
BarabasEast(string barabas)
{
	cutscene_sync mark
	sound_ambient_start c11_10_14bar_jet
	playback barabus BarabasEast
	ai2_barabbas_retrievegun barabus
	sleep 60
	chr_envanim barabus BarabasEastBox norotation
	chr_animate barabus BARABeast
	sleep 105
	#particle BarabasEast do start
}



func void
BarabasWest(string barabas)
{
	cutscene_sync mark
	sound_ambient_start c11_10_14bar_jet
	playback barabus BarabasWest
	ai2_barabbas_retrievegun barabus
	sleep 60
	chr_envanim barabus BarabasWestBox norotation
	chr_animate barabus BARABwest
	sleep 105
	#particle BarabasWest do start

}
