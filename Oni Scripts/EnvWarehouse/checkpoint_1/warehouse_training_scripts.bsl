######################
# training variables #
######################

#checks to see if player is in correct room for executing current script
var int how_far_along=0;

#number of dash track lights
var int tcount=17;

#sees if player sprinted
var int didsprint;

#sees if player jumped up to big crate with power cell
var int powerupon;

#checks to see if OK to run training (for restored game funkiness)
var int can_train_movement = 1;

#continues crouch training
var int onto_crouch2;

#used to determine if dashing on track for the first time
var int A;

#used to determine if finished run was slow
var int B;

#set if running was failed
var int bad;

#used to measure performance of player
var int rating = 1;

#karen dies!
var int demo3dead;

#determines which jump script continues after getting on biggest crate	
var int got_ammo;

#prevents forcefield and particle/gunk from starting multiple times and not after jumping to the next room
var int forcefieldstopped;
var int particlestarted;

##################
# basic movement #
##################
func void train_movement(string ai_name)
{
	if (can_train_movement eq 1)
	{
		train_movement_internal
	}
}

func void train_movement_internal(void)
{
	fade_out 0 0 0 0
	cm_interpolate KonCamFoot01 0
	particle forcefield1 do start
	particle forcefield2 do start
	particle steam start
	ui_suppress_prompt=1
	ui_show_element left 0
	ui_show_element right 0
	target_set (1,0.0)
	env_show 2010 0
	how_far_along = 1;
	trigvolume_enable trigger_volume_54 0
	lock_keys 
	lock_keys keys_pause
	trigvolume_enable tv_train_door 0
	trigvolume_enable tv1 0
	trigvolume_enable tv2 0	
	trigvolume_enable tv3 0
	trigvolume_enable tv4 0
	trigvolume_enable tv5 0
	trigvolume_enable tv6 0
	trigvolume_enable tv7 0
	trigvolume_enable tv8 0
	trigvolume_enable tv9 0
	trigvolume_enable tv10 0
	trigvolume_enable tv11 0
	trigvolume_enable tv12 0
	trigvolume_enable tv13 0
	trigvolume_enable tv14 0
	trigvolume_enable tv15 0
	trigvolume_enable tv16 0
	trigvolume_enable tv17 0
	trigvolume_enable tv_move4 0
	trigvolume_enable tv_end 0
	trigvolume_enable tv_review 0
	console_deactivate 11

	dprint train_movement

	if(how_far_along eq 1)
	{	
		input 0
		fade_in 120
		sleep 90
		fork Kon
		####Shinatama telling Konoko that their neurolink is working perfectly, and telling her they're about to start training.
		cinematic_start (SHINnametag, 180, 180, 15, 1, 20, false)
		sleep f10
		music_train1
		sound_dialog_play c00_01_29shinatama
		sound_dialog_play_block pause
		sleep 30
		sound_dialog_play c00_01_30shinatama
		sound_dialog_play_block pause
		sleep 30
		sound_dialog_play c00_01_31shinatama
		sound_dialog_play_block pause		
		sleep 30
		sound_dialog_play c00_01_32shinatama
		sound_dialog_play_block pause
		sleep 30
		message xwelcome 240
		sound_dialog_play c00_01_35shinatama
		sound_dialog_play_block pause
		cinematic_stop (SHINnametag, 15, 20)
		input 1
	}

	if(how_far_along eq 1)
	{
		#use mouse
		message xmouse 
		chr_wait_animtype 0 standing_turn_left standing_turn_right
		message_remove xmouse
		sleep 60
		#move with wads
		lock_keys keys_movement 
		message xmove 
		chr_wait_animtype 0 run
		sleep 60
		message_remove xmove
		sleep 60
	}
	if(how_far_along eq 1)
	{
		#combine to move diag
		message xcombo 300
		sleep 300
	}
	if(how_far_along eq 1)
	{
		#control console
		message xconsole1
		sleep 30
		particle obj_control create
		trigvolume_enable trigger_volume_54 1
		console_activate 10
		lock_keys keys_action

	}
}

