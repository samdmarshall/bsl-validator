func void cheater(void)
{
	invincible=1
	omnipotent=1
	lock_keys keys_all
	chr_teleport 0 7023
}
###################################
# variables used in train2 scipts #
###################################

#used to see if PPK combo was successful
var int combo_did;

#used to determine when to activate or deactivate blocking drone, current script comments out the usefulness of this variable
var int count_block;

#determines if reload in ballistics or cell
var int reload=0;

#makes sure reloading cells doesn't play before player has even picked up the rifle
var int droid_active;

#sees if you already reloaded ballistics ammo before the system had a chance to prompt you to do so
var int already_reloaded;

#sees if you already reloaded cell ammo before system prompted you to do so.
var int already_reloaded2;

#counts number of reload prompts necessary, if you reloaded more than one time, you lose rating points
var int had_to_reload;

#determines when inside the target shooting function
var int inside_target_function;

#determines when inside ammo reload function
var int inside_ammo_function = 0;

#determines when not to display block droid message
var int block_off;

################################
# fight training scripts below #
################################

#########################
# punch and kick script #
#########################
func void train_fighting(string ai_name)
{
	how_far_along = 4;
	music_stop
	particle obj3 kill
	particle obj4 kill	
	trig_deactivate 1
	trig_deactivate 2
	trig_deactivate 3
	message_remove c01_50_23
	message_remove jump_encourage
	message_remove jump_encourage2
	sleep 60
	sound_dialog_play_interrupt c00_01_64shinatama
	message_remove
	message begin_fight 240
	sleep 240
#	PUNCH-KICK
	lock_keys keys_attack
	message xpunch
	chr_wait_animtype 0 punch
	sleep 60
	message_remove xpunch
	sleep 60
	message xkick
	chr_wait_animtype 0 kick
	sleep 60
	message_remove xkick
	sleep 60

	if (how_far_along eq 4)
	{
		#throw two punches
		sound_dialog_play_block c00_01_65shinatama
		message punch
		chr_wait_animtype 0 punch2
		message_remove punch
		sleep 60
		message c01_50_27 180
		sound_dialog_play_interrupt c00_01_66shinatama
		sound_dialog_play_block pause
		sleep 40
	}

	if (how_far_along eq 4)
	{
#		more combo
		sound_dialog_play_block c00_01_67shinatama
		sound_dialog_play_block pause
		sleep 60
	}

	if (how_far_along eq 4)
	{
#		FIRST COMBO
		message c01_50_29
		fork combo_wait
		chr_wait_animtype 0 ppk
		combo_did = 1;
		sleep 60
		message_remove c01_50_29
		message_remove c01_50_29b
		sleep 60
		sound_dialog_play_interrupt c00_01_07shinatama
		message xppk 180
		sleep 180
	}
	if(combo_did eq 1)
	{
		if (how_far_along eq 4)
		{
#		try linking for more combos
		sound_dialog_play_block c00_01_69shinatama
		sound_dialog_play_block pause
		sleep 240
		}

		if (how_far_along eq 4)
		{
#		you're now ready to train with a sparring partner
		sound_dialog_play_block c00_01_70shinatama
		sound_dialog_play_block pause
		sleep 30
		}
		if (how_far_along eq 4)
		{
#		proceed to the next room
		sound_dialog_play_block c00_01_71shinatama
		message xspar2
		ai2_spawn dum_hit_flash
		chr_lock_active dum_hit_flash
		chr_death_lock dum_hit_flash 1
		door_unlock 99
		particle door2_locklight02 do start
		}
	}
}

func void combo_wait(string ai_name)
{
	sleep 600
	if (combo_did eq 0)
	{
		dprint rating
		rating =  rating + 1
		rating
		message_remove c01_50_29
		sound_dialog_play_block c00_01_68shinatama
		sleep 60
	}
	if (combo_did eq 0)
	{
		message c01_50_29b 240
		sleep 240
	}
	if (combo_did eq 0)
	{
		message c01_50_29
	}

#	if(combo_did eq 0)
#	{
#		if (how_far_along eq 4)
#		{
#			try linking for more combos
#			sound_dialog_play_block c00_01_69shinatama
#			sound_dialog_play_block pause
#			sleep 240
#		}
#
#		if (how_far_along eq 4)
#		{
#			you're now ready to train with a sparring partner
#			sound_dialog_play_block c00_01_70shinatama
#			sound_dialog_play_block pause
#			sleep 30
#		}
#		if (how_far_along eq 4)
#		{
#			proceed to the next room
#			sound_dialog_play_block c00_01_71shinatama
#			message xspar2
#			ai2_spawn dum_hit_flash
#			chr_lock_active dum_hit_flash
#			chr_death_lock dum_hit_flash 1
#			door_unlock 99
#			particle door2_locklight02 do start
#		}
#	}
}

