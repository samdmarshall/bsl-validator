//
//  BSLGlobals.h
//  bsl-parse
//
//  Created by Samantha Marshall on 12/28/14.
//  Copyright (c) 2014 Samantha Marshall. All rights reserved.
//

#ifndef bsl_parse_BSLGlobals_h
#define bsl_parse_BSLGlobals_h

#include "BSLPrivate.h"

#include "BSL_stdlib.h"

#include "BSLFunction.h"
#include "BSLExecute.h"

// clang-format off

static bsl_register_func_item GLOBAL_FUNCTIONS[] = {
	// Kills any temporary particles
	{"particle_temp_kill", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// returns if this character is the player
	{"chr_is_player", bsl_db_register_type_bool, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// returns if we did kill griffen
	{"did_kill_griffen", bsl_db_register_type_int, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// dumps stats for a playback film
	{"playback_debug", bsl_db_register_type_void, "(string film_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	{"chr_playback_debug", bsl_db_register_type_void, "(string film_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// locks keys out
	{"lock_keys", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to move to a flag
	{"ai2_movetoflag", bsl_db_register_type_void, "([ai_name:string | script_id:int], int flag_id, string setfacing)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// lists all the engines
	{"m3_geom_engine_list", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a single AI blind
	{"ai2_makeblind", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// lists all the players
	{"chr_who", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes the player character fall front
	{"fall_front", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets the main characters class
	{"chr_main_class", bsl_db_register_type_void, "([class_name:string | class_index:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets a triggers speed
	{"trig_speed", bsl_db_register_type_void, "(int trigger_id, float volume)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// forces an AI into active mode
	{"ai2_active", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// initiates a camera interpolation
	{"cm_interpolate_block", bsl_db_register_type_void, "(string anim_name, int num_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to start character dialog playing
	{"sound_dialog_play", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// kills all the AI
	{"chr_kill_all_ai", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// begins a cutscene
	{"begin_cutscene", bsl_db_register_type_void, "(string flag)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets up an AI's neutral-interaction
	{"ai2_neutralbehavior", bsl_db_register_type_void, "([ai_name:string | script_id:int], string behavior)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// debugging message
	{"dmsg", bsl_db_register_type_void, "(string astring)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// shows or hides part of the HUD
	{"ui_show_element", bsl_db_register_type_void, "(string element_name, int show)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// swaps an environment texture
	{"env_texswap", bsl_db_register_type_void, "(int gq_start, string tex_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// special camera for barabus
	{"cm_barabus", bsl_db_register_type_void, "([ai_name:string | script_id:int], float away, float up, int time)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// turns input on or off
	{"input", bsl_db_register_type_void, "(int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// finds all BNV connections from the player's location
	{"ai2_findconnections", bsl_db_register_type_void, "(int distance)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// forces a character to hold a key down for some frames
	{"chr_holdkey", bsl_db_register_type_void, "([ai_name:string | script_id:int], string key_name, int num_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets the character class of a specific character
	{"chr_set_class", bsl_db_register_type_void, "(int chr_index, [class_name:string | class_index:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// prints all doors in the level to file
	{"door_printall", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to take its current state as its job
	{"ai2_setjobstate", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// removes all bindings
	{"unbindall", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// puts the camera in orbit mode
	{"cm_orbit", bsl_db_register_type_void, "(float speed, float stopangle)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// crashes the game (used for testing error handling)
	{"crash", bsl_db_register_type_void, "(string when)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Creates and starts all environmental particles
	{"p3_startall", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// bla bla bla
	{"tr_stop_lookup", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Prints out all environmental particles with tags
	{"p3_printtags", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets the location of any character
	{"chr_location", bsl_db_register_type_void, "([ai_name:string | chr_index:int], float loc_x, float loc_y, float loc_z)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// saves the shooting skill being edited out as a text file
	{"ai2_skill_save", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Dump all particles to a text file
	{"p3_dumpparticles", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the mouse acceleration value
	{"mouse_acceleration", bsl_db_register_type_void, "(float accel)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to run for an alarm
	{"ai2_doalarm", bsl_db_register_type_void, "([ai_name:string | script_id:int], int console_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets corpses to their initial state
	{"corpse_reset", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// prints an anim state
	{"print_state", bsl_db_register_type_void, "(int state)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// prints an anim type
	{"print_type", bsl_db_register_type_void, "(int type)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Plays the objective-complete sound.
	{"objective_complete", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// lists all the display modes
	{"m3_display_list", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets all level mechanics (triggers
	{"reset_mechanics", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Removes all 'dangerous projectile' particles by making their lifetime expire
	{"p3_removedangerous", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// stops all AIs from thinking for themselves
	{"ai2_allpassive", bsl_db_register_type_void, "(int passive)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Writes all particles used on this level to a text file
	{"p3_writeusedparticles", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sends a command to environmental particles with a given tag
	{"particle", bsl_db_register_type_void, "(string tag, string command, string event_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// disables collision for a character
	{"chr_nocollision", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// toggles camera Jello(tm) mode
	{"cm_jello", bsl_db_register_type_void, "(int mode)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// kills all the characters inside a trigger volume
	{"trigvolume_kill", bsl_db_register_type_void, "(int trig_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// spawns all AI
	{"ai2_spawnall", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to become idle
	{"ai2_idle", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// forces a character to holster their weapon
	{"chr_forceholster", bsl_db_register_type_void, "([ai_name:string | script_id:int], int holster, int force_draw)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// lose this level
	{"lose", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// creates a character from a .txt file
	{"chr_create", bsl_db_register_type_void, "(int script_id, string start_create)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// fades the screen in
	{"fade_in", bsl_db_register_type_void, "(int ticks)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// xxx
	{"ph_status", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// initiates a camera animation
	{"cm_anim_block", bsl_db_register_type_void, "(string cam_spec, string anim_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// activates a console
	{"console_activate", bsl_db_register_type_void, "(int console_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes the camera wait until it is no longer busy
	{"cm_wait", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// unlocks a door
	{"door_unlock", bsl_db_register_type_void, "(int door_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// hides a trigger
	{"trig_hide", bsl_db_register_type_void, "(int trigger_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// turns on or off specified parts of the environment
	{"env_show", bsl_db_register_type_void, "(int gq_ref, int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// lists all the engines
	{"m3_draw_engine_list", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets an AI's max delay between shots
	{"ai2_skill_delaymax", bsl_db_register_type_void, "(int frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to look at a character
	{"ai2_lookatchar", bsl_db_register_type_void, "([ai_name:string | script_id:int], [ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// snaps a character's facing to a flag's facing
	{"chr_facetoflag", bsl_db_register_type_void, "([ai_name:string | script_id:int], int flag_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// kills a range of object
	{"obj_kill", bsl_db_register_type_void, "(int obj_id, int obj_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// set the script to call from a trigger volume
	{"trigvolume_setscript", bsl_db_register_type_void, "(string name, string script, string type)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// shows AI memory usage
	{"ai2_showmem", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the current graphics quality
	{"m3_quality_set", bsl_db_register_type_void, "(string quality)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the level of errors to report at console
	{"ai2_set_reporterror", bsl_db_register_type_void, "(string error_level, string subsystem)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets an AI's min delay between shots
	{"ai2_skill_delaymin", bsl_db_register_type_void, "(int mindelay)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sends a message from the subtitle file
	{"message", bsl_db_register_type_void, "(string message, int timer)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Kills the nearest P3 particle
	{"p3_killnearest", bsl_db_register_type_void, "(bool no_recreate)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a single AI deaf
	{"ai2_makedeaf", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// changes the fog start distance smoothly
	{"gl_fog_start_changeto", bsl_db_register_type_void, "(float start_val, int frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// waits for a character to play a specific animation
	{"chr_wait_animation", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// initiates a environment animation: blocks until completed
	{"env_anim_block", bsl_db_register_type_void, "(int obj_id, int obj_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the field of view
	{"gs_fov_set", bsl_db_register_type_void, "(float fov_degrees)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// turns display of an object on or off
	{"obj_shade", bsl_db_register_type_void, "(int obj_id, int obj_id, float r, float g, float b)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// bla bla bla
	{"tr_write_collection", bsl_db_register_type_void, "(string collection_name, string file_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// gives a character a powerup
	{"chr_givepowerup", bsl_db_register_type_void, "([ai_name:string | script_id:int], string powerup, int amount)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// cycles console text color
	{"co_toggle_text", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets up an animation for an object
	{"env_setanim_block", bsl_db_register_type_void, "(int obj_id, string object_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to follow the player
	{"ai2_followme", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// initiates a camera animation
	{"cm_anim", bsl_db_register_type_void, "(string cam_spec, string anim_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the active engine
	{"m3_engine_set", bsl_db_register_type_void, "(int geom_engine, int draw_engine)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// returns if this character is holding a weapon that is empty
	{"chr_has_empty_weapon", bsl_db_register_type_bool, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets the location of any character to the camera location
	{"chr_location_settocamera", bsl_db_register_type_void, "(int chr_index)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets part of the HUD to flash or not flash
	{"ui_flash_element", bsl_db_register_type_void, "(string element_name, int fill)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets the location of the player character
	{"goto", bsl_db_register_type_void, "(float loc_x, float loc_y, float loc_z)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// win this level
	{"win", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// fades the screen out
	{"fade_out", bsl_db_register_type_void, "([r:float | r:int], [g:float | g:int], [b:float | b:int], int ticks)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes barabbas retrieve his gun if it is lost
	{"ai2_barabbas_retrievegun", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// bla bla bla
	{"tr_write_animation", bsl_db_register_type_void, "(string anim_name, string file_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Selects what character to control
	{"chr_focus", bsl_db_register_type_void, "(int chr_index)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// ends a cutscene
	{"end_cutscene", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// returns the difficulty level
	{"difficulty", bsl_db_register_type_int, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// plays back a film and blocks until complete
	{"playback_block", bsl_db_register_type_void, "([ai_name:string | script_id:int], string film_name, string mode, int num_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	{"chr_playback_block", bsl_db_register_type_void, "([ai_name:string | script_id:int], string film_name, string mode, int num_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// changes the fog end distance smoothly
	{"gl_fog_end_changeto", bsl_db_register_type_void, "(float end_val, int frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// slowly poisons a character
	{"chr_poison", bsl_db_register_type_void, "([ai_name:string | script_id:int], int damage, int interval, int initial_interval)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets an AI's recoil compensation amount (0-1)
	{"ai2_skill_recoil", bsl_db_register_type_void, "(float recoil_compensation)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// kills all the corpses inside a trigger volume
	{"trigvolume_corpse", bsl_db_register_type_void, "(int trig_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// initiates a environment animation: blocks until completed
	{"env_anim", bsl_db_register_type_void, "(int obj_id, int obj_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// stop the display of a cinematic insert
	{"cinematic_stop", bsl_db_register_type_void, "(string bitmap_name, int end, float velocity)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets AI as if start of level
	{"ai2_reset", bsl_db_register_type_void, "(int reset_player)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// initiates a camera interpolation
	{"cm_interpolate", bsl_db_register_type_void, "(string anim_name, int num_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to start music playing
	{"sound_music_stop", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// activates a turret
	{"turret_activate", bsl_db_register_type_void, "(int turret_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// starts the countdown timer
	{"timer_stop", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets the current objective page.
	{"objective_set", bsl_db_register_type_void, "(int page, string make_silent)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// plays an animation on a character and blocks until done
	{"chr_animate_block", bsl_db_register_type_void, "([ai_name:string | script_id:int], string anim_name, int num_frames, int interp_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// prints location of a character
	{"where", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Disables parts of the daodan shield (for debugging)
	{"p3_daodan_disable", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the level of errors to log to file
	{"ai2_set_logerror", bsl_db_register_type_void, "(string error_level, string subsystem)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// causes the player to make a sound (alerts nearby AIs)
	{"ai2_debug_makesound", bsl_db_register_type_void, "(string sound_type, float volume)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// puts the camera in orbit mode
	{"cm_orbit_block", bsl_db_register_type_void, "(float speed, float stopangle)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Triggers an event on all P3 particles of a specified class
	{"p3_callevent", bsl_db_register_type_void, "(string particle_class, int event_index)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// shows a trigger
	{"trig_show", bsl_db_register_type_void, "(int trigger_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets up an animation for an object
	{"env_setanim", bsl_db_register_type_void, "(int obj_id, string object_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// stops any environment animation on a character
	{"chr_envanim_stop", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// creates a new powerup
	{"powerup_spawn", bsl_db_register_type_void, "(string poweruptype, int flag)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// detaches the camera
	{"cm_detach", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// waits for a character to play a specific animation type
	{"chr_wait_animtype", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// dumps all arguments
	{"console_print", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// turns on the boss shield for a character
	{"chr_boss_shield", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets a characters health by script id
	{"chr_set_health", bsl_db_register_type_void, "([ai_name:string | script_id:int], int hit_points)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets part of the HUD to completely filled
	{"ui_fill_element", bsl_db_register_type_void, "(string element_name, int fill)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// teleports a character to a flag
	{"chr_teleport", bsl_db_register_type_void, "([ai_name:string | script_id:int], int flag_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// fire off a trigger volume
	{"trigvolume_trigger", bsl_db_register_type_void, "(string name, string type, [ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// activates a trigger
	{"trig_activate", bsl_db_register_type_void, "(int trigger_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// debugging print
	{"dprint", bsl_db_register_type_void, "(string astring)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// deactivates a trigger
	{"trig_deactivate", bsl_db_register_type_void, "(int trigger_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// draws a line for an environment animation
	{"debug_env_anim", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// hangs the game (used for testing error handling)
	{"hang", bsl_db_register_type_void, "(string when)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// prints all nearby doors
	{"door_printnearby", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a character invincible
	{"chr_invincible", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes one or all AIs forget they saw anything
	{"ai2_forget", bsl_db_register_type_void, "([ai_name:string | script_id:int], string forget_char)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// enables ultra mode for a character
	{"chr_ultra_mode", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// forces a character to play a pain sound
	{"chr_pain", bsl_db_register_type_void, "([ai_name:string | script_id:int], string pain_type)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// removes a currently displayed message
	{"message_remove", bsl_db_register_type_void, "(string message)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// locks an object as visible
	{"obj_force_draw", bsl_db_register_type_void, "(int obj_id, int obj_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// forces an AI into inactive mode
	{"ai2_inactive", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to start music playing
	{"sound_music_start", bsl_db_register_type_void, "(string name, float volume)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// shows the currently selected shooting skill
	{"ai2_skill_show", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// jams a door in its current state
	{"door_jam", bsl_db_register_type_void, "(int door_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Kills all P3 particles
	{"p3_killall", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a character unkillable
	{"chr_unkillable", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to come to the player
	{"ai2_comehere", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// prints the index of the player's BNV
	{"ai2_printbnvindex", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// View flags with a specific prefix
	{"flag_view_prefix", bsl_db_register_type_void, "(string prefix)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// turns of the shadow for this character
	{"chr_shadow", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to report in
	{"ai2_report", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// records that the character has the lsi
	{"chr_has_lsi", bsl_db_register_type_bool, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// unjams a door so characters can open it
	{"door_unjam", bsl_db_register_type_void, "(int door_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// clears a characters inventory
	{"chr_inv_reset", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets the weapon for a give character
	{"chr_weapon", bsl_db_register_type_void, "(int chr_index, [weapon_name:string | weapon_num:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets a console to initial state
	{"console_reset", bsl_db_register_type_void, "(int console_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// locks the character active
	{"chr_lock_active", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to run a particular path
	{"ai2_dopath", bsl_db_register_type_void, "([ai_name:string | script_id:int], string path_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function plays an impulse sound
	{"sound_impulse_play", bsl_db_register_type_void, "(string name, float volume)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// waits for a character to reach a specific animation state
	{"chr_wait_animstate", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// enable or disable a trigger volume
	{"trigvolume_enable", bsl_db_register_type_void, "(string name, int enable, string type)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// removes a binding from a input function
	{"unbind", bsl_db_register_type_void, "(string input_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to start an ambient sound
	{"sound_ambient_start", bsl_db_register_type_void, "(string name, float volume)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// kills one or more AIs
	{"ai2_kill", bsl_db_register_type_void, "(string param1, string param2)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the active display mode
	{"m3_display_set", bsl_db_register_type_void, "(int device_index, int mode_index)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets or clears an AI's non-combatant state
	{"ai2_noncombatant", bsl_db_register_type_void, "([ai_name:string | script_id:int], int non_combatant)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// plays an animation on a character
	{"chr_animate", bsl_db_register_type_void, "([ai_name:string | script_id:int], string anim_name, int num_frames, int interp_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// creates a chump
	{"ai2_chump", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to set the volume of playing music
	{"sound_music_volume", bsl_db_register_type_void, "(string name, float volume, float time)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// starts the slowmotion timer
	{"slowmo", bsl_db_register_type_void, "(int duration)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// turns off fight mode
	{"chr_peace", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// bla bla bla
	{"tr_write_lookup", bsl_db_register_type_void, "(string file_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// locks a door
	{"door_lock", bsl_db_register_type_void, "(int door_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// counts the number of people in a trigger volume
	{"trigvolume_count", bsl_db_register_type_int, "(int trig_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Disarms a character or everyone
	{"chr_disarm", bsl_db_register_type_void, "(int chr_index)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// draws a dot at a specified location
	{"chr_draw_dot", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets an AI's shooting inaccuracy multiplier
	{"ai2_skill_inaccuracy", bsl_db_register_type_void, "(float inaccuracy)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to report in verbosely
	{"ai2_report_verbose", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to start character dialog playing after the current dialog finishes
	{"sound_dialog_play_block", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// reverts the shooting skill being edited to the saved copy,
	{"ai2_skill_revert", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Gives a powerup to a character
	{"give_powerup", bsl_db_register_type_void, "(string powerup_name, int amount, int character)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the far clipping plane
	{"gs_farclipplane_set", bsl_db_register_type_void, "(float plane)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets a characters health to full by script id
	{"chr_full_health", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// changes a character's team
	{"chr_changeteam", bsl_db_register_type_void, "([ai_name:string | script_id:int], string team_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the shade of a block of objects
	{"env_shade", bsl_db_register_type_void, "(int gq_ref, int gq_ref, float r, float g, float b)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the perf prefix
	{"perf_prefix", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets the target to the specified flag
	{"target_set", bsl_db_register_type_void, "(int flag_id, float min_distance)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// starts the countdown timer
	{"timer_start", bsl_db_register_type_void, "(float duration, string script)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// causes a character to play a line of dialogue
	{"chr_talk", bsl_db_register_type_void, "([ai_name:string | script_id:int], string sound_name, int pre_pause, int post_pause, string priority)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function writes a list of sounds which have broken links to a file
	{"sound_list_broken_links", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Toggles particle performance display and sets event masks
	{"p3_perf", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to stop an ambient sound
	{"sound_ambient_stop", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// restores the game
	{"restore_game", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets an AI's current movement mode
	{"ai2_setmovementmode", bsl_db_register_type_void, "([ai_name:string | script_id:int], string mode)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a character weapon immune
	{"chr_weapon_immune", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Lists a count of P3 particles
	{"p3_count", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// saves the game
	{"save_game", bsl_db_register_type_void, "(int save_point, string type)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// deactivates a console
	{"console_deactivate", bsl_db_register_type_void, "(int console_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to interrupt the current character dialog and play a new one
	{"sound_dialog_play_interrupt", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets a trigger to non-triggered state
	{"trig_reset", bsl_db_register_type_void, "(int trigger_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a single AI ignore the player
	{"ai2_makeignoreplayer", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets if we killed griffen
	{"killed_griffen", bsl_db_register_type_void, "(bool murder)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// this character will not die too much
	{"chr_death_lock", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// deactivates a turret
	{"turret_deactivate", bsl_db_register_type_void, "(int turret_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to set the volume of a playing ambient sound
	{"sound_ambient_volume", bsl_db_register_type_void, "(string name, float volume, float time)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets an AI's best aiming angle in degrees
	{"ai2_skill_bestangle", bsl_db_register_type_void, "(float best_angle)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets all unheld weapons to their starting state
	{"weapon_reset", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes an AI panic or not panic
	{"ai2_panic", bsl_db_register_type_void, "([ai_name:string | script_id:int], int timer)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets the alert state of an AI
	{"ai2_setalert", bsl_db_register_type_void, "([ai_name:string | script_id:int], string alarm)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// marks a point in a cutscene
	{"cutscene_sync", bsl_db_register_type_void, "(string state)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a character utter a vocalization
	{"chr_vocalize", bsl_db_register_type_void, "([ai_name:string | script_id:int], string type)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// selects a shooting skill to edit
	{"ai2_skill_select", bsl_db_register_type_void, "(string char_class, string weapon_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Turns on the text console display
	{"text_console", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// forces an AI to attack another character
	{"ai2_attack", bsl_db_register_type_void, "([ai_name:string | script_id:int], [target_name:string | target_script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// trips an alarm
	{"ai2_tripalarm", bsl_db_register_type_void, "(int alarm_id, [ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// prints AIs that are nearby
	{"who", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Starts temporary-particle-creation mode
	{"particle_temp_start", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// function to start a movie playing
	{"movie_play", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets all placed powerups to their starting points
	{"powerup_reset", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets an AI's grouping decay
	{"ai2_skill_decay", bsl_db_register_type_void, "(float decay_amount)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// closes a door (may not stay open)
	{"door_close", bsl_db_register_type_void, "(int door_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets the camera
	{"cm_reset", bsl_db_register_type_void, "(float maxspeed, float maxfocalaccel)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Shows all registered variables and commands
	{"dump_docs", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// creates a new weapon
	{"weapon_spawn", bsl_db_register_type_void, "(string weapontype, int flag)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// set's a character's super value
	{"chr_super", bsl_db_register_type_void, "([ai_name:string | script_id:int], float super_amount)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// starts or stops letterboxing
	{"letterbox", bsl_db_register_type_void, "(int start_stop)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// waits until a character's health falls below a value
	{"chr_wait_health", bsl_db_register_type_void, "([ai_name:string | script_id:int], int hit_points)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes an AI aware of another character
	{"ai2_makeaware", bsl_db_register_type_void, "([ai_name:string | script_id:int], [target_name:string | target_script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// start the display of a cinematic insert
	{"cinematic_start", bsl_db_register_type_void, "(string bitmap_name, int draw_width, int draw_height, int start, int end, float velocity, bool mirror)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a character unstoppable
	{"chr_unstoppable", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// displays a splash screen
	{"splash_screen", bsl_db_register_type_void, "(string texture)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// turns display of an object on or off
	{"obj_hide", bsl_db_register_type_void, "(int obj_id, int obj_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Dump all particle classes with collision to a text file
	{"p3_listcollision", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// disables the weapon variant for a character
	{"chr_dontaim", bsl_db_register_type_void, "([ai_name:string | script_id:int], int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// debugging: enables the HUD help overlays
	{"ui_show_help", bsl_db_register_type_void, "(int enable)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Spawns a new P3 particle
	{"p3_spawn", bsl_db_register_type_void, "(string particle_class, float velocity)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets whether handled errors are silent
	{"ai2_set_handlesilenterror", bsl_db_register_type_void, "(bool handle_silent, string subsystem)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// tells an AI to look at the player
	{"ai2_lookatme", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// plays an environment animation on a character and blocks
	{"chr_envanim_block", bsl_db_register_type_void, "([ai_name:string | script_id:int], string anim, string norotation)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes the player character fall front
	{"fall_back", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// resets a turret to initial state
	{"turret_reset", bsl_db_register_type_void, "(int turret_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Unlocks a specific diary page on the current level.
	{"diary_page_unlock", bsl_db_register_type_void, "(int page)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets an AI's grouping error
	{"ai2_skill_error", bsl_db_register_type_void, "(float error_amount)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// reloads the sounds objects
	{"sound_objects_reset", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Sets character's health
	{"chr_health", bsl_db_register_type_void, "(int chr_index, int hit_points)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// computes the number of objects in a range that have all their glass broken
	{"env_broken", bsl_db_register_type_int, "(int gq_ref, int gq_endref)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// gives a character a new weapon
	{"chr_giveweapon", bsl_db_register_type_void, "([ai_name:string | script_id:int], string weapon_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Displays the characters combat stats
	{"chr_display_combat_stats", bsl_db_register_type_void, "(int chr_index)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// opens a door (may not stay open)
	{"door_open", bsl_db_register_type_void, "(int door_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// plays an environment animation on a character
	{"chr_envanim", bsl_db_register_type_void, "([ai_name:string | script_id:int], string anim, string norotation)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes a corpse
	{"make_corpse", bsl_db_register_type_void, "(string corpse_name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// binds an input to a function
	{"bind", bsl_db_register_type_void, "(string input_name, string to, string input_function)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// reload scripts for a level
	{"script_reload", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// [ai_name:string | script_id:int] passive:int
	{"chr_freeze", bsl_db_register_type_void, "([ai_name:string | script_id:int], int passive)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	{"chr_neutral", bsl_db_register_type_void, "([ai_name:string | script_id:int], int passive)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	{"ai2_passive", bsl_db_register_type_void, "([ai_name:string | script_id:int], int passive)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Stops all environmental particles
	{"p3_stopall", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// makes the AI movement system take control of the player
	{"ai2_takecontrol", bsl_db_register_type_void, "(int on_off)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// plays back a film
	{"playback", bsl_db_register_type_void, "([ai_name:string | script_id:int], string file_name, string mode, int num_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	{"chr_playback", bsl_db_register_type_void, "([ai_name:string | script_id:int], string file_name, string mode, int num_frames)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// creates a range of objects
	{"obj_create", bsl_db_register_type_void, "(int obj_id, int obj_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// sets which character we're authoring for a film
	{"sc_focus", bsl_db_register_type_void, "(int chr_index)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// Stops temporary-particle-creation mode
	{"particle_temp_stop", bsl_db_register_type_void, "(void)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// selects a path square in the player's BNV for debugging
	{"ai2_pathdebugsquare", bsl_db_register_type_void, "(int x, int y)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// turns display of an object on or off
	{"obj_show", bsl_db_register_type_void, "(int obj_id, int obj_id)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// reset a trigger volume to its level-load state
	{"trigvolume_reset", bsl_db_register_type_void, "(string name)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// locks the character active
	{"chr_unlock_active", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// creates and starts an AI from a character object
	{"ai2_spawn", bsl_db_register_type_void, "(string ai_name, string force_spawn)", bsl_symbol_parse_call_symbol, oni_call_non_op},
	// deletes a character
	{"chr_delete", bsl_db_register_type_void, "([ai_name:string | script_id:int])", bsl_symbol_parse_call_symbol, oni_call_non_op},
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

// clang-format on

#endif