func void move2(string ai_name)
{
	#trigger volume near control console
	message_remove xmouse
	message_remove xmove
	message_remove xcombo
	message_remove xconsole1
	particle obj_control kill
}

func void lights(string ai_name)
{
		particle t17 create
		sleep 60
		particle t16 create
		sleep 60
		particle t15 create
		sleep 60
		particle t14 create
		sleep 60
		particle t13 create
		sleep 60
		particle t12 create
		sleep 60
		particle t11 create
		sleep 60
		particle t10 create
		sleep 60
		particle t9 create
		sleep 60
		particle t8 create
		sleep 60
		particle t7 create
		sleep 60
		particle t6 create
		sleep 60
		particle t5 create
		sleep 60
		particle t4 create
		sleep 60
		particle t3 create
		sleep 60
		particle t2 create
		sleep 60
		particle t1 create
}

func void move3(string ai_name)
{
	#used control console
	message_remove xactivate1
	particle obj_control kill
	sleep 60

	if(A eq 0)
	#first run, so warm up
	{
		if(how_far_along eq 1)
		{
			#we'll use lights for dash
			sound_dialog_play c00_01_36shinatama			
			message xactivate2 300
			fork lights
			sleep 30
			#better warmup
			sound_dialog_play_block c00_01_33shinatama
			sound_dialog_play_block pause	
		}
		
		if(how_far_along eq 1)
		{
			#turn and dash
			message xdash1
			fork encourage_dash
			chr_wait_animation 0 KONSPRrun_lt KONSPRrun_rt
			didsprint = 1
			message_remove xdash1
			message_remove xencouragedash
			sleep 60
			sound_dialog_play c00_01_37shinatama
		#	sound_dialog_play_block pause
		}

		if(how_far_along eq 1)
		{
			#beautiful sprint
			message xdash2 240
			sleep  240
		}

		if(how_far_along eq 1)
		{
			#dash is fast but loud
			message xdash3
			sound_dialog_play c00_01_38shinatama
			sound_dialog_play_block pause
		}
	}

	if(A eq 1)
	{
		tcount= 17;
		B = 0;
		bad = 0;
		if(how_far_along eq 1)
		{
		#	sound_dialog_play_block c00_01_41shinatama
			dprint kill_parts
			particle t17 kill
			particle t16 kill
			particle t15 kill
			particle t14 kill
			particle t13 kill
			particle t12 kill
			particle t11 kill
			particle t10 kill
			particle t9 kill
			particle t8 kill
			particle t7 kill
			particle t6 kill
			particle t5 kill
			particle t4 kill
			particle t3 kill
			particle t2 kill
			particle t1 kill
			dprint recreate_parts
			particle t17 create
			particle t16 create
			particle t15 create
			particle t14 create
			particle t13 create
			particle t12 create
			particle t11 create
			particle t10 create
			particle t9 create
			particle t8 create
			particle t7 create
			particle t6 create
			particle t5 create
			particle t4 create
			particle t3 create
			particle t2 create
			particle t1 create
			trigvolume_reset tv_move4 
		}
	}

	if(how_far_along eq 1)
	{
		message_remove xdash3
		sleep 60
		#goto track and trigger script in volume
		particle obj_start create
		message xgotrack
		trigvolume_enable tv_move4 1
	}
}

func void encourage_dash(string ai_name)
{
	sleep 600
	if(didsprint eq 0)
	{
		message_remove xdash1
		sleep 60
		#that'sleep 300 not a dash
		sound_dialog_play c00_01_39shinatama
		message xencouragedash
		dprint rating
		rating = rating + 1;
	}
}