##################################
# train player about hit flashes #
##################################
func void train_hit_flash(string ai_name)
{
	particle steam stop
	music_train2
	how_far_along = 6;
	message_remove xspar2
	sleep 60
#	try hitting this dummy
	sound_dialog_play_block c00_01_77shinatama
	message start_hit
	ai2_makeignoreplayer dum_hit_flash 1
}

func void hurt_dummy1(string ai_name)
{
	message_remove start_hit
	sleep 60
	door_lock 99
	particle door2_locklight02 do stop
#	dynamic hit flashes
	message c01_50_35 300
	sleep 240
	ai2_dopath dum_hit_flash patrol_dum_hit_flash
	ai2_setjobstate dum_hit_flash
	sleep 60
#	more dynamic hit flashes blue
	message blueflash 300
	sleep 240
	ai2_dopath dum_hit_flash patrol_dum_hit_flash
	ai2_setjobstate dum_hit_flash
	sleep 60
	message c01_50_37 300
	sleep 240
	ai2_dopath dum_hit_flash patrol_dum_hit_flash
	ai2_setjobstate dum_hit_flash
	sleep 60
#	more dynamic hit flashes
	message c01_50_38 300
	sleep 240
	ai2_dopath dum_hit_flash patrol_dum_hit_flash
	ai2_setjobstate dum_hit_flash
#	move on to the next room to learn how to perform the most dangerous attacks.
	sleep 60
	sound_dialog_play_block c00_01_78shinatama
	message goto_throw
	sleep 60
	door_unlock 100
	particle door3_locklight02 do start
	ai2_spawn dum_train_throw
	chr_lock_active dum_train_throw
	chr_death_lock dum_train_throw 1
	ai2_makeignoreplayer dum_train_throw 1
}

###################################
# train player to throw opponents #
###################################
func void lockthrow(void)
{
	door_lock 100
	particle door3_locklight02 do stop
}

func void train_throw(string ai_name)
{
	how_far_along = 7;
	message_remove goto_throw
	sleep 60
	if (how_far_along eq 7)
	{
#		FIRST THROW
		sound_dialog_play_block c00_01_79shinatama
		message c01_50_41
		chr_wait_animtype 0 throw_forward_punch throw_forward_kick run_throw_forward_punch run_throw_forward_kick 
		message_remove c01_50_41
		sleep 60
	}

	if (how_far_along eq 7)
	{
#		more throws
		sound_dialog_play_block c00_01_80shinatama
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
		sleep 180
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
		sleep 180
		message xthrow1 360
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
		sleep 180
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
		sleep 180
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
		sleep 180
		message xthrow2 360
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
		sleep 180
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
		sleep 180
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
		sleep 180
		ai2_dopath dum_train_throw patrol_train_throw2
		ai2_setjobstate dum_train_throw
	}

	if (how_far_along eq 7)
	{
#		Proceed to the next room and try blocking the training dummy'sleep 240 attacks.
		message goto_block
		sleep 60
		door_unlock 101
		particle door4_locklight02 do start
		particle door4b_locklight02 do start
		ai2_spawn dum_train_block
		ai2_makeignoreplayer dum_train_block 1
		chr_invincible char_0 1
	}

}

###############################
# train player to block blows #
###############################
func void train_block(string ai_name)
{
#introduce blocking
	how_far_along = 5;
	message_remove goto_block
#	dummy attack
	sound_dialog_play_block c00_01_72shinatama
	sound_dialog_play_block pause
	sound_dialog_play_block c00_01_73shinatama
	if(count_block eq 0)
	{
		message c01_50_33
	}
}

