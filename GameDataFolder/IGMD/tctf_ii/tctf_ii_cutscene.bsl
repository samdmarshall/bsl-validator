#
# tctf_cutscene.bsl
#

func void
Intro(
	void)
{
	fade_out 0 0 0 0
	cm_interpolate IntroCam01 0
	sleep f14
	begin_cutscene weapon
	marketing_line_off=1
	letterbox 1
	sleep f60
	invincible=1
	obj_create 401 402
	obj_create 404 407
	fade_in 90
	#Outside shot of TCTF
	cm_interpolate IntroCam01 0
	playback 0 IntroKonokoSet
	sleep f300
	#Griffin and Guy talking
	chr_create 1201 start
	chr_create 1202 start
	playback 1202 IntroTCTF01
	#make this box animation last as long as conversation
	chr_envanim 1201 IntroGriffinBox01
	chr_animate 1201 COMGUYsit_idle1 1800
	#Conversation between the two
	cm_interpolate IntroCam02 0
	sound_dialog_play c14_50_01scigoon1
	cinematic_start (COPtalking, 180, 180, 15, 1, 20, false)
	sound_dialog_play_block pause
	cm_interpolate IntroCamGriffin 0
	sound_dialog_play c14_50_02griffin
	cinematic_start (GRIFtalking, 180, 180, 16, 3, 20, true)
	sound_dialog_play_block pause
	#TCTF walks out
	sound_music_start atm_low_perc2 0.8
	cm_interpolate IntroCam02 0
	playback 1202 IntroTCTF02
	sound_dialog_play c14_50_03scigoon1
	sleep f240
	cinematic_stop (COPtalking, 15, 20)
	cinematic_stop (GRIFtalking, 15, 20)
	sleep f60
	door_open 70
	door_jam 70
	sleep f100
	#KONOKO on roof
	playback 0 IntroKonoko01
	cm_interpolate IntroCamInside01 0
	cm_interpolate_block IntroCamInside02 400
	sleep f400
	cm_anim both IntroCamRoof
	sleep f210
	#Konoko falls into view
	cm_anim both IntroCamFall01
	chr_envanim 0 IntroKonBox01 norotation
	chr_animate 0 KONOKOlev18_IntroFall01 140
	#Griffin gets surprised
	chr_delete 1202
	cm_anim_block both IntroCamStand01
	chr_envanim 1201 IntroGriffinBox02 norotation
	chr_animate 1201 GRIFINlev18_IntroStand 110
	env_anim 401 401
	sleep f88
	#Konoko enters office
	playback 0 IntroKonoko02
	cm_interpolate_block IntroCamKonAim01 0
	cm_interpolate_block IntroCamKonAim02 350
	sleep f140
	cinematic_start(KONangryfront, 180, 180, 18, 6, 30, true)
	sound_dialog_play c14_50_04konoko
	sound_dialog_play_block pause
	cinematic_stop (KONangryfront, 18, 30)
	#Conversation with Griffin
	playback 1201 IntroGriffin
	cm_interpolate IntroCamGriffin02 0
	cinematic_start(GRIFtalkangry, 180,180,18,6,30, true)
	sound_dialog_play c14_50_05griffin
	sound_dialog_play_block pause
	cinematic_stop (GRIFtalkangry, 18, 30)
	#Griffin's office goes down
	sound_music_volume atm_low_perc2 0.0 0.5
	sound_music_stop atm_low_perc2
	music_intro
	env_show 403 0
	obj_create 403 403
	cm_anim both IntroCamEscape01
	chr_envanim 1201 IntroGriffinBox03 norotation
	env_setanim 401 IntroChair02
	env_anim 402 407
	cutscene_sync mark
	sound_ambient_start c14_46_11grifdesk
	sleep f16
	playback 0 IntroKonokoAim fromhere
	cm_anim_block both IntroCamEscape02
	cm_wait
	cm_reset
	obj_kill 401 407
	# look out Stefan is editing scripts; yo foolios need to turn back on the laser sight :O)
	marketing_line_off=0
	end_cutscene
	invincible=0
	chr_delete 1201
	door_unjam 70
	door_close 70
	# who is a foolio? the foo or the foo who follows him?
	s1
}