func void move4(string ai_name)
{
  if(A eq 0)
  {
	if(how_far_along eq 1)
	{
		message_remove xgotrack
		trigvolume_enable tv1 1
		trigvolume_enable tv2 1	
		trigvolume_enable tv3 1
		trigvolume_enable tv4 1
		trigvolume_enable tv5 1
		trigvolume_enable tv6 1
		trigvolume_enable tv7 1
		trigvolume_enable tv8 1
		trigvolume_enable tv9 1
		trigvolume_enable tv10 1
		trigvolume_enable tv11 1
		trigvolume_enable tv12 1
		trigvolume_enable tv13 1
		trigvolume_enable tv14 1
		trigvolume_enable tv15 1
		trigvolume_enable tv16 1
		trigvolume_enable tv17 1
		particle obj_start kill
		sound_dialog_play c00_01_41shinatama
		sleep 60
		message xrun
	}
  }
 	if(A eq 1)
  	{
		if(how_far_along eq 1)
		{
			message_remove xgotrack
			trigvolume_reset tv1 
			trigvolume_reset tv2 
			trigvolume_reset tv3 
			trigvolume_reset tv4 
			trigvolume_reset tv5 
			trigvolume_reset tv6 
			trigvolume_reset tv7 
			trigvolume_reset tv8 
			trigvolume_reset tv9 
			trigvolume_reset tv10 
			trigvolume_reset tv11 
			trigvolume_reset tv12 
			trigvolume_reset tv13 
			trigvolume_reset tv14 
			trigvolume_reset tv15 
			trigvolume_reset tv16 
			trigvolume_reset tv17 
			particle obj_start kill
			sound_dialog_play c00_01_41shinatama
			sleep 60
			message xrun
		}
	}

	particle obj_end create
	trigvolume_reset tv_end
	trigvolume_enable tv_end 1
	sleep 660
	dprint timeup
	B = 1;
}

func void track_end(string ai_name)
{
	if(B eq 1)
	{
		bad = 1;
	}
	if(how_far_along eq 1)
	{
		particle obj_end kill
		particle obj_start kill
		message_remove
		message_remove xrun
		sleep 60
		###all targets hit
		if(tcount eq 0)
		{
			#### all hit, RUN WAS fast	
			if(bad eq 0)
			{
				sound_dialog_play_block c00_01_42shinatama
				message xgreat 240
				A = 0;
				sleep 240
			}
			####all hit, RUN WAS slow
			if(bad eq 1)
			{
				dprint rating
				rating = rating + 1;
				sound_dialog_play_block c00_01_11shinatama
				message xgoodbutslow 240
				A = 0;
				sleep 240
			}
		}

		####targets were MISSED
		if(tcount ne 0)
		{
			dprint rating
			rating = rating + 1;
			###missed, fast
			if(bad eq 0)
			{
				sound_dialog_play_block c00_01_43shinatama
				message xpractice 360
				A = 1;
				sleep 360
			}
			####missed, slow
			if(bad eq 1)
			{
				sound_dialog_play_block c00_01_43shinatama
				message xslowtoo 360
				A = 1;
				sleep 360
			}
		}
	}
   #####THIS ENDS BASIC MOVEMENTS FOR SUCCESSFUL RUNNERS
  if(A eq 0)
  {
	if(how_far_along eq 1)
	{
		sound_dialog_play_block c00_01_44shinatama
		message xendbasic 300
		sleep 300
	}

	if(how_far_along eq 1)
	{
		sound_dialog_play c00_01_45shinatama
		message xreview 
		console_activate 11
		trigvolume_enable tv_review 1
		particle obj_data create
	}
  }
      ####IF THE RUN WASN'T GOOD, THEN RESET CONSOLE
	if(A eq 1)
	{
		message xconsole1
		sleep 30
		particle obj_control create
		console_reset 10
		console_activate 10
		trigvolume_reset trigger_volume_54 		
		trigvolume_enable trigger_volume_54 1
	}
}

func void review(string ai_name)
{
	if(how_far_along eq 1)
	{
		message_remove xreview
		particle obj_data kill
	#	sleep 60
	#	message xactivate3
	}
}

func void review2(string ai_name)
{
	if(how_far_along eq 1)
	{
	#	message_remove xactivate3
		text_console level_1c
		console_reset 11
		sleep 120
		message xgodoor
		trigvolume_enable tv_train_door 1
		sound_dialog_play c00_01_48shinatama
	#	sound_dialog_play_block pause
		particle obj1 create
	}
}

func void track17(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t17 kill
		tcount = tcount - 1
	}
}

func void track16(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t16 kill
		tcount = tcount - 1
	}
}

