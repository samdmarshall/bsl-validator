cm_barabus = {
    'desc': "special camera for barabus",
    'args': '[ai_name:string | script_id:int] away:float up:float time:int',
    'rtype': ''
};
chr_create = {
    'desc': "creates a character from a .txt file",
    'args': 'script_id:int [start_create:string{\"start\"} | ]',
    'rtype': ''
};
chr_delete = {
    'desc': "deletes a character",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_lock_active = {
    'desc': "locks the character active",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_unlock_active = {
    'desc': "locks the character active",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_facetoflag = {
    'desc': "snaps a character's facing to a flag's facing",
    'args': '[ai_name:string | script_id:int] flag_id:int',
    'rtype': ''
};
chr_teleport = {
    'desc': "teleports a character to a flag",
    'args': '[ai_name:string | script_id:int] flag_id:int',
    'rtype': ''
};
chr_nocollision = {
    'desc': "disables collision for a character",
    'args': '[ai_name:string | script_id:int] on_off:int{0 | 1}',
    'rtype': ''
};
ai2_takecontrol = {
    'desc': "makes the AI movement system take control of the player",
    'args': 'on_off:int{0 | 1}',
    'rtype': ''
};
chr_playback = {
    'desc': "plays back a film",
    'args': '[ai_name:string | script_id:int] film_name:string [mode:string{\"fromhere\" | \"interp\"} | ] [num_frames:int | ]",ai2iscript_playback',
    'rtype': ''
};
chr_playback_block = {
    'desc': "plays back a film and blocks until complete",
    'args': '[ai_name:string | script_id:int] film_name:string [mode:string{\"fromhere\" | \"interp\"} | ] [num_frames:int | ]",ai2iscript_playback_block',
    'rtype': ''
};
chr_playback_debug = {
    'desc': "dumps stats for a playback film",
    'args': 'film_name:string',
    'rtype': ''
};
chr_holdkey = {
    'desc': "forces a character to hold a key down for some frames",
    'args': '[ai_name:string | script_id:int] key_name:string num_frames:int',
    'rtype': ''
};
chr_animate = {
    'desc': "plays an animation on a character",
    'args': '[ai_name:string | script_id:int] anim_name:string [num_frames:int | ] [interp_frames:int | ]',
    'rtype': ''
};
chr_animate_block = {
    'desc': "plays an animation on a character and blocks until done",
    'args': '[ai_name:string | script_id:int] anim_name:string [num_frames:int | ] [interp_frames:int | ]',
    'rtype': ''
};
chr_envanim = {
    'desc': "plays an environment animation on a character",
    'args': '[ai_name:string | script_id:int] anim:string [norotation:string{\"norotation\"} | ]',
    'rtype': ''
};
chr_envanim_block = {
    'desc': "plays an environment animation on a character and blocks",
    'args': '[ai_name:string | script_id:int] anim:string [norotation:string{\"norotation\"} | ]',
    'rtype': ''
};
chr_envanim_stop = {
    'desc': "stops any environment animation on a character",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_wait_animation = {
    'desc': "waits for a character to play a specific animation",
    'args': 'void',
    'rtype': ''
};
chr_wait_animtype = {
    'desc': "waits for a character to play a specific animation type",
    'args': 'void',
    'rtype': ''
};
chr_wait_animstate = {
    'desc': "waits for a character to reach a specific animation state",
    'args': 'void',
    'rtype': ''
};
chr_boss_shield = {
    'desc': "turns on the boss shield for a character",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_weapon_immune = {
    'desc': "makes a character weapon immune",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_dontaim = {
    'desc': "disables the weapon variant for a character",
    'args': '[ai_name:string | script_id:int] on_off:int{0 | 1}',
    'rtype': ''
};
chr_set_health = {
    'desc': "sets a characters health by script id",
    'args': '[ai_name:string | script_id:int] hit_points:int',
    'rtype': ''
};
chr_full_health = {
    'desc': "sets a characters health to full by script id",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_giveweapon = {
    'desc': "gives a character a new weapon",
    'args': '[ai_name:string | script_id:int] weapon_name:string',
    'rtype': ''
};
chr_givepowerup = {
    'desc': "gives a character a powerup",
    'args': '[ai_name:string | script_id:int] powerup:string [amount:int | ]',
    'rtype': ''
};
chr_forceholster = {
    'desc': "forces a character to holster their weapon",
    'args': '[ai_name:string | script_id:int] holster:int{0 | 1} [force_draw:int{0 | 1} | ]',
    'rtype': ''
};
chr_changeteam = {
    'desc': "changes a character's team",
    'args': '[ai_name:string | script_id:int] team_name:string',
    'rtype': ''
};
chr_unstoppable = {
    'desc': "makes a character unstoppable",
    'args': '[ai_name:string | script_id:int] [on_off:int{0 | 1}]',
    'rtype': ''
};
chr_invincible = {
    'desc': "makes a character invincible",
    'args': '[ai_name:string | script_id:int] [on_off:int{0 | 1}]',
    'rtype': ''
};
chr_unkillable = {
    'desc': "makes a character unkillable",
    'args': '[ai_name:string | script_id:int] [on_off:int{0 | 1}]',
    'rtype': ''
};
chr_talk = {
    'desc': "causes a character to play a line of dialogue",
    'args': '[ai_name:string | script_id:int] sound_name:string pre_pause:int post_pause:int [priority:string | ]',
    'rtype': ''
};
chr_vocalize = {
    'desc': "makes a character utter a vocalization",
    'args': '[ai_name:string | script_id:int] type:string',
    'rtype': ''
};
chr_inv_reset = {
    'desc': "clears a characters inventory",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_peace = {
    'desc': "turns off fight mode",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
chr_poison = {
    'desc': "slowly poisons a character",
    'args': '[ai_name:string | script_id:int] damage:int interval:int [initial_interval:int | ]',
    'rtype': ''
};
chr_pain = {
    'desc': "forces a character to play a pain sound",
    'args': '[ai_name:string | script_id:int] pain_type:string',
    'rtype': ''
};
chr_super = {
    'desc': "set's a character's super value",
    'args': '[ai_name:string | script_id:int] super_amount:float',
    'rtype': ''
};
chr_wait_health = {
    'desc': "waits until a character's health falls below a value",
    'args': '[ai_name:string | script_id:int] hit_points:int',
    'rtype': ''
};
chr_shadow = {
    'desc': "turns of the shadow for this character",
    'args': '[ai_name:string | script_id:int] on_off:int{0 | 1}',
    'rtype': ''
};
chr_death_lock = {
    'desc': "this character will not die too much",
    'args': '[ai_name:string | script_id:int] on_off:int{0 | 1}',
    'rtype': ''
};
chr_ultra_mode = {
    'desc': "enables ultra mode for a character",
    'args': '[ai_name:string | script_id:int] on_off:int{0 | 1}',
    'rtype': ''
};
ai2_reset = {
    'desc': "resets AI as if start of level",
    'args': '[reset_player:int | ]',
    'rtype': ''
};
ai2_spawn = {
    'desc': "creates and starts an AI from a character object",
    'args': 'ai_name:string [force_spawn:string{\"force\"} | ]',
    'rtype': ''
};
ai2_spawnall = {
    'desc': "spawns all AI",
    'args': 'even those not initially present',
    'rtype': ''
};
ai2_kill = {
    'desc': "kills one or more AIs",
    'args': '[param1:string | ] [param2:string | ]',
    'rtype': ''
};
ai2_allpassive = {
    'desc': "stops all AIs from thinking for themselves",
    'args': 'passive:int{0 | 1}',
    'rtype': ''
};
ai2_passive = {
    'desc': "[ai_name:string | script_id:int] passive:int{0 | 1}",
    'args': 'ai2iscript_passive',
    'rtype': ''
};
ai2_active = {
    'desc': "forces an AI into active mode",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
ai2_inactive = {
    'desc': "forces an AI into inactive mode",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
ai2_setjobstate = {
    'desc': "tells an AI to take its current state as its job",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
ai2_dopath = {
    'desc': "tells an AI to run a particular path",
    'args': '[ai_name:string | script_id:int] path_name:string',
    'rtype': ''
};
ai2_doalarm = {
    'desc': "tells an AI to run for an alarm",
    'args': '[ai_name:string | script_id:int] [console_id:int | ]',
    'rtype': ''
};
ai2_idle = {
    'desc': "tells an AI to become idle",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
ai2_neutralbehavior = {
    'desc': "sets up an AI's neutral-interaction",
    'args': '[ai_name:string | script_id:int] behavior:string',
    'rtype': ''
};
ai2_noncombatant = {
    'desc': "sets or clears an AI's non-combatant state",
    'args': '[ai_name:string | script_id:int] non_combatant:int{0 | 1}',
    'rtype': ''
};
ai2_panic = {
    'desc': "makes an AI panic or not panic",
    'args': '[ai_name:string | script_id:int] timer:int',
    'rtype': ''
};
ai2_makeaware = {
    'desc': "makes an AI aware of another character",
    'args': '[ai_name:string | script_id:int] [target_name:string | target_script_id:int]',
    'rtype': ''
};
ai2_attack = {
    'desc': "forces an AI to attack another character",
    'args': '[ai_name:string | script_id:int] [target_name:string | target_script_id:int]',
    'rtype': ''
};
ai2_forget = {
    'desc': "makes one or all AIs forget they saw anything",
    'args': '[ai_name:string | script_id:int | ]  [forget_char:string | ]',
    'rtype': ''
};
ai2_setalert = {
    'desc': "sets the alert state of an AI",
    'args': '[ai_name:string | script_id:int] alert:string',
    'rtype': ''
};
ai2_tripalarm = {
    'desc': "trips an alarm",
    'args': 'alarm_id:int [ai_name:string | script_id:int | ]',
    'rtype': ''
};
ai2_makeblind = {
    'desc': "makes a single AI blind",
    'args': '[ai_name:string | script_id:int] on_off:int{0 | 1}',
    'rtype': ''
};
ai2_makedeaf = {
    'desc': "makes a single AI deaf",
    'args': '[ai_name:string | script_id:int] on_off:int{0 | 1}',
    'rtype': ''
};
ai2_makeignoreplayer = {
    'desc': "makes a single AI ignore the player",
    'args': '[ai_name:string | script_id:int] on_off:int{0 | 1}',
    'rtype': ''
};
ai2_setmovementmode = {
    'desc': "sets an AI's current movement mode",
    'args': '[ai_name:string | script_id:int] mode:string',
    'rtype': ''
};
ai2_movetoflag = {
    'desc': "tells an AI to move to a flag",
    'args': '[ai_name:string | script_id:int] flag_id:int [setfacing:string{\"setfacing\"} | ]',
    'rtype': ''
};
ai2_lookatchar = {
    'desc': "tells an AI to look at a character",
    'args': '[ai_name:string | script_id:int] [ai_name:string | script_id:int]',
    'rtype': ''
};
ai2_set_reporterror = {
    'desc': "sets the level of errors to report at console",
    'args': 'error_level:string [subsystem:string | ]',
    'rtype': ''
};
ai2_set_logerror = {
    'desc': "sets the level of errors to log to file",
    'args': 'error_level:string [subsystem:string | ]',
    'rtype': ''
};
ai2_set_handlesilenterror = {
    'desc': "sets whether handled errors are silent",
    'args': "handle_silent:bool [subsystem:string | ]",
    'rtype': ''
};
ai2_barabbas_retrievegun = {
    'desc': "makes barabbas retrieve his gun if it is lost",
    'args': '[ai_name:string | script_id:int]',
    'rtype': ''
};
ai2_skill_select = {
    'desc': "selects a shooting skill to edit",
    'args': 'char_class:string weapon_name:string',
    'rtype': ''
};
ai2_skill_show = {
    'desc': "shows the currently selected shooting skill",
    'args': '',
    'rtype': ''
};
ai2_skill_revert = {
    'desc': "reverts the shooting skill being edited to the saved copy,",
    'args': 'ai2iscript_skill_revert',
    'rtype': ''
};
ai2_skill_save = {
    'desc': "saves the shooting skill being edited out as a text file",
    'args': '',
    'rtype': ''
};
ai2_skill_recoil = {
    'desc': "sets an AI's recoil compensation amount (0-1)",
    'args': 'recoil_compensation:float',
    'rtype': ''
};
ai2_skill_bestangle = {
    'desc': "sets an AI's best aiming angle in degrees",
    'args': 'best_angle:float',
    'rtype': ''
};
ai2_skill_error = {
    'desc': "sets an AI's grouping error",
    'args': 'error_amount:float',
    'rtype': ''
};
ai2_skill_decay = {
    'desc': "sets an AI's grouping decay",
    'args': 'decay_amount:float',
    'rtype': ''
};
ai2_skill_inaccuracy = {
    'desc': "sets an AI's shooting inaccuracy multiplier",
    'args': 'inaccuracy:float',
    'rtype': ''
};
ai2_skill_delaymin = {
    'desc': "sets an AI's min delay between shots",
    'args': 'in frames',
    'rtype': ''
};
ai2_skill_delaymax = {
    'desc': "sets an AI's max delay between shots",
    'args': 'in frames',
    'rtype': ''
};
reset_mechanics = {
    'desc': "resets all level mechanics (triggers",
    'args': 'turrets',
    'rtype': ''
};
door_jam = {
    'desc': "jams a door in its current state",
    'args': 'door_id:int',
    'rtype': ''
};
door_unjam = {
    'desc': "unjams a door so characters can open it",
    'args': 'door_id:int',
    'rtype': ''
};
door_lock = {
    'desc': "locks a door",
    'args': 'door_id:int',
    'rtype': ''
};
door_unlock = {
    'desc': "unlocks a door",
    'args': 'door_id:int',
    'rtype': ''
};
door_open = {
    'desc': "opens a door (may not stay open)",
    'args': 'door_id:int',
    'rtype': ''
};
door_close = {
    'desc': "closes a door (may not stay open)",
    'args': 'door_id:int',
    'rtype': ''
};
door_printall = {
    'desc': "prints all doors in the level to file",
    'args': '',
    'rtype': ''
};
door_printnearby = {
    'desc': "prints all nearby doors",
    'args': '',
    'rtype': ''
};
console_activate = {
    'desc': "activates a console",
    'args': 'console_id:int',
    'rtype': ''
};
console_deactivate = {
    'desc': "deactivates a console",
    'args': 'console_id:int',
    'rtype': ''
};
console_reset = {
    'desc': "resets a console to initial state",
    'args': 'console_id:int',
    'rtype': ''
};
turret_activate = {
    'desc': "activates a turret",
    'args': 'turret_id:int',
    'rtype': ''
};
turret_deactivate = {
    'desc': "deactivates a turret",
    'args': 'turret_id:int',
    'rtype': ''
};
turret_reset = {
    'desc': "resets a turret to initial state",
    'args': 'turret_id:int',
    'rtype': ''
};
trig_activate = {
    'desc': "activates a trigger",
    'args': 'trigger_id:int',
    'rtype': ''
};
trig_deactivate = {
    'desc': "deactivates a trigger",
    'args': 'trigger_id:int',
    'rtype': ''
};
trig_reset = {
    'desc': "resets a trigger to non-triggered state",
    'args': 'trigger_id:int',
    'rtype': ''
};
trig_hide = {
    'desc': "hides a trigger",
    'args': 'trigger_id:int',
    'rtype': ''
};
trig_show = {
    'desc': "shows a trigger",
    'args': 'trigger_id:int',
    'rtype': ''
};
trig_speed = {
    'desc': "sets a triggers speed",
    'args': 'trigger_id:int volume:float',
    'rtype': ''
};
trigvolume_enable = {
    'desc': "enable or disable a trigger volume",
    'args': 'name:string enable:int{0 | 1} [type:string{\"all\" | \"entry\" | \"inside\" | \"exit\"} | ]',
    'rtype': ''
};
trigvolume_setscript = {
    'desc': "set the script to call from a trigger volume",
    'args': 'name:string script:string type:string{\"entry\" | \"inside\" | \"exit\"}',
    'rtype': ''
};
trigvolume_trigger = {
    'desc': "fire off a trigger volume",
    'args': 'name:string type:string{\"entry\" | \"inside\" | \"exit\"} [ai_name:string | script_id:int | ]',
    'rtype': ''
};
trigvolume_reset = {
    'desc': "reset a trigger volume to its level-load state",
    'args': 'name:string',
    'rtype': ''
};
trigvolume_corpse = {
    'desc': "kills all the corpses inside a trigger volume",
    'args': 'trig_id:int',
    'rtype': ''
};
trigvolume_kill = {
    'desc': "kills all the characters inside a trigger volume",
    'args': 'trig_id:int',
    'rtype': ''
};
weapon_spawn = {
    'desc': "creates a new weapon",
    'args': 'weapontype:string flag:int',
    'rtype': ''
};
powerup_spawn = {
    'desc': "creates a new powerup",
    'args': 'poweruptype:string flag:int',
    'rtype': ''
};
killed_griffen = {
    'desc': "sets if we killed griffen",
    'args': 'murder:bool',
    'rtype': ''
};
ai2_report = {
    'desc': "tells an AI to report in",
    'args': '[ai_name:string | script_id:int | ]',
    'rtype': ''
};
ai2_report_verbose = {
    'desc': "tells an AI to report in verbosely",
    'args': '[ai_name:string | script_id:int | ]',
    'rtype': ''
};
where = {
    'desc': "prints location of a character",
    'args': '[ai_name:string | script_id:int | ]',
    'rtype': ''
};
who = {
    'desc': "prints AIs that are nearby",
    'args': '',
    'rtype': ''
};
ai2_comehere = {
    'desc': "tells an AI to come to the player",
    'args': '[ai_name:string | script_id:int | ]',
    'rtype': ''
};
ai2_lookatme = {
    'desc': "tells an AI to look at the player",
    'args': '[ai_name:string | script_id:int | ]',
    'rtype': ''
};
ai2_followme = {
    'desc': "tells an AI to follow the player",
    'args': '[ai_name:string | script_id:int | ]',
    'rtype': ''
};
ai2_showmem = {
    'desc': "shows AI memory usage",
    'args': '',
    'rtype': ''
};
ai2_findconnections = {
    'desc': "finds all BNV connections from the player's location",
    'args': '[distance:int | ]',
    'rtype': ''
};
ai2_printbnvindex = {
    'desc': "prints the index of the player's BNV",
    'args': '',
    'rtype': ''
};
ai2_chump = {
    'desc': "creates a chump",
    'args': '',
    'rtype': ''
};
ai2_pathdebugsquare = {
    'desc': "selects a path square in the player's BNV for debugging",
    'args': 'x:int y:int',
    'rtype': ''
};
ai2_debug_makesound = {
    'desc': "causes the player to make a sound (alerts nearby AIs)",
    'args': '[sound_type:string | ] [volume:float | ]',
    'rtype': ''
};
env_broken = {
    'desc': "computes the number of objects in a range that have all their glass broken",
    'args': "gq_ref:int [gq_endref:int | ]",
    'rtype': 'int'
};
chr_is_player = {
    'desc': "returns if this character is the player",
    'args': "[ai_name:string | script_id:int]",
    'rtype': 'bool'
}
chr_has_lsi = {
    'desc': "records that the character has the lsi",
    'args': "[ai_name:string | script_id:int]",
    'rtype': 'bool'
}
chr_has_empty_weapon = {
    'desc': "returns if this character is holding a weapon that is empty",
    'args': "[ai_name:string | script_id:int]",
    'rtype': 'bool'
}
did_kill_griffen = {
    'desc': "returns if we did kill griffen",
    'args': 'void',
    'rtype': 'int'
};
trigvolume_count = {
    'desc': "counts the number of people in a trigger volume",
    'args': "trig_id:int",
    'rtype': 'int'
};
difficulty = {
    'desc': "returns the difficulty level",
    'args': 'void',
    'rtype': 'int'
};
chr_focus = {
    'desc': "Selects what character to control",
    'args': 'chr_index:int',
    'rtype': 'void'
};
chr_health = {
    'desc': "Sets character's health",
    'args': 'chr_index:int [hit_points:int | ]',
    'rtype': 'void'
};
chr_disarm = {
    'desc': "Disarms a character or everyone",
    'args': 'chr_index:int',
    'rtype': 'void'
};
goto = {
    'desc': "Sets the location of the player character",
    'args': '[[loc_x:float loc_y:float loc_z:float] | ]',
    'rtype': 'void'
};
chr_location = {
    'desc': "Sets the location of any character",
    'args': '[ai_name:string | chr_index:int] [[loc_x:float loc_y:float loc_z:float] | ]',
    'rtype': 'void'
};
chr_location_settocamera = {
    'desc': "Sets the location of any character to the camera location",
    'args': 'chr_index:int',
    'rtype': 'void'
};
chr_main_class = {
    'desc': "Sets the main characters class",
    'args': '[class_name:string | class_index:int]',
    'rtype': 'void'
};
chr_display_combat_stats = {
    'desc': "Displays the characters combat stats",
    'args': 'chr_index:int',
    'rtype': 'void'
};
chr_set_class = {
    'desc': "Sets the character class of a specific character",
    'args': 'chr_index:int [class_name:string | class_index:int]',
    'rtype': 'void'
};
chr_weapon = {
    'desc': "Sets the weapon for a give character",
    'args': 'chr_index:int [weapon_name:string | weapon_num:int]',
    'rtype': 'void'
};
chr_draw_dot = {
    'desc': "draws a dot at a specified location",
    'args': 'void',
    'rtype': 'void'
};
chr_kill_all_ai = {
    'desc': "kills all the AI",
    'args': 'void',
    'rtype': 'void'
};
fall_front = {
    'desc': "makes the player character fall front",
    'args': 'void',
    'rtype': 'void'
};
fall_back = {
    'desc': "makes the player character fall front",
    'args': 'void',
    'rtype': 'void'
};
make_corpse = {
    'desc': "makes a corpse",
    'args': 'corpse_name:string',
    'rtype': 'void'
};
corpse_reset = {
    'desc': "resets corpses to their initial state",
    'args': '',
    'rtype': 'void'
};
chr_who = {
    'desc': "lists all the players",
    'args': 'void',
    'rtype': 'void'
};
print_type = {
    'desc': "prints an anim type ",
    'args': 'type:int',
    'rtype': 'void'
};
print_state = {
    'desc': "prints an anim state",
    'args': 'state:int',
    'rtype': 'void'
};
crash = {
    'desc': "crashes the game (used for testing error handling)",
    'args': 'when:string{\"now\"}',
    'rtype': 'void'
};
hang = {
    'desc': "hangs the game (used for testing error handling)",
    'args': 'when:string{\"now\"}',
    'rtype': 'void'
};
perf_prefix = {
    'desc': "sets the perf prefix",
    'args': 'void',
    'rtype': 'void'
};
gs_fov_set = {
    'desc': "sets the field of view",
    'args': 'fov_degrees:float',
    'rtype': 'void'
};
debug_env_anim = {
    'desc': "draws a line for an environment animation",
    'args': 'name:string',
    'rtype': 'void'
};
gs_farclipplane_set = {
    'desc': "sets the far clipping plane",
    'args': 'plane:float',
    'rtype': 'void'
};
cm_anim = {
    'desc': "initiates a camera animation",
    'args': 'cam_spec:string{\"move\" | \"look\" | \"both\"} anim_name:string',
    'rtype': 'void'
};
cm_anim_block = {
    'desc': "initiates a camera animation",
    'args': 'cam_spec:string{\"move\" | \"look\" | \"both\"} anim_name:string',
    'rtype': 'void'
};
cm_interpolate = {
    'desc': "initiates a camera interpolation",
    'args': 'anim_name:string num_frames:int',
    'rtype': 'void'
};
cm_interpolate_block = {
    'desc': "initiates a camera interpolation",
    'args': 'anim_name:string num_frames:int',
    'rtype': 'void'
};
cm_orbit = {
    'desc': "puts the camera in orbit mode",
    'args': 'speed:float [stopangle:float | ]',
    'rtype': 'void'
};
cm_orbit_block = {
    'desc': "puts the camera in orbit mode",
    'args': 'speed:float [stopangle:float| ]',
    'rtype': 'void'
};
cm_detach = {
    'desc': "detaches the camera",
    'args': '',
    'rtype': 'void'
};
cm_wait = {
    'desc': "makes the camera wait until it is no longer busy",
    'args': '',
    'rtype': 'void'
};
cm_reset = {
    'desc': "resets the camera",
    'args': '[maxspeed:float | ] [maxfocalaccel:float | ]',
    'rtype': 'void'
};
obj_hide = {
    'desc': "turns display of an object on or off",
    'args': 'obj_id:int [ obj_id:int | ]',
    'rtype': 'void'
};
obj_show = {
    'desc': "turns display of an object on or off",
    'args': 'obj_id:int [ obj_id:int | ]',
    'rtype': 'void'
};
obj_force_draw = {
    'desc': "locks an object as visible",
    'args': 'obj_id:int [ obj_id:int | ]',
    'rtype': 'void'
};
obj_shade = {
    'desc': "turns display of an object on or off",
    'args': 'obj_id:int obj_id:int r:float g:float b:float',
    'rtype': 'void'
};
obj_kill = {
    'desc': "kills a range of object",
    'args': 'obj_id:int [ obj_id:int | ]',
    'rtype': 'void'
};
obj_create = {
    'desc': "creates a range of objects",
    'args': 'obj_id:int [ obj_id:int | ]',
    'rtype': 'void'
};
env_anim = {
    'desc': "initiates a environment animation: blocks until completed",
    'args': 'obj_id:int [ obj_id:int | ]',
    'rtype': 'void'
};
env_anim_block = {
    'desc': "initiates a environment animation: blocks until completed",
    'args': 'obj_id:int [ obj_id:int | ]',
    'rtype': 'void'
};
env_setanim = {
    'desc': "sets up an animation for an object",
    'args': 'obj_id:int object_name:string',
    'rtype': 'void'
};
env_setanim_block = {
    'desc': "sets up an animation for an object",
    'args': 'obj_id:int object_name:string',
    'rtype': 'void'
};
letterbox = {
    'desc': "starts or stops letterboxing",
    'args': 'start_stop:int{0 | 1}",	aiiscript_letterbox },',
    'rtype': 'void'
};
input = {
    'desc': "turns input on or off",
    'args': 'on_off:int{0 | 1}',
    'rtype': 'void'
};
fade_in = {
    'desc': "fades the screen in",
    'args': 'ticks:int',
    'rtype': 'void'
};
fade_out = {
    'desc': "fades the screen out",
    'args': '[r:float | r:int] [g:float | g:int] [b:float | b:int] ticks:int',
    'rtype': 'void'
};
env_texswap = {
    'desc': "swaps an environment texture",
    'args': 'gq_start:int tex_name:string',
    'rtype': 'void'
};
env_show = {
    'desc': "turns on or off specified parts of the environment",
    'args': 'gq_ref:int on_off:int{0 | 1}',
    'rtype': 'void'
};
env_shade = {
    'desc': "sets the shade of a block of objects",
    'args': 'gq_ref:int gq_ref:int r:float g:float b:float',
    'rtype': 'void'
};
begin_cutscene = {
    'desc': "begins a cutscene",
    'args': 'void',
    'rtype': 'void'
};
end_cutscene = {
    'desc': "ends a cutscene",
    'args': '',
    'rtype': 'void'
};
cutscene_sync = {
    'desc': "marks a point in a cutscene",
    'args': 'void',
    'rtype': 'void'
};
dprint = {
    'desc': "debugging print",
    'args': 'astring:string',
    'rtype': 'void'
};
dmsg = {
    'desc': "debugging message",
    'args': 'astring:string',
    'rtype': 'void'
};
win = {
    'desc': "win this level",
    'args': 'void',
    'rtype': 'void'
};
lose = {
    'desc': "lose this level",
    'args': 'void',
    'rtype': 'void'
};
slowmo = {
    'desc': "starts the slowmotion timer",
    'args': 'duration:int',
    'rtype': 'void'
};
timer_start = {
    'desc': "starts the countdown timer",
    'args': 'duration:float script:string',
    'rtype': 'void'
};
timer_stop = {
    'desc': "starts the countdown timer",
    'args': '',
    'rtype': 'void'
};
save_game = {
    'desc': "saves the game",
    'args': 'save_point:int [type:string{\"autosave\"} | ]',
    'rtype': 'void'
};
restore_game = {
    'desc': "restores the game",
    'args': '',
    'rtype': 'void'
};
message = {
    'desc': "sends a message from the subtitle file",
    'args': 'message:string [timer:int]',
    'rtype': 'void'
};
message_remove = {
    'desc': "removes a currently displayed message",
    'args': '[message:string | ]',
    'rtype': 'void'
};
splash_screen = {
    'desc': "displays a splash screen",
    'args': 'texture:string',
    'rtype': 'void'
};
lock_keys = {
    'desc': "locks keys out",
    'args': 'void',
    'rtype': 'void'
};
cinematic_start = {
    'desc': "start the display of a cinematic insert",
    'args': "bitmap_name:string draw_width:int draw_height:int start:int end:int velocity:float mirror:bool",
    'rtype': 'void'
};
cinematic_stop = {
    'desc': "stop the display of a cinematic insert",
    'args': "bitmap_name:string end:int velocity:float",
    'rtype': 'void'
};
cm_jello = {
    'desc': "toggles camera Jello(tm) mode",
    'args': "mode:int{0 | 1 }",
    'rtype': 'void'
};
console_print = {
    'desc': "dumps all arguments",
    'args': 'void',
    'rtype': 'voud'
};
co_toggle_text = {
    'desc': "cycles console text color",
    'args': 'void',
    'rtype': 'void'
};
give_powerup = {
    'desc': "Gives a powerup to a character",
    'args': "powerup_name:string [amount:int | ] [character:int | ]",
    'rtype': 'void'
};
weapon_reset = {
    'desc': "resets all unheld weapons to their starting state",
    'args': 'void',
    'rtype': 'void'
};
powerup_reset = {
    'desc': "resets all placed powerups to their starting points",
    'args': 'void',
    'rtype': 'void'
};
diary_page_unlock = {
    'desc': "Unlocks a specific diary page on the current level.",
    'args': "page:int",
    'rtype': 'void'
};
objective_complete = {
    'desc': "Plays the objective-complete sound.",
    'args': 'void',
    'rtype': 'void'
};
ui_show_help = {
    'desc': "debugging: enables the HUD help overlays",
    'args': "enable:int",
    'rtype': 'void'
};
ui_fill_element = {
    'desc': "sets part of the HUD to completely filled",
    'args': "element_name:string fill:int",
    'rtype': 'void'
};
objective_set = {
    'desc': "Sets the current objective page.",
    'args': "page:int [make_silent:string{\"silent\"} | ]",
    'rtype': 'void'
};
target_set = {
    'desc': "Sets the target to the specified flag",
    'args': "flag_id:int min_distance:float",
    'rtype': 'void'
};
text_console = {
    'desc': "Turns on the text console display",
    'args': "name:string",
    'rtype': 'void'
};
ui_show_element = {
    'desc': "shows or hides part of the HUD",
    'args': "element_name:string show:int",
    'rtype': 'void'
};
ui_flash_element = {
    'desc': "sets part of the HUD to flash or not flash",
    'args': "element_name:string fill:int",
    'rtype': 'void'
};
dump_docs = {
    'desc': "Shows all registered variables and commands",
    'args': 'void',
    'rtype': 'void'
};
flag_view_prefix = {
    'desc': "View flags with a specific prefix",
    'args': "prefix:string",
    'rtype': 'void'
};
gl_fog_start_changeto = {
    'desc': "changes the fog start distance smoothly",
    'args': "start_val:float [frames:int | ]",
    'rtype': 'void'
};
gl_fog_end_changeto = {
    'desc': "changes the fog end distance smoothly",
    'args': "end_val:float [frames:int | ]",
    'rtype': 'void'
};
m3_draw_engine_list = {
    'desc': "lists all the engines",
    'args': "void",
    'rtype': 'void'
};
m3_geom_engine_list = {
    'desc': "lists all the engines",
    'args': "void",
    'rtype': 'void'
};
m3_engine_set = {
    'desc': "sets the active engine",
    'args': "geom_engine:int draw_engine:int",
    'rtype': 'void'
};
m3_display_list = {
    'desc': "lists all the display modes",
    'args': "void",
    'rtype': 'void'
};
m3_display_set = {
    'desc': "sets the active display mode",
    'args': "device_index:int mode_index:int",
    'rtype': 'void'
};
m3_quality_set = {
    'desc': "sets the current graphics quality",
    'args': "quality:string",
    'rtype': 'void'
};
movie_play = {
    'desc': "function to start a movie playing",
    'args': "name:string",
    'rtype': 'void'
};
p3_spawn = {
    'desc': "Spawns a new P3 particle",
    'args': "particle_class:string [velocity:float | ]",
    'rtype': 'void'
};
p3_killall = {
    'desc': "Kills all P3 particles",
    'args': "void",
    'rtype': 'void'
};
p3_killnearest = {
    'desc': "Kills the nearest P3 particle",
    'args': "[no_recreate:bool | ]",
    'rtype': 'void'
};
p3_count = {
    'desc': "Lists a count of P3 particles",
    'args': "void",
    'rtype': 'void'
};
p3_callevent = {
    'desc': "Triggers an event on all P3 particles of a specified class",
    'args': "particle_class:string event_index:int",
    'rtype': 'void'
};
particle_temp_start = {
    'desc': "Starts temporary-particle-creation mode",
    'args': 'void',
    'rtype': 'void'
};
particle_temp_stop = {
    'desc': "Stops temporary-particle-creation mode",
    'args': 'void',
    'rtype': 'void'
};
particle_temp_kill = {
    'desc': "Kills any temporary particles",
    'args': 'void',
    'rtype': 'void'
};
particle = {
    'desc': "Sends a command to environmental particles with a given tag",
    'args': 'void',
    'rtype': 'void'
};
p3_printtags = {
    'desc': "Prints out all environmental particles with tags",
    'args': 'void',
    'rtype': 'void'
};
p3_removedangerous = {
    'desc': "Removes all 'dangerous projectile' particles by making their lifetime expire",
    'args': 'void',
    'rtype': 'void'
};
p3_dumpparticles = {
    'desc': "Dump all particles to a text file",
    'args': 'void',
    'rtype': 'void'
};
p3_listcollision = {
    'desc': "Dump all particle classes with collision to a text file",
    'args': 'void',
    'rtype': 'void'
};
p3_writeusedparticles = {
    'desc': "Writes all particles used on this level to a text file",
    'args': 'void',
    'rtype': 'void'
};
p3_startall = {
    'desc': "Creates and starts all environmental particles",
    'args': 'void',
    'rtype': 'void'
};
p3_stopall = {
    'desc': "Stops all environmental particles",
    'args': 'void',
    'rtype': 'void'
};
p3_daodan_disable = {
    'desc': "Disables parts of the daodan shield (for debugging)",
    'args': 'void',
    'rtype': 'void'
};
p3_perf = {
    'desc': "Toggles particle performance display and sets event masks",
    'args': 'void',
    'rtype': 'void'
};
ph_status = {
    'desc': 'xxx',
    'args': 'void',
    'rtype': 'void'
};
script_reload = {
    'desc': "reload scripts for a level",
    'args': 'void',
    'rtype': 'void'
};
sc_focus = {
    'desc': "sets which character we're authoring for a film",
    'args': "chr_index:int",
    'rtype': 'void'
};
sound_music_start = {
    'desc': "function to start music playing",
    'args': "name:string",
    'rtype': 'void'
};
sound_music_stop = {
    'desc': "function to start music playing",
    'args': "name:string",
    'rtype': 'void'
};
sound_dialog_play = {
    'desc': "function to start character dialog playing",
    'args': "name:string",
    'rtype': 'void'
};
sound_dialog_play_block = {
    'desc': "function to start character dialog playing after the current dialog finishes",
    'args': "name:string",
    'rtype': 'void'
};
sound_dialog_play_interrupt = {
    'desc': "function to interrupt the current character dialog and play a new one",
    'args': "name:string",
    'rtype': 'void'
};
sound_ambient_start = {
    'desc': "function to start an ambient sound",
    'args': "name:string [volume:float | ]",
    'rtype': 'void'
};
sound_ambient_stop = {
    'desc': "function to stop an ambient sound",
    'args': "name:string",
    'rtype': 'void'
};
sound_ambient_volume = {
    'desc': "function to set the volume of a playing ambient sound",
    'args': "name:string volume:float [time:float | ]",
    'rtype': 'void'
};
sound_impulse_play = {
    'desc': "function plays an impulse sound",
    'args': "name:string [volume:float | ]",
    'rtype': 'void'
};
sound_list_broken_links = {
    'desc': "function writes a list of sounds which have broken links to a file",
    'args': "void",
    'rtype': 'void'
};
sound_objects_reset = {
    'desc': "reloads the sounds objects",
    'args': 'void',
    'rtype': 'void'
};
sound_music_volume = {
    'desc': "function to set the volume of playing music",
    'args': "name:string volume:float [time:float | ]",
    'rtype': 'void'
};
tr_write_animation = {
    'desc': "bla bla bla",
    'args': "anim_name:string file_name:string",
    'rtype': 'void'
};
tr_write_collection = {
    'desc': "bla bla bla",
    'args': "collection_name:string file_name:string",
    'rtype': 'void'
};
tr_write_lookup = {
    'desc': "bla bla bla",
    'args': "file_name:string",
    'rtype': 'void'
};
tr_stop_lookup = {
    'desc': "bla bla bla",
    'args': 'void',
    'rtype': 'void'
};
bind = {
    'desc': "binds an input to a function",
    'args': "input_name:string to:string{\"to\"} input_function:string",
    'rtype': 'void'
};
unbind = {
    'desc': "removes a binding from a input function",
    'args': "input_name:string",
    'rtype': 'void'
};
unbindall = {
    'desc': "removes all bindings",
    'args': 'void',
    'rtype': 'void'
};
mouse_acceleration = {
    'desc': "sets the mouse acceleration value",
    'args': "accel:float",
    'rtype': 'void'
};
