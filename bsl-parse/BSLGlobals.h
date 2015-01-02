//
//  BSLGlobals.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef bsl_parse_BSLGlobals_h
#define bsl_parse_BSLGlobals_h

#include "BSLPrivate.h"
#include "BSLFunction.h"

static bsl_register_func_item GLOBAL_FUNCTIONS[] = {
	// Kills any temporary particles
	{"particle_temp_kill", bsl_db_register_type_void, "void", oni_call_noop},
	// returns if this character is the player
	{"chr_is_player", bsl_db_register_type_bool, "[ai_name:string | script_id:int]", oni_call_noop},
	// returns if we did kill griffen
	{"did_kill_griffen", bsl_db_register_type_int, "void", oni_call_noop},
	// dumps stats for a playback film
	{"chr_playback_debug", bsl_db_register_type_void, "film_name:string", oni_call_noop},
	// locks keys out
	{"lock_keys", bsl_db_register_type_void, "void", oni_call_noop},
	// tells an AI to move to a flag
	{"ai2_movetoflag", bsl_db_register_type_void, "[ai_name:string | script_id:int] flag_id:int [setfacing:string]", oni_call_noop},
	// lists all the engines
	{"m3_geom_engine_list", bsl_db_register_type_void, "void", oni_call_noop},
	// makes a single AI blind
	{"ai2_makeblind", bsl_db_register_type_void, "[ai_name:string | script_id:int] on_off:int", oni_call_noop},
	// lists all the players
	{"chr_who", bsl_db_register_type_void, "void", oni_call_noop},
	// makes the player character fall front
	{"fall_front", bsl_db_register_type_void, "void", oni_call_noop},
	// Sets the main characters class
	{"chr_main_class", bsl_db_register_type_void, "[class_name:string | class_index:int]", oni_call_noop},
	// sets a triggers speed
	{"trig_speed", bsl_db_register_type_void, "trigger_id:int volume:float", oni_call_noop},
	// forces an AI into active mode
	{"ai2_active", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// initiates a camera interpolation
	{"cm_interpolate_block", bsl_db_register_type_void, "anim_name:string num_frames:int", oni_call_noop},
	// function to start character dialog playing
	{"sound_dialog_play", bsl_db_register_type_void, "name:string", oni_call_noop},
	// kills all the AI
	{"chr_kill_all_ai", bsl_db_register_type_void, "void", oni_call_noop},
	// begins a cutscene
	{"begin_cutscene", bsl_db_register_type_void, "void", oni_call_noop},
	// sets up an AI's neutral-interaction
	{"ai2_neutralbehavior", bsl_db_register_type_void, "[ai_name:string | script_id:int] behavior:string", oni_call_noop},
	// debugging message
	{"dmsg", bsl_db_register_type_void, "astring:string", oni_call_noop},
	// shows or hides part of the HUD
	{"ui_show_element", bsl_db_register_type_void, "element_name:string show:int", oni_call_noop},
	// swaps an environment texture
	{"env_texswap", bsl_db_register_type_void, "gq_start:int tex_name:string", oni_call_noop},
	// special camera for barabus
	{"cm_barabus", bsl_db_register_type_void, "[ai_name:string | script_id:int] away:float up:float time:int", oni_call_noop},
	// turns input on or off
	{"input", bsl_db_register_type_void, "on_off:int", oni_call_noop},
	// finds all BNV connections from the player's location
	{"ai2_findconnections", bsl_db_register_type_void, "[distance:int | ]", oni_call_noop},
	// forces a character to hold a key down for some frames
	{"chr_holdkey", bsl_db_register_type_void, "[ai_name:string | script_id:int] key_name:string num_frames:int", oni_call_noop},
	// Sets the character class of a specific character
	{"chr_set_class", bsl_db_register_type_void, "chr_index:int [class_name:string | class_index:int]", oni_call_noop},
	// prints all doors in the level to file
	{"door_printall", bsl_db_register_type_void, "", oni_call_noop},
	// tells an AI to take its current state as its job
	{"ai2_setjobstate", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// removes all bindings
	{"unbindall", bsl_db_register_type_void, "void", oni_call_noop},
	// puts the camera in orbit mode
	{"cm_orbit", bsl_db_register_type_void, "speed:float [stopangle:float | ]", oni_call_noop},
	// crashes the game (used for testing error handling)
	{"crash", bsl_db_register_type_void, "when:string", oni_call_noop},
	// Creates and starts all environmental particles
	{"p3_startall", bsl_db_register_type_void, "void", oni_call_noop},
	// bla bla bla
	{"tr_stop_lookup", bsl_db_register_type_void, "void", oni_call_noop},
	// Prints out all environmental particles with tags
	{"p3_printtags", bsl_db_register_type_void, "void", oni_call_noop},
	// Sets the location of any character
	{"chr_location", bsl_db_register_type_void, "[ai_name:string | chr_index:int] [[loc_x:float loc_y:float loc_z:float] | ]", oni_call_noop},
	// saves the shooting skill being edited out as a text file
	{"ai2_skill_save", bsl_db_register_type_void, "", oni_call_noop},
	// Dump all particles to a text file
	{"p3_dumpparticles", bsl_db_register_type_void, "void", oni_call_noop},
	// sets the mouse acceleration value
	{"mouse_acceleration", bsl_db_register_type_void, "accel:float", oni_call_noop},
	// tells an AI to run for an alarm
	{"ai2_doalarm", bsl_db_register_type_void, "[ai_name:string | script_id:int] [console_id:int | ]", oni_call_noop},
	// resets corpses to their initial state
	{"corpse_reset", bsl_db_register_type_void, "", oni_call_noop},
	// prints an anim state
	{"print_state", bsl_db_register_type_void, "state:int", oni_call_noop},
	// prints an anim type
	{"print_type", bsl_db_register_type_void, "type:int", oni_call_noop},
	// Plays the objective-complete sound.
	{"objective_complete", bsl_db_register_type_void, "void", oni_call_noop},
	// lists all the display modes
	{"m3_display_list", bsl_db_register_type_void, "void", oni_call_noop},
	// resets all level mechanics (triggers
	{"reset_mechanics", bsl_db_register_type_void, "", oni_call_noop},
	// Removes all 'dangerous projectile' particles by making their lifetime expire
	{"p3_removedangerous", bsl_db_register_type_void, "void", oni_call_noop},
	// stops all AIs from thinking for themselves
	{"ai2_allpassive", bsl_db_register_type_void, "passive:int", oni_call_noop},
	// Writes all particles used on this level to a text file
	{"p3_writeusedparticles", bsl_db_register_type_void, "void", oni_call_noop},
	// Sends a command to environmental particles with a given tag
	{"particle", bsl_db_register_type_void, "void", oni_call_noop},
	// disables collision for a character
	{"chr_nocollision", bsl_db_register_type_void, "[ai_name:string | script_id:int] on_off:int", oni_call_noop},
	// toggles camera Jello(tm) mode
	{"cm_jello", bsl_db_register_type_void, "mode:int", oni_call_noop},
	// kills all the characters inside a trigger volume
	{"trigvolume_kill", bsl_db_register_type_void, "trig_id:int", oni_call_noop},
	// spawns all AI
	{"ai2_spawnall", bsl_db_register_type_void, "", oni_call_noop},
	// tells an AI to become idle
	{"ai2_idle", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// forces a character to holster their weapon
	{"chr_forceholster", bsl_db_register_type_void, "[ai_name:string | script_id:int] holster:int [force_draw:int | ]", oni_call_noop},
	// lose this level
	{"lose", bsl_db_register_type_void, "void", oni_call_noop},
	// creates a character from a .txt file
	{"chr_create", bsl_db_register_type_void, "script_id:int [start_create:string | void ]", oni_call_noop},
	// fades the screen in
	{"fade_in", bsl_db_register_type_void, "ticks:int", oni_call_noop},
	// xxx
	{"ph_status", bsl_db_register_type_void, "void", oni_call_noop},
	// initiates a camera animation
	{"cm_anim_block", bsl_db_register_type_void, "cam_spec:string anim_name:string", oni_call_noop},
	// activates a console
	{"console_activate", bsl_db_register_type_void, "console_id:int", oni_call_noop},
	// makes the camera wait until it is no longer busy
	{"cm_wait", bsl_db_register_type_void, "", oni_call_noop},
	// unlocks a door
	{"door_unlock", bsl_db_register_type_void, "door_id:int", oni_call_noop},
	// hides a trigger
	{"trig_hide", bsl_db_register_type_void, "trigger_id:int", oni_call_noop},
	// turns on or off specified parts of the environment
	{"env_show", bsl_db_register_type_void, "gq_ref:int on_off:int", oni_call_noop},
	// lists all the engines
	{"m3_draw_engine_list", bsl_db_register_type_void, "void", oni_call_noop},
	// sets an AI's max delay between shots
	{"ai2_skill_delaymax", bsl_db_register_type_void, "int frames", oni_call_noop},
	// tells an AI to look at a character
	{"ai2_lookatchar", bsl_db_register_type_void, "[ai_name:string | script_id:int] [ai_name:string | script_id:int]", oni_call_noop},
	// snaps a character's facing to a flag's facing
	{"chr_facetoflag", bsl_db_register_type_void, "[ai_name:string | script_id:int] flag_id:int", oni_call_noop},
	// kills a range of object
	{"obj_kill", bsl_db_register_type_void, "obj_id:int [ obj_id:int | ]", oni_call_noop},
	// set the script to call from a trigger volume
	{"trigvolume_setscript", bsl_db_register_type_void, "name:string script:string type:string", oni_call_noop},
	// shows AI memory usage
	{"ai2_showmem", bsl_db_register_type_void, "", oni_call_noop},
	// sets the current graphics quality
	{"m3_quality_set", bsl_db_register_type_void, "quality:string", oni_call_noop},
	// sets the level of errors to report at console
	{"ai2_set_reporterror", bsl_db_register_type_void, "error_level:string [subsystem:string | ]", oni_call_noop},
	// sets an AI's min delay between shots
	{"ai2_skill_delaymin", bsl_db_register_type_void, "in frames", oni_call_noop},
	// sends a message from the subtitle file
	{"message", bsl_db_register_type_void, "message:string [timer:int]", oni_call_noop},
	// Kills the nearest P3 particle
	{"p3_killnearest", bsl_db_register_type_void, "[no_recreate:bool | ]", oni_call_noop},
	// makes a single AI deaf
	{"ai2_makedeaf", bsl_db_register_type_void, "[ai_name:string | script_id:int] on_off:int", oni_call_noop},
	// changes the fog start distance smoothly
	{"gl_fog_start_changeto", bsl_db_register_type_void, "start_val:float [frames:int | ]", oni_call_noop},
	// waits for a character to play a specific animation
	{"chr_wait_animation", bsl_db_register_type_void, "void", oni_call_noop},
	// initiates a environment animation: blocks until completed
	{"env_anim_block", bsl_db_register_type_void, "obj_id:int [ obj_id:int | ]", oni_call_noop},
	// sets the field of view
	{"gs_fov_set", bsl_db_register_type_void, "fov_degrees:float", oni_call_noop},
	// turns display of an object on or off
	{"obj_shade", bsl_db_register_type_void, "obj_id:int obj_id:int r:float g:float b:float", oni_call_noop},
	// bla bla bla
	{"tr_write_collection", bsl_db_register_type_void, "collection_name:string file_name:string", oni_call_noop},
	// gives a character a powerup
	{"chr_givepowerup", bsl_db_register_type_void, "[ai_name:string | script_id:int] powerup:string [amount:int | ]", oni_call_noop},
	// cycles console text color
	{"co_toggle_text", bsl_db_register_type_void, "void", oni_call_noop},
	// sets up an animation for an object
	{"env_setanim_block", bsl_db_register_type_void, "obj_id:int object_name:string", oni_call_noop},
	// tells an AI to follow the player
	{"ai2_followme", bsl_db_register_type_void, "[ai_name:string | script_id:int | ]", oni_call_noop},
	// initiates a camera animation
	{"cm_anim", bsl_db_register_type_void, "cam_spec:string anim_name:string", oni_call_noop},
	// sets the active engine
	{"m3_engine_set", bsl_db_register_type_void, "geom_engine:int draw_engine:int", oni_call_noop},
	// returns if this character is holding a weapon that is empty
	{"chr_has_empty_weapon", bsl_db_register_type_bool, "[ai_name:string | script_id:int]", oni_call_noop},
	// Sets the location of any character to the camera location
	{"chr_location_settocamera", bsl_db_register_type_void, "chr_index:int", oni_call_noop},
	// sets part of the HUD to flash or not flash
	{"ui_flash_element", bsl_db_register_type_void, "element_name:string fill:int", oni_call_noop},
	// Sets the location of the player character
	{"goto", bsl_db_register_type_void, "[[loc_x:float loc_y:float loc_z:float] | ]", oni_call_noop},
	// win this level
	{"win", bsl_db_register_type_void, "void", oni_call_noop},
	// fades the screen out
	{"fade_out", bsl_db_register_type_void, "[r:float | r:int] [g:float | g:int] [b:float | b:int] ticks:int", oni_call_noop},
	// makes barabbas retrieve his gun if it is lost
	{"ai2_barabbas_retrievegun", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// bla bla bla
	{"tr_write_animation", bsl_db_register_type_void, "anim_name:string file_name:string", oni_call_noop},
	// Selects what character to control
	{"chr_focus", bsl_db_register_type_void, "chr_index:int", oni_call_noop},
	// ends a cutscene
	{"end_cutscene", bsl_db_register_type_void, "", oni_call_noop},
	// returns the difficulty level
	{"difficulty", bsl_db_register_type_int, "void", oni_call_noop},
	// plays back a film and blocks until complete
	{"chr_playback_block", bsl_db_register_type_void, "[ai_name:string | script_id:int] film_name:string [mode:string | ] [num_frames:int | ]", oni_call_noop},
	// changes the fog end distance smoothly
	{"gl_fog_end_changeto", bsl_db_register_type_void, "end_val:float [frames:int | ]", oni_call_noop},
	// slowly poisons a character
	{"chr_poison", bsl_db_register_type_void, "[ai_name:string | script_id:int] damage:int interval:int [initial_interval:int | ]", oni_call_noop},
	// sets an AI's recoil compensation amount (0-1)
	{"ai2_skill_recoil", bsl_db_register_type_void, "recoil_compensation:float", oni_call_noop},
	// kills all the corpses inside a trigger volume
	{"trigvolume_corpse", bsl_db_register_type_void, "trig_id:int", oni_call_noop},
	// initiates a environment animation: blocks until completed
	{"env_anim", bsl_db_register_type_void, "obj_id:int [ obj_id:int | ]", oni_call_noop},
	// stop the display of a cinematic insert
	{"cinematic_stop", bsl_db_register_type_void, "bitmap_name:string end:int velocity:float", oni_call_noop},
	// resets AI as if start of level
	{"ai2_reset", bsl_db_register_type_void, "[reset_player:int | ]", oni_call_noop},
	// initiates a camera interpolation
	{"cm_interpolate", bsl_db_register_type_void, "anim_name:string num_frames:int", oni_call_noop},
	// function to start music playing
	{"sound_music_stop", bsl_db_register_type_void, "name:string", oni_call_noop},
	// activates a turret
	{"turret_activate", bsl_db_register_type_void, "turret_id:int", oni_call_noop},
	// starts the countdown timer
	{"timer_stop", bsl_db_register_type_void, "", oni_call_noop},
	// Sets the current objective page.
	{"objective_set", bsl_db_register_type_void, "page:int [make_silent:string | ]", oni_call_noop},
	// plays an animation on a character and blocks until done
	{"chr_animate_block", bsl_db_register_type_void, "[ai_name:string | script_id:int] anim_name:string [num_frames:int | ] [interp_frames:int | ]", oni_call_noop},
	// prints location of a character
	{"where", bsl_db_register_type_void, "[ai_name:string | script_id:int | ]", oni_call_noop},
	// Disables parts of the daodan shield (for debugging)
	{"p3_daodan_disable", bsl_db_register_type_void, "void", oni_call_noop},
	// sets the level of errors to log to file
	{"ai2_set_logerror", bsl_db_register_type_void, "error_level:string [subsystem:string | ]", oni_call_noop},
	// causes the player to make a sound (alerts nearby AIs)
	{"ai2_debug_makesound", bsl_db_register_type_void, "[sound_type:string | ] [volume:float | ]", oni_call_noop},
	// puts the camera in orbit mode
	{"cm_orbit_block", bsl_db_register_type_void, "speed:float [stopangle:float| ]", oni_call_noop},
	// Triggers an event on all P3 particles of a specified class
	{"p3_callevent", bsl_db_register_type_void, "particle_class:string event_index:int", oni_call_noop},
	// shows a trigger
	{"trig_show", bsl_db_register_type_void, "trigger_id:int", oni_call_noop},
	// sets up an animation for an object
	{"env_setanim", bsl_db_register_type_void, "obj_id:int object_name:string", oni_call_noop},
	// stops any environment animation on a character
	{"chr_envanim_stop", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// creates a new powerup
	{"powerup_spawn", bsl_db_register_type_void, "poweruptype:string flag:int", oni_call_noop},
	// detaches the camera
	{"cm_detach", bsl_db_register_type_void, "", oni_call_noop},
	// waits for a character to play a specific animation type
	{"chr_wait_animtype", bsl_db_register_type_void, "void", oni_call_noop},
	// dumps all arguments
	{"console_print", bsl_db_register_type_void, "void", oni_call_noop},
	// turns on the boss shield for a character
	{"chr_boss_shield", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// sets a characters health by script id
	{"chr_set_health", bsl_db_register_type_void, "[ai_name:string | script_id:int] hit_points:int", oni_call_noop},
	// sets part of the HUD to completely filled
	{"ui_fill_element", bsl_db_register_type_void, "element_name:string fill:int", oni_call_noop},
	// teleports a character to a flag
	{"chr_teleport", bsl_db_register_type_void, "[ai_name:string | script_id:int] flag_id:int", oni_call_noop},
	// fire off a trigger volume
	{"trigvolume_trigger", bsl_db_register_type_void, "name:string type:string [ai_name:string | script_id:int | ]", oni_call_noop},
	// activates a trigger
	{"trig_activate", bsl_db_register_type_void, "trigger_id:int", oni_call_noop},
	// debugging print
	{"dprint", bsl_db_register_type_void, "astring:string", oni_call_noop},
	// deactivates a trigger
	{"trig_deactivate", bsl_db_register_type_void, "trigger_id:int", oni_call_noop},
	// draws a line for an environment animation
	{"debug_env_anim", bsl_db_register_type_void, "name:string", oni_call_noop},
	// hangs the game (used for testing error handling)
	{"hang", bsl_db_register_type_void, "when:string", oni_call_noop},
	// prints all nearby doors
	{"door_printnearby", bsl_db_register_type_void, "", oni_call_noop},
	// makes a character invincible
	{"chr_invincible", bsl_db_register_type_void, "[ai_name:string | script_id:int] [on_off:int]", oni_call_noop},
	// makes one or all AIs forget they saw anything
	{"ai2_forget", bsl_db_register_type_void, "[ai_name:string | script_id:int | ]  [forget_char:string | ]", oni_call_noop},
	// enables ultra mode for a character
	{"chr_ultra_mode", bsl_db_register_type_void, "[ai_name:string | script_id:int] on_off:int", oni_call_noop},
	// forces a character to play a pain sound
	{"chr_pain", bsl_db_register_type_void, "[ai_name:string | script_id:int] pain_type:string", oni_call_noop},
	// removes a currently displayed message
	{"message_remove", bsl_db_register_type_void, "[message:string | ]", oni_call_noop},
	// locks an object as visible
	{"obj_force_draw", bsl_db_register_type_void, "obj_id:int [ obj_id:int | ]", oni_call_noop},
	// forces an AI into inactive mode
	{"ai2_inactive", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// function to start music playing
	{"sound_music_start", bsl_db_register_type_void, "name:string", oni_call_noop},
	// shows the currently selected shooting skill
	{"ai2_skill_show", bsl_db_register_type_void, "", oni_call_noop},
	// jams a door in its current state
	{"door_jam", bsl_db_register_type_void, "door_id:int", oni_call_noop},
	// Kills all P3 particles
	{"p3_killall", bsl_db_register_type_void, "void", oni_call_noop},
	// makes a character unkillable
	{"chr_unkillable", bsl_db_register_type_void, "[ai_name:string | script_id:int] [on_off:int]", oni_call_noop},
	// tells an AI to come to the player
	{"ai2_comehere", bsl_db_register_type_void, "[ai_name:string | script_id:int | ]", oni_call_noop},
	// prints the index of the player's BNV
	{"ai2_printbnvindex", bsl_db_register_type_void, "", oni_call_noop},
	// View flags with a specific prefix
	{"flag_view_prefix", bsl_db_register_type_void, "prefix:string", oni_call_noop},
	// turns of the shadow for this character
	{"chr_shadow", bsl_db_register_type_void, "[ai_name:string | script_id:int] on_off:int", oni_call_noop},
	// tells an AI to report in
	{"ai2_report", bsl_db_register_type_void, "[ai_name:string | script_id:int | ]", oni_call_noop},
	// records that the character has the lsi
	{"chr_has_lsi", bsl_db_register_type_bool, "[ai_name:string | script_id:int]", oni_call_noop},
	// unjams a door so characters can open it
	{"door_unjam", bsl_db_register_type_void, "door_id:int", oni_call_noop},
	// clears a characters inventory
	{"chr_inv_reset", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// Sets the weapon for a give character
	{"chr_weapon", bsl_db_register_type_void, "chr_index:int [weapon_name:string | weapon_num:int]", oni_call_noop},
	// resets a console to initial state
	{"console_reset", bsl_db_register_type_void, "console_id:int", oni_call_noop},
	// locks the character active
	{"chr_lock_active", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// tells an AI to run a particular path
	{"ai2_dopath", bsl_db_register_type_void, "[ai_name:string | script_id:int] path_name:string", oni_call_noop},
	// function plays an impulse sound
	{"sound_impulse_play", bsl_db_register_type_void, "name:string [volume:float | ]", oni_call_noop},
	// waits for a character to reach a specific animation state
	{"chr_wait_animstate", bsl_db_register_type_void, "void", oni_call_noop},
	// enable or disable a trigger volume
	{"trigvolume_enable", bsl_db_register_type_void, "name:string enable:int [type:string | ]", oni_call_noop},
	// removes a binding from a input function
	{"unbind", bsl_db_register_type_void, "input_name:string", oni_call_noop},
	// function to start an ambient sound
	{"sound_ambient_start", bsl_db_register_type_void, "name:string [volume:float | ]", oni_call_noop},
	// kills one or more AIs
	{"ai2_kill", bsl_db_register_type_void, "[param1:string | ] [param2:string | ]", oni_call_noop},
	// sets the active display mode
	{"m3_display_set", bsl_db_register_type_void, "device_index:int mode_index:int", oni_call_noop},
	// sets or clears an AI's non-combatant state
	{"ai2_noncombatant", bsl_db_register_type_void, "[ai_name:string | script_id:int] non_combatant:int", oni_call_noop},
	// plays an animation on a character
	{"chr_animate", bsl_db_register_type_void, "[ai_name:string | script_id:int] anim_name:string [num_frames:int | ] [interp_frames:int | ]", oni_call_noop},
	// creates a chump
	{"ai2_chump", bsl_db_register_type_void, "", oni_call_noop},
	// function to set the volume of playing music
	{"sound_music_volume", bsl_db_register_type_void, "name:string volume:float [time:float | ]", oni_call_noop},
	// starts the slowmotion timer
	{"slowmo", bsl_db_register_type_void, "duration:int", oni_call_noop},
	// turns off fight mode
	{"chr_peace", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// bla bla bla
	{"tr_write_lookup", bsl_db_register_type_void, "file_name:string", oni_call_noop},
	// locks a door
	{"door_lock", bsl_db_register_type_void, "door_id:int", oni_call_noop},
	// counts the number of people in a trigger volume
	{"trigvolume_count", bsl_db_register_type_int, "trig_id:int", oni_call_noop},
	// Disarms a character or everyone
	{"chr_disarm", bsl_db_register_type_void, "chr_index:int", oni_call_noop},
	// draws a dot at a specified location
	{"chr_draw_dot", bsl_db_register_type_void, "void", oni_call_noop},
	// sets an AI's shooting inaccuracy multiplier
	{"ai2_skill_inaccuracy", bsl_db_register_type_void, "inaccuracy:float", oni_call_noop},
	// tells an AI to report in verbosely
	{"ai2_report_verbose", bsl_db_register_type_void, "[ai_name:string | script_id:int | ]", oni_call_noop},
	// function to start character dialog playing after the current dialog finishes
	{"sound_dialog_play_block", bsl_db_register_type_void, "name:string", oni_call_noop},
	// reverts the shooting skill being edited to the saved copy,
	{"ai2_skill_revert", bsl_db_register_type_void, "ai2iscript_skill_revert", oni_call_noop},
	// Gives a powerup to a character
	{"give_powerup", bsl_db_register_type_void, "powerup_name:string [amount:int | ] [character:int | ]", oni_call_noop},
	// sets the far clipping plane
	{"gs_farclipplane_set", bsl_db_register_type_void, "plane:float", oni_call_noop},
	// sets a characters health to full by script id
	{"chr_full_health", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// changes a character's team
	{"chr_changeteam", bsl_db_register_type_void, "[ai_name:string | script_id:int] team_name:string", oni_call_noop},
	// sets the shade of a block of objects
	{"env_shade", bsl_db_register_type_void, "gq_ref:int gq_ref:int r:float g:float b:float", oni_call_noop},
	// sets the perf prefix
	{"perf_prefix", bsl_db_register_type_void, "void", oni_call_noop},
	// Sets the target to the specified flag
	{"target_set", bsl_db_register_type_void, "flag_id:int min_distance:float", oni_call_noop},
	// starts the countdown timer
	{"timer_start", bsl_db_register_type_void, "duration:float script:string", oni_call_noop},
	// causes a character to play a line of dialogue
	{"chr_talk", bsl_db_register_type_void, "[ai_name:string | script_id:int] sound_name:string pre_pause:int post_pause:int [priority:string | ]", oni_call_noop},
	// function writes a list of sounds which have broken links to a file
	{"sound_list_broken_links", bsl_db_register_type_void, "void", oni_call_noop},
	// Toggles particle performance display and sets event masks
	{"p3_perf", bsl_db_register_type_void, "void", oni_call_noop},
	// function to stop an ambient sound
	{"sound_ambient_stop", bsl_db_register_type_void, "name:string", oni_call_noop},
	// restores the game
	{"restore_game", bsl_db_register_type_void, "", oni_call_noop},
	// sets an AI's current movement mode
	{"ai2_setmovementmode", bsl_db_register_type_void, "[ai_name:string | script_id:int] mode:string", oni_call_noop},
	// makes a character weapon immune
	{"chr_weapon_immune", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// Lists a count of P3 particles
	{"p3_count", bsl_db_register_type_void, "void", oni_call_noop},
	// saves the game
	{"save_game", bsl_db_register_type_void, "save_point:int [type:string | ]", oni_call_noop},
	// deactivates a console
	{"console_deactivate", bsl_db_register_type_void, "console_id:int", oni_call_noop},
	// function to interrupt the current character dialog and play a new one
	{"sound_dialog_play_interrupt", bsl_db_register_type_void, "name:string", oni_call_noop},
	// resets a trigger to non-triggered state
	{"trig_reset", bsl_db_register_type_void, "trigger_id:int", oni_call_noop},
	// makes a single AI ignore the player
	{"ai2_makeignoreplayer", bsl_db_register_type_void, "[ai_name:string | script_id:int] on_off:int", oni_call_noop},
	// sets if we killed griffen
	{"killed_griffen", bsl_db_register_type_void, "murder:bool", oni_call_noop},
	// this character will not die too much
	{"chr_death_lock", bsl_db_register_type_void, "[ai_name:string | script_id:int] on_off:int", oni_call_noop},
	// deactivates a turret
	{"turret_deactivate", bsl_db_register_type_void, "turret_id:int", oni_call_noop},
	// function to set the volume of a playing ambient sound
	{"sound_ambient_volume", bsl_db_register_type_void, "name:string volume:float [time:float | ]", oni_call_noop},
	// sets an AI's best aiming angle in degrees
	{"ai2_skill_bestangle", bsl_db_register_type_void, "best_angle:float", oni_call_noop},
	// resets all unheld weapons to their starting state
	{"weapon_reset", bsl_db_register_type_void, "void", oni_call_noop},
	// makes an AI panic or not panic
	{"ai2_panic", bsl_db_register_type_void, "[ai_name:string | script_id:int] timer:int", oni_call_noop},
	// sets the alert state of an AI
	{"ai2_setalert", bsl_db_register_type_void, "[ai_name:string | script_id:int] alert:string", oni_call_noop},
	// marks a point in a cutscene
	{"cutscene_sync", bsl_db_register_type_void, "void", oni_call_noop},
	// makes a character utter a vocalization
	{"chr_vocalize", bsl_db_register_type_void, "[ai_name:string | script_id:int] type:string", oni_call_noop},
	// selects a shooting skill to edit
	{"ai2_skill_select", bsl_db_register_type_void, "char_class:string weapon_name:string", oni_call_noop},
	// Turns on the text console display
	{"text_console", bsl_db_register_type_void, "name:string", oni_call_noop},
	// forces an AI to attack another character
	{"ai2_attack", bsl_db_register_type_void, "[ai_name:string | script_id:int] [target_name:string | target_script_id:int]", oni_call_noop},
	// trips an alarm
	{"ai2_tripalarm", bsl_db_register_type_void, "alarm_id:int [ai_name:string | script_id:int | ]", oni_call_noop},
	// prints AIs that are nearby
	{"who", bsl_db_register_type_void, "", oni_call_noop},
	// Starts temporary-particle-creation mode
	{"particle_temp_start", bsl_db_register_type_void, "void", oni_call_noop},
	// function to start a movie playing
	{"movie_play", bsl_db_register_type_void, "name:string", oni_call_noop},
	// resets all placed powerups to their starting points
	{"powerup_reset", bsl_db_register_type_void, "void", oni_call_noop},
	// sets an AI's grouping decay
	{"ai2_skill_decay", bsl_db_register_type_void, "decay_amount:float", oni_call_noop},
	// closes a door (may not stay open)
	{"door_close", bsl_db_register_type_void, "door_id:int", oni_call_noop},
	// resets the camera
	{"cm_reset", bsl_db_register_type_void, "[maxspeed:float | ] [maxfocalaccel:float | ]", oni_call_noop},
	// Shows all registered variables and commands
	{"dump_docs", bsl_db_register_type_void, "void", oni_call_noop},
	// creates a new weapon
	{"weapon_spawn", bsl_db_register_type_void, "weapontype:string flag:int", oni_call_noop},
	// set's a character's super value
	{"chr_super", bsl_db_register_type_void, "[ai_name:string | script_id:int] super_amount:float", oni_call_noop},
	// starts or stops letterboxing
	{"letterbox", bsl_db_register_type_void, "start_stop:int", oni_call_noop},
	// waits until a character's health falls below a value
	{"chr_wait_health", bsl_db_register_type_void, "[ai_name:string | script_id:int] hit_points:int", oni_call_noop},
	// makes an AI aware of another character
	{"ai2_makeaware", bsl_db_register_type_void, "[ai_name:string | script_id:int] [target_name:string | target_script_id:int]", oni_call_noop},
	// start the display of a cinematic insert
	{"cinematic_start", bsl_db_register_type_void, "bitmap_name:string draw_width:int draw_height:int start:int end:int velocity:float mirror:bool", oni_call_noop},
	// makes a character unstoppable
	{"chr_unstoppable", bsl_db_register_type_void, "[ai_name:string | script_id:int] [on_off:int]", oni_call_noop},
	// displays a splash screen
	{"splash_screen", bsl_db_register_type_void, "texture:string", oni_call_noop},
	// turns display of an object on or off
	{"obj_hide", bsl_db_register_type_void, "obj_id:int [ obj_id:int | ]", oni_call_noop},
	// Dump all particle classes with collision to a text file
	{"p3_listcollision", bsl_db_register_type_void, "void", oni_call_noop},
	// disables the weapon variant for a character
	{"chr_dontaim", bsl_db_register_type_void, "[ai_name:string | script_id:int] on_off:int", oni_call_noop},
	// debugging: enables the HUD help overlays
	{"ui_show_help", bsl_db_register_type_void, "enable:int", oni_call_noop},
	// Spawns a new P3 particle
	{"p3_spawn", bsl_db_register_type_void, "particle_class:string [velocity:float | ]", oni_call_noop},
	// sets whether handled errors are silent
	{"ai2_set_handlesilenterror", bsl_db_register_type_void, "handle_silent:bool [subsystem:string | ]", oni_call_noop},
	// tells an AI to look at the player
	{"ai2_lookatme", bsl_db_register_type_void, "[ai_name:string | script_id:int | ]", oni_call_noop},
	// plays an environment animation on a character and blocks
	{"chr_envanim_block", bsl_db_register_type_void, "[ai_name:string | script_id:int] anim:string [norotation:string | ]", oni_call_noop},
	// makes the player character fall front
	{"fall_back", bsl_db_register_type_void, "void", oni_call_noop},
	// resets a turret to initial state
	{"turret_reset", bsl_db_register_type_void, "turret_id:int", oni_call_noop},
	// Unlocks a specific diary page on the current level.
	{"diary_page_unlock", bsl_db_register_type_void, "page:int", oni_call_noop},
	// sets an AI's grouping error
	{"ai2_skill_error", bsl_db_register_type_void, "error_amount:float", oni_call_noop},
	// reloads the sounds objects
	{"sound_objects_reset", bsl_db_register_type_void, "void", oni_call_noop},
	// Sets character's health
	{"chr_health", bsl_db_register_type_void, "chr_index:int [hit_points:int | ]", oni_call_noop},
	// computes the number of objects in a range that have all their glass broken
	{"env_broken", bsl_db_register_type_int, "gq_ref:int [gq_endref:int | ]", oni_call_noop},
	// gives a character a new weapon
	{"chr_giveweapon", bsl_db_register_type_void, "[ai_name:string | script_id:int] weapon_name:string", oni_call_noop},
	// Displays the characters combat stats
	{"chr_display_combat_stats", bsl_db_register_type_void, "chr_index:int", oni_call_noop},
	// opens a door (may not stay open)
	{"door_open", bsl_db_register_type_void, "door_id:int", oni_call_noop},
	// plays an environment animation on a character
	{"chr_envanim", bsl_db_register_type_void, "[ai_name:string | script_id:int] anim:string [norotation:string | ]", oni_call_noop},
	// makes a corpse
	{"make_corpse", bsl_db_register_type_void, "corpse_name:string", oni_call_noop},
	// binds an input to a function
	{"bind", bsl_db_register_type_void, "input_name:string to:string input_function:string", oni_call_noop},
	// reload scripts for a level
	{"script_reload", bsl_db_register_type_void, "void", oni_call_noop},
	// [ai_name:string | script_id:int] passive:int
	{"ai2_passive", bsl_db_register_type_void, "[ai_name:string | script_id:int], int passive", oni_call_noop},
	// Stops all environmental particles
	{"p3_stopall", bsl_db_register_type_void, "void", oni_call_noop},
	// makes the AI movement system take control of the player
	{"ai2_takecontrol", bsl_db_register_type_void, "on_off:int", oni_call_noop},
	// plays back a film
	{"chr_playback", bsl_db_register_type_void, "[ai_name:string | script_id:int] film_name:string [mode:string | ] [num_frames:int | ]", oni_call_noop},
	// creates a range of objects
	{"obj_create", bsl_db_register_type_void, "obj_id:int [ obj_id:int | ]", oni_call_noop},
	// sets which character we're authoring for a film
	{"sc_focus", bsl_db_register_type_void, "chr_index:int", oni_call_noop},
	// Stops temporary-particle-creation mode
	{"particle_temp_stop", bsl_db_register_type_void, "void", oni_call_noop},
	// selects a path square in the player's BNV for debugging
	{"ai2_pathdebugsquare", bsl_db_register_type_void, "x:int y:int", oni_call_noop},
	// turns display of an object on or off
	{"obj_show", bsl_db_register_type_void, "obj_id:int [ obj_id:int | ]", oni_call_noop},
	// reset a trigger volume to its level-load state
	{"trigvolume_reset", bsl_db_register_type_void, "name:string", oni_call_noop},
	// locks the character active
	{"chr_unlock_active", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// creates and starts an AI from a character object
	{"ai2_spawn", bsl_db_register_type_void, "ai_name:string [force_spawn:string | ]", oni_call_noop},
	// deletes a character
	{"chr_delete", bsl_db_register_type_void, "[ai_name:string | script_id:int]", oni_call_noop},
	// end
	NULL
};

static bsl_register_var_item GLOBAL_VARIABLES[] = {
	// Turns off all melee damage
	{"chr_disable_melee", bsl_db_register_type_bool},
	// Controls the size of the main character
	{"wp_pow_adjustment", bsl_db_register_type_float},
	// turns on pathfinding dynamic grid display
	{"ai2_showdynamicgrids", bsl_db_register_type_bool},
	// enables position-sensitive weighting of spacing behaviors
	{"ai2_spacing_weights", bsl_db_register_type_bool},
	// enables editable recoil
	{"recoil_edit", bsl_db_register_type_bool},
	// Turns on the drawing of characters
	{"gs_show_characters", bsl_db_register_type_bool},
	// number of cookies per fight
	{"ai2_spacing_cookies", bsl_db_register_type_int},
	// Disables weapon fading
	{"wp_disable_fade", bsl_db_register_type_bool},
	// Sets strength of hypo spray
	{"wp_hypostrength", bsl_db_register_type_int},
	// stops the chump
	{"ai2_chump_stop", bsl_db_register_type_bool},
	// Controls the size of the main character
	{"wp_scale_adjustment", bsl_db_register_type_float},
	// Enables the display of turrets
	{"show_turrets", bsl_db_register_type_bool},
	// draws a health bar for every AI above their head
	{"ai2_showhealth", bsl_db_register_type_bool},
	// draws the name of every AI above their head
	{"ai2_shownames", bsl_db_register_type_bool},
	// Draws laser / environment collisions.
	{"show_laser_env_collision", bsl_db_register_type_bool},
	// inverts the aiming
	{"am_invert", bsl_db_register_type_bool},
	// lets Barabbas run while carrying his gun
	{"ai2_barabbas_run", bsl_db_register_type_bool},
	// Specifies the distance from the camera that patrol point names no longer draw.
	{"patrolpath_name_distance", bsl_db_register_type_float},
	// sets character bounding box collision grow amount
	{"chr_collision_grow", bsl_db_register_type_float},
	//
	{"wp_force_no_scale", bsl_db_register_type_bool},
	// shows AI firing spread knowledge
	{"ai2_showfiringspreads", bsl_db_register_type_bool},
	// Toggles display of the clouds
	{"sky_show_clouds", bsl_db_register_type_bool},
	// turns on inactive -> active pathfinding rendering
	{"ai2_showactivationpaths", bsl_db_register_type_bool},
	// Toggle keyboard applied forces
	{"ph_debug_keyforces", bsl_db_register_type_bool},
	// shows the count of visable environment quads
	{"env_show_quad_count", bsl_db_register_type_bool},
	// makes all AI ignore the player
	{"ai2_ignore_player", bsl_db_register_type_bool},
	// draws a line from the player to every AI
	{"ai2_showlinetochar", bsl_db_register_type_bool},
	// enables fast lookup
	{"fast_lookup", bsl_db_register_type_bool},
	// shows ID numbers for combat, melee and neutral settings
	{"ai2_debug_showsettingIDs", bsl_db_register_type_bool},
	// Enables the display of triggers
	{"show_triggers", bsl_db_register_type_bool},
	// fog end
	{"gl_fog_end", bsl_db_register_type_float},
	// turns off the AI's sound sensing system
	{"ai2_deaf", bsl_db_register_type_bool},
	// Draws the main character small
	{"chr_mini_me", bsl_db_register_type_bool},
	// Enables performance display
	{"show_performance_gsd", bsl_db_register_type_bool},
	// Toggles display of the sky
	{"sky_show_sky", bsl_db_register_type_bool},
	// Should we center the cursor
	{"li_center_cursor", bsl_db_register_type_bool},
	// debug local-path code from player's position and facing
	{"ai2_debug_localpathfinding", bsl_db_register_type_bool},
	// makes the game wait for a key before level load
	{"wait_for_key", bsl_db_register_type_bool},
	// turns on pathfinding grid rendering
	{"ai2_showgrids", bsl_db_register_type_bool},
	// Use this to control the input sensitivity
	{"gs_input_accel", bsl_db_register_type_float},
	// set the number of events before the AI will stop ignoring
	{"ai2_stopignoring_count", bsl_db_register_type_int},
	// fog disabled
	{"gl_fog_disabled", bsl_db_register_type_bool},
	// forces all characters to be active
	{"chr_all_active", bsl_db_register_type_bool},
	// bla bla
	{"cm_jello_amt", bsl_db_register_type_float},
	// Shows Texture name
	{"am_show_texturename", bsl_db_register_type_bool},
	// makes the laser pointer hit all objects
	{"am_hit_everything", bsl_db_register_type_bool},
	// shows the bnv of the main character
	{"chr_show_bnv", bsl_db_register_type_bool},
	// Sound spheres will always be drawn, not just when a sound sphere is selected.
	{"show_sound_spheres", bsl_db_register_type_bool},
	// shows grid squares that are evaluated by the A* pathfinding
	{"ai2_showastar", bsl_db_register_type_bool},
	// lets you disable use of DXT1
	{"gl_disable_dxt1", bsl_db_register_type_bool},
	// Toggles display of the skybox
	{"sky_show_skybox", bsl_db_register_type_bool},
	// camera height
	{"cm_height", bsl_db_register_type_float},
	// Display trigger volumes
	{"show_triggervolumes", bsl_db_register_type_bool},
	// shows the count of physics
	{"gs_show_physics_count", bsl_db_register_type_bool},
	// makes player invincible
	{"invincible", bsl_db_register_type_bool},
	// enables auto aiming
	{"chr_weapon_auto_aim", bsl_db_register_type_bool},
	// Specifies the id for a new flag
	{"flag_new_id", bsl_db_register_type_int},
	// the number of game ticks until charaters begin to fade
	{"chr_death_fade_start", bsl_db_register_type_int},
	// Enables debugging information for overlays
	{"chr_debug_overlay", bsl_db_register_type_bool},
	// saved_film_loop
	{"saved_film_loop", bsl_db_register_type_bool},
	// 2^n amount of reduction
	{"gs_screen_shot_reduce", bsl_db_register_type_int},
	// Sound rings will always be drawn, not just when a sound is selected.
	{"show_sound_all", bsl_db_register_type_bool},
	// Enables character collision
	{"chr_enable_collision", bsl_db_register_type_bool},
	// binds f2 to a specific animation
	{"sc_bind_f2", bsl_db_register_type_string},
	// Draws everyone with a big head
	{"chr_big_head", bsl_db_register_type_bool},
	// return speed
	{"recoil_return_speed", bsl_db_register_type_float},
	// pins a character to the ground
	{"chr_pin_character", bsl_db_register_type_bool},
	// the number of game ticks until charaters fade over
	{"chr_death_fade_frames", bsl_db_register_type_int},
	// base
	{"recoil_base", bsl_db_register_type_float},
	// saved_film_character_offset
	{"saved_film_character_offset", bsl_db_register_type_int},
	// footstep flash mode
	{"footstep_flash", bsl_db_register_type_bool},
	// dumps the closest GQ index file/obj name to console
	{"am_show_filenames", bsl_db_register_type_bool},
	// Disables all door locks
	{"door_ignore_locks", bsl_db_register_type_bool},
	// makes player omnipotent
	{"omnipotent", bsl_db_register_type_bool},
	// disable_depth_reads
	{"gl_disable_depth_reads", bsl_db_register_type_bool},
	// color to clear the back buffer to
	{"m3_clear_color", bsl_db_register_type_int},
	// Controls the size of the big head
	{"chr_big_head_amount", bsl_db_register_type_float},
	// Makes all furniture breakable.
	{"p3_furniture_breakable", bsl_db_register_type_bool},
	// bla bla
	{"cm_jello_radius", bsl_db_register_type_float},
	// Enables drawing of the facing vector
	{"chr_draw_facing_vector", bsl_db_register_type_bool},
	// Enables the display of triggers
	{"laser_alpha", bsl_db_register_type_bool},
	// fog green
	{"gl_fog_green", bsl_db_register_type_float},
	// fog start
	{"gl_fog_start", bsl_db_register_type_float},
	// debug AI's melee intersections
	{"ai2_showintersections", bsl_db_register_type_bool},
	// control pathfinding debugging
	{"chr_debug_pathfinding", bsl_db_register_type_bool},
	// Enables the display of flags
	{"show_flags", bsl_db_register_type_bool},
	// Enables performance display
	{"show_performance_gsu", bsl_db_register_type_bool},
	// binds f3 to a specific animation
	{"sc_bind_f3", bsl_db_register_type_string},
	// lets you disable packed-pixels support
	{"gl_disable_packed_pixels", bsl_db_register_type_bool},
	// turns on aiming screen debugging
	{"chr_debug_aiming_screen", bsl_db_register_type_bool},
	// Enables performance display
	{"show_performance", bsl_db_register_type_bool},
	// jello camera plane test
	{"cm_plane_test", bsl_db_register_type_bool},
	// draws doorframes for all unplaced doors
	{"door_drawframes", bsl_db_register_type_bool},
	// lets the player kick weapons
	{"wp_kickable", bsl_db_register_type_bool},
	// makes player unstoppable
	{"unstoppable", bsl_db_register_type_bool},
	// Toggles texture mapping or gouraud
	{"m3_texture", bsl_db_register_type_bool},
	// toggles character bounding box / bounding sphere collision
	{"chr_collision_box", bsl_db_register_type_bool},
	// enables AI boss-battle target selection
	{"ai2_boss_battle", bsl_db_register_type_bool},
	// Enables the display of turret debug lines
	{"turret_show_debug", bsl_db_register_type_bool},
	// Turns on the drawing of particles
	{"gs_show_particles", bsl_db_register_type_bool},
	// Turns on the drawing of objects
	{"gs_show_objects", bsl_db_register_type_bool},
	// footstep debugging mode
	{"chr_debug_footsteps", bsl_db_register_type_bool},
	// enables text message display
	{"co_message_display", bsl_db_register_type_bool},
	// fog red
	{"gl_fog_red", bsl_db_register_type_float},
	// verbose footstep debugging mode
	{"chr_debug_footsteps_verbose", bsl_db_register_type_bool},
	// shows prediction info for AI2 characters
	{"ai2_showprediction", bsl_db_register_type_bool},
	// enables debugging display of sound occlusions
	{"sound_show_occlusions", bsl_db_register_type_bool},
	// Specifies the distance from the camera that character names no longer draw.
	{"character_name_distance", bsl_db_register_type_float},
	// sets the number of rays to cast
	{"env_ray_number", bsl_db_register_type_int},
	// Turns on a call to sleep to make debugging easier
	{"gs_sleep", bsl_db_register_type_bool},
	// enable physics debugging visuals
	{"ob_show_debug", bsl_db_register_type_bool},
	// highlights a particular gq
	{"env_highlight_gq", bsl_db_register_type_int},
	// turns no debugging for the handle code
	{"chr_debug_handle", bsl_db_register_type_bool},
	// Turns on the sky
	{"gs_show_sky", bsl_db_register_type_bool},
	// Toggles buffer clear
	{"m3_buffer_clear", bsl_db_register_type_bool},
	// Draws particle / environment collisions.
	{"p3_show_env_collision", bsl_db_register_type_bool},
	// forces a given lod if it is between 0 and 4
	{"chr_lod", bsl_db_register_type_int},
	// Enables drawing of the aiming vector
	{"chr_draw_aiming_vector", bsl_db_register_type_bool},
	// turns off the AI's visual sensing system
	{"ai2_blind", bsl_db_register_type_bool},
	// lets you disable miplevels (-ve = disable big, +ve = disable small)
	{"gl_mipmap_offset", bsl_db_register_type_int},
	// Suppresses UI prompting about new objectives or moves.
	{"ui_suppress_prompt", bsl_db_register_type_bool},
	// prints impacts as they occur
	{"debug_impacts", bsl_db_register_type_bool},
	// Enables environment collision
	{"env_collision", bsl_db_register_type_bool},
	// spatial footsteps
	{"spatial_footsteps", bsl_db_register_type_bool},
	// set the delay timer before the AI forgets about ignored events,&AI2gSound_StopIgnoring_Time
	{"ai2_stopignoring_time", bsl_db_register_type_int},
	// Draws character / environment collisions.
	{"show_chr_env_collision", bsl_db_register_type_bool},
	// prints information about each AI spawn
	{"ai2_printspawn", bsl_db_register_type_bool},
	// Specifies the distance from the camera that flag names no longer draw.
	{"flag_name_distance", bsl_db_register_type_float},
	//
	{"gs_show_corpses", bsl_db_register_type_bool},
	// makes the ear stable
	{"gs_stable_ear", bsl_db_register_type_bool},
	// turns the laser line off
	{"marketing_line_off", bsl_db_register_type_bool},
	//
	{"fx_laser_width", bsl_db_register_type_float},
	// Show specially flagged noncollision quads
	{"env_show_stairflagged", bsl_db_register_type_bool},
	// Enables movement debugging information for characters
	{"chr_show_movement", bsl_db_register_type_int},
	// makes the game run fast
	{"fast_mode", bsl_db_register_type_bool},
	// When true the environment only renders triangles in the octnode that contains the manual camera
	{"env_show_octnode_gqs", bsl_db_register_type_bool},
	// When true show ghost GQs
	{"env_show_ghostgqs", bsl_db_register_type_bool},
	// displays font cache texture
	{"debug_font_cache", bsl_db_register_type_bool},
	// at what percent of lookspring fight mode turns off
	{"cm_lookspring_percent", bsl_db_register_type_float},
	// draw every frame multiple
	{"draw_every_frame_multiple", bsl_db_register_type_int},
	// Turns on/off debugging of collision
	{"chr_debug_collision", bsl_db_register_type_bool},
	// camera canter
	{"cm_canter_unarmed", bsl_db_register_type_float},
	// draws a green cross at each AI's job location
	{"ai2_showjoblocations", bsl_db_register_type_bool},
	// Enables debugging information for characters
	{"chr_debug_characters", bsl_db_register_type_bool},
	// enables console display
	{"co_display", bsl_db_register_type_bool},
	// Draw the rays
	{"env_show_rays", bsl_db_register_type_bool},
	// dumps the closest GQ index to console
	{"am_show_closest", bsl_db_register_type_bool},
	// weights down non-attack techniques so they are never more than attacks, &AI2gMeleeWeightCorrection
	{"ai2_melee_weightcorrection", bsl_db_register_type_bool},
	// Enables sphere tree debugging for characters
	{"chr_debug_sphere", bsl_db_register_type_bool},
	//
	{"wp_force_scale", bsl_db_register_type_bool},
	// true if zcompare is on
	{"m3_zcompareon", bsl_db_register_type_bool},
	// enable physics
	{"ph_active", bsl_db_register_type_bool},
	// Enables collision debugging display
	{"p3_debug_collision", bsl_db_register_type_int},
	// enable trigger volume debugging
	{"debug_triggers", bsl_db_register_type_bool},
	// Toggles wireframe vs filled triangles
	{"m3_fill_solid", bsl_db_register_type_bool},
	// disable visibility activation
	{"chr_disable_visactive", bsl_db_register_type_bool},
	// sky height
	{"sky_height", bsl_db_register_type_float},
	// Enables the display of character starting positions
	{"show_characters", bsl_db_register_type_bool},
	// puts the game in single step mode
	{"single_step", bsl_db_register_type_bool},
	// number of degress of aiming width
	{"chr_aim_width", bsl_db_register_type_float},
	// shows AI sounds as they are generated
	{"ai2_showsounds", bsl_db_register_type_bool},
	// shows world axes
	{"am_show_axes", bsl_db_register_type_bool},
	// Selects the character debugging target
	{"chr_debug_target", bsl_db_register_type_int},
	// Enables display of environment octtree traversal
	{"env_show_octtree", bsl_db_register_type_bool},
	// Turns on doing the environment
	{"gs_show_environment", bsl_db_register_type_bool},
	// shows the count of objects
	{"gs_show_object_count", bsl_db_register_type_bool},
	// Sound rectangles will always be drawn, not just when a sound Rectangle is selected.
	{"show_sound_rectangles", bsl_db_register_type_bool},
	// forces the drawing of all characters
	{"chr_draw_all_characters", bsl_db_register_type_bool},
	// camera canter
	{"cm_canter_weapon", bsl_db_register_type_float},
	// which save point we are on
	{"save_point", bsl_db_register_type_int},
	// enable AI gun behavior debugging
	{"debug_gun_behavior", bsl_db_register_type_bool},
	// Enables character shadows
	{"gs_show_shadows", bsl_db_register_type_bool},
	// turns on pathfinding connection rendering
	{"ai2_showconnections", bsl_db_register_type_bool},
	// shows the path each AI is following
	{"ai2_showpaths", bsl_db_register_type_bool},
	// enables sync debugging
	{"sync_debug", bsl_db_register_type_bool},
	// shows local-environment melee awareness
	{"ai2_showlocalmelee", bsl_db_register_type_bool},
	// Sets the distance at which the radar will start to change from its minimum.
	{"target_max_distance", bsl_db_register_type_float},
	// controls trigger quad debugging
	{"chr_debug_trigger_quad", bsl_db_register_type_bool},
	// shows AI projectile knowledge
	{"ai2_showprojectiles", bsl_db_register_type_bool},
	// shows targeting info for AI2 characters
	{"ai2_showtargeting", bsl_db_register_type_bool},
	// Makes corpses fade when they are offscreen.
	{"chr_corpse_fade_offscreen", bsl_db_register_type_bool},
	// Displays sound debugging info
	{"sound_show_debug", bsl_db_register_type_bool},
	// Controls the size of the main character
	{"chr_mini_me_amount", bsl_db_register_type_float},
	// toggle display of colliding quads
	{"ph_show_collisions", bsl_db_register_type_bool},
	// Sets free time for powerups
	{"wp_fadetime", bsl_db_register_type_int},
	// Toggles double buffer mode
	{"m3_double_buffer", bsl_db_register_type_bool},
	// shows AI line-of-sight checking
	{"ai2_showlos", bsl_db_register_type_bool},
	// shows the count of active scripting contexts
	{"gs_show_scripting_count", bsl_db_register_type_bool},
	// number of degress of auto aiming arc
	{"chr_auto_aim_arc", bsl_db_register_type_float},
	// enables visual display of pathfinding errors
	{"ai2_showpathfindingerrors", bsl_db_register_type_bool},
	// Shows debug geometry
	{"door_show_debug", bsl_db_register_type_bool},
	// forces drawing of every frame
	{"draw_every_frame", bsl_db_register_type_bool},
	// Turns on the ui
	{"gs_show_ui", bsl_db_register_type_bool},
	// Draws a circle where door activates
	{"door_show_activation", bsl_db_register_type_bool},
	// controls the angle at which the characters can block
	{"chr_block_angle", bsl_db_register_type_float},
	// max
	{"recoil_max", bsl_db_register_type_float},
	// controls drawing of weapons
	{"chr_draw_weapon", bsl_db_register_type_bool},
	// fog blue
	{"gl_fog_blue", bsl_db_register_type_float},
	// shows the current lod of the main character
	{"chr_show_lod", bsl_db_register_type_bool},
	// prints debugging information about console usage
	{"debug_consoles", bsl_db_register_type_bool},
	// uses bad door lighting
	{"door_pop_lighting", bsl_db_register_type_bool},
	// distance for auto aiming
	{"chr_auto_aim_dist", bsl_db_register_type_float},
	// Prints debugging info about character melee impacts
	{"chr_debug_impacts", bsl_db_register_type_bool},
	// Draw only the GQs used for visibility
	{"env_drawvisonly", bsl_db_register_type_bool},
	// Turns on printing of the sound effect
	{"chr_print_sound", bsl_db_register_type_bool},
	// Enables character activity
	{"chr_active", bsl_db_register_type_bool},
	// number of lines to cast to debug local-movement code
	{"ai2_debug_localmove_lines", bsl_db_register_type_int},
	// Enables the display of AI patrol path objects
	{"show_patrolpaths", bsl_db_register_type_bool},
	// Offset from the horizontal edge of the screen for the cinematic insert.
	{"cinematic_yoffset", bsl_db_register_type_float},
	// Enables vertex interpolation for the triangle
	{"m3_shade_vertex", bsl_db_register_type_bool},
	// prints debugging info about weapon particle events
	{"debug_weapons", bsl_db_register_type_bool},
	// Enables breakable glass.
	{"p3_glass_breakable", bsl_db_register_type_bool},
	// Offset from the vertical edge of the screen for the cinematic insert.
	{"cinematic_xoffset", bsl_db_register_type_float},
	// factor
	{"recoil_factor", bsl_db_register_type_float},
	// controls debugging falling
	{"chr_debug_fall", bsl_db_register_type_bool},
	// shows circles that represent the combat ranges of each AI
	{"ai2_showcombatranges", bsl_db_register_type_bool},
	// shows fights in progress
	{"ai2_showfights", bsl_db_register_type_bool},
	// Enables display of environment octtree leaf nodes
	{"env_show_leafnodes", bsl_db_register_type_bool},
	// enable script debugging
	{"debug_scripts", bsl_db_register_type_bool},
	// Toggles display of the stars
	{"sky_show_stars", bsl_db_register_type_bool},
	// Draw all the GQs
	{"env_drawallgqs", bsl_db_register_type_bool},
	//
	{"wp_force_half_scale", bsl_db_register_type_bool},
	// shows each AI's vision cones (central and peripheral)
	{"ai2_showvision", bsl_db_register_type_bool},
	// Shows weapon ID
	{"chr_show_weaponid", bsl_db_register_type_bool},
	// 0 = normal buffer
	{"chr_buffer_size", bsl_db_register_type_int},
	// The fade time of the console
	{"co_fade_time", bsl_db_register_type_int},
	// Draw the frustum around the environment camera
	{"env_drawfrustum", bsl_db_register_type_bool},
	// master enable switch for spacing behavior
	{"ai2_spacing_enable", bsl_db_register_type_bool},
	// changes the priority of messages to display on the console
	{"co_priority", bsl_db_register_type_int},
	// turns on laser sights for AI2 characters
	{"ai2_showlasers", bsl_db_register_type_bool},
	// camera distance
	{"cm_distance", bsl_db_register_type_float},
	// Makes every quad breakable.
	{"p3_everything_breakable", bsl_db_register_type_bool},
	// Toggles display of the planet (sun/moon)
	{"sky_show_planet", bsl_db_register_type_bool},
	// debug local-movement code from player's position
	{"ai2_debug_localmovement", bsl_db_register_type_bool},
	// end of list
	NULL
};

static char *BSL_GLOBAL_DEFINES = "# dumps stats for a playback film\n \
func  chr_playback_debug(string film_name) {\n}\n \
\n \
# Kills any temporary particles\n \
func void particle_temp_kill(void) {\n}\n \
\n \
# returns if this character is the player\n \
func bool chr_is_player([ai_name:string | script_id:int]) {\n}\n \
\n \
# returns if we did kill griffen\n \
func int did_kill_griffen(void) {\n}\n \
\n \
# locks keys out\n \
func void lock_keys(void) {\n}\n \
\n \
# tells an AI to move to a flag\n \
func  ai2_movetoflag([ai_name:string | script_id:int], int flag_id, string setfacing) {\n}\n \
\n \
# lists all the engines\n \
func void m3_geom_engine_list(void) {\n}\n \
\n \
# makes a single AI blind\n \
func  ai2_makeblind([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# lists all the players\n \
func void chr_who(void) {\n}\n \
\n \
# makes the player character fall front\n \
func void fall_front(void) {\n}\n \
\n \
# Sets the main characters class\n \
func void chr_main_class([class_name:string | class_index:int]) {\n}\n \
\n \
# sets a triggers speed\n \
func  trig_speed(int trigger_id, float volume) {\n}\n \
\n \
# forces an AI into active mode\n \
func  ai2_active([ai_name:string | script_id:int]) {\n}\n \
\n \
# initiates a camera interpolation\n \
func void cm_interpolate_block(string anim_name, int num_frames) {\n}\n \
\n \
# function to start character dialog playing\n \
func void sound_dialog_play(string name) {\n}\n \
\n \
# kills all the AI\n \
func void chr_kill_all_ai(void) {\n}\n \
\n \
# begins a cutscene\n \
func void begin_cutscene(void) {\n}\n \
\n \
# sets up an AIs neutral-interaction\n \
func  ai2_neutralbehavior([ai_name:string | script_id:int], string behavior) {\n}\n \
\n \
# debugging message\n \
func void dmsg(string astring) {\n}\n \
\n \
# shows or hides part of the HUD\n \
func void ui_show_element(string element_name, int show) {\n}\n \
\n \
# swaps an environment texture\n \
func void env_texswap(int gq_start, string tex_name) {\n}\n \
\n \
# special camera for barabus\n \
func  cm_barabus([ai_name:string | script_id:int], float away, float up, int time) {\n}\n \
\n \
# turns input on or off\n \
func void input(int on_off) {\n}\n \
\n \
# finds all BNV connections from the players location\n \
func  ai2_findconnections(int distance) {\n}\n \
\n \
# forces a character to hold a key down for some frames\n \
func  chr_holdkey([ai_name:string | script_id:int], string key_name, int num_frames) {\n}\n \
\n \
# Sets the character class of a specific character\n \
func void chr_set_class(int chr_index, [class_name:string | class_index:int]) {\n}\n \
\n \
# prints all doors in the level to file\n \
func  door_printall() {\n}\n \
\n \
# tells an AI to take its current state as its job\n \
func  ai2_setjobstate([ai_name:string | script_id:int]) {\n}\n \
\n \
# removes all bindings\n \
func void unbindall(void) {\n}\n \
\n \
# puts the camera in orbit mode\n \
func void cm_orbit(float speed, float stopangle) {\n}\n \
\n \
# crashes the game (used for testing error handling)\n \
func void crash(string when) {\n}\n \
\n \
# Creates and starts all environmental particles\n \
func void p3_startall(void) {\n}\n \
\n \
# bla bla bla\n \
func void tr_stop_lookup(void) {\n}\n \
\n \
# Prints out all environmental particles with tags\n \
func void p3_printtags(void) {\n}\n \
\n \
# Sets the location of any character\n \
func void chr_location([ai_name:string | chr_index:int], float loc_x, float loc_y, float loc_z) {\n}\n \
\n \
# saves the shooting skill being edited out as a text file\n \
func  ai2_skill_save() {\n}\n \
\n \
# Dump all particles to a text file\n \
func void p3_dumpparticles(void) {\n}\n \
\n \
# sets the mouse acceleration value\n \
func void mouse_acceleration(float accel) {\n}\n \
\n \
# tells an AI to run for an alarm\n \
func  ai2_doalarm([ai_name:string | script_id:int], int console_id) {\n}\n \
\n \
# resets corpses to their initial state\n \
func void corpse_reset() {\n}\n \
\n \
# prints an anim state\n \
func void print_state(int state) {\n}\n \
\n \
# prints an anim type \n \
func void print_type(int type) {\n}\n \
\n \
# Plays the objective-complete sound.\n \
func void objective_complete(void) {\n}\n \
\n \
# lists all the display modes\n \
func void m3_display_list(void) {\n}\n \
\n \
# resets all level mechanics (triggers, turrets, consoles, etc...) to initial state\n \
func  reset_mechanics() {\n}\n \
\n \
# Removes all dangerous projectile particles by making their lifetime expire\n \
func void p3_removedangerous(void) {\n}\n \
\n \
# stops all AIs from thinking for themselves\n \
func  ai2_allpassive(int passive) {\n}\n \
\n \
# Writes all particles used on this level to a text file\n \
func void p3_writeusedparticles(void) {\n}\n \
\n \
# Sends a command to environmental particles with a given tag\n \
func void particle(void) {\n}\n \
\n \
# disables collision for a character\n \
func  chr_nocollision([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# toggles camera Jello(tm) mode\n \
func void cm_jello(int mode) {\n}\n \
\n \
# kills all the characters inside a trigger volume\n \
func  trigvolume_kill(int trig_id) {\n}\n \
\n \
# spawns all AI even those not initially present\n \
func  ai2_spawnall() {\n}\n \
\n \
# tells an AI to become idle\n \
func  ai2_idle([ai_name:string | script_id:int]) {\n}\n \
\n \
# forces a character to holster their weapon\n \
func  chr_forceholster([ai_name:string | script_id:int], int holster, int force_draw) {\n}\n \
\n \
# lose this level\n \
func void lose(void) {\n}\n \
\n \
# creates a character from a .txt file\n \
func  chr_create(int script_id, string start_create) {\n}\n \
\n \
# fades the screen in\n \
func void fade_in(int ticks) {\n}\n \
\n \
# xxx\n \
func void ph_status(void) {\n}\n \
\n \
# initiates a camera animation\n \
func void cm_anim_block(string cam_spec, string anim_name) {\n}\n \
\n \
# activates a console\n \
func  console_activate(int console_id) {\n}\n \
\n \
# makes the camera wait until it is no longer busy\n \
func void cm_wait() {\n}\n \
\n \
# unlocks a door\n \
func  door_unlock(int door_id) {\n}\n \
\n \
# hides a trigger\n \
func  trig_hide(int trigger_id) {\n}\n \
\n \
# turns on or off specified parts of the environment\n \
func void env_show(int gq_ref, int on_off) { \n}\n \
\n \
# lists all the engines\n \
func void m3_draw_engine_list(void) {\n}\n \
\n \
# sets an AIs max delay between shots in frames\n \
func ai2_skill_delaymax(int maxdelay) {\n}\n \
\n \
# tells an AI to look at a character\n \
func  ai2_lookatchar([ai_name:string | script_id:int], [ai_name:string | script_id:int]) {\n}\n \
\n \
# snaps a characters facing to a flags facing\n \
func  chr_facetoflag([ai_name:string | script_id:int], int flag_id) {\n}\n \
\n \
# kills a range of object\n \
func void obj_kill(int obj_id, int obj_id2) {\n}\n \
\n \
# set the script to call from a trigger volume\n \
func  trigvolume_setscript(string name, string script, string type) {\n}\n \
\n \
# shows AI memory usage\n \
func  ai2_showmem() {\n}\n \
\n \
# sets the current graphics quality\n \
func void m3_quality_set(string quality) {\n}\n \
\n \
# sets the level of errors to report at console\n \
func  ai2_set_reporterror(string error_level, string subsystem) {\n}\n \
\n \
# sets an AIs min delay between shots in frames\n \
func  ai2_skill_delaymin(int mindelay) {\n}\n \
\n \
# sends a message from the subtitle file\n \
func void message(string message, int timer) {\n}\n \
\n \
# Kills the nearest P3 particle\n \
func void p3_killnearest(bool no_recreate) {\n}\n \
\n \
# makes a single AI deaf\n \
func  ai2_makedeaf([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# changes the fog start distance smoothly\n \
func void gl_fog_start_changeto(float start_val, int frames) {\n}\n \
\n \
# waits for a character to play a specific animation\n \
func  chr_wait_animation(void) {\n}\n \
\n \
# initiates a environment animation: blocks until completed\n \
func void env_anim_block(int obj_id, int obj_id2) {\n}\n \
\n \
# sets the field of view\n \
func void gs_fov_set(float fov_degrees) {\n}\n \
\n \
# turns display of an object on or off\n \
func void obj_shade(int obj_id, int obj_id, float r, float g, float b) {\n}\n \
\n \
# bla bla bla\n \
func void tr_write_collection(string collection_name, string file_name) {\n}\n \
\n \
# gives a character a powerup\n \
func  chr_givepowerup([ai_name:string | script_id:int], string powerup, int amount) {\n}\n \
\n \
# cycles console text color\n \
func void co_toggle_text(void) {\n}\n \
\n \
# sets up an animation for an object\n \
func void env_setanim_block(int obj_id, string object_name) {\n}\n \
\n \
# tells an AI to follow the player\n \
func  ai2_followme([ai_name:string | script_id:int]) {\n}\n \
\n \
# initiates a camera animation\n \
func void cm_anim(string cam_spec, string anim_name) {\n}\n \
\n \
# sets the active engine\n \
func void m3_engine_set(int geom_engine, int draw_engine) {\n}\n \
\n \
# returns if this character is holding a weapon that is empty\n \
func bool chr_has_empty_weapon([ai_name:string | script_id:int]) {\n}\n \
\n \
# Sets the location of any character to the camera location\n \
func void chr_location_settocamera(int chr_index) {\n}\n \
\n \
# sets part of the HUD to flash or not flash\n \
func void ui_flash_element(string element_name, int fill) {\n}\n \
\n \
# Sets the location of the player character\n \
func void goto(float loc_x, float loc_y, float loc_z) {\n}\n \
\n \
# win this level\n \
func void win(void) {\n}\n \
\n \
# fades the screen out\n \
func void fade_out([r:float | r:int], [g:float | g:int], [b:float | b:int], int ticks) {\n}\n \
\n \
# makes barabbas retrieve his gun if it is lost\n \
func  ai2_barabbas_retrievegun([ai_name:string | script_id:int]) {\n}\n \
\n \
# bla bla bla\n \
func void tr_write_animation(string anim_name, string file_name) {\n}\n \
\n \
# Selects what character to control\n \
func void chr_focus(int chr_index) {\n}\n \
\n \
# ends a cutscene\n \
func void end_cutscene() {\n}\n \
\n \
# returns the difficulty level\n \
func int difficulty(void) {\n}\n \
\n \
# plays back a film and blocks until complete\n \
func  chr_playback_block([ai_name:string | script_id:int], string film_name, string mode, int num_frames) {\n}\n \
\n \
# changes the fog end distance smoothly\n \
func void gl_fog_end_changeto(float end_val, int frames) {\n}\n \
\n \
# slowly poisons a character\n \
func  chr_poison([ai_name:string | script_id:int], int damage, int interval, int initial_interval) {\n}\n \
\n \
# sets an AIs recoil compensation amount (0-1)\n \
func  ai2_skill_recoil(float recoil_compensation) {\n}\n \
\n \
# kills all the corpses inside a trigger volume\n \
func  trigvolume_corpse(int trig_id) {\n}\n \
\n \
# initiates a environment animation: blocks until completed\n \
func void env_anim(int obj_id, int obj_id) {\n}\n \
\n \
# stop the display of a cinematic insert\n \
func void cinematic_stop(string bitmap_name, int end, float velocity) {\n}\n \
\n \
# resets AI as if start of level\n \
func  ai2_reset(int reset_player) {\n}\n \
\n \
# initiates a camera interpolation\n \
func void cm_interpolate(string anim_name, int num_frames) {\n}\n \
\n \
# function to start music playing\n \
func void sound_music_stop(string name) {\n}\n \
\n \
# activates a turret\n \
func  turret_activate(int turret_id) {\n}\n \
\n \
# starts the countdown timer\n \
func void timer_stop() {\n}\n \
\n \
# Sets the current objective page.\n \
func void objective_set(int page, string make_silent) {\n}\n \
\n \
# plays an animation on a character and blocks until done\n \
func  chr_animate_block([ai_name:string | script_id:int], string anim_name, int num_frames, int interp_frames) {\n}\n \
\n \
# prints location of a character\n \
func  where([ai_name:string | script_id:int]) {\n}\n \
\n \
# Disables parts of the daodan shield (for debugging)\n \
func void p3_daodan_disable(void) {\n}\n \
\n \
# sets the level of errors to log to file\n \
func  ai2_set_logerror(string error_level, string subsystem) {\n}\n \
\n \
# causes the player to make a sound (alerts nearby AIs)\n \
func  ai2_debug_makesound(string sound_type, float volume) {\n}\n \
\n \
# puts the camera in orbit mode\n \
func void cm_orbit_block(float speed, float stopangle) {\n}\n \
\n \
# Triggers an event on all P3 particles of a specified class\n \
func void p3_callevent(string particle_class, int event_index) {\n}\n \
\n \
# shows a trigger\n \
func  trig_show(int trigger_id) {\n}\n \
\n \
# sets up an animation for an object\n \
func void env_setanim(int obj_id, string object_name) {\n}\n \
\n \
# stops any environment animation on a character\n \
func  chr_envanim_stop([ai_name:string | script_id:int]) {\n}\n \
\n \
# creates a new powerup\n \
func  powerup_spawn(string poweruptype, int flag) {\n}\n \
\n \
# detaches the camera\n \
func void cm_detach() {\n}\n \
\n \
# waits for a character to play a specific animation type\n \
func  chr_wait_animtype(void) {\n}\n \
\n \
# dumps all arguments\n \
func voud console_print(void) {\n}\n \
\n \
# turns on the boss shield for a character\n \
func  chr_boss_shield([ai_name:string | script_id:int]) {\n}\n \
\n \
# sets a characters health by script id\n \
func  chr_set_health([ai_name:string | script_id:int], int hit_points) {\n}\n \
\n \
# sets part of the HUD to completely filled\n \
func void ui_fill_element(string element_name, int fill) {\n}\n \
\n \
# teleports a character to a flag\n \
func  chr_teleport([ai_name:string | script_id:int], int flag_id) {\n}\n \
\n \
# fire off a trigger volume\n \
func  trigvolume_trigger(string name, string type, [ai_name:string | script_id:int]) {\n}\n \
\n \
# activates a trigger\n \
func  trig_activate(int trigger_id) {\n}\n \
\n \
# debugging print\n \
func void dprint(string astring) {\n}\n \
\n \
# deactivates a trigger\n \
func  trig_deactivate(int trigger_id) {\n}\n \
\n \
# draws a line for an environment animation\n \
func void debug_env_anim(string name) {\n}\n \
\n \
# hangs the game (used for testing error handling)\n \
func void hang(string when) {\n}\n \
\n \
# prints all nearby doors\n \
func  door_printnearby() {\n}\n \
\n \
# makes a character invincible\n \
func  chr_invincible([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# makes one or all AIs forget they saw anything\n \
func  ai2_forget([ai_name:string | script_id:int], string forget_char) {\n}\n \
\n \
# enables ultra mode for a character\n \
func  chr_ultra_mode([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# forces a character to play a pain sound\n \
func  chr_pain([ai_name:string | script_id:int], string pain_type) {\n}\n \
\n \
# removes a currently displayed message\n \
func void message_remove(message) {\n}\n \
\n \
# locks an object as visible\n \
func void obj_force_draw(int obj_id, int obj_id) {\n}\n \
\n \
# forces an AI into inactive mode\n \
func  ai2_inactive([ai_name:string | script_id:int]) {\n}\n \
\n \
# function to start music playing\n \
func void sound_music_start(string name) {\n}\n \
\n \
# shows the currently selected shooting skill\n \
func  ai2_skill_show() {\n}\n \
\n \
# jams a door in its current state\n \
func  door_jam(int door_id) {\n}\n \
\n \
# Kills all P3 particles\n \
func void p3_killall(void) {\n}\n \
\n \
# makes a character unkillable\n \
func  chr_unkillable([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# tells an AI to come to the player\n \
func  ai2_comehere([ai_name:string | script_id:int]) {\n}\n \
\n \
# prints the index of the players BNV\n \
func  ai2_printbnvindex() {\n}\n \
\n \
# View flags with a specific prefix\n \
func void flag_view_prefix(string prefix) {\n}\n \
\n \
# turns of the shadow for this character\n \
func  chr_shadow([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# tells an AI to report in\n \
func  ai2_report([ai_name:string | script_id:int]) {\n}\n \
\n \
# records that the character has the lsi\n \
func bool chr_has_lsi([ai_name:string | script_id:int]) {\n}\n \
\n \
# unjams a door so characters can open it\n \
func  door_unjam(int door_id) {\n}\n \
\n \
# clears a characters inventory\n \
func  chr_inv_reset([ai_name:string | script_id:int]) {\n}\n \
\n \
# Sets the weapon for a give character\n \
func void chr_weapon(int chr_index, [weapon_name:string | weapon_num:int]) {\n}\n \
\n \
# resets a console to initial state\n \
func  console_reset(int console_id) {\n}\n \
\n \
# locks the character active\n \
func  chr_lock_active([ai_name:string | script_id:int]) {\n}\n \
\n \
# tells an AI to run a particular path\n \
func  ai2_dopath([ai_name:string | script_id:int], string path_name) {\n}\n \
\n \
# function plays an impulse sound\n \
func void sound_impulse_play(string name, float volume) {\n}\n \
\n \
# waits for a character to reach a specific animation state\n \
func  chr_wait_animstate(void) {\n}\n \
\n \
# enable or disable a trigger volume\n \
func  trigvolume_enable(string name, int enable, string type) {\n}\n \
\n \
# removes a binding from a input function\n \
func void unbind(string input_name) {\n}\n \
\n \
# function to start an ambient sound\n \
func void sound_ambient_start(string name, float volume) {\n}\n \
\n \
# kills one or more AIs\n \
func  ai2_kill(string param1, string param2) {\n}\n \
\n \
# sets the active display mode\n \
func void m3_display_set(int device_index, int mode_index) {\n}\n \
\n \
# sets or clears an AIs non-combatant state\n \
func  ai2_noncombatant([ai_name:string | script_id:int], int non_combatant) {\n}\n \
\n \
# plays an animation on a character\n \
func  chr_animate([ai_name:string | script_id:int], string anim_name, int num_frames, int interp_frames) {\n}\n \
\n \
# creates a chump\n \
func  ai2_chump() {\n}\n \
\n \
# function to set the volume of playing music\n \
func void sound_music_volume(string name, float volume, float time) {\n}\n \
\n \
# starts the slowmotion timer\n \
func void slowmo(int duration) {\n}\n \
\n \
# turns off fight mode\n \
func  chr_peace([ai_name:string | script_id:int]) {\n}\n \
\n \
# bla bla bla\n \
func void tr_write_lookup(string file_name) {\n}\n \
\n \
# locks a door\n \
func  door_lock(int door_id) {\n}\n \
\n \
# counts the number of people in a trigger volume\n \
func int trigvolume_count(int trig_id) {\n}\n \
\n \
# Disarms a character or everyone\n \
func void chr_disarm(int chr_index) {\n}\n \
\n \
# draws a dot at a specified location\n \
func void chr_draw_dot(void) {\n}\n \
\n \
# sets an AIs shooting inaccuracy multiplier\n \
func  ai2_skill_inaccuracy(float inaccuracy) {\n}\n \
\n \
# tells an AI to report in verbosely\n \
func  ai2_report_verbose([ai_name:string | script_id:int]) {\n}\n \
\n \
# function to start character dialog playing after the current dialog finishes\n \
func void sound_dialog_play_block(string name) {\n}\n \
\n \
# reverts the shooting skill being edited to the saved copy,\n \
func  ai2_skill_revert() {\n}\n \
\n \
# Gives a powerup to a character\n \
func void give_powerup(string powerup_name, int amount, int character) {\n}\n \
\n \
# sets the far clipping plane\n \
func void gs_farclipplane_set(float plane) {\n}\n \
\n \
# sets a characters health to full by script id\n \
func  chr_full_health([ai_name:string | script_id:int]) {\n}\n \
\n \
# changes a characters team\n \
func  chr_changeteam([ai_name:string | script_id:int], string team_name) {\n}\n \
\n \
# sets the shade of a block of objects\n \
func void env_shade(int gq_ref, int gq_ref, float r, float g, float b) {\n}\n \
\n \
# sets the perf prefix\n \
func void perf_prefix(void) {\n}\n \
\n \
# Sets the target to the specified flag\n \
func void target_set(int flag_id, float min_distance) {\n}\n \
\n \
# starts the countdown timer\n \
func void timer_start(float duration, string script) {\n}\n \
\n \
# causes a character to play a line of dialogue\n \
func  chr_talk([ai_name:string | script_id:int], string sound_name, int pre_pause, int post_pause, string priority) {\n}\n \
\n \
# function writes a list of sounds which have broken links to a file\n \
func void sound_list_broken_links(void) {\n}\n \
\n \
# Toggles particle performance display and sets event masks\n \
func void p3_perf(void) {\n}\n \
\n \
# function to stop an ambient sound\n \
func void sound_ambient_stop(string name) {\n}\n \
\n \
# restores the game\n \
func void restore_game() {\n}\n \
\n \
# sets an AIs current movement mode\n \
func  ai2_setmovementmode([ai_name:string | script_id:int], string mode) {\n}\n \
\n \
# makes a character weapon immune\n \
func  chr_weapon_immune([ai_name:string | script_id:int]) {\n}\n \
\n \
# Lists a count of P3 particles\n \
func void p3_count(void) {\n}\n \
\n \
# saves the game\n \
func void save_game(int save_point, string type) {\n}\n \
\n \
# deactivates a console\n \
func  console_deactivate(int console_id) {\n}\n \
\n \
# function to interrupt the current character dialog and play a new one\n \
func void sound_dialog_play_interrupt(string name) {\n}\n \
\n \
# resets a trigger to non-triggered state\n \
func  trig_reset(int trigger_id) {\n}\n \
\n \
# makes a single AI ignore the player\n \
func  ai2_makeignoreplayer([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# sets if we killed griffen\n \
func  killed_griffen(bool murder) {\n}\n \
\n \
# this character will not die too much\n \
func  chr_death_lock([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# deactivates a turret\n \
func  turret_deactivate(turret_id:int) {\n}\n \
\n \
# function to set the volume of a playing ambient sound\n \
func void sound_ambient_volume(string name, float volume, float time) {\n}\n \
\n \
# sets an AIs best aiming angle in degrees\n \
func  ai2_skill_bestangle(float best_angle) {\n}\n \
\n \
# resets all unheld weapons to their starting state\n \
func void weapon_reset(void) {\n}\n \
\n \
# makes an AI panic or not panic\n \
func  ai2_panic([ai_name:string | script_id:int], int timer) {\n}\n \
\n \
# sets the alert state of an AI\n \
func  ai2_setalert([ai_name:string | script_id:int], string alert) {\n}\n \
\n \
# marks a point in a cutscene\n \
func void cutscene_sync(void) {\n}\n \
\n \
# makes a character utter a vocalization\n \
func  chr_vocalize([ai_name:string | script_id:int], string type) {\n}\n \
\n \
# selects a shooting skill to edit\n \
func  ai2_skill_select(string char_class, string weapon_name) {\n}\n \
\n \
# Turns on the text console display\n \
func void text_console(string name) {\n}\n \
\n \
# forces an AI to attack another character\n \
func  ai2_attack([ai_name:string | script_id:int], [target_name:string | target_script_id:int]) {\n}\n \
\n \
# trips an alarm\n \
func  ai2_tripalarm(int alarm_id, [ai_name:string | script_id:int | ]) {\n}\n \
\n \
# prints AIs that are nearby\n \
func  who() {\n}\n \
\n \
# Starts temporary-particle-creation mode\n \
func void particle_temp_start(void) {\n}\n \
\n \
# function to start a movie playing\n \
func void movie_play(string name) {\n}\n \
\n \
# resets all placed powerups to their starting points\n \
func void powerup_reset(void) {\n}\n \
\n \
# sets an AIs grouping decay\n \
func  ai2_skill_decay(float decay_amount) {\n}\n \
\n \
# closes a door (may not stay open)\n \
func  door_close(int door_id) {\n}\n \
\n \
# resets the camera\n \
func void cm_reset(float maxspeed,  float maxfocalaccel) {\n}\n \
\n \
# Shows all registered variables and commands\n \
func void dump_docs(void) {\n}\n \
\n \
# creates a new weapon\n \
func  weapon_spawn(string weapontype, int flag) {\n}\n \
\n \
# sets a characters super value\n \
func  chr_super([ai_name:string | script_id:int], float super_amount) {\n}\n \
\n \
# starts or stops letterboxing\n \
func void letterbox(int start_stop) {\n}\n \
\n \
# waits until a characters health falls below a value\n \
func  chr_wait_health([ai_name:string | script_id:int], int hit_points) {\n}\n \
\n \
# makes an AI aware of another character\n \
func  ai2_makeaware([ai_name:string | script_id:int], [target_name:string | target_script_id:int]) {\n}\n \
\n \
# start the display of a cinematic insert\n \
func void cinematic_start(string bitmap_name, int draw_width, int draw_height, int start, int end, float velocity, bool mirror) {\n}\n \
\n \
# makes a character unstoppable\n \
func  chr_unstoppable([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# displays a splash screen\n \
func void splash_screen(int texture) {\n}\n \
\n \
# turns display of an object on or off\n \
func void obj_hide(int obj_id, int obj_id) {\n}\n \
\n \
# Dump all particle classes with collision to a text file\n \
func void p3_listcollision(void) {\n}\n \
\n \
# disables the weapon variant for a character\n \
func  chr_dontaim([ai_name:string | script_id:int], int on_off) {\n}\n \
\n \
# debugging: enables the HUD help overlays\n \
func void ui_show_help(int enable) {\n}\n \
\n \
# Spawns a new P3 particle\n \
func void p3_spawn(string particle_class, float velocity) {\n}\n \
\n \
# sets whether handled errors are silent\n \
func  ai2_set_handlesilenterror(bool handle_silent, string subsystem) {\n}\n \
\n \
# tells an AI to look at the player\n \
func  ai2_lookatme([ai_name:string | script_id:int]) {\n}\n \
\n \
# plays an environment animation on a character and blocks\n \
func  chr_envanim_block([ai_name:string | script_id:int], string anim, string norotation) {\n}\n \
\n \
# makes the player character fall front\n \
func void fall_back(void) {\n}\n \
\n \
# resets a turret to initial state\n \
func  turret_reset(int turret_id) {\n}\n \
\n \
# Unlocks a specific diary page on the current level.\n \
func void diary_page_unlock(int page) {\n}\n \
\n \
# sets an AIs grouping error\n \
func  ai2_skill_error(float error_amount) {\n}\n \
\n \
# reloads the sounds objects\n \
func void sound_objects_reset(void) {\n}\n \
\n \
# Sets characters health\n \
func void chr_health(int chr_index, int hit_points) {\n}\n \
\n \
# computes the number of objects in a range that have all their glass broken\n \
func int env_broken(int gq_ref, int gq_endref) {\n}\n \
\n \
# gives a character a new weapon\n \
func  chr_giveweapon([ai_name:string | script_id:int], string weapon_name) {\n}\n \
\n \
# Displays the characters combat stats\n \
func void chr_display_combat_stats(int chr_index) {\n}\n \
\n \
# opens a door (may not stay open)\n \
func  door_open(int door_id) {\n}\n \
\n \
# plays an environment animation on a character\n \
func  chr_envanim([ai_name:string | script_id:int], string anim, string norotation) {\n}\n \
\n \
# makes a corpse\n \
func void make_corpse(corpse_name:string) {\n}\n \
\n \
# binds an input to a function\n \
func void bind(string input_name, string to, string input_function) {\n}\n \
\n \
# reload scripts for a level\n \
func void script_reload(void) {\n}\n \
\n \
# stops an AI from thinking for itself\n \
func  ai2_passive([ai_name:string | script_id:int], int passive) {\n}\n \
\n \
# Stops all environmental particles\n \
func void p3_stopall(void) {\n}\n \
\n \
# makes the AI movement system take control of the player\n \
func  ai2_takecontrol(int on_off) {\n}\n \
\n \
# plays back a film\n \
func  chr_playback([ai_name:string | script_id:int], string film_name, string mode, int num_frames) {\n}\n \
\n \
# creates a range of objects\n \
func void obj_create(int obj_id, int obj_id) {\n}\n \
\n \
# sets which character were authoring for a film\n \
func void sc_focus(int chr_index) {\n}\n \
\n \
# Stops temporary-particle-creation mode\n \
func void particle_temp_stop(void) {\n}\n \
\n \
# selects a path square in the players BNV for debugging\n \
func  ai2_pathdebugsquare(int x, int y) {\n}\n \
\n \
# turns display of an object on or off\n \
func void obj_show(int obj_id, int obj_id) {\n}\n \
\n \
# reset a trigger volume to its level-load state\n \
func  trigvolume_reset(string name) {\n}\n \
\n \
# locks the character active\n \
func  chr_unlock_active([ai_name:string | script_id:int]) {\n}\n \
\n \
# creates and starts an AI from a character object\n \
func  ai2_spawn(string ai_name, string force_spawn) {\n}\n \
\n \
# deletes a character\n \
func  chr_delete([ai_name:string | script_id:int]) {\n}\n \
\n \
";

#endif