func void track15(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t15 kill
		tcount = tcount - 1
}
}

func void track14(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t14 kill
		tcount = tcount - 1
	}
}

func void track13(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t13 kill
		tcount = tcount - 1
	}
}

func void track12(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t12 kill
		tcount = tcount - 1
	}
}

func void track11(string ai_name)
{
	if(how_far_along eq 1)
	{
		tcount = tcount - 1
		particle t11 kill
	}
}

func void track10(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t10 kill
		tcount = tcount - 1
	}
}

func void track9(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t9 kill
		tcount = tcount - 1
	}
}

func void track8(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t8 kill
		tcount = tcount - 1
	}
}

func void track7(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t7 kill
		tcount = tcount - 1
	}
}

func void track6(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t6 kill
		tcount = tcount - 1
	}
}

func void track5(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t5 kill
		tcount = tcount - 1
	}
}

func void track4(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t4 kill
		tcount = tcount - 1
	}
}

func void track3(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t3 kill
		tcount = tcount - 1
	}
}

func void track2(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t2 kill
		tcount = tcount - 1
	}
}

func void track1(string ai_name)
{
	if(how_far_along eq 1)
	{
		particle t1 kill
		tcount = tcount - 1
	}
}

###################
# use manual door #
###################
func void train_door(string ai_name)
{
	dprint train_door
	message_remove xgodoor
	sleep 60
#	Good.  Now the door will unlock as the indicator light turns green.
	particle obj1 kill
	#light goes green
	message unlock_door1 240
	sleep 40
	door_unlock 98 
	particle door1_locklight02 do start
	sleep 200

	if (how_far_along eq 1)
	{
		message open_door1b 300
		sleep 300
	}

	if (how_far_along eq 1)
	{
#		Please proceed to the next room
		message proceed_door1 300	
		sleep 300
	}
	if (how_far_along eq 1)
	{
#		message open_door1	
	}
}

########
# jump #
########
func void train_jump(string ai_name)
{	
	how_far_along = 2;
	lock_keys keys_inventory
	message_remove open_door1
	message_remove open_door1b
	message_remove proceed_door1
	sleep 120
	if (how_far_along eq 2)
	{
		if(powerupon eq 0)
		{
			sound_dialog_play c00_01_49shinatama
			message jump_basic 240
			sleep 240
		}
	}
	if (how_far_along eq 2)
	{
		if(powerupon eq 0)
		{
			lock_keys keys_jump
#			SPACE to jump
			message c01_50_06 
			chr_wait_animtype 0 jump
			sleep 60
			message_remove c01_50_06
			sleep 60
		}
	}
	if (how_far_along eq 2)
	{
		if(powerupon eq 0)
		{
			sound_dialog_play c00_01_08shinatama
		}
	}
	if (how_far_along eq 2)
	{
		if(powerupon eq 0)
		{
#			directional jumping
#			(press W and then SPACE when you want to jump)
			message c01_50_07 		
			chr_wait_animation 0 KONOKOjump_fw_start KONOKOjump_lt_start KONOKOjump_rt_start KONOKOjump_bk_start
			sleep 60
			message_remove c01_50_07
			sleep 60
		}

	}
	if (how_far_along eq 2)
	{
		if(powerupon eq 0)
		{
#			longer hit space, longer jump
			message jump_basic2 300		
			sleep 120
		}
	}
########################encourage players to jump to next room unless they are on the large crate
	if (how_far_along eq 2)
	{
		if(powerupon eq 0)
		{
			if(forcefieldstopped eq 0)
			{
				forcefieldstopped = 1;
				particle forcefield1 do stop
				sleep 180
			}
		}
		if(powerupon eq 0)
		{
			if(particlestarted eq 0)
			{
				particlestarted = 1;
		 		sound_dialog_play c00_01_50shinatama
		  	  	message jump1
				particle obj2 create
				env_show 2011 0
			}

		}
	}
}

