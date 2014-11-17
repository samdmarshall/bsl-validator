cm_barabus = {
    'desc': "special camera for barabus",
    'args': '"[ai_name:string | script_id:int] away:float up:float time:int"',
    'rtype': ''
};
chr_create = {
    'desc': "creates a character from a .txt file",
    'args': '"script_id:int [start_create:string{\"start\"} | ]"',
    'rtype': ''
};
chr_delete = {
    'desc': "deletes a character",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_lock_active = {
    'desc': "locks the character active",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_unlock_active = {
    'desc': "locks the character active",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_facetoflag = {
    'desc': "snaps a character's facing to a flag's facing",
    'args': '"[ai_name:string | script_id:int] flag_id:int"',
    'rtype': ''
};
chr_teleport = {
    'desc': "teleports a character to a flag",
    'args': '"[ai_name:string | script_id:int] flag_id:int"',
    'rtype': ''
};
chr_nocollision = {
    'desc': "disables collision for a character",
    'args': '"[ai_name:string | script_id:int] on_off:int{0 | 1}"',
    'rtype': ''
};
ai2_takecontrol = {
    'desc': "makes the AI movement system take control of the player",
    'args': '"on_off:int{0 | 1}"',
    'rtype': ''
};
chr_playback = {
    'desc': "plays back a film",
    'args': '"[ai_name:string | script_id:int] film_name:string [mode:string{\"fromhere\" | \"interp\"} | ] [num_frames:int | ]",ai2iscript_playback',
    'rtype': ''
};
chr_playback_block = {
    'desc': "plays back a film and blocks until complete",
    'args': '"[ai_name:string | script_id:int] film_name:string [mode:string{\"fromhere\" | \"interp\"} | ] [num_frames:int | ]",ai2iscript_playback_block',
    'rtype': ''
};
chr_playback_debug = {
    'desc': "dumps stats for a playback film",
    'args': '"film_name:string"',
    'rtype': ''
};
chr_holdkey = {
    'desc': "forces a character to hold a key down for some frames",
    'args': '"[ai_name:string | script_id:int] key_name:string num_frames:int"',
    'rtype': ''
};
chr_animate = {
    'desc': "plays an animation on a character",
    'args': '"[ai_name:string | script_id:int] anim_name:string [num_frames:int | ] [interp_frames:int | ]"',
    'rtype': ''
};
chr_animate_block = {
    'desc': "plays an animation on a character and blocks until done",
    'args': '"[ai_name:string | script_id:int] anim_name:string [num_frames:int | ] [interp_frames:int | ]"',
    'rtype': ''
};
chr_envanim = {
    'desc': "plays an environment animation on a character",
    'args': '"[ai_name:string | script_id:int] anim:string [norotation:string{\"norotation\"} | ]"',
    'rtype': ''
};
chr_envanim_block = {
    'desc': "plays an environment animation on a character and blocks",
    'args': '"[ai_name:string | script_id:int] anim:string [norotation:string{\"norotation\"} | ]"',
    'rtype': ''
};
chr_envanim_stop = {
    'desc': "stops any environment animation on a character",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_wait_animation = {
    'desc': "waits for a character to play a specific animation",
    'args': 'null',
    'rtype': ''
};
chr_wait_animtype = {
    'desc': "waits for a character to play a specific animation type",
    'args': 'null',
    'rtype': ''
};
chr_wait_animstate = {
    'desc': "waits for a character to reach a specific animation state",
    'args': 'null',
    'rtype': ''
};
chr_boss_shield = {
    'desc': "turns on the boss shield for a character",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_weapon_immune = {
    'desc': "makes a character weapon immune",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_dontaim = {
    'desc': "disables the weapon variant for a character",
    'args': '"[ai_name:string | script_id:int] on_off:int{0 | 1}"',
    'rtype': ''
};
chr_set_health = {
    'desc': "sets a characters health by script id",
    'args': '"[ai_name:string | script_id:int] hit_points:int"',
    'rtype': ''
};
chr_full_health = {
    'desc': "sets a characters health to full by script id",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_giveweapon = {
    'desc': "gives a character a new weapon",
    'args': '"[ai_name:string | script_id:int] weapon_name:string"',
    'rtype': ''
};
chr_givepowerup = {
    'desc': "gives a character a powerup",
    'args': '"[ai_name:string | script_id:int] powerup:string [amount:int | ]"',
    'rtype': ''
};
chr_forceholster = {
    'desc': "forces a character to holster their weapon",
    'args': '"[ai_name:string | script_id:int] holster:int{0 | 1} [force_draw:int{0 | 1} | ]"',
    'rtype': ''
};
chr_changeteam = {
    'desc': "changes a character's team",
    'args': '"[ai_name:string | script_id:int] team_name:string"',
    'rtype': ''
};
chr_unstoppable = {
    'desc': "makes a character unstoppable",
    'args': '"[ai_name:string | script_id:int] [on_off:int{0 | 1}]"',
    'rtype': ''
};
chr_invincible = {
    'desc': "makes a character invincible",
    'args': '"[ai_name:string | script_id:int] [on_off:int{0 | 1}]"',
    'rtype': ''
};
chr_unkillable = {
    'desc': "makes a character unkillable",
    'args': '"[ai_name:string | script_id:int] [on_off:int{0 | 1}]"',
    'rtype': ''
};
chr_talk = {
    'desc': "causes a character to play a line of dialogue",
    'args': '"[ai_name:string | script_id:int] sound_name:string pre_pause:int post_pause:int [priority:string | ]"',
    'rtype': ''
};
chr_vocalize = {
    'desc': "makes a character utter a vocalization",
    'args': '"[ai_name:string | script_id:int] type:string"',
    'rtype': ''
};
chr_inv_reset = {
    'desc': "clears a characters inventory",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_peace = {
    'desc': "turns off fight mode",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
chr_poison = {
    'desc': "slowly poisons a character",
    'args': '"[ai_name:string | script_id:int] damage:int interval:int [initial_interval:int | ]"',
    'rtype': ''
};
chr_pain = {
    'desc': "forces a character to play a pain sound",
    'args': '"[ai_name:string | script_id:int] pain_type:string"',
    'rtype': ''
};
chr_super = {
    'desc': "set's a character's super value",
    'args': '"[ai_name:string | script_id:int] super_amount:float"',
    'rtype': ''
};
chr_wait_health = {
    'desc': "waits until a character's health falls below a value",
    'args': '"[ai_name:string | script_id:int] hit_points:int"',
    'rtype': ''
};
chr_shadow = {
    'desc': "turns of the shadow for this character",
    'args': '"[ai_name:string | script_id:int] on_off:int{0 | 1}"',
    'rtype': ''
};
chr_death_lock = {
    'desc': "this character will not die too much",
    'args': '"[ai_name:string | script_id:int] on_off:int{0 | 1}"',
    'rtype': ''
};
chr_ultra_mode = {
    'desc': "enables ultra mode for a character",
    'args': '"[ai_name:string | script_id:int] on_off:int{0 | 1}"',
    'rtype': ''
};
ai2_reset = {
    'desc': "resets AI as if start of level",
    'args': '"[reset_player:int | ]"',
    'rtype': ''
};
ai2_spawn = {
    'desc': "creates and starts an AI from a character object",
    'args': '"ai_name:string [force_spawn:string{\"force\"} | ]"',
    'rtype': ''
};
ai2_spawnall = {
    'desc': "spawns all AI",
    'args': 'even those not initially present"',
    'rtype': ''
};
ai2_kill = {
    'desc': "kills one or more AIs",
    'args': '"[param1:string | ] [param2:string | ]"',
    'rtype': ''
};
ai2_allpassive = {
    'desc': "stops all AIs from thinking for themselves",
    'args': '"passive:int{0 | 1}"',
    'rtype': ''
};
ai2_passive = {
    'desc': "[ai_name:string | script_id:int] passive:int{0 | 1}",
    'args': 'ai2iscript_passive',
    'rtype': ''
};
ai2_active = {
    'desc': "forces an AI into active mode",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
ai2_inactive = {
    'desc': "forces an AI into inactive mode",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
ai2_setjobstate = {
    'desc': "tells an AI to take its current state as its job",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
ai2_dopath = {
    'desc': "tells an AI to run a particular path",
    'args': '"[ai_name:string | script_id:int] path_name:string"',
    'rtype': ''
};
ai2_doalarm = {
    'desc': "tells an AI to run for an alarm",
    'args': '"[ai_name:string | script_id:int] [console_id:int | ]"',
    'rtype': ''
};
ai2_idle = {
    'desc': "tells an AI to become idle",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
ai2_neutralbehavior = {
    'desc': "sets up an AI's neutral-interaction",
    'args': '"[ai_name:string | script_id:int] behavior:string"',
    'rtype': ''
};
ai2_noncombatant = {
    'desc': "sets or clears an AI's non-combatant state",
    'args': '"[ai_name:string | script_id:int] non_combatant:int{0 | 1}"',
    'rtype': ''
};
ai2_panic = {
    'desc': "makes an AI panic or not panic",
    'args': '"[ai_name:string | script_id:int] timer:int"',
    'rtype': ''
};
ai2_makeaware = {
    'desc': "makes an AI aware of another character",
    'args': '"[ai_name:string | script_id:int] [target_name:string | target_script_id:int]"',
    'rtype': ''
};
ai2_attack = {
    'desc': "forces an AI to attack another character",
    'args': '"[ai_name:string | script_id:int] [target_name:string | target_script_id:int]"',
    'rtype': ''
};
ai2_forget = {
    'desc': "makes one or all AIs forget they saw anything",
    'args': '"[ai_name:string | script_id:int | ]  [forget_char:string | ]"',
    'rtype': ''
};
ai2_setalert = {
    'desc': "sets the alert state of an AI",
    'args': '"[ai_name:string | script_id:int] alert:string"',
    'rtype': ''
};
ai2_tripalarm = {
    'desc': "trips an alarm",
    'args': '"alarm_id:int [ai_name:string | script_id:int | ]"',
    'rtype': ''
};
ai2_makeblind = {
    'desc': "makes a single AI blind",
    'args': '"[ai_name:string | script_id:int] on_off:int{0 | 1}"',
    'rtype': ''
};
ai2_makedeaf = {
    'desc': "makes a single AI deaf",
    'args': '"[ai_name:string | script_id:int] on_off:int{0 | 1}"',
    'rtype': ''
};
ai2_makeignoreplayer = {
    'desc': "makes a single AI ignore the player",
    'args': '"[ai_name:string | script_id:int] on_off:int{0 | 1}"',
    'rtype': ''
};
ai2_setmovementmode = {
    'desc': "sets an AI's current movement mode",
    'args': '"[ai_name:string | script_id:int] mode:string"',
    'rtype': ''
};
ai2_movetoflag = {
    'desc': "tells an AI to move to a flag",
    'args': '"[ai_name:string | script_id:int] flag_id:int [setfacing:string{\"setfacing\"} | ]"',
    'rtype': ''
};
ai2_lookatchar = {
    'desc': "tells an AI to look at a character",
    'args': '"[ai_name:string | script_id:int] [ai_name:string | script_id:int]"',
    'rtype': ''
};
ai2_set_reporterror = {
    'desc': "sets the level of errors to report at console",
    'args': '"error_level:string [subsystem:string | ]"',
    'rtype': ''
};
ai2_set_logerror = {
    'desc': "sets the level of errors to log to file",
    'args': '"error_level:string [subsystem:string | ]"',
    'rtype': ''
};
ai2_set_handlesilenterror,NULL = {
    'desc': "handle_silent:bool [subsystem:string | ]",
    'args': 'ai2iscript_set_handlesilenterror',
    'rtype': ''
};
ai2_barabbas_retrievegun = {
    'desc': "makes barabbas retrieve his gun if it is lost",
    'args': '"[ai_name:string | script_id:int]"',
    'rtype': ''
};
ai2_skill_select = {
    'desc': "selects a shooting skill to edit",
    'args': '"char_class:string weapon_name:string"',
    'rtype': ''
};
ai2_skill_show = {
    'desc': "shows the currently selected shooting skill",
    'args': '""',
    'rtype': ''
};
ai2_skill_revert = {
    'desc': "reverts the shooting skill being edited to the saved copy,",
    'args': 'ai2iscript_skill_revert',
    'rtype': ''
};
ai2_skill_save = {
    'desc': "saves the shooting skill being edited out as a text file",
    'args': '""',
    'rtype': ''
};
ai2_skill_recoil = {
    'desc': "sets an AI's recoil compensation amount (0-1)",
    'args': '"recoil_compensation:float"',
    'rtype': ''
};
ai2_skill_bestangle = {
    'desc': "sets an AI's best aiming angle in degrees",
    'args': '"best_angle:float"',
    'rtype': ''
};
ai2_skill_error = {
    'desc': "sets an AI's grouping error",
    'args': '"error_amount:float"',
    'rtype': ''
};
ai2_skill_decay = {
    'desc': "sets an AI's grouping decay",
    'args': '"decay_amount:float"',
    'rtype': ''
};
ai2_skill_inaccuracy = {
    'desc': "sets an AI's shooting inaccuracy multiplier",
    'args': '"inaccuracy:float"',
    'rtype': ''
};
ai2_skill_delaymin = {
    'desc': "sets an AI's min delay between shots",
    'args': 'in frames"',
    'rtype': ''
};
ai2_skill_delaymax = {
    'desc': "sets an AI's max delay between shots",
    'args': 'in frames"',
    'rtype': ''
};
reset_mechanics = {
    'desc': "resets all level mechanics (triggers",
    'args': 'turrets',
    'rtype': ''
};
door_jam = {
    'desc': "jams a door in its current state",
    'args': '"door_id:int"',
    'rtype': ''
};
door_unjam = {
    'desc': "unjams a door so characters can open it",
    'args': '"door_id:int"',
    'rtype': ''
};
door_lock = {
    'desc': "locks a door",
    'args': '"door_id:int"',
    'rtype': ''
};
door_unlock = {
    'desc': "unlocks a door",
    'args': '"door_id:int"',
    'rtype': ''
};
door_open = {
    'desc': "opens a door (may not stay open)",
    'args': '"door_id:int"',
    'rtype': ''
};
door_close = {
    'desc': "closes a door (may not stay open)",
    'args': '"door_id:int"',
    'rtype': ''
};
door_printall = {
    'desc': "prints all doors in the level to file",
    'args': '""',
    'rtype': ''
};
door_printnearby = {
    'desc': "prints all nearby doors",
    'args': '""',
    'rtype': ''
};
console_activate = {
    'desc': "activates a console",
    'args': '"console_id:int"',
    'rtype': ''
};
console_deactivate = {
    'desc': "deactivates a console",
    'args': '"console_id:int"',
    'rtype': ''
};
console_reset = {
    'desc': "resets a console to initial state",
    'args': '"console_id:int"',
    'rtype': ''
};
turret_activate = {
    'desc': "activates a turret",
    'args': '"turret_id:int"',
    'rtype': ''
};
turret_deactivate = {
    'desc': "deactivates a turret",
    'args': '"turret_id:int"',
    'rtype': ''
};
turret_reset = {
    'desc': "resets a turret to initial state",
    'args': '"turret_id:int"',
    'rtype': ''
};
trig_activate = {
    'desc': "activates a trigger",
    'args': '"trigger_id:int"',
    'rtype': ''
};
trig_deactivate = {
    'desc': "deactivates a trigger",
    'args': '"trigger_id:int"',
    'rtype': ''
};
trig_reset = {
    'desc': "resets a trigger to non-triggered state",
    'args': '"trigger_id:int"',
    'rtype': ''
};
trig_hide = {
    'desc': "hides a trigger",
    'args': '"trigger_id:int"',
    'rtype': ''
};
trig_show = {
    'desc': "shows a trigger",
    'args': '"trigger_id:int"',
    'rtype': ''
};
trig_speed = {
    'desc': "sets a triggers speed",
    'args': '"trigger_id:int volume:float"',
    'rtype': ''
};
trigvolume_enable = {
    'desc': "enable or disable a trigger volume",
    'args': '"name:string enable:int{0 | 1} [type:string{\"all\" | \"entry\" | \"inside\" | \"exit\"} | ]"',
    'rtype': ''
};
trigvolume_setscript = {
    'desc': "set the script to call from a trigger volume",
    'args': '"name:string script:string type:string{\"entry\" | \"inside\" | \"exit\"}"',
    'rtype': ''
};
trigvolume_trigger = {
    'desc': "fire off a trigger volume",
    'args': '"name:string type:string{\"entry\" | \"inside\" | \"exit\"} [ai_name:string | script_id:int | ]"',
    'rtype': ''
};
trigvolume_reset = {
    'desc': "reset a trigger volume to its level-load state",
    'args': '"name:string"',
    'rtype': ''
};
trigvolume_corpse = {
    'desc': "kills all the corpses inside a trigger volume",
    'args': '"trig_id:int"',
    'rtype': ''
};
trigvolume_kill = {
    'desc': "kills all the characters inside a trigger volume",
    'args': '"trig_id:int"',
    'rtype': ''
};
weapon_spawn = {
    'desc': "creates a new weapon",
    'args': '"weapontype:string flag:int"',
    'rtype': ''
};
powerup_spawn = {
    'desc': "creates a new powerup",
    'args': '"poweruptype:string flag:int"',
    'rtype': ''
};
killed_griffen = {
    'desc': "sets if we killed griffen",
    'args': '"murder:bool"',
    'rtype': ''
};
ai2_report = {
    'desc': "tells an AI to report in",
    'args': '"[ai_name:string | script_id:int | ]"',
    'rtype': ''
};
ai2_report_verbose = {
    'desc': "tells an AI to report in verbosely",
    'args': '"[ai_name:string | script_id:int | ]"',
    'rtype': ''
};
where = {
    'desc': "prints location of a character",
    'args': '"[ai_name:string | script_id:int | ]"',
    'rtype': ''
};
who = {
    'desc': "prints AIs that are nearby",
    'args': '""',
    'rtype': ''
};
ai2_comehere = {
    'desc': "tells an AI to come to the player",
    'args': '"[ai_name:string | script_id:int | ]"',
    'rtype': ''
};
ai2_lookatme = {
    'desc': "tells an AI to look at the player",
    'args': '"[ai_name:string | script_id:int | ]"',
    'rtype': ''
};
ai2_followme = {
    'desc': "tells an AI to follow the player",
    'args': '"[ai_name:string | script_id:int | ]"',
    'rtype': ''
};
ai2_showmem = {
    'desc': "shows AI memory usage",
    'args': '""',
    'rtype': ''
};
ai2_findconnections = {
    'desc': "finds all BNV connections from the player's location",
    'args': '"[distance:int | ]"',
    'rtype': ''
};
ai2_printbnvindex = {
    'desc': "prints the index of the player's BNV",
    'args': '""',
    'rtype': ''
};
ai2_chump = {
    'desc': "creates a chump",
    'args': '""',
    'rtype': ''
};
ai2_pathdebugsquare = {
    'desc': "selects a path square in the player's BNV for debugging",
    'args': '"x:int y:int"',
    'rtype': ''
};
ai2_debug_makesound = {
    'desc': "causes the player to make a sound (alerts nearby AIs)",
    'args': '"[sound_type:string | ] [volume:float | ]"',
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
}
trigvolume_count = {
    'desc': "counts the number of people in a trigger volume",
    'args': "trig_id:int",
    'rtype': 'int'
}
difficulty = {
    'desc': "returns the difficulty level",
    'args': 'void',
    'rtype': 'int'
}