func void train_block2(string ai_name)
{	
	ai2_makeignoreplayer dum_train_block 0
	ai2_dopath dum_train_block patrol_56b
	ai2_setjobstate dum_train_block
	message_remove c01_50_33
	if(count_block eq 0)
	{
		count_block = 1
		door_lock 101
		door_close 101
		particle door4_locklight02 do stop
		chr_delete dum_train_throw
		chr_delete dum_hit_flash
		chr_delete demo1
		chr_delete demo2
		chr_delete demo3
		if (how_far_along eq 5)
		{
#			more blocking
			sleep 60
			message c01_50_32 300
			sound_dialog_play_block c00_01_74shinatama
			sound_dialog_play_pause 
			sleep 30
			sound_dialog_play_block c00_01_75shinatama
			message xblocking2 300
			sound_dialog_play_pause 
			sleep 30
			sound_dialog_play_block c00_01_76shinatama
		}
		sleep 120
	#	message_remove xdronedeactive
		ai2_makeignoreplayer dum_train_block 1
		ai2_dopath dum_train_block patrol_56b
		ai2_setjobstate dum_train_block 
		sound_dialog_play_block c00_01_83shinatama
		sound_dialog_play_block pause
		door_unlock 102
		particle door5_locklight02 do start
		message goto_shoot
		chr_inv_reset 0
		music_stop
		sleep 60
		dprint spawn_shoot
		ai2_spawn dum_train_shoot
		ai2_spawn dum_train_shoot2
		ai2_passive dum_train_shoot 1
		ai2_passive dum_train_shoot2 1
		chr_invincible dum_train_shoot 1
		chr_invincible dum_train_shoot2 1
		chr_invincible char_0 0
		console_deactivate 12
		trigvolume_enable tv75 0
		trigvolume_enable tv74 0
	}
}

func void disable_tv46(void)
{
	message_remove c01_50_33
	trigvolume_enable trigger_volume_46 0
}

##################################
# put drones back on their spots #
##################################
func void flash_path(string ai_name)
{
	sleep 90
	ai2_dopath dum_hit_flash patrol_dum_hit_flash
}

func void throw_path(string ai_name)
{
	sleep 90
	ai2_dopath dum_train_throw patrol_train_throw2
}

func void block_path(string ai_name)
{
	if(block_off eq 0)
	{
		block_off = 1;
		message xdronedeactive 180
	}
	ai2_makeignoreplayer dum_train_block 1
	ai2_dopath dum_train_block patrol_56
	sleep 180
	block_off = 0;
}

func void block_path2(string ai_name)
{

	ai2_makeignoreplayer dum_train_block 1
	ai2_dopath dum_train_block patrol_56
}
######################################################
# regenerate first two training dummies as necessary #
######################################################

func void regen1(string ai_name)
{
	dprint regen1
	message_remove blueflash
	message_remove c01_50_37
	message_remove c01_50_38
	sleep 60
	message xregen1 180
	sleep 180
	chr_set_health dum_hit_flash 50
	ai2_dopath dum_hit_flash patrol_dum_hit_flash
	ai2_setjobstate dum_hit_flash
}

func void regen2(string ai_name)
{
	dprint regen2
	sleep 60
	message xregen1 180
	sleep 180
	chr_set_health dum_train_throw 50
	ai2_dopath dum_hit_flash patrol_train_throw2
	ai2_setjobstate dum_train_throw
}

#########################
# train player to shoot #
#########################
func void train_shoot(string ai_name)
{
#	message_remove xdroneactive
	message_remove xdronedeactive
	particle g_tap1 create
	sleep 7
	weapon_spawn w1_tap 7042
	wp_disable_fade=1
	how_far_along = 8;
	message_remove goto_shoot
	sleep 60
	ai2_dopath dum_train_throw patrol_train_throw
	ai2_setjobstate dum_train_throw

	if (how_far_along eq 8)
	{
	lock_keys keys_inventory
	lock_keys keys_reload
#	approach weapons
	sound_dialog_play_block c00_01_84shinatama
	sound_dialog_play_pause 
	chr_wait_animtype char_0 Pickup_Pistol Pickup_Pistol_Mid 
	door_lock 102
	particle door5_locklight02 do stop
	trigvolume_enable tv75 1
	trigvolume_enable tv74 1
	ui_show_element left 1
	sleep 60
	message c01_50_54
#	hit targets
	sound_dialog_play_block c00_01_85shinatama
	chr_wait_animtype char_0 Autopistol_Recoil
	sleep 120
	message_remove c01_50_54
	sleep 60
	message c01_50_53 300
	sleep 300
	}
}

func void enter_ammo_function(void)
{
   dprint enter_ammo_function
   inside_ammo_function = 1;
}

func void exit_ammo_function(void)
{
   dprint exit_ammo_function
   inside_ammo_function = 0;
}