func void powerup(string ai_name)
{
	powerupon = 1
	fork pickup_powerup
	dprint rating
	rating =  rating - 1;
	message_remove jump_basic
	message_remove jump_basic2
	message_remove good
	message_remove jump1
#	particle obj2 kill
	sleep 80
	if(how_far_along eq 2)
	{
		sound_dialog_play c00_01_46shinatama
		sound_dialog_play_block pause
		sleep 30
		sound_dialog_play c00_01_47shinatama
		sound_dialog_play_block pause
	}
#############################encourage players to jump to next room unless they are getting the ammo
	if(got_ammo eq 0)
	{
		if(how_far_along eq 2)
		{	
		#	particle obj2 kill
			message_remove jump1
		 	if(forcefieldstopped eq 0)
			{
				forcefieldstopped =1;
				particle forcefield1 do stop
				sleep 180
        	}
		}
	}
	if(got_ammo eq 0)
	{
		if(how_far_along eq 2)
		{
			sound_dialog_play c00_01_50shinatama
			if(particlestarted eq 0)
 			{
				particlestarted = 1;
				particle obj2 create
				env_show 2011 0
            }
		}
	}
}

func void pickup_powerup(void)
{
#	particle obj2 kill
	message_remove jump1
	chr_wait_animtype 0 Pickup_Object
	got_ammo = 1;
	sleep 80
	message xpower1 300
	sleep 120
#########################encourage players to jump to next room unless the messages have already gone by
	
	forcefieldstopped = 1;
	particle forcefield1 do stop
	sleep 180
	if(how_far_along eq 2)
	{
		sound_dialog_play c00_01_50shinatama
		if(particlestarted eq 0)
		{
			particlestarted = 1;
			particle obj2 create
			env_show 2011 0
		}
	}
	if(how_far_along eq 2)
	{
		message jump1
	}	
}

################
# escape moves #
################
func void train_crouch(string ai_name)
{
	how_far_along = 3;
	trigvolume_enable trigger_volume_62 0
	message_remove
	door_lock 98
	particle door1_locklight02 do stop
	particle obj2 kill
	particle obj1 kill
	particle obj_start kill
	particle obj_end kill
	particle obj_control kill
	dprint train_crouch
	trigvolume_enable trigger_volume_71 0
	sleep 60
	message_remove
	particle obj2 kill
	sound_dialog_play_interrupt c00_01_01shinatama
	ai2_spawn demo1
	ai2_spawn demo2
	ai2_spawn demo3
	chr_nocollision demo1 1
	chr_nocollision demo2 1 
	chr_nocollision demo3 1
		ai2_dopath demo1 pdemo1
		ai2_dopath demo2 pdemo2
   		ai2_dopath demo3 pdemo3
		ai2_setjobstate demo1
		ai2_setjobstate demo2
		ai2_setjobstate demo3
	#shift important
	if(how_far_along eq 3)
	{
		lock_keys keys_crouch
		message shift 240
		sleep 240
	}

	if(how_far_along eq 3)
	{
#		SHIFT to crouch
		message c01_50_08 
		chr_wait_animtype 0 crouch
		sleep 60
		message_remove c01_50_08
		sleep 120
	}

	if(how_far_along eq 3)
	{
		sleep 30
#		sorry to interrupt you
		sound_dialog_play c00_01_51shinatama
		sleep 60
		message xinterrupt 180
		sleep 180
		message xfite
		sleep 30
		particle fight create
		trigvolume_enable trigger_volume_71 1
	}
}

