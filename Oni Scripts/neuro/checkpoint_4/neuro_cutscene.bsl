#
# neuro_cutscene.bsl
#

func void
neuro_cs_intro(
	void)
{
	fade_out 0 0 0 0		
	env_show 271 0
	env_show 272 0
	obj_create 271 272
	cm_interpolate IntroCamOut01 0
	sleep f14
	obj_shade 271 272 .4 .4 .2
	begin_cutscene							
	sleep f1
	sound_music_start mus_low1 1.0
	#fork music_force_stop
	#Camera shot outside
	cm_interpolate IntroCamOut01 0
	ai2_spawn IntroTCTF01
	playback IntroTCTF01 IntroSecSet
	fade_in 60
	sleep f100
	playback IntroTCTF01 IntroSecStart
	sleep f200
	#Lobby shot
	cm_interpolate IntroCamIn01 0
	sleep f180
	sound_dialog_play c13_47_03blackops
	cinematic_start (TCTFtalking, 180, 180, 20, 9, 20, true)
	sleep f60
	#Security lets guy in
	cm_interpolate IntroCamSecSet 0
	playback IntroTCTF01 IntroSecSet
	sleep f150
	sound_dialog_play c13_47_04opsguard2
	cinematic_start (BOPSface, 180, 180, 15, 1, 20, false)	
	sleep f150
	cinematic_stop (BOPSface, 15, 20)
	cinematic_stop (TCTFtalking, 20, 20)
	#Door opens
	ai2_spawn IntroTCTF02
	cm_interpolate IntroCamDoorOpen 0
	playback IntroTCTF01 IntroSecSet
	playback IntroTCTF02 IntroSecWalk
	env_anim 271 272
	sound_ambient_start c12_42_00door
	sleep f240
	#camera inside looking down
	cm_interpolate IntroCamTopDown 0
	playback 0 IntroKonCrouch
	chr_animate 0 KONOKOcrouch_idle 1000
	sleep f300
	#camera showing security talking
	playback IntroTCTF01 IntroSecMonitor01
	#cm_interpolate IntroCamBothTalk 0
	#sleep f180
	#Security goes over to monitors
	cm_interpolate IntroCamMonitorMid 0
	playback IntroTCTF02 IntroSecMonitor02
	#next line was 180
	sleep f120
	sound_dialog_play c13_47_01opsguard1
	cinematic_start (TCTFtalking, 180, 180, 20, 9, 20, true)
	sleep f60
	#konoko jumps down behind Security
	cm_interpolate IntroCamKonDrop 0
	sleep f120
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev14_IntroJump
	#Konoko hides from guys
	chr_envanim_block 0 IntroKonBox02 norotation
	cm_anim both IntroCamHide
	sound_dialog_play c13_47_02opsguard2
	cinematic_start (BOPSface, 180, 180, 15, 1, 20, false)	
	sleep f100
	chr_animate 0 KONOKOlev14_IntroHide
	sound_dialog_play_block pause
	cinematic_stop (BOPSface, 15, 20)
	cinematic_stop (TCTFtalking, 20, 20)
	#Show doors closing
	cm_wait
	cm_interpolate IntroCamDoors 0
	env_setanim 271 IntroDoorRt01
	env_setanim 272 IntroDoorLt01
	sound_ambient_start c13_04_03doorclose
	sleep f120
	#Konoko makes a run for it
	env_setanim 271 IntroDoorRt01
	env_setanim 272 IntroDoorLt01
	cm_anim both IntroCamKonRun
	chr_envanim 0 IntroKonBox03 norotation
	chr_animate 0 KONOKOlev14_IntroRun
	sound_music_stop mus_low1
	#Konoko dives through closing door and sec turns around
	cm_anim_block both IntroCamKonDive
	chr_envanim 0 IntroKonBox04 norotation
	chr_animate 0 KONOKOlev14_IntroDive
	playback IntroTCTF01 IntroSecEnd
	chr_envanim IntroTCTF02 IntroSecBox01 norotation
	chr_animate IntroTCTF02 SECURIlev14_IntroTurn
	#reset cam outside
	cm_wait
	playback 0 IntroKonstart
	sleep f10
	cm_reset
	chr_delete IntroTCTF01
	chr_delete IntroTCTF02
	obj_kill 271 272
	env_show 271 1
	env_show 272 1
	env_shade 271 272 .4 .4 .2
	fork Setup_Intro
	fork set_objective_1
	end_cutscene
}