func void
GrifSpawn(
	void)
{
	ai2_spawn ZomGrif
	chr_invincible ZomGrif 1
	chr_unstoppable ZomGrif 1
	ai2_makeignoreplayer ZomGrif 1
	ai2_setmovementmode ZomGrif walk
	playback ZomGrif ZomGrifDraw
}

func void create_zomshin(void)
{
	ai2_spawn ZomShin
	ai2_passive ZomShin 1
	chr_shadow ZomShin 0
	chr_invincible ZomShin 1
	chr_unstoppable ZomShin 1
	chr_nocollision ZomShin 1
	chr_neutral ZomShin 1
	chr_lock_active ZomShin
}

func void
Base(
	void)
{
	begin_cutscene
	#place Griffin here earlier
	#chr_neutral ZomGrif 1
	sleep f20
	#playback ZomGrif BaseGriffin01
	cm_interpolate BaseCam01 180
	sleep f210
	#place Konoko
	playback 0 BaseKonoko01
	cm_interpolate BaseCam02 0
	cm_interpolate_block BaseCam04 500
	sound_dialog_play c14_51_01konoko
	cinematic_start(KONangryfront, 180,180,19,7,20, true)
	sound_dialog_play_block pause
	cinematic_stop (KONangryfront, 19, 20)
	cm_interpolate BaseCam01 0
	cm_interpolate_block BaseCam03 600
	sound_dialog_play c14_51_02griffin
	cinematic_start(GRIFtalkangry, 180,180,20,9,20, true)
	sound_dialog_play_block pause
	cutscene_sync mark
	sound_ambient_start c15_04_23_effects
	sound_dialog_play c14_51_03griffin
	#Shinzom comes out of ground
	create_zomshin
	chr_envanim ZomShin ChairShinBox01
	obj_create 171 174
	env_anim 171 174
	obj_shade 171 174 .5 .5 .5
	cm_anim both ChairCamZomUp
	#chr_create ZomShin start
	#chr_neutral ZomShin 1
	sleep f270
	particle zombiespark pulse

	cm_wait

	particle zombient start
	#hide Chair object, show chair gunk
	env_show 171 1
	env_show 172 1
	env_show 173 1
	env_show 174 1
	obj_kill 171 174
	cm_interpolate BaseCamShin01 0
	playback ZomShin BaseShin
	cm_interpolate_block BaseCamShin02 300
	sound_dialog_play_block
	cinematic_stop (GRIFtalkangry, 20, 20)
	sound_dialog_play c14_51_04shinatama
	cinematic_start(SHINZOMlistening, 180,180,19,7,20, false)
	sound_dialog_play_block
	cinematic_stop (SHINZOMlistening, 19, 20)
	sleep f30
	particle Forcefield do start
	sound_ambient_start zomshin_amb_loop 0.1
	sound_ambient_volume zomshin_amb_loop 1.0 1.0
	cm_interpolate BaseCam02 0
	sound_dialog_play c14_51_05konoko
	cinematic_start(KONscared, 180,180,20,9,20, true)
	sound_dialog_play_block
	cinematic_stop (KONscared, 20, 20)
	playback ZomShin BaseShin
	cm_interpolate_block BaseCamShin02 0
	sound_dialog_play c14_51_06shinatama
	cinematic_start(SHINZOMlistening, 180,180,19,7,20, false)
	particle zombiesteam start
	sound_dialog_play_block pause
	cinematic_stop (SHINZOMlistening, 19, 20)
#	cm_reset
#	trig_show 9
#	trig_activate 9
	end_cutscene
	music_zom
	ai2_passive ZomShin 1
	ai2_makeignoreplayer ZomGrif 1
	zombie_round_2
#	ai2_allpassive 1
#	remove line below after zomshin puzzle is fixed
#	Zom
}