func void crouch2(string ai_name)
{
	if (how_far_along eq 3)
	{
		message xresume 180
		sleep 180
#		MOVEWHile crouching
		message c01_50_09
		chr_wait_animtype 0 crouch_run crouch_run_backwards crouch_run_sidestep_left crouch_run_sidestep_right
		sleep 60
		message_remove c01_50_09
		sleep 60
		message c01_50_10 240
		sound_dialog_play_block c00_01_54shinatama
		sleep 240

	}

	if (how_far_along eq 3)
	{
#		ESCAPE MOVES somersault
		message c01_50_11
		chr_wait_animation 0 KONCOMcrouch_fw KONCOMcrouch_rt KONCOMcrouch_lt KONOKOcrouch_fw KONOKOss_lt_slide KONOKOss_rt_slide KONOKOrun_bk_slide
		sleep 60
		message_remove c01_50_11
		sleep 60
	}

	if (how_far_along eq 3)
	{
#		cartwheel
		message back 
		chr_wait_animtype 0 crouch_back
		sleep 60
		sound_dialog_play_block c00_01_07shinatama
		message_remove back
		sleep 60
	}

	if (how_far_along eq 3)
	{
#		SLIDE
		sleep 30
		sound_dialog_play_block c00_01_55shinatama
		sound_dialog_play_block pause
		message c01_50_16 
		chr_wait_animstate 0 run_slide
		sleep 60
		message_remove c01_50_16
		sleep 60
	}

	if (how_far_along eq 3)
	{
#		slide under traps
#		try sliding beneath these moving laser sensors
		sleep 60
		sound_dialog_play_block c00_01_57shinatama
	}
	if (how_far_along eq 3)
	{
		message slide 360
		sleep 30
		trig_activate 3
		sleep 40
		trig_activate 2
		sleep 40
		trig_activate 1
		sleep 300
		sound_dialog_play_block c00_01_56shinatama
		sleep 300
	}

	if (how_far_along eq 3)
	{
#		especially important when fighting multiple opponents
#		message c01_50_13 240
		sound_dialog_play_block c00_01_59shinatama
		sound_dialog_play_block pause
		sleep 60
	}

	if (how_far_along eq 3)
	{
#		JUMP-FLIP
		message jump_flip 300
		sleep 300
	}
	if (how_far_along eq 3)
	{
		message c01_50_19	
		chr_wait_animtype 0 flip
		message_remove c01_50_19
		sleep 60
		sound_dialog_play_block c00_01_03shinatama
		sound_dialog_play_block pause
	}

	if (how_far_along eq 3)
	{
#		hit opponent on ground
		sound_dialog_play_block c00_01_60shinatama
		sound_dialog_play_block pause
	}

	if (how_far_along eq 3)
	{
#		more jump-flip
#		starting at the target cursor on the floor, dash and jump-flip up to the next level.
		particle forcefield2 do stop
		sleep 180	
		sound_dialog_play_block c00_01_61shinatama
		message c01_50_23 	
		particle obj3 create
		env_show 2012 0
		sleep 600
	}

	if (how_far_along eq 3)
	{
		sound_dialog_play_block c00_01_62shinatama
		sound_dialog_play_block pause
		message_remove c01_50_23
		sleep 60
		message jump_encourage 300
		sleep 300
	}
	if (how_far_along eq 1)
	{
		message c01_50_23
		sleep 900	
	}

	if (how_far_along eq 3)
	{
		message_remove c01_50_23 
		sleep 60
	}
	if (how_far_along eq 3)
	{
		sound_dialog_play_block c00_01_63shinatama
		particle obj3 kill
		sleep 30
	}
	if (how_far_along eq 3)
	{
		particle obj4 create
		message jump_encourage2 
		dprint rating
		rating = rating + 1;
	}
}

################
# karen fights #
################

func void t71(string ai_name)
{
	message_remove xfite
	chr_nocollision demo1 0
	chr_nocollision demo2 0 
	chr_nocollision demo3 0
	env_show 2010 1
	chr_changeteam demo1 Syndicate
	chr_changeteam demo2 Syndicate
	particle fight kill
}

func void demo3dies(string ai_name)
{
	dprint oh_no
	demo3dead = 1;
	chr_changeteam demo1 Konoko
	chr_changeteam demo2 Konoko
	if(trigvolume_count (71) eq 1)
	{
		sleep 60
		sound_dialog_play c00_01_52shinatama
		sound_dialog_play_block pause
	}
	sleep 60
	crouch2

}

func void demo_over(string ai_name)
{
	onto_crouch2 = onto_crouch2 + 1
	if(onto_crouch2 eq 2)
	{
		ai2_dopath demo3 pdemo4
		ai2_setjobstate demo3
		sleep 90
		sound_dialog_play c00_01_53shinatama
		sound_dialog_play_block pause
		if(demo3dead eq 0)
		{
			crouch2
		}
	}
}