func void
spawn_kerr(
	void)
{
	ai2_spawn ScanKerr01
	ai2_passive ScanKerr01 1
	chr_unstoppable KerrKerr 1
	chr_delete KerrKerr
}


func void
scanner_start(
	void)
{
	var int number_near = 0;

	number_near = number_near + trigvolume_count(68);
	number_near = number_near + trigvolume_count(69);
	number_near = number_near + trigvolume_count(70);
	number_near = number_near + trigvolume_count(71);

	if (number_near eq 0) 
	{
		trigvolume_enable trigger_volume_13 0
		doscanscene
	}
}

##############################

func void wait_and_play_xtr5(void)
{
	sleep 60
	sound_music_start mus_xtr5 1.0
}


func void
doscanscene(
	void)
{
		sound_ambient_start lab_amb1 0.1
		sound_ambient_volume lab_amb1 1 2
		fork Scan_Guards	
		has_probed = 1
		begin_cutscene
		#hide scanner gunk
		env_show 51 0
		env_show 52 0
		env_show 53 0
		env_show 54 0
		env_show 55 0
		env_show 56 0
		env_show 57 0
		env_show 58 0
		env_show 59 0
		obj_create 51 59
		#create this character before konoko gets into the scanner room
		cm_interpolate ScanCamDocTalk 200
		#patrol Konoko to flag 1009
		ai2_takecontrol 1
		ai2_movetoflag 0 1009
		sleep f200
		#Konoko talks
		ai2_takecontrol 0
		playback 0 ScanKonokoSet
		sound_dialog_play c13_64_01konoko
		cinematic_start (KONlistening, 180, 180, 19, 7, 20, false)	
		sound_dialog_play_block pause
		sleep f15
		#Doctor says Go Sit in That Chair
		cm_interpolate ScanCamDocTalk 0
		sound_dialog_play c13_65_01kerr
		cinematic_start (KERRtalking, 180, 180, 20, 9, 20, true)
		sound_dialog_play_block pause
		sleep f25
		#Is this necessary?
		cm_interpolate ScanCamBoth 0
		sound_dialog_play c13_65_02konoko
		sound_dialog_play_block pause
		sleep f10
		sound_dialog_play c13_65_03kerr
		sound_dialog_play_block pause
		cinematic_stop (KERRtalking, 20, 20)
		#Konoko walk to chair & doctor walks to booth
		playback 0 ScanKonokoWalk
		cm_interpolate ScanCamKonWalk 0
		playback ScanKerr01 ScanDoctorWalk
		sleep f120
		sound_dialog_play c13_65_04konoko
		sleep f140
		cinematic_stop (KONlistening, 19, 20)
		#chair drops
		cm_interpolate ScanCamChairDown 0
		sleep f30
		cutscene_sync mark
		sound_ambient_start c18_01_29_effectsa
		sleep f30
		env_setanim 53 Scan_chair01
		env_setanim 54 Scan_chair02
		env_setanim 55 Scan_chair03
		sleep f30
		sleep f150
		#Doctor enters booth
		cm_interpolate ScanCamBoothIn 0
		sleep f200
		#show doctor in booth
		playback ScanKerr01 ScanDocBooth
		cm_interpolate ScanCamBooth 0
		chr_envanim 0 ScanKonBox04
		chr_animate 0 KONOKOlev14_scan 500
		sound_dialog_play c13_65_05kerr
		cinematic_start (KERRtalking, 180, 180, 20, 9, 20, true)
		sound_dialog_play_block pause
		cinematic_stop (KERRtalking, 20, 20)
		sleep f30
		#scanner starts
		env_setanim 51 Scan_arm01
		env_setanim 52 Scan_arm02
		env_setanim 53 Scan_chair0101
		env_setanim 54 Scan_chair0201
		env_setanim 55 Scan_chair0301
		env_setanim 56 Scan_tube01
		env_setanim 57 Scan_tube02
		env_setanim 58 Scan_tube03
		env_setanim 59 Scan_tube04
		chr_envanim 0 ScanKonBox01
		chr_animate 0 KONOKOlev14_scan 2000
		cm_interpolate ScanCamScan01 0
		sleep f60
		cutscene_sync mark
		sound_ambient_start c18_01_29_effectsb
		sleep f120
		cm_interpolate_block ScanCamScan02 300
		#Konoko gets scanned
		chr_envanim_block 0 ScanKonBox02
		chr_animate 0 KONOKOlev14_scan 2000
		cm_interpolate ScanCamScan03 0
		cm_interpolate_block ScanCamScan04 360
		particle brainscan do start
		sound_ambient_start scanner
		sleep f120
		sound_ambient_volume scanner .5 2
		sleep f60
		#Doctor in booth
		sound_dialog_play c13_65_07kerr
		cinematic_start (KERRtalking, 180, 180, 20, 9, 20, true)
		cm_interpolate_block ScanCamBoothOut 0
		sleep f10
		sound_dialog_play c13_65_08konoko
		cinematic_start (KONdeepthought, 180, 180, 19, 7, 20, false)	
		sound_dialog_play_block pause
		#Doctrof rom inside booth
		cm_interpolate ScanCamBooth 0
		sound_dialog_play c13_65_09kerr
		sound_dialog_play_block pause
		#konoko scanned
		chr_envanim 0 ScanKonBox02
		chr_animate 0 KONOKOlev14_scan 2000
		cm_interpolate ScanCamScan02 0
		cm_interpolate_block ScanCamScan01 1000
		sound_dialog_play c13_65_10konoko
		sound_dialog_play_block pause
		sound_dialog_play c13_65_11kerr
		sound_dialog_play_block pause
		sound_dialog_play c13_65_12konoko
		sound_dialog_play_block pause
		cm_interpolate ScanCamBoothOut02 0
		cm_interpolate_block ScanCamBoothOut 900
		sound_dialog_play c13_65_13kerr
		sound_dialog_play_block pause
		cm_interpolate ScanCamScan04 0
		cm_interpolate_block ScanCamScan03 800
		sound_dialog_play c13_65_14konoko
		sound_dialog_play_block pause
		sleep f75
		cm_interpolate ScanCamBoothOut 0
		cm_interpolate_block ScanCamBoothOut02 900
		sound_dialog_play c13_65_15kerr
		sound_dialog_play_block pause
		sleep f25
		sound_dialog_play c13_65_16konoko
		sound_dialog_play_block pause
		sleep f20
		#Doc in Booth
		sound_dialog_play c13_65_17kerr
		sleep f100
		#Scanner stops
		particle brainscan do stop
		cutscene_sync_mark
		sound_ambient_stop scanner
		env_setanim 51 Scan_arm0102
		env_setanim 52 Scan_arm0202
		env_setanim 53 Scan_chair0102
		env_setanim 54 Scan_chair0202
		env_setanim 55 Scan_chair0302
		env_setanim 56 Scan_tube0102
		env_setanim 57 Scan_tube0202
		env_setanim 58 Scan_tube0302
		env_setanim 59 Scan_tube0402
		chr_envanim 0 ScanKonBox03
		chr_animate 0 KONOKOlev14_scan 730
		cm_interpolate ScanCamScan01 0
		cutscene_sync mark
		sound_ambient_start c18_01_29_effectsc
		cm_interpolate_block ScanCamScanStop 300
		sleep f700
		cinematic_stop (KONdeepthought, 19, 20)
		cinematic_stop (KERRtalking, 20, 20)
		#Doctor comes out of booth
		playback ScanKerr01 ScanDocWalkOut
		cm_interpolate ScanCamBoothOut 0
		sleep f60
		playback 0 ScanKonDone
		sleep f150
		sleep f80
		#Konoko and Doc meet to talk
		cm_interpolate ScanCamBoth02 0
		cm_interpolate_block ScanCamBoth03 300
		sleep f120
		sound_dialog_play c13_65_18konoko
		cinematic_start (KONlistening, 180, 180, 19, 7, 20, false)	
		sleep f240
		#Doc talks
		playback ScanKerr01 ScanDoctorSet
		cm_interpolate ScanCamDocTalk 0
		cm_interpolate_block ScanCamDocTalk02 1100
		sound_dialog_play c13_65_19kerr
		cinematic_start (KERRtalking, 180, 180, 20, 9, 20, true)
		sound_dialog_play_block pause
		sound_dialog_play c13_65_20konoko
		sound_dialog_play_block pause
		sound_dialog_play c13_65_21kerr
		sound_music_start mus_sad1 0.8
		sound_dialog_play_block pause
		#KOnoko talks
		playback 0 ScanKonokoSet
		cm_interpolate ScanCamKonTalk 0
		cm_interpolate_block ScanCamKonTalk03 600
		sound_dialog_play_block pause
		sound_dialog_play c13_65_22konoko
		sound_dialog_play_block pause
		sleep f25
		sound_dialog_play c13_65_23kerr
		sound_dialog_play_block pause
		#Both talk
		cm_interpolate ScanCamTalkBoth 0
		cm_interpolate_block ScanCamTalkBoth02 800
		sound_dialog_play_block pause
		sound_dialog_play c13_65_24konoko
		sound_dialog_play_block pause
		sleep f55
		sound_dialog_play c13_65_25kerr
		sound_dialog_play_block pause
		sleep f40
		#Konoko cam
		cm_interpolate ScanCamKonTalk04 0
		cm_interpolate_block ScanCamKonTalk 1000
		sound_dialog_play c13_65_26konoko
		sound_dialog_play_block pause
		#KerrCam
		cm_interpolate ScanCamDocTalk02 0
		cm_interpolate_block ScanCamDocTalk03 800
		sound_dialog_play c13_65_27kerr
		sound_dialog_play_block pause
		#BothCam
		cm_interpolate ScanCamTalkBoth02 0
		cm_interpolate_block ScanCamTalkBoth 1000
		sound_dialog_play c13_65_28konoko
		sound_dialog_play_block pause
		sleep f25
		sound_dialog_play c13_65_29kerr
		sound_dialog_play_block pause
		sound_dialog_play c13_65_30konoko
		sound_dialog_play_block pause
		sleep f20
		sound_dialog_play c13_65_31kerr
		sound_dialog_play_block pause
		sleep f20
		sound_dialog_play c13_65_32konoko
		sound_dialog_play_block pause
		sleep f20
		#KerrCam
		cm_interpolate ScanCamDocTalk 0
		cm_interpolate_block ScanCamDocTalk03 1000
		sound_dialog_play c13_65_33kerr
		sound_dialog_play_block pause
		sleep f20
		#Konoko cam
		cm_interpolate ScanCamKonTalk02 0
		cm_interpolate_block ScanCamKonTalk 800
		sound_dialog_play c13_65_34konoko
		sound_dialog_play_block pause
		#BothCam
		cm_interpolate ScanCamTalkBoth02 0
		cm_interpolate_block ScanCamTalkBoth 800
		sound_dialog_play c13_65_35kerr
		sound_dialog_play_block pause
		sound_dialog_play c13_65_36konoko
		sound_dialog_play_block pause
		sleep f20
		#show scanner gunk and hide scanner objects
		env_show 51 1
		env_show 52 1
		env_show 53 1
		env_show 54 1
		env_show 55 1
		env_show 56 1
		env_show 57 1
		env_show 58 1
		env_show 59 1
		obj_kill 51 59
		sound_dialog_play_block pause
		sound_dialog_play c13_65_37kerr
		sound_dialog_play_block pause
#		#Ambush sequence starts
		#dOORS start to open
		sound_music_stop mus_sad1
		door_open 7
		ai2_spawn ScanOps01
		ai2_setmovementmode ScanOps01 run
		playback ScanOps01 AmbushTCTFenter
		sleep f60
		#Konoko and Doctor hear doors opening
		cm_interpolate AmbushCamTurn 0
		playback ScanKerr01 AmbushDoctorTurn
		sleep f10
		chr_animate 0 KONCOMstartle_lt1
		sleep f60
		#TCTF is shown entering
		playback ScanOps01 AmbushTCTFenter011
		cinematic_stop (KONlistening, 19, 20)
		cinematic_stop (KERRtalking, 20, 20)
		cm_interpolate AmbushCamTCTFenter02 160
		sleep f120
		sound_dialog_play c13_65_38opsguard1
		cinematic_start (BOPSface, 180, 180, 15, 1, 20, false)
		particle_temp_start
		sound_dialog_play_block
		cinematic_stop (BOPSface, 15, 20)
		#TCTF shoots gun
		playback ScanOps01 AmbushTCTFshoot fromhere
		sleep f40
		particle_temp_kill
		#Doctor takes bullets for konoko
		#chr_envanim 0 AmbushKonBox02 norotation
		#chr_animate 0 KONOKOlev14_Ambush01
		#chr_envanim ScanKerr01 AmbushKerrBox02 norotation
		#chr_animate ScanKerr01 DOClev14_Ambush01
		#cm_anim both AmbushCamDie01
		#sleep f30
		#other angle of above
		slowmo 120
		cm_anim both AmbushCamDie02
		chr_envanim 0 AmbushKonBox02 norotation
		chr_animate 0 KONOKOlev14_Ambush01
		chr_envanim ScanKerr01 AmbushKerrBox02 norotation
		chr_animate ScanKerr01 DOClev14_Ambush01
		cm_anim both AmbushCamDie02
		sleep f22
		particle_temp_stop
		particle ScanMerc pulse
		sleep f1
		particle scanexplode create
		sound_dialog_play kerr_dth1

		fork wait_and_play_xtr5

		#TCTF says you're next
		cm_wait
		ai2_kill ScanKerr01
		#chr_set_health ScanKerr01 0
		cm_interpolate ScanCamSynDie 0
		playback 0 ScanKonDie
		sleep f120
		#konoko says let's get it on gameplay resumes
		cm_interpolate ScanCamKonDie 0
		sound_dialog_play c13_65_39konoko
		cinematic_start (KONangryfront, 180, 180, 19, 7, 20, true)	
 		sound_dialog_play_block pause
		cinematic_stop (KONangryfront, 20, 20)
		cm_reset
		fork set_objective_3
		trigvolume_enable trigger_volume_13 0

		# CB: set up the monologue for konoko telling herself about her next objective
		prepare_vat_monologue();

		end_cutscene
		env_show 823 0
		save_point_3

		sound_ambient_volume lab_amb1 0 4

		sleep 120
		post_scan_music_start
}

