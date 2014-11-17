ai2_showpaths = {
    'desc': "shows the path each AI is following",
    'type': 'bool'
};
ai2_showgrids = {
    'desc': "turns on pathfinding grid rendering",
    'type': 'bool'
};
ai2_showdynamicgrids = {
    'desc': "turns on pathfinding dynamic grid display",
    'type': 'bool'
};
ai2_showpathfindingerrors = {
    'desc': "enables visual display of pathfinding errors",
    'type': 'bool'
};
ai2_showconnections = {
    'desc': "turns on pathfinding connection rendering",
    'type': 'bool'
};
ai2_showactivationpaths = {
    'desc': "turns on inactive -> active pathfinding rendering",
    'type': 'bool'
};
ai2_showastar = {
    'desc': "shows grid squares that are evaluated by the A* pathfinding",
    'type': 'bool'
};
ai2_showcombatranges = {
    'desc': "shows circles that represent the combat ranges of each AI",
    'type': 'bool'
};
ai2_showvision = {
    'desc': "shows each AI's vision cones (central and peripheral)",
    'type': 'bool'
};
ai2_showprediction = {
    'desc': "shows prediction info for AI2 characters",
    'type': 'bool'
};
ai2_showtargeting = {
    'desc': "shows targeting info for AI2 characters",
    'type': 'bool'
};
ai2_showlasers = {
    'desc': "turns on laser sights for AI2 characters",
    'type': 'bool'
};
ai2_showlos = {
    'desc': "shows AI line-of-sight checking",
    'type': 'bool'
};
ai2_showprojectiles = {
    'desc': "shows AI projectile knowledge",
    'type': 'bool'
};
ai2_showfiringspreads = {
    'desc': "shows AI firing spread knowledge",
    'type': 'bool'
};
ai2_showlocalmelee = {
    'desc': "shows local-environment melee awareness",
    'type': 'bool'
};
ai2_showfights = {
    'desc': "shows fights in progress",
    'type': 'bool'
};
ai2_shownames = {
    'desc': "draws the name of every AI above their head",
    'type': 'bool'
};
ai2_showhealth = {
    'desc': "draws a health bar for every AI above their head",
    'type': 'bool'
};
ai2_showjoblocations = {
    'desc': "draws a green cross at each AI's job location",
    'type': 'bool'
};
ai2_showlinetochar = {
    'desc': "draws a line from the player to every AI",
    'type': 'bool'
};
ai2_showsounds = {
    'desc': "shows AI sounds as they are generated",
    'type': 'bool'
};
ai2_printspawn = {
    'desc': "prints information about each AI spawn",
    'type': 'bool'
};
ai2_blind = {
    'desc': "turns off the AI's visual sensing system",
    'type': 'bool'
};
ai2_deaf = {
    'desc': "turns off the AI's sound sensing system",
    'type': 'bool'
};
ai2_ignore_player = {
    'desc': "makes all AI ignore the player",
    'type': 'bool'
};
ai2_chump_stop = {
    'desc': "stops the chump",
    'type': 'bool'
};
ai2_stopignoring_count = {
    'desc': "set the number of events before the AI will stop ignoring",
    'type': 'int'
};
ai2_stopignoring_time = {
    'desc': "set the delay timer before the AI forgets about ignored events,&AI2gSound_StopIgnoring_Time",
    'type': 'int'
};
ai2_melee_weightcorrection = {
    'desc': "weights down non-attack techniques so they are never more than attacks, &AI2gMeleeWeightCorrection",
    'type': 'bool'
};
ai2_spacing_enable = {
    'desc': "master enable switch for spacing behavior",
    'type': 'bool'
};
ai2_spacing_cookies = {
    'desc': "number of cookies per fight",
    'type': 'int'
};
ai2_spacing_weights = {
    'desc': "enables position-sensitive weighting of spacing behaviors",
    'type': 'bool'
};
ai2_barabbas_run = {
    'desc': "lets Barabbas run while carrying his gun",
    'type': 'bool'
};
ai2_boss_battle = {
    'desc': "enables AI boss-battle target selection",
    'type': 'bool'
};
ai2_showintersections = {
    'desc': "debug AI's melee intersections",
    'type': 'bool'
};
ai2_debug_localmovement = {
    'desc': "debug local-movement code from player's position",
    'type': 'bool'
};
ai2_debug_localpathfinding = {
    'desc': "debug local-path code from player's position and facing",
    'type': 'bool'
};
ai2_debug_localmove_lines = {
    'desc': "number of lines to cast to debug local-movement code",
    'type': 'int'
};
ai2_debug_showsettingIDs = {
    'desc': "shows ID numbers for combat, melee and neutral settings",
    'type': 'bool'
};
spatial_footsteps = {
    'desc': "spatial footsteps",
    'type': 'bool'
};
chr_disable_visactive = {
    'desc': "disable visibility activation",
    'type': 'bool'
};
chr_all_active = {
    'desc': "forces all characters to be active",
    'type': 'bool'
};
chr_debug_footsteps = {
    'desc': "footstep debugging mode",
    'type': 'bool'
};
chr_debug_footsteps_verbose = {
    'desc': "verbose footstep debugging mode",
    'type': 'bool'
};
footstep_flash = {
    'desc': "footstep flash mode",
    'type': 'bool'
};
door_drawframes = {
    'desc': "draws doorframes for all unplaced doors",
    'type': 'bool'
};
debug_triggers = {
    'desc': "enable trigger volume debugging",
    'type': 'bool'
};
debug_scripts = {
    'desc': "enable script debugging",
    'type': 'bool'
};
debug_gun_behavior = {
    'desc': "enable AI gun behavior debugging",
    'type': 'bool'
};
chr_weapon_auto_aim = {
    'desc': "enables auto aiming",
    'type': 'bool'
};
saved_film_loop = {
    'desc': "saved_film_loop",
    'type': 'bool'
};
chr_debug_pathfinding = {
    'desc': "control pathfinding debugging",
    'type': 'bool'
};
chr_debug_fall = {
    'desc': "controls debugging falling",
    'type': 'bool'
};
debug_impacts = {
    'desc': "prints impacts as they occur",
    'type': 'bool'
};
chr_collision_box = {
    'desc': "toggles character bounding box / bounding sphere collision",
    'type': 'bool'
};
chr_debug_trigger_quad = {
    'desc': "controls trigger quad debugging",
    'type': 'bool'
};
chr_draw_weapon = {
    'desc': "controls drawing of weapons",
    'type': 'bool'
};
chr_pin_character = {
    'desc': "pins a character to the ground",
    'type': 'bool'
};
chr_draw_all_characters = {
    'desc': "forces the drawing of all characters",
    'type': 'bool'
};
chr_mini_me = {
    'desc': "Draws the main character small",
    'type': 'bool'
};
show_chr_env_collision = {
    'desc': "Draws character / environment collisions.",
    'type': 'bool'
};
show_laser_env_collision = {
    'desc': "Draws laser / environment collisions.",
    'type': 'bool'
};
chr_corpse_fade_offscreen = {
    'desc': "Makes corpses fade when they are offscreen.",
    'type': 'bool'
};
gs_show_shadows = {
    'desc': "Enables character shadows",
    'type': 'bool'
};
chr_debug_impacts = {
    'desc': "Prints debugging info about character melee impacts",
    'type': 'bool'
};
chr_debug_aiming_screen = {
    'desc': "turns on aiming screen debugging",
    'type': 'bool'
};
chr_enable_collision = {
    'desc': "Enables character collision",
    'type': 'bool'
};
chr_active = {
    'desc': "Enables character activity",
    'type': 'bool'
};
chr_draw_facing_vector = {
    'desc': "Enables drawing of the facing vector",
    'type': 'bool'
};
chr_draw_aiming_vector = {
    'desc': "Enables drawing of the aiming vector",
    'type': 'bool'
};
chr_debug_characters = {
    'desc': "Enables debugging information for characters",
    'type': 'bool'
};
chr_debug_overlay = {
    'desc': "Enables debugging information for overlays",
    'type': 'bool'
};
chr_debug_sphere = {
    'desc': "Enables sphere tree debugging for characters",
    'type': 'bool'
};
chr_print_sound = {
    'desc': "Turns on printing of the sound effect",
    'type': 'bool'
};
chr_debug_collision = {
    'desc': "Turns on/off debugging of collision",
    'type': 'bool'
};
chr_disable_melee = {
    'desc': "Turns off all melee damage",
    'type': 'bool'
};
wp_force_scale = {
    'desc': "",
    'type': 'bool'
};
wp_force_half_scale = {
    'desc': "",
    'type': 'bool'
};
wp_force_no_scale = {
    'desc': "",
    'type': 'bool'
};
gs_show_corpses = {
    'desc': "",
    'type': 'bool'
};
chr_show_weaponid = {
    'desc': "Shows weapon ID",
    'type': 'bool'
};
marketing_line_off = {
    'desc': "turns the laser line off",
    'type': 'bool'
};
chr_big_head = {
    'desc': "Draws everyone with a big head",
    'type': 'bool'
};
saved_film_character_offset = {
    'desc': "saved_film_character_offset",
    'type': 'int'
};
chr_death_fade_start = {
    'desc': "the number of game ticks until charaters begin to fade",
    'type': 'int'
};
chr_death_fade_frames = {
    'desc': "the number of game ticks until charaters fade over",
    'type': 'int'
};
chr_lod = {
    'desc': "forces a given lod if it is between 0 and 4",
    'type': 'int'
};
chr_show_movement = {
    'desc': "Enables movement debugging information for characters",
    'type': 'int'
};
chr_debug_target = {
    'desc': "Selects the character debugging target",
    'type': 'int'
};
cm_lookspring_percent = {
    'desc': "at what percent of lookspring fight mode turns off",
    'type': 'float'
};
chr_collision_grow = {
    'desc': "sets character bounding box collision grow amount",
    'type': 'float'
};
chr_block_angle = {
    'desc': "controls the angle at which the characters can block",
    'type': 'float'
};
chr_aim_width = {
    'desc': "number of degress of aiming width",
    'type': 'float'
};
chr_auto_aim_arc = {
    'desc': "number of degress of auto aiming arc",
    'type': 'float'
};
chr_auto_aim_dist = {
    'desc': "distance for auto aiming",
    'type': 'float'
};
chr_big_head_amount = {
    'desc': "Controls the size of the big head",
    'type': 'float'
};
chr_mini_me_amount = {
    'desc': "Controls the size of the main character",
    'type': 'float'
};
wp_scale_adjustment = {
    'desc': "Controls the size of the main character",
    'type': 'float'
};
wp_pow_adjustment = {
    'desc': "Controls the size of the main character",
    'type': 'float'
};
gs_show_particles = {
    'desc': "Turns on the drawing of particles",
    'type': 'bool'
};
gs_show_sky = {
    'desc': "Turns on the sky",
    'type': 'bool'
};
gs_show_characters = {
    'desc': "Turns on the drawing of characters",
    'type': 'bool'
};
gs_show_objects = {
    'desc': "Turns on the drawing of objects",
    'type': 'bool'
};
gs_show_ui = {
    'desc': "Turns on the ui",
    'type': 'bool'
};
chr_debug_handle = {
    'desc': "turns no debugging for the handle code",
    'type': 'bool'
};
gs_stable_ear = {
    'desc': "makes the ear stable",
    'type': 'bool'
};
env_show_quad_count = {
    'desc': "shows the count of visable environment quads",
    'type': 'bool'
};
gs_show_object_count = {
    'desc': "shows the count of objects",
    'type': 'bool'
};
gs_show_physics_count = {
    'desc': "shows the count of physics",
    'type': 'bool'
};
gs_show_scripting_count = {
    'desc': "shows the count of active scripting contexts",
    'type': 'bool'
};
single_step = {
    'desc': "puts the game in single step mode",
    'type': 'bool'
};
wait_for_key = {
    'desc': "makes the game wait for a key before level load",
    'type': 'bool'
};
draw_every_frame = {
    'desc': "forces drawing of every frame",
    'type': 'bool'
};
fast_mode = {
    'desc': "makes the game run fast",
    'type': 'bool'
};
show_performance = {
    'desc': "Enables performance display",
    'type': 'bool'
};
show_performance_gsd = {
    'desc': "Enables performance display",
    'type': 'bool'
};
show_performance_gsu = {
    'desc': "Enables performance display",
    'type': 'bool'
};
gs_sleep = {
    'desc': "Turns on a call to sleep to make debugging easier",
    'type': 'bool'
};
gs_show_environment = {
    'desc': "Turns on doing the environment",
    'type': 'bool'
};
ob_show_debug = {
    'desc': "enable physics debugging visuals",
    'type': 'bool'
};
debug_consoles = {
    'desc': "prints debugging information about console usage",
    'type': 'bool'
};
debug_font_cache = {
    'desc': "displays font cache texture",
    'type': 'bool'
};
fast_lookup = {
    'desc': "enables fast lookup",
    'type': 'bool'
};
sync_debug = {
    'desc': "enables sync debugging",
    'type': 'bool'
};
show_triggervolumes = {
    'desc': "Display trigger volumes",
    'type': 'bool'
};
invincible = {
    'desc': "makes player invincible",
    'type': 'bool'
};
omnipotent = {
    'desc': "makes player omnipotent",
    'type': 'bool'
};
unstoppable = {
    'desc': "makes player unstoppable",
    'type': 'bool'
};
gs_input_accel = {
    'desc': "Use this to control the input sensitivity",
    'type': 'float'
};
gs_screen_shot_reduce = {
    'desc': "2^n amount of reduction",
    'type': 'int'
};
chr_buffer_size = {
    'desc': "0 = normal buffer",
    'type': 'int'
};
draw_every_frame_multiple = {
    'desc': "draw every frame multiple",
    'type': 'int'
};
save_point = {
    'desc': "which save point we are on",
    'type': 'int'
};