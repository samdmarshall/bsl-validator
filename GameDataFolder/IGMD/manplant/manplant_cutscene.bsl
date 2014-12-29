#
# manplant_cutscene.bsl
#

func void
manplant_cs_intro(void)
{

}


func void intro(void)
{
	fade_out 0 0 0 0
	cm_interpolate Camout01 0
	env_show 561 0
	sleep f14
	begin_cutscene
	sleep f30
	#Outside shot of cops walking in
	ai2_spawn Recep
	ai2_spawn partner_cop_1
	ai2_spawn partner_cop_2
	playback 0 IntroKonoko01
	playback partner_cop_1 IntroCop01
	playback partner_cop_2 IntroCop02
	#cm_interpolate Camout01 0
	
	sound_music_start mus_ambgrv1b 0.90
	#music_script_start();

	fade_in 120

	sleep f240
	#cops enter building, shot behind the receptionist
	cm_anim both Camin02
	chr_envanim Recep IntroSecBox01 norotation
	chr_animate Recep SECRETsit_prehello 540
	chr_lock_active Recep
	chr_lock_active partner_cop_1
	chr_lock_active partner_cop_2
	#receptionist looks up and Cop introduces himself
	cm_interpolate_block Camin03 0
	chr_envanim Recep IntroSecBox01 norotation
	chr_animate Recep SECRETsit_prehello 120
	chr_animate_block Recep SECRETsit_hello 90

	sound_music_volume mus_ambgrv1b 0.6 1

	chr_animate_block Recep SECRETsit_talk 600
	chr_envanim Recep IntroSecBox01 norotation

	sound_dialog_play c01_04_01receptionist
	cinematic_start (RECEPtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause
	cinematic_stop (RECEPtalking, 20, 20)
	cinematic_start (TCTFtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play c01_04_02tctfag1
	chr_envanim Recep IntroSecBox01 norotation
	#Konoko interrupts Cop guy
	playback 0 IntroKonokoInt
	sleep f100
	#sound_dialog_play_block pause
	chr_envanim Recep IntroSecBox01 norotation
	cm_interpolate IntroCamInterrupt 0
	cinematic_start (KONpsychedup, 180, 180, 20, 7, 20, false)
	playback partner_cop_1 IntroCopInt
	sound_dialog_play_interrupt c01_04_03konoko
	cinematic_stop (TCTFtalking, 19, 20)
	sound_dialog_play_block pause
	cinematic_stop (KONpsychedup, 19, 20)
	#Receptionis says ok officer
	cm_interpolate Camin03 0
	chr_envanim Recep IntroSecBox01 norotation
	chr_animate Recep SECRETsit_talk 400
	sleep f30
	cinematic_start (RECEPtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play c01_04_04receptionist
	sleep f90
	#Receptionis hits alarm
	cm_anim both IntroCamAlarm
	chr_envanim Recep IntroSecBox01 norotation
	chr_animate Recep SECRETsit_alarm 400
	sleep f110
	particle IntroLight01 create
	particle IntroLight01 do start
	cinematic_stop (RECEPtalking, 20, 20)
	#Bad guys see alarm is hit
	cm_wait
	chr_create 1050 start
	ai2_spawn Barabus
	chr_neutral 1050 1
	#chr_neutral 1051 1
	playback 1050 IntroMuroSet
	playback Barabus IntroBossSet
	cm_interpolate IntroCamBadGuys00 0

	sound_ambient_start alarm_loop

	cm_interpolate_block IntroCamBadGuys01 240
	sleep f120
	cinematic_start (BOSS1nametag, 180, 180, 16, 3, 20, false)
	sound_dialog_play c02_05_01barabas

	sound_ambient_volume alarm_loop .35 1.0
	
	sound_dialog_play_block pause
	#Muro turns to Bossman
	playback 1050 IntroMuro01
	cm_interpolate IntroCamMuro01 0
	cinematic_start (MUROnametag, 180, 180, 15, 1, 20, false)	
	sound_dialog_play c02_05_02muro
	sound_dialog_play_block pause
	#Bossman and Muro talk
	cm_interpolate IntroCamBothLt 0
	cm_interpolate_block IntroCamBothRt 500
	sound_dialog_play c02_05_03barabas
	sound_dialog_play_block pause
	sound_dialog_play c02_05_04muro
	sound_dialog_play_block pause
	sound_dialog_play c02_05_05barabas
	sound_dialog_play_block pause
	#Muro talks
	cm_interpolate IntroCamMuro02 0

	sound_ambient_volume alarm_loop 0.0 1.0
	sound_ambient_stop alarm_loop

	sound_dialog_play c02_05_06muro
	sound_dialog_play_block pause
	#Bossman and Muro talk
	cm_interpolate IntroCamBothRtHigh 0
	cm_interpolate_block IntroCamBothLtHigh 500
	sound_dialog_play c02_05_07muro
	sound_dialog_play_block pause
	sound_dialog_play c02_05_08barabas
	sound_dialog_play_block pause
	sound_dialog_play c02_05_09muro
	sound_dialog_play_block pause
	sound_dialog_play c02_05_10barabas
	sound_dialog_play_block pause
	#Muro talks
	cm_interpolate IntroCamMuro01 0
	sound_dialog_play c02_05_11muro
	sound_dialog_play_block pause
	cinematic_stop (MUROnametag, 15,20)
	cinematic_stop (BOSS1nametag, 16,20)
	#Receptionist says hold on
	cm_interpolate Camin03 0
	chr_envanim Recep IntroSecBox01 norotation
	chr_animate Recep SECRETsit_unalarm 180
	chr_animate_block Recep SECRETsit_talk 500
	sound_dialog_play c02_05_12receptionist
	cinematic_start (RECEPtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause
	cinematic_stop (RECEPtalking, 20,20)
	#Strikers Rush in

	sound_ambient_volume mus_ambgrv1b 0 .5

	music_script_start();

	ai2_spawn ambush_striker_3
	ai2_spawn ambush_striker_2
	#chr_neutral ambush_striker_3 1
	#chr_neutral ambush_striker_2 1
	
	door_open 21
	door_jam 21

	playback ambush_striker_3 IntroStrikerRight01
	playback ambush_striker_2 IntroStrikerRight02
	cm_interpolate IntroCamDoorRight01 0
	sleep f180
	#Cop says what the?
	playback partner_cop_2 IntroCop02Surprise
	chr_envanim 1003 IntroSecBox01 norotation
	chr_animate Recep SECRETsit_talk 400
	cm_interpolate IntroCamSurprise 0
	cm_interpolate_block IntroCamSurprise02 90
	sound_dialog_play c02_05_13tctfag1
	ai2_spawn ambush_striker_1
	#chr_neutral ambush_striker_1 1

	door_unlock 4
	door_open 4
	door_jam 4
	
	playback ambush_striker_1 IntroStrikerLeft01
	sleep f60
	#Konoko looks around
	chr_envanim Recep IntroSecBox01 norotation
	chr_animate Recep SECRETsit_talk 180
	cm_reset
	playback 0 IntroKonokoLook
	sleep f30
	cinematic_start (KONangryfront, 180, 180, 20, 7, 10, false)
	sleep f170
	#Konoko says we got company
	playback Recep IntroRecepRun
	cm_interpolate IntroCamCompany 0
	sound_dialog_play c02_05_14konoko
	sleep f30
	playback Recep IntroRecepRun
	sound_dialog_play_block pause
	cinematic_stop (KONangryfront, 19 ,20)
	#gameplay resumes
	cm_reset
	env_show 561 1
	env_show 560 0
	end_cutscene

	ai2_attack partner_cop_1 ambush_striker_1
	ai2_attack partner_cop_2 ambush_striker_3

	chr_delete 1050
	chr_delete Barabus
	particle IntroLight01 kill
	sleep f90
	#chr_delete Recep
	
	door_lock 1
	door_unjam 4
	door_lock 4
	door_unjam 21
	set_objective_1
	
	save_point_1
}

func void
Chase(
	void)
{
	sleep 60
	begin_cutscene jello
#	sleep f10
#	cm_orbit .1
	sleep f30
	chr_animate 0 KONOKOwatch_start 60
	sleep f40
	cinematic_start (KONtalking, 180, 180, 15, 1, 20, false)
	cinematic_start (GRIFtalking, 180, 180, 16, 3, 20, true)
	sleep f19
	chr_animate 0 KONOKOwatch_idle 3000

	sound_music_volume atm_low_perc1 0.35 1.0

	sound_dialog_play c02_06_01konoko
	sound_dialog_play_block pause
	sound_dialog_play c02_06_02griffin
	sound_dialog_play_block pause
	sound_dialog_play c02_06_03konoko
	sound_dialog_play_block pause
	sound_dialog_play c02_06_04griffin
	sound_dialog_play_block pause
	sound_dialog_play c02_06_05konoko
	sound_dialog_play_block pause
	sound_dialog_play c02_06_06griffin
	sound_dialog_play_block pause
	sound_dialog_play c02_06_07konoko
	sound_dialog_play_block pause
	cinematic_stop (KONtalking, 15,20)
	cinematic_stop (GRIFtalking, 16,20)
	chr_animate 0 KONOKOwatch_stop
	sleep f15
	cm_reset
	end_cutscene

	sound_music_volume atm_low_perc1 .90 1.0
	
	striker_counter = striker_counter + 2
	particle save1b_locklight01 do start
	door_unlock 11
	console_deactivate 15
	
	if (alarm_counter eq 1)		
		{
		ai2_spawn hall_striker_2
		ai2_tripalarm konoko 1
		}
}


func void
Griffin_1(
	void)
{
	begin_cutscene jello
	sound_ambient_stop alarm_loop
	sleep f30
	chr_animate 0 KONOKOwatch_start 60
	sleep 40
	cinematic_start (KONtalking, 180, 180, 15, 1, 20, false)
	cinematic_start (GRIFtalking, 180, 180, 16, 3, 20, true)
	sleep f19
	chr_animate 0 KONOKOwatch_idle 3000
	sound_dialog_play c02_07_01griffin
	sound_dialog_play_block pause
	sound_dialog_play c02_07_02konoko
	sound_dialog_play_block pause
	chr_animate 0 KONOKOwatch_stop
	cinematic_stop (KONtalking, 15,20)
	cinematic_stop (GRIFtalking, 16,20)
	sleep f15
	cm_reset
	end_cutscene
}


func void
outro(
	void)
{
	begin_cutscene
	env_show 555 1
	env_show 556 0
	#Konok talks on watch radio to Griffin
	#playback 0 OutroKonokoSet
	##cm_interpolate OutroCam00 0
	##cm_interpolate_block OutroCam01 180
	fork soundplay
	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_end=.999
	gl_fog_start_changeto 0.92 60
	sleep f60
	sleep f30
	playback 0 OutroKonokoRun
	cm_interpolate OutroCam00 0
	cm_interpolate_block OutroCam01 180
	sleep f120
	#Konoko jumps out of room
	playback 0 OutroKonoko01
	cm_interpolate OutroCam02 0
	sleep f60
	#cm_interpolate_block OutroCam03 180
	sleep f40
	particle OutroCharge do explode
	sleep f200
	#Konoko runs out of room
	playback 0 OutroKonoko02
	door_open 4
	door_jam 4
	cm_interpolate OutroCam04 0
	sleep f90
	cm_interpolate_block OutroCam05 180
	sleep f180
	#Konoko runs out of front door
	cm_interpolate OutroCam06 0
	cm_interpolate_block OutroCam07 180
	sleep f100
	door_open 1
	door_jam 1
	sleep f140
	fade_out 0 0 0 120
	#win
}

func void
soundplay(
	void)
{
	cinematic_start (GRIFtalking, 180, 180, 15, 1, 20, false)
	sound_dialog_play c02_09_01griffin
	sleep f60
	sound_dialog_play_block pause
	sound_dialog_play c02_09_02kerr
	cinematic_start (KERRtalking, 180, 180, 16, 3, 20, true)	
	sound_dialog_play_block pause
	sound_dialog_play c02_09_03griffin
	sound_dialog_play_block pause
	sound_dialog_play c02_09_04kerr
	sound_dialog_play_block pause
	sound_dialog_play c02_09_05griffin
	sound_dialog_play_block pause
	sound_dialog_play c02_09_06kerr
	sound_dialog_play_block pause
	sound_dialog_play c02_09_07griffin
	sound_dialog_play_block pause
	cinematic_stop (KERRtalking, 16,20)
	cinematic_stop (GRIFtalking, 15,20)
	sleep f100
	gl_fog_end=1
	gl_fog_start=.975
	win
}



func void
animate(
	void)
{
	env_anim 1101 1
	env_anim 1102 1
	env_anim 1103 1
	env_anim 1104 1
	env_anim 1105 1
	env_anim 1106 1
	env_anim 1107 1
	env_anim 1108 1
	env_anim 1109 1
	env_anim 1110 1
	env_anim 1111 1
	env_anim 1201 1
	env_anim 1202 1
	env_anim 1203 1
	env_anim 1204 1
}