func void
KerrSpawn(void)
{
		ai2_spawn KerrKerr
		#playback KerrKerr KerrKerrSet
		ai2_passive KerrKerr 1
}

func void
Kerr(void)
{
	if(trigvolume_count(36) eq 0)
	{
		sound_music_start mus_sad1 0.8
		begin_cutscene
		#ai2_spawn KerrKerr
		ai2_takecontrol 1
		ai2_movetoflag 0 1261 setfacing
		playback KerrKerr KerrKerrSet
		cm_interpolate KerrCamKerr 180
		sleep f100
		#Konoko says Hi Uncle
		sound_dialog_play c13_64_01konoko
		cinematic_start (KONlistening, 180, 180, 19, 9, 20, true)
		sound_dialog_play_block pause
		#Kerr says what are you doing here?
		cm_interpolate KerrCamKerr 180
		sound_dialog_play c13_64_02kerr
		cinematic_start (KERRtalking, 180, 180, 16, 1, 20, false)
		sound_dialog_play_block pause
		#Konoko says I need your help
		playback 0 KerrKonSet
		cm_interpolate KerrCamLt02 0
		cm_interpolate_block KerrCamLt01 800
		sound_dialog_play c13_64_03konoko
		sound_dialog_play_block pause
		#Kerr says yep, you do
		sound_dialog_play c13_64_04kerr
		sound_dialog_play_block pause
		sleep f20
		#Konoko says I'm on it
		sound_dialog_play c13_64_05konoko
		sound_dialog_play_block pause
		sleep f30
		#Kerr says meet me in lab
		sound_dialog_play c13_64_06kerr
		sound_dialog_play_block pause
		cinematic_stop (KONlistening, 20, 20)
		cinematic_stop (KERRtalking, 15, 20)
		cm_reset
		letterbox 0
		playback KerrKerr KerrKerrGive fromhere
		sleep f90
		chr_animate KerrKerr COMGUYact_give
		chr_animate 0 KONOKOact_give
		sleep f90
		give_powerup hypo
		sleep f2
		give_powerup hypo
		ai2_takecontrol 0
		fork set_objective_2
		end_cutscene
		trigvolume_enable Kerr_trig 0
		trigvolume_enable Kerr_trig_copy 0
		console_activate 13
		save_point_2
		sound_music_volume mus_sad1 0 2
		kerr_console_music
	}	
}


func void Acid01(string char)
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
	chr_animate(char, KONOKOacid);
	trigvolume_enable LastVat 0
	cm_interpolate AcidCam01 500
	sleep 5
	input 0
	invincible=1
	sleep 525
	chr_animate(char, KONOKOlev14_grinder);
	chr_envanim(char, GrinderKonBox01, norotation);
	sleep f60
	sound_ambient_start c13_47_11_bonecrunch
	sleep f10
	sound_impulse_play konoko_gruesome_death
	sleep f75
	chr_set_health(char, 0);
  }
}


func void Acid02(string char)
{
  var bool eggman;

  eggman = chr_is_player(char);

  if (eggman eq 0)
  {
    chr_animate(char, KONOKOacid);
    sleep f10
    chr_set_health(char, 0);
  }

  if (eggman eq 1)
  {
	chr_animate(char, KONOKOacid);
	input 0
	trigvolume_enable LastVat 0
	cm_interpolate AcidCam01 400
	sleep f5
	invincible=1
	sleep f430
	chr_animate(char, KONOKOlev14_grinder);
	chr_envanim(char, GrinderKonBox01, norotation);
	sleep f60
	sound_ambient_start c13_47_11_bonecrunch
	sleep f10
	sound_impulse_play konoko_gruesome_death
	sleep f75
	chr_set_health(char, 0);
  }
}