func void need_ammo(string ai_name)
{
   trigvolume_enable tv74 0

   sleep 67
   var int empty_weapon = chr_has_empty_weapon(char_0);

   dprint trying_ammo_function

   if (inside_ammo_function eq 0)
   {
      dprint doing_ammo_function
      enter_ammo_function();

	   if(empty_weapon eq 1)
	   {
		sleep 15
		if(reload eq 0)
		{
			message_remove xkeepshoot
			already_reloaded = 0;
			sound_dialog_play_block c00_01_87shinatama
			message c01_50_61
		#	generate powerup
			particle g_tap1 create
			sleep 7
			powerup_spawn ammo 7042
			particle g_tap2 create
			sleep 7
			powerup_spawn ammo 7043
			chr_wait_animtype char_0 Pickup_Object_Mid Pickup_Object
			fork remove_reload_message
		#	sleep 60
			message_remove c01_50_61
			sleep 90
			if(already_reloaded eq 0)
			{
				message xreload
				chr_wait_animtype char_0 reload_pistol
				increase_rating()
				message_remove xreload
				sleep 90
			}
			message xkeepshoot
		}
		if(reload eq 1)
		{
			if(droid_active eq 1)
			{
				message c01_50_62
			#	generate powerup
				particle g_phr1 create
				sleep 7
				powerup_spawn cell 7044
				particle g_phr2 create
				sleep 7
				powerup_spawn cell 7045
				chr_wait_animtype char_0 Pickup_Object_Mid Pickup_Object
			#	sleep 60
				message_remove c01_50_62
				fork remove_reload_message2
				if(already_reloaded2 eq 0)
				{
					sleep 90
					message xreload
					chr_wait_animtype char_0 reload_rifle
					dprint rating
					increase_rating()
					message_remove xreload
				}
			}
		}
	   }

	   exit_ammo_function();
	}

   sleep 60
   trigvolume_enable tv74 1
}

func void increase_rating(void)
{
	dprint rating
	if(had_to_reload ne 0)
	{

		rating = rating + 1;
	}
	had_to_reload = had_to_reload + 1;
}

func void remove_reload_message(void)
{
	chr_wait_animtype char_0 reload_pistol
	already_reloaded = 1;
}

func void remove_reload_message2(void)
{
	chr_wait_animtype char_0 reload_rifle
	already_reloaded2 = 1;
}

func void enter_target_function(void)
{
   dprint enter_target_function
   inside_target_function = 1;
}

func void exit_target_function(void)
{
   dprint exit_target_function
   inside_target_function = 0;
}

func void targets_are_gone(void)
{
	reload=1;
	message_remove xkeepshoot
	trigvolume_enable tv75 0
	sleep 7
	particle g_phr1 create
	sleep7
	weapon_spawn w3_phr 7045
	sound_dialog_play_block c00_01_86shinatama
	sound_dialog_play_block pause
	message_remove
	#plasma, switch weapons
	sound_dialog_play_block c00_01_88shinatama
	chr_wait_animtype char_0 Pickup_Rifle Pickup_Rifle_Mid 
	droid_active = 1;
	sleep 30
	#activate drone, hit it
	chr_invincible dum_train_shoot 0		
	ai2_passive dum_train_shoot 0
	sound_dialog_play_block c00_01_89shinatama
	ai2_dopath dum_train_shoot patrol_train_shoot
	ai2_setjobstate dum_train_shoot
}

func void targets_are_not_gone(void)
{
	# CB: turn off the trigger volume and sleep for a second
	# so as not to cause hideous performance loss
	trigvolume_enable tv75 0
	sleep 60
	trigvolume_enable tv75 1
}

func void targets_gone(string ai_name)
{
	if(inside_target_function eq 0)
	{	
		enter_target_function()

		var int num_broken = env_broken(3001, 3018);

		if (num_broken eq 18)
		{
			targets_are_gone();
		}
	
		if (num_broken < 18)
		{
			targets_are_not_gone();
		}

		exit_target_function
	}
}

func void droid1_gone(string ai_name)
{
	if (how_far_along eq 8)
	{
		chr_invincible dum_train_shoot2 0
#		now side to side
		sound_dialog_play_block c00_01_90shinatama
		sound_dialog_play_block pause
		sleep 30
		ai2_passive dum_train_shoot2 0
		ai2_dopath dum_train_shoot2 patrol_train_shoot2
		ai2_setjobstate dum_train_shoot2
	}
}