func void fade_out_zom_amb(void)
{
	sound_ambient_volume zomshin_amb_loop 0.0 1.0
	sleep 60
	sound_ambient_stop zomshin_amb_loop
}

func void
Zom(
	void)
{
	env_show 1010 0
	particle Forcefield do stop
	fork fade_out_zom_amb
	begin_cutscene
	marketing_line_off=1
	#Shinatama will already be created
	#show the destruction of the turrets and the forcefield around Griffin
	#cm_interpolate ZomCamGrif01 0
	ai2_setmovementmode ZomGrif walk
	playback ZomGrif ZomGrifDrawSet
	#sleep f120
	#Shinatama gets up out of chair
	chr_shadow ZomShin 1
	chr_invincible ZomShin 0
	chr_unstoppable ZomShin 0
	chr_envanim ZomShin ZomShinBox01 norotation
	chr_animate ZomShin SHINZOMlev18_Free
	cm_anim both ZomCamFree01
	sleep f90
	cutscene_sync mark
	sound_ambient_start c_shin_escape
	cm_wait
	#Griffin says "what are you doing?"
	cm_interpolate ZomCamGrif01 0
	sound_dialog_play c14_52_01griffin
	cinematic_start(GRIFtalkangry, 180,180,19,7,20, false)
	sound_dialog_play_block
	cinematic_stop(GRIFtalkangry, 19,20)
	#Shinatama approaches Griffin
	cm_interpolate ZomCamShinStart 0
	playback ZomShin ZomShinSet
	chr_animate ZomShin SHINZOMwalk1 180
	chr_nocollision ZomShin 0
	sleep f175
	#Griffin says GET BACK OR I'll SHOOT
	#cm_interpolate ZomCamGrif01 0
	#playback ZomGrif ZomGrifDrawSet
	#sleep f120
	#Shin keeps coming
	#cm_interpolate ZomCamShinApproach 0
	playback ZomShin ZomShinWalk
	chr_animate ZomShin SHINZOMwalk1 600
	#sleep f120
	#Griffin draws weapon
	cm_interpolate ZomCamGrif01 0
	playback ZomGrif ZomGrifDrawSet
	sleep f30
	#sound_dialog_play c14_52_01bgriffin
	playback ZomGrif ZomGrifDraw
	sleep f60
	#konoko drops weapon
	playback 0 ZomKonokoDrop
	#Shinatama Approaches Griffin
	cm_interpolate ZomCamBoth 0
	sleep f180
	#Griffin shoots
	cm_interpolate ZomCamGrifShoot 0
	playback ZomGrif ZomGrifShoot
	sleep f50
	#Shinatama gets hit
	cm_interpolate ZomCamShinDie 0
	chr_animate ZomShin SHINZOMshot 126
	sound_ambient_start c_shin_die 1.0
	sleep f120
	#Show Griffin over Shinatama
	cm_interpolate ZomCamDead 0
	playback ZomGrif ZomGriffinKilled
	chr_animate ZomShin SHINZOMfallen_front 1000
	sleep f10
	cm_interpolate ZomCamKonokoBehind 270
	playback 0 ZomKonokoBehind
	sleep f280
	#Griffin turns and gets thrown
	# CB: we force omnipotent off because it breaks this cutscene (you kill
	# griffin prematurely)
	omnipotent = 0
	chr_invincible ZomGrif 0
	chr_unstoppable ZomGrif 0
	ai2_kill ZomShin
	chr_neutral ZomGrif 0
	cm_interpolate ZomCamThrow 0
	playback ZomGrif ZomGriffinTurn
	playback 0 ZomKonokoThrow
	sleep f140
	#Knoko holds him down
	cm_interpolate ZomCamKonokoAim02 0
	chr_neutral ZomGrif 1
	chr_envanim ZomGrif ZomGriffinBox01 norotation
	chr_envanim 0 ZomKonokoBox01 norotation
	chr_animate 0 KONOKOlev18_ZomAim 300
	chr_animate ZomGrif GRIFINlev18_ZomAim 500
	sound_dialog_play c14_52_02konoko
	cinematic_start(KONangryfront, 180,180,19,7,20, false)
	sound_dialog_play_block pause
	#Looking down at griffin
	#chr_envanim 0 ZomKonokoBox01 norotation
	#chr_envanim ZomGrif ZomGriffinBox01 norotation
	#chr_animate 0 KONOKOlev18_ZomAim 300
	#chr_animate ZomGrif GRIFINlev18_ZomAim 500
	#cm_interpolate ZomCamKonokoAim01 0
	#KONoko gets off Griffin
	#cm_interpolate ZomCamKonokoAim02 0
	chr_envanim 0 ZomKonokoBox02 norotation
	chr_envanim ZomGrif ZomGriffinBox01 norotation
	chr_animate ZomGrif GRIFINlev18_ZomAim 500
	chr_animate 0 KONOKOlev18_ZomUp 120
	#sound_dialog_play c14_52_04konoko
	#Griffin gets up put the gun down
	sleep f100
	cm_interpolate ZomCamGriffinUp 0
	chr_envanim ZomGrif ZomGriffinBox02 norotation
	chr_animate ZomGrif GRIFINlev18_ZomUp
	sound_dialog_play c14_52_03griffin
	cinematic_start(GRIFbeatup, 180, 180, 20, 9, 20, true)
	sound_dialog_play_block pause
	#Konoko I'm a rogue agent, very dangerous
	playback 0 ZomKonokoFace
	cm_interpolate ZomCamKonokoFace 0
	sound_dialog_play c14_52_04konoko
	sound_dialog_play_block pause
	#Griffin says youre a monster
	cm_interpolate ZomCamGriffinFace 0
	playback ZomGrif ZomGriffinFace
	sound_dialog_play c14_52_05griffin
	sound_dialog_play_block pause
	#for you, badly
	cm_interpolate ZomCamKonokoFace 0
	sound_dialog_play c14_52_06konoko
	sound_dialog_play_block pause
	#Griffin says youre a monster
	cm_interpolate ZomCamGriffinFace 0
	sound_dialog_play c14_52_07griffin
	sound_dialog_play_block pause
	cinematic_stop(GRIFbeatup, 20, 20)
	cinematic_stop(KONangryfront, 19, 20)
	#Give player back control
	cm_reset
	end_cutscene
	ai2_allpassive 1
	chr_set_health ZomGrif 1
	marketing_line_off=0
	trigvolume_enable trigger_volume_35 1
	objective_set(5)
}

func void
OutroKill(
	void)
{
	sound_music_start mus_wls 1.0
	begin_cutscene jello
	sleep f40
	sound_dialog_play c14_53_01konoko
	cinematic_start(KONintense, 180,180,19,8,20, false)
	sound_dialog_play_block
	cinematic_stop (KONintense, 19, 20)
	fade_out 0 0 0 120
	sleep f120
	end_cutscene
	win
}


func void
OutroNoKill(
	void)
{
	begin_cutscene jello
	cm_detach
	ai2_takecontrol 1
	ai2_lookatchar 0 ZomGrif
	ai2_lookatchar ZomGrif 0
	sound_music_start mus_sad1
	sound_dialog_play c14_54_01konoko
	cinematic_start(KONlistening, 180,180,19,8,20, false)
	sleep f120
	cm_interpolate BaseCam01 180
	sound_dialog_play_block
	cinematic_stop (KONlistening, 19, 20)
	fade_out 0 0 0 120
	sleep f120
	end_cutscene
	win
}