//
//  BSLGlobals.h
//  bsl-parse
//
//  Created by Sam Marshall on 12/28/14.
//  Copyright (c) 2014 Sam Marshall. All rights reserved.
//

#ifndef bsl_parse_BSLGlobals_h
#define bsl_parse_BSLGlobals_h

char *BSL_GLOBAL_DEFINES = "# dumps stats for a playback film\n \
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
# Turns off all melee damage\n \
var bool chr_disable_melee;\n \
\n \
# Controls the size of the main character\n \
var float wp_pow_adjustment;\n \
\n \
# turns on pathfinding dynamic grid display\n \
var bool ai2_showdynamicgrids;\n \
\n \
# enables position-sensitive weighting of spacing behaviors\n \
var bool ai2_spacing_weights;\n \
\n \
# enables editable recoil\n \
var bool recoil_edit;\n \
\n \
# Turns on the drawing of characters\n \
var bool gs_show_characters;\n \
\n \
# number of cookies per fight\n \
var int ai2_spacing_cookies;\n \
\n \
# Disables weapon fading\n \
var bool wp_disable_fade;\n \
\n \
# Sets strength of hypo spray\n \
var int wp_hypostrength;\n \
\n \
# stops the chump\n \
var bool ai2_chump_stop;\n \
\n \
# Controls the size of the main character\n \
var float wp_scale_adjustment;\n \
\n \
# Enables the display of turrets\n \
var bool show_turrets;\n \
\n \
# draws a health bar for every AI above their head\n \
var bool ai2_showhealth;\n \
\n \
# draws the name of every AI above their head\n \
var bool ai2_shownames;\n \
\n \
# Draws laser / environment collisions.\n \
var bool show_laser_env_collision;\n \
\n \
# inverts the aiming\n \
var bool am_invert;\n \
\n \
# lets Barabbas run while carrying his gun\n \
var bool ai2_barabbas_run;\n \
\n \
# Specifies the distance from the camera that patrol point names no longer draw.\n \
var float patrolpath_name_distance;\n \
\n \
# sets character bounding box collision grow amount\n \
var float chr_collision_grow;\n \
\n \
# \n \
var bool wp_force_no_scale;\n \
\n \
# shows AI firing spread knowledge\n \
var bool ai2_showfiringspreads;\n \
\n \
# Toggles display of the clouds\n \
var bool sky_show_clouds;\n \
\n \
# turns on inactive -> active pathfinding rendering\n \
var bool ai2_showactivationpaths;\n \
\n \
# Toggle keyboard applied forces\n \
var bool ph_debug_keyforces;\n \
\n \
# shows the count of visable environment quads\n \
var bool env_show_quad_count;\n \
\n \
# makes all AI ignore the player\n \
var bool ai2_ignore_player;\n \
\n \
# draws a line from the player to every AI\n \
var bool ai2_showlinetochar;\n \
\n \
# enables fast lookup\n \
var bool fast_lookup;\n \
\n \
# shows ID numbers for combat, melee and neutral settings\n \
var bool ai2_debug_showsettingIDs;\n \
\n \
# Enables the display of triggers\n \
var bool show_triggers;\n \
\n \
# fog end\n \
var float gl_fog_end;\n \
\n \
# turns off the AIs sound sensing system\n \
var bool ai2_deaf;\n \
\n \
# Draws the main character small\n \
var bool chr_mini_me;\n \
\n \
# Enables performance display\n \
var bool show_performance_gsd;\n \
\n \
# Toggles display of the sky\n \
var bool sky_show_sky;\n \
\n \
# Should we center the cursor\n \
var bool li_center_cursor;\n \
\n \
# debug local-path code from players position and facing\n \
var bool ai2_debug_localpathfinding;\n \
\n \
# makes the game wait for a key before level load\n \
var bool wait_for_key;\n \
\n \
# turns on pathfinding grid rendering\n \
var bool ai2_showgrids;\n \
\n \
# Use this to control the input sensitivity\n \
var float gs_input_accel;\n \
\n \
# set the number of events before the AI will stop ignoring\n \
var int ai2_stopignoring_count;\n \
\n \
# fog disabled\n \
var bool gl_fog_disabled;\n \
\n \
# forces all characters to be active\n \
var bool chr_all_active;\n \
\n \
# bla bla\n \
var float cm_jello_amt;\n \
\n \
# Shows Texture name\n \
var bool am_show_texturename;\n \
\n \
# makes the laser pointer hit all objects\n \
var bool am_hit_everything;\n \
\n \
# shows the bnv of the main character\n \
var bool chr_show_bnv;\n \
\n \
# Sound spheres will always be drawn, not just when a sound sphere is selected.\n \
var bool show_sound_spheres;\n \
\n \
# shows grid squares that are evaluated by the A* pathfinding\n \
var bool ai2_showastar;\n \
\n \
# lets you disable use of DXT1\n \
var bool gl_disable_dxt1;\n \
\n \
# Toggles display of the skybox\n \
var bool sky_show_skybox;\n \
\n \
# camera height\n \
var float cm_height;\n \
\n \
# Display trigger volumes\n \
var bool show_triggervolumes;\n \
\n \
# shows the count of physics\n \
var bool gs_show_physics_count;\n \
\n \
# makes player invincible\n \
var bool invincible;\n \
\n \
# enables auto aiming\n \
var bool chr_weapon_auto_aim;\n \
\n \
# Specifies the id for a new flag\n \
var int flag_new_id;\n \
\n \
# the number of game ticks until charaters begin to fade\n \
var int chr_death_fade_start;\n \
\n \
# Enables debugging information for overlays\n \
var bool chr_debug_overlay;\n \
\n \
# saved_film_loop\n \
var bool saved_film_loop;\n \
\n \
# 2^n amount of reduction\n \
var int gs_screen_shot_reduce;\n \
\n \
# Sound rings will always be drawn, not just when a sound is selected.\n \
var bool show_sound_all;\n \
\n \
# Enables character collision\n \
var bool chr_enable_collision;\n \
\n \
# binds f2 to a specific animation\n \
var string sc_bind_f2;\n \
\n \
# Draws everyone with a big head\n \
var bool chr_big_head;\n \
\n \
# return speed\n \
var float recoil_return_speed;\n \
\n \
# pins a character to the ground\n \
var bool chr_pin_character;\n \
\n \
# the number of game ticks until charaters fade over\n \
var int chr_death_fade_frames;\n \
\n \
# base\n \
var float recoil_base;\n \
\n \
# saved_film_character_offset\n \
var int saved_film_character_offset;\n \
\n \
# footstep flash mode\n \
var bool footstep_flash;\n \
\n \
# dumps the closest GQ index file/obj name to console\n \
var bool am_show_filenames;\n \
\n \
# Disables all door locks\n \
var bool door_ignore_locks;\n \
\n \
# makes player omnipotent\n \
var bool omnipotent;\n \
\n \
# disable_depth_reads\n \
var bool gl_disable_depth_reads;\n \
\n \
# color to clear the back buffer to\n \
var int m3_clear_color;\n \
\n \
# Controls the size of the big head\n \
var float chr_big_head_amount;\n \
\n \
# Makes all furniture breakable.\n \
var bool p3_furniture_breakable;\n \
\n \
# bla bla\n \
var float cm_jello_radius;\n \
\n \
# Enables drawing of the facing vector\n \
var bool chr_draw_facing_vector;\n \
\n \
# Enables the display of triggers\n \
var bool laser_alpha;\n \
\n \
# fog green\n \
var float gl_fog_green;\n \
\n \
# fog start\n \
var float gl_fog_start;\n \
\n \
# debug AIs melee intersections\n \
var bool ai2_showintersections;\n \
\n \
# control pathfinding debugging\n \
var bool chr_debug_pathfinding;\n \
\n \
# Enables the display of flags\n \
var bool show_flags;\n \
\n \
# Enables performance display\n \
var bool show_performance_gsu;\n \
\n \
# binds f3 to a specific animation\n \
var string sc_bind_f3;\n \
\n \
# lets you disable packed-pixels support\n \
var bool gl_disable_packed_pixels;\n \
\n \
# turns on aiming screen debugging\n \
var bool chr_debug_aiming_screen;\n \
\n \
# Enables performance display\n \
var bool show_performance;\n \
\n \
# jello camera plane test\n \
var bool cm_plane_test;\n \
\n \
# draws doorframes for all unplaced doors\n \
var bool door_drawframes;\n \
\n \
# lets the player kick weapons\n \
var bool wp_kickable;\n \
\n \
# makes player unstoppable\n \
var bool unstoppable;\n \
\n \
# Toggles texture mapping or gouraud\n \
var bool m3_texture;\n \
\n \
# toggles character bounding box / bounding sphere collision\n \
var bool chr_collision_box;\n \
\n \
# enables AI boss-battle target selection\n \
var bool ai2_boss_battle;\n \
\n \
# Enables the display of turret debug lines\n \
var bool turret_show_debug;\n \
\n \
# Turns on the drawing of particles\n \
var bool gs_show_particles;\n \
\n \
# Turns on the drawing of objects\n \
var bool gs_show_objects;\n \
\n \
# footstep debugging mode\n \
var bool chr_debug_footsteps;\n \
\n \
# enables text message display\n \
var bool co_message_display;\n \
\n \
# fog red\n \
var float gl_fog_red;\n \
\n \
# verbose footstep debugging mode\n \
var bool chr_debug_footsteps_verbose;\n \
\n \
# shows prediction info for AI2 characters\n \
var bool ai2_showprediction;\n \
\n \
# enables debugging display of sound occlusions\n \
var bool sound_show_occlusions;\n \
\n \
# Specifies the distance from the camera that character names no longer draw.\n \
var float character_name_distance;\n \
\n \
# sets the number of rays to cast\n \
var int env_ray_number;\n \
\n \
# Turns on a call to sleep to make debugging easier\n \
var bool gs_sleep;\n \
\n \
# enable physics debugging visuals\n \
var bool ob_show_debug;\n \
\n \
# highlights a particular gq\n \
var int env_highlight_gq;\n \
\n \
# turns no debugging for the handle code\n \
var bool chr_debug_handle;\n \
\n \
# Turns on the sky\n \
var bool gs_show_sky;\n \
\n \
# Toggles buffer clear\n \
var bool m3_buffer_clear;\n \
\n \
# Draws particle / environment collisions.\n \
var bool p3_show_env_collision;\n \
\n \
# forces a given lod if it is between 0 and 4\n \
var int chr_lod;\n \
\n \
# Enables drawing of the aiming vector\n \
var bool chr_draw_aiming_vector;\n \
\n \
# turns off the AIs visual sensing system\n \
var bool ai2_blind;\n \
\n \
# lets you disable miplevels (-ve = disable big, +ve = disable small)\n \
var int gl_mipmap_offset;\n \
\n \
# Suppresses UI prompting about new objectives or moves.\n \
var bool ui_suppress_prompt;\n \
\n \
# prints impacts as they occur\n \
var bool debug_impacts;\n \
\n \
# Enables environment collision\n \
var bool env_collision;\n \
\n \
# spatial footsteps\n \
var bool spatial_footsteps;\n \
\n \
# set the delay timer before the AI forgets about ignored events,&AI2gSound_StopIgnoring_Time\n \
var int ai2_stopignoring_time;\n \
\n \
# Draws character / environment collisions.\n \
var bool show_chr_env_collision;\n \
\n \
# prints information about each AI spawn\n \
var bool ai2_printspawn;\n \
\n \
# Specifies the distance from the camera that flag names no longer draw.\n \
var float flag_name_distance;\n \
\n \
# \n \
var bool gs_show_corpses;\n \
\n \
# makes the ear stable\n \
var bool gs_stable_ear;\n \
\n \
# turns the laser line off\n \
var bool marketing_line_off;\n \
\n \
# \n \
var float fx_laser_width;\n \
\n \
# Show specially flagged noncollision quads\n \
var bool env_show_stairflagged;\n \
\n \
# Enables movement debugging information for characters\n \
var int chr_show_movement;\n \
\n \
# makes the game run fast\n \
var bool fast_mode;\n \
\n \
# When true the environment only renders triangles in the octnode that contains the manual camera\n \
var bool env_show_octnode_gqs;\n \
\n \
# When true show ghost GQs\n \
var bool env_show_ghostgqs;\n \
\n \
# displays font cache texture\n \
var bool debug_font_cache;\n \
\n \
# at what percent of lookspring fight mode turns off\n \
var float cm_lookspring_percent;\n \
\n \
# draw every frame multiple\n \
var int draw_every_frame_multiple;\n \
\n \
# Turns on/off debugging of collision\n \
var bool chr_debug_collision;\n \
\n \
# camera canter\n \
var float cm_canter_unarmed;\n \
\n \
# draws a green cross at each AIs job location\n \
var bool ai2_showjoblocations;\n \
\n \
# Enables debugging information for characters\n \
var bool chr_debug_characters;\n \
\n \
# enables console display\n \
var bool co_display;\n \
\n \
# Draw the rays\n \
var bool env_show_rays;\n \
\n \
# dumps the closest GQ index to console\n \
var bool am_show_closest;\n \
\n \
# weights down non-attack techniques so they are never more than attacks, &AI2gMeleeWeightCorrection\n \
var bool ai2_melee_weightcorrection;\n \
\n \
# Enables sphere tree debugging for characters\n \
var bool chr_debug_sphere;\n \
\n \
# \n \
var bool wp_force_scale;\n \
\n \
# true if zcompare is on\n \
var bool m3_zcompareon;\n \
\n \
# enable physics\n \
var bool ph_active;\n \
\n \
# Enables collision debugging display\n \
var int p3_debug_collision;\n \
\n \
# enable trigger volume debugging\n \
var bool debug_triggers;\n \
\n \
# Toggles wireframe vs filled triangles\n \
var bool m3_fill_solid;\n \
\n \
# disable visibility activation\n \
var bool chr_disable_visactive;\n \
\n \
# sky height\n \
var float sky_height;\n \
\n \
# Enables the display of character starting positions\n \
var bool show_characters;\n \
\n \
# puts the game in single step mode\n \
var bool single_step;\n \
\n \
# number of degress of aiming width\n \
var float chr_aim_width;\n \
\n \
# shows AI sounds as they are generated\n \
var bool ai2_showsounds;\n \
\n \
# shows world axes\n \
var bool am_show_axes;\n \
\n \
# Selects the character debugging target\n \
var int chr_debug_target;\n \
\n \
# Enables display of environment octtree traversal\n \
var bool env_show_octtree;\n \
\n \
# Turns on doing the environment\n \
var bool gs_show_environment;\n \
\n \
# shows the count of objects\n \
var bool gs_show_object_count;\n \
\n \
# Sound rectangles will always be drawn, not just when a sound Rectangle is selected.\n \
var bool show_sound_rectangles;\n \
\n \
# forces the drawing of all characters\n \
var bool chr_draw_all_characters;\n \
\n \
# camera canter\n \
var float cm_canter_weapon;\n \
\n \
# which save point we are on\n \
var int save_point;\n \
\n \
# enable AI gun behavior debugging\n \
var bool debug_gun_behavior;\n \
\n \
# Enables character shadows\n \
var bool gs_show_shadows;\n \
\n \
# turns on pathfinding connection rendering\n \
var bool ai2_showconnections;\n \
\n \
# shows the path each AI is following\n \
var bool ai2_showpaths;\n \
\n \
# enables sync debugging\n \
var bool sync_debug;\n \
\n \
# shows local-environment melee awareness\n \
var bool ai2_showlocalmelee;\n \
\n \
# Sets the distance at which the radar will start to change from its minimum.\n \
var float target_max_distance;\n \
\n \
# controls trigger quad debugging\n \
var bool chr_debug_trigger_quad;\n \
\n \
# shows AI projectile knowledge\n \
var bool ai2_showprojectiles;\n \
\n \
# shows targeting info for AI2 characters\n \
var bool ai2_showtargeting;\n \
\n \
# Makes corpses fade when they are offscreen.\n \
var bool chr_corpse_fade_offscreen;\n \
\n \
# Displays sound debugging info\n \
var bool sound_show_debug;\n \
\n \
# Controls the size of the main character\n \
var float chr_mini_me_amount;\n \
\n \
# toggle display of colliding quads\n \
var bool ph_show_collisions;\n \
\n \
# Sets free time for powerups\n \
var int wp_fadetime;\n \
\n \
# Toggles double buffer mode\n \
var bool m3_double_buffer;\n \
\n \
# shows AI line-of-sight checking\n \
var bool ai2_showlos;\n \
\n \
# shows the count of active scripting contexts\n \
var bool gs_show_scripting_count;\n \
\n \
# number of degress of auto aiming arc\n \
var float chr_auto_aim_arc;\n \
\n \
# enables visual display of pathfinding errors\n \
var bool ai2_showpathfindingerrors;\n \
\n \
# Shows debug geometry\n \
var bool door_show_debug;\n \
\n \
# forces drawing of every frame\n \
var bool draw_every_frame;\n \
\n \
# Turns on the ui\n \
var bool gs_show_ui;\n \
\n \
# Draws a circle where door activates\n \
var bool door_show_activation;\n \
\n \
# controls the angle at which the characters can block\n \
var float chr_block_angle;\n \
\n \
# max\n \
var float recoil_max;\n \
\n \
# controls drawing of weapons\n \
var bool chr_draw_weapon;\n \
\n \
# fog blue\n \
var float gl_fog_blue;\n \
\n \
# shows the current lod of the main character\n \
var bool chr_show_lod;\n \
\n \
# prints debugging information about console usage\n \
var bool debug_consoles;\n \
\n \
# uses bad door lighting\n \
var bool door_pop_lighting;\n \
\n \
# distance for auto aiming\n \
var float chr_auto_aim_dist;\n \
\n \
# Prints debugging info about character melee impacts\n \
var bool chr_debug_impacts;\n \
\n \
# Draw only the GQs used for visibility\n \
var bool env_drawvisonly;\n \
\n \
# Turns on printing of the sound effect\n \
var bool chr_print_sound;\n \
\n \
# Enables character activity\n \
var bool chr_active;\n \
\n \
# number of lines to cast to debug local-movement code\n \
var int ai2_debug_localmove_lines;\n \
\n \
# Enables the display of AI patrol path objects\n \
var bool show_patrolpaths;\n \
\n \
# Offset from the horizontal edge of the screen for the cinematic insert.\n \
var float cinematic_yoffset;\n \
\n \
# Enables vertex interpolation for the triangle\n \
var bool m3_shade_vertex;\n \
\n \
# prints debugging info about weapon particle events\n \
var bool debug_weapons;\n \
\n \
# Enables breakable glass.\n \
var bool p3_glass_breakable;\n \
\n \
# Offset from the vertical edge of the screen for the cinematic insert.\n \
var float cinematic_xoffset;\n \
\n \
# factor\n \
var float recoil_factor;\n \
\n \
# controls debugging falling\n \
var bool chr_debug_fall;\n \
\n \
# shows circles that represent the combat ranges of each AI\n \
var bool ai2_showcombatranges;\n \
\n \
# shows fights in progress\n \
var bool ai2_showfights;\n \
\n \
# Enables display of environment octtree leaf nodes\n \
var bool env_show_leafnodes;\n \
\n \
# enable script debugging\n \
var bool debug_scripts;\n \
\n \
# Toggles display of the stars\n \
var bool sky_show_stars;\n \
\n \
# Draw all the GQs\n \
var bool env_drawallgqs;\n \
\n \
# \n \
var bool wp_force_half_scale;\n \
\n \
# shows each AIs vision cones (central and peripheral)\n \
var bool ai2_showvision;\n \
\n \
# Shows weapon ID\n \
var bool chr_show_weaponid;\n \
\n \
# 0 = normal buffer\n \
var int chr_buffer_size;\n \
\n \
# The fade time of the console\n \
var int co_fade_time;\n \
\n \
# Draw the frustum around the environment camera\n \
var bool env_drawfrustum;\n \
\n \
# master enable switch for spacing behavior\n \
var bool ai2_spacing_enable;\n \
\n \
# changes the priority of messages to display on the console\n \
var int co_priority;\n \
\n \
# turns on laser sights for AI2 characters\n \
var bool ai2_showlasers;\n \
\n \
# camera distance\n \
var float cm_distance;\n \
\n \
# Makes every quad breakable.\n \
var bool p3_everything_breakable;\n \
\n \
# Toggles display of the planet (sun/moon)\n \
var bool sky_show_planet;\n \
\n \
# debug local-movement code from players position\n \
var bool ai2_debug_localmovement;\n \
\n \
";

#endif