func void droid2_gone(string ai_name)
{
	if (how_far_along eq 8)
	{
		reload = 2;
		droid_active = 0;
		message_remove
		cinematic_start (SHINnametag, 180, 180, 15, 1, 20, false)
#		great, done training
		chr_changeteam char_0 Syndicate
		music_train3
		if(rating eq 0)
		{
			message poopy 

		}
		if(rating eq 1)
		{
			message poopy2 

		}
		if(rating eq 2)
		{
			message poopy3 

		}
		if(rating eq 3)
		{
			message poopy4 

		}
		if(rating eq 4)
		{
			message poopy5 

		}
		if(rating eq 5)
		{
			message poopy6 

		}
		if(rating > 5)
		{
			message poopy7 

		}
		sound_dialog_play_block c00_01_91shinatama
		sound_dialog_play_block pause
		sleep 40
		sound_dialog_play_block c00_01_81shinatama
		sound_dialog_play_block pause
		message_remove
		sleep 40
		sound_dialog_play_block c00_01_82shinatama
		sound_dialog_play_block pause
		cinematic_stop (SHINnametag, 15, 20)
 		message xf1 400
		sleep 400
		message xlastreview
		particle obj_lastreview create
		console_activate 12
		wp_disable_fade=0
	}
}

func void lastreview(string ai_name)
{
	music_stop
	particle obj_lastreview kill
	message_remove
	message_remove xlastreview
	text_console level_1f
	lock_keys keys_all
	sleep 60
	dprint swing
	swing
	ui_suppress_prompt=0
} 

######################################
# training scripts used in warehouse #
######################################
# note: health function 'yhealth' is in the level_script file #

func void train_fathealth(string ai_name)
{
	chr_wait_animtype char_0 Pickup_Object 
	if(trigvolume_count (80) eq 1)
	{
		sleep 90
		message xtabhypo 300
		sound_dialog_play_block c00_01_93shinatama
		sound_dialog_play_block pause
		sleep 40
		sound_dialog_play_block c00_01_94shinatama
	}
}

func void intro_enemies(string ai_name)
{
	dprint intro_enemies
	how_far_along = 11;

	music_firstfight

	if (how_far_along eq 11)
	{
		ai2_spawn Bay2_Thug_1
		ai2_spawn Bay2_Thug_2
	}

	if (how_far_along eq 11)
	{
#		enemies
		message c01_50_84 240
		sleep 360
	}
}

func void train_alarm(string ai_name)
{
	how_far_along = 13;

	if (how_far_along eq 13)
	{
	ai2_spawn Bay4_Comguy_1
#	alarm
	sleep 180
	message c01_50_88 240
	sleep 240
	}

	if (how_far_along eq 13)
	{
#	alarm
	message c01_50_89 240
	sleep 240
	}

#	if (how_far_along eq 13)
#	{
#	alarm
#	message c01_50_90 240
#	sleep 240
#	}
}

func void train_neutral(string ai_name)
{
	how_far_along = 14;
	target_set(92,15.0)
	if (how_far_along eq 14)
	{
#		neutrals
		message c01_50_91 240
		sleep 240
		sound_dialog_play_block c00_01_97shinatama
	}
}

func void train_timer(string ai_name)
{
	how_far_along = 15;

	if(how_far_along eq 15)
	{
		target_set(96,15.0)
		timer_start 180 OutroLose
		sound_dialog_play_block c00_01_95shinatama
		sleep 180
		objective_set(4)
		sound_dialog_play_block pause
		music_timer
	}

	if (how_far_along eq 15)
	{
		sleep 60
		message timer_text 300
		sleep 360
		message timer_text2 240
	}
}

############################
# warn about alarm console #
############################
func void alarm_warning(string ai_name)
{ 
	if(count_alarm eq 0)
	{
		message alarm_warn 300
	}
	count_alarm = 1;
}

func void alarm_warningb(string ai_name)
{ 
	count_alarm = 0;
}

#############################
# consoles and compass hint #
#############################
func void console_jump(string ai_name)
{
	text_console level_1g
	console_reset 18
}

func void console_escape(string ai_name)
{
	text_console level_1h
	console_reset 17
}

func void console_attack(string ai_name)
{
	text_console level_1i
	console_reset 16
}

func void console_flash(string ai_name)
{
	text_console level_1j
	console_reset 15
}

func void console_throw(string ai_name)
{
	text_console level_1k
	console_reset 14
}

func void console_block(string ai_name)
{
	text_console level_1l
	console_reset 13
}

func void t77(string ai_name)
{
	message xarrow 400
}