func void Acid03(string char)
{
  var bool eggman;

  eggman = chr_is_player(char);

  if (eggman eq 0)
  {
    chr_animate(char, KONOKOacid);
    sleep f10
    chr_set_health(char, 0);
  }

  if (eggman eq 1)
  {
	input 0
	trigvolume_enable LastVat 0
	chr_animate(char, KONOKOacid);
	cm_interpolate AcidCam01 200
	sleep f5
	invincible=1
	sleep 230
	chr_animate(char, KONOKOlev14_grinder);
	chr_envanim(char, GrinderKonBox01, norotation);
	sleep f60
	sound_ambient_start c13_47_11_bonecrunch
	sleep f10
	sound_impulse_play konoko_gruesome_death
	sleep f75
	chr_set_health(char, 0);
  }
}



func void acid04(string char)
{
  var bool eggman;

  eggman = chr_is_player(char);

  if (eggman eq 0)
  {
    chr_animate(char, KONOKOacid);
    sleep f10
    chr_set_health(char, 0);
  }

  if (eggman eq 1)
  {
	cm_detach
	input 0
	trigvolume_enable LastVat 0
	chr_animate(char, KONOKOacid);
	sleep f5
	invincible=1
	sleep 40
	cm_interpolate GrinderCamEnd 0
	sleep f10
	chr_animate(char, KONOKOlev14_grinderend);
	chr_envanim(char, EndGrinderKonBox01, norotation);
	sleep f60
	sound_ambient_start c13_47_11_bonecrunch
	sleep f10
	sound_impulse_play konoko_gruesome_death
	sleep f75
	chr_set_health(char, 0);
  }
}





func void
EndScan(
	void)
{
	sound_dialog_play c13_66_01konoko
	cinematic_start (KONtalkangryfront, 180, 180, 19, 7, 20)
	sound_dialog_play_block
	sleep f60
	cinematic_stop (KONtalkangryfront, 19, 20)
}


func void
CraneTalk(
	void)
{
	sound_dialog_play c13_66_03konoko
	cinematic_start (KONtalkangryfront, 180, 180, 19, 7, 20)
	sound_dialog_play_block
	sleep f60
	cinematic_stop (KONtalkangryfront, 19, 20)	
}

func void
BeginVat(
	void)
{
	sound_dialog_play c13_66_02konoko	
	cinematic_start (KONtalkangryfront, 180, 180, 19, 7, 20)
	sound_dialog_play_block
	sleep f60
	cinematic_stop (KONtalkangryfront, 19, 20)
}


func void
Outro(
	void)
{
	if(final_check eq 0)
	{
		dprint OUTRO_1
		begin_cutscene
		trigvolume_enable LastVat 0
		ai2_takecontrol 1
		ai2_movetoflag 0 222
		sleep f200
		Outro2
	}

	if(final_check ne 0)
	{
		Outro2
	}
}

func void
Outro2(
	void)
{
	dprint OUTRO_2
	begin_cutscene
	trigvolume_enable LastVat 0
	ai2_takecontrol 1	
	#dialog talking about how to get to the crane
	#Konoko runs to Crane
	cm_interpolate OutroCam01 0
	sound_dialog_play c13_66_04konoko
	cinematic_start (KONintense, 180, 180, 19, 7, 20)
	sound_dialog_play_block
	chr_envanim 0 OutroKonBox01 norotation
	env_anim 71 74
	cm_anim both OutroCam01
	cutscene_sync mark
	sound_ambient_start c13_59_22_crane
	sleep f150
	chr_animate 0 KONOKOlev14_Run
	#Konoko jumps to Crane
	cm_anim_block both OutroCamJump
	chr_envanim 0 OutroKonBox02 norotation
	chr_animate 0 KONOKOlev14_Jump
	env_setanim 71 cranehook_jump
	env_setanim 72 cranerope_jump
	#Konoko tucks over shredders
	cm_anim_block both OutroCamTuck
	chr_envanim 0 OutroKonBox03 norotation
	chr_animate 0 KONOKOlev14_Tuck
	env_setanim 71 cranehook_tuck
	env_setanim 72 cranerope_tuck
	sleep f160
	sound_dialog_play c13_66_05konoko
	#Konoko dives into acid
	chr_nocollision 0 1
	cm_anim_block both OutroCamDive
	chr_envanim 0 OutroKonBox04 norotation
	chr_animate 0 KONOKOlev14_Dive
	env_setanim 71 cranehook_dive
	env_setanim 72 cranerope_dive
	sleep f90
	cinematic_stop (KONintense, 20, 20)
	sleep f60
	particle OutroSplash create
	sound_ambient_start c14_15_12_splash
	sleep f120
	sound_ambient_start c14_16_18_bubbles	
	sleep f80



	### CB: this is the two-guys-at-the-acid-pool script
#	playback OutroTCTF1 OutroTCTFSwat01
#	playback OutroTCTF2 OutroTCTFLite01
#	sleep f100
#	cm_interpolate OutroCamWater01 0
#	sleep f120
#	sound_dialog_play c13_67_01opsguard1
#	cinematic_start (TCTFtalking, 180, 180, 19, 7, 20, false)
#	sound_dialog_play_block
#	sound_dialog_play c13_67_02opsguard2
#	cinematic_start (BOPSface, 180, 180, 20, 9, 20, true)
#	sound_dialog_play_block
#	#TCTFguys from birds eye
#	cm_interpolate OutroCamWater02 0
#	#sound_dialog_play c13_67_03opsguard3
#	#sound_dialog_play_block
#	#sound_dialog_play c13_67_04opsguard1
#	#sound_dialog_play_block
#	sleep f30
#	sound_dialog_play c13_67_05opsguard2
#	sound_dialog_play_block
#	cinematic_stop (BOPSface, 20, 20)
#	cinematic_stop (TCTFtalking, 19, 20)






	### CB: this is the same script with a third character added
	ai2_spawn OutroTCTF1
	ai2_spawn OutroTCTF2
	ai2_spawn OutroTCTF3
	playback OutroTCTF1 OutroTCTFSwat01
	playback OutroTCTF2 OutroTCTFLite01
	sleep f40
	playback OutroTCTF3 OutroTCTFLite02
	sleep f60
	cm_interpolate OutroCamWater01 0
	sleep f120
	sound_dialog_play c13_67_01opsguard1
	cinematic_start (TCTFtalking, 180, 180, 19, 7, 20, false)
	sound_dialog_play_block
	sound_dialog_play c13_67_02opsguard2
	cinematic_start (BOPSface, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block
	sound_dialog_play c13_67_03opsguard3
	sound_dialog_play_block
	cinematic_stop (BOPSface, 20, 20)
	cinematic_stop (TCTFtalking, 19, 20)

	#TCTFguys from birds eye
	cm_interpolate OutroCamWater02 0
	sleep f40
	cinematic_start (TCTFtalking, 180, 180, 20, 9, 20, true)
	sound_dialog_play c13_67_04opsguard1
	sound_dialog_play_block
	sleep f30
	cinematic_start (BOPSface, 180, 180, 19, 7, 20, false)
	sound_dialog_play c13_67_05opsguard2
	sound_dialog_play_block
	sleep f140
	cinematic_stop (BOPSface, 19, 20)
	cinematic_stop (TCTFtalking, 20, 20)




	sleep f140
	win
}

