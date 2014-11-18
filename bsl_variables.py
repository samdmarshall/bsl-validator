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
am_hit_everything = {
    'desc': "makes the laser pointer hit all objects",
    'type': 'bool'
};
am_invert = {
    'desc': "inverts the aiming",
    'type': 'bool'
};
am_show_axes = {
    'desc': "shows world axes",
    'type': 'bool'
};
am_show_closest = {
    'desc': "dumps the closest GQ index to console",
    'type': 'bool'
};
am_show_filenames = {
    'desc': "dumps the closest GQ index file/obj name to console",
    'type': 'bool'
};
am_show_texturename = {
    'desc': "Shows Texture name",
    'type': 'bool'
};
character_name_distance = {
    'desc': "Specifies the distance from the camera that character names no longer draw.",
    'type': 'float'
};
show_characters = {
    'desc': "Enables the display of character starting positions",
    'type': 'bool'
};
chr_show_bnv = {
    'desc': "shows the bnv of the main character",
    'type': 'bool'
};
chr_show_lod = {
    'desc': "shows the current lod of the main character",
    'type': 'bool'
};
cinematic_xoffset = {
    'desc': "Offset from the vertical edge of the screen for the cinematic insert.",
    'type': 'float'
};
cinematic_yoffset = {
    'desc': "Offset from the horizontal edge of the screen for the cinematic insert.",
    'type': 'float'
};
cm_canter_unarmed = {
    'desc': "camera canter",
    'type': 'float'
};
cm_canter_weapon = {
    'desc': "camera canter",
    'type': 'float'
};
cm_distance = {
    'desc': "camera distance",
    'type': 'float'
};
cm_height = {
    'desc': "camera height",
    'type': 'float'
};
cm_jello_radius = {
    'desc': "bla bla",
    'type': 'float'
};
cm_jello_amt = {
    'desc': "bla bla",
    'type': 'float'
};
cm_plane_test = {
    'desc': "jello camera plane test",
    'type': 'bool'
};
co_display = {
    'desc': "enables console display",
    'type': 'bool'
};
co_message_display = {
    'desc': "enables text message display",
    'type': 'bool'
};
co_fade_time = {
    'desc': "The fade time of the console",
    'type': 'int'
};
co_priority = {
    'desc': "changes the priority of messages to display on the console",
    'type': 'int'
};
debug_weapons = {
    'desc': "prints debugging info about weapon particle events",
    'type': 'bool'
};
wp_kickable = {
    'desc': "lets the player kick weapons",
    'type': 'bool'
};
recoil_edit = {
    'desc': "enables editable recoil",
    'type': 'bool'
};
recoil_base = {
    'desc': 'base',
    'type': 'float'
};
recoil_max = {
    'desc': 'max',
    'type': 'float'
};
recoil_factor = {
    'desc': 'factor',
    'type': 'float'
};
recoil_return_speed = {
    'desc': 'return speed',
    'type': 'float'
};
wp_hypostrength = {
    'desc': "Sets strength of hypo spray",
    'type': 'int'
};
wp_fadetime = {
    'desc': "Sets free time for powerups",
    'type': 'int'
};
wp_disable_fade = {
    'desc': "Disables weapon fading",
    'type': 'bool'
};
target_max_distance = {
    'desc': "Sets the distance at which the radar will start to change from its minimum.",
    'type': 'float'
};
ui_suppress_prompt = {
    'desc': "Suppresses UI prompting about new objectives or moves.",
    'type': 'bool'
};
door_show_debug = {
    'desc': "Shows debug geometry",
    'type': 'bool'
};
door_ignore_locks = {
    'desc': "Disables all door locks",
    'type': 'bool'
};
door_show_activation = {
    'desc': "Draws a circle where door activates",
    'type': 'bool'
};
door_pop_lighting = {
    'desc': "uses bad door lighting",
    'type': 'bool'
};
env_show_stairflagged = {
    'desc': "Show specially flagged noncollision quads",
    'type': 'bool'
};
env_show_rays = {
    'desc': "Draw the rays",
    'type': 'bool'
};
env_drawallgqs = {
    'desc': "Draw all the GQs",
    'type': 'bool'
};
env_drawvisonly = {
    'desc': "Draw only the GQs used for visibility",
    'type': 'bool'
};
env_collision = {
    'desc': "Enables environment collision",
    'type': 'bool'
};
env_drawfrustum = {
    'desc': "Draw the frustum around the environment camera",
    'type': 'bool'
};
env_show_octtree = {
    'desc': "Enables display of environment octtree traversal",
    'type': 'bool'
};
env_show_leafnodes = {
    'desc': "Enables display of environment octtree leaf nodes",
    'type': 'bool'
};
env_show_octnode_gqs = {
    'desc': "When true the environment only renders triangles in the octnode that contains the manual camera",
    'type': 'bool'
};
env_show_ghostgqs = {
    'desc': "When true show ghost GQs",
    'type': 'bool'
};
env_highlight_gq = {
    'desc': "highlights a particular gq",
    'type': 'int'
};
env_ray_number = {
    'desc': "sets the number of rays to cast",
    'type': 'int'
};
flag_name_distance = {
    'desc': "Specifies the distance from the camera that flag names no longer draw.",
    'type': 'float'
};
flag_new_id = {
    'desc': "Specifies the id for a new flag",
    'type': 'int'
};
show_flags = {
    'desc': "Enables the display of flags",
    'type': 'bool'
};
fx_laser_width = {
    'desc': "",
    'type': 'float'
};
gl_fog_end = {
    'desc': "fog end",
    'type': 'float'
};
gl_fog_start = {
    'desc': "fog start",
    'type': 'float'
};
gl_fog_red = {
    'desc': "fog red",
    'type': 'float'
};
gl_fog_green = {
    'desc': "fog green",
    'type': 'float'
};
gl_fog_blue = {
    'desc': "fog blue",
    'type': 'float'
};
gl_disable_depth_reads = {
    'desc': "disable_depth_reads",
    'type': 'bool'
};
gl_disable_packed_pixels = {
    'desc': "lets you disable packed-pixels support",
    'type': 'bool'
};
gl_disable_dxt1 = {
    'desc': "lets you disable use of DXT1",
    'type': 'bool'
};
gl_mipmap_offset = {
    'desc': "lets you disable miplevels (-ve = disable big, +ve = disable small)",
    'type': 'int'
};
gl_fog_disabled = {
    'desc': 'fog disabled',
    'type': 'bool'
};
laser_alpha = {
    'desc': "Enables the display of triggers",
    'type': 'bool'
};
show_triggers = {
    'desc': "Enables the display of triggers",
    'type': 'bool'
};
li_center_cursor = {
    'desc': "Should we center the cursor",
    'type': 'bool'
};
m3_clear_color = {
    'desc': "color to clear the back buffer to",
    'type': 'int'
};
m3_shade_vertex = {
    'desc': "Enables vertex interpolation for the triangle",
    'type': 'bool'
};
m3_fill_solid = {
    'desc': "Toggles wireframe vs filled triangles",
    'type': 'bool'
};
m3_texture = {
    'desc': "Toggles texture mapping or gouraud",
    'type': 'bool'
};
m3_zcompareon = {
    'desc': "true if zcompare is on",
    'type': 'bool'
};
m3_double_buffer = {
    'desc': "Toggles double buffer mode",
    'type': 'bool'
};
m3_buffer_clear = {
    'desc': "Toggles buffer clear",
    'type': 'bool'
};
p3_show_env_collision = {
    'desc': "Draws particle / environment collisions.",
    'type': 'bool'
};
p3_glass_breakable = {
    'desc': "Enables breakable glass.",
    'type': 'bool'
};
p3_everything_breakable = {
    'desc': "Makes every quad breakable.",
    'type': 'bool'
};
p3_furniture_breakable = {
    'desc': "Makes all furniture breakable.",
    'type': 'bool'
};
p3_debug_collision = {
    'desc': "Enables collision debugging display",
    'type': 'int'
};
patrolpath_name_distance = {
    'desc': "Specifies the distance from the camera that patrol point names no longer draw.",
    'type': 'float'
};
ph_debug_keyforces = {
    'desc': "Toggle keyboard applied forces",
    'type': 'bool'
};
ph_active = {
    'desc': "enable physics",
    'type': 'bool'
};
ph_show_collisions = {
    'desc': "toggle display of colliding quads",
    'type': 'bool'
};
sc_bind_f2 = {
    'desc': "binds f2 to a specific animation",
    'type': 'string'
};
sc_bind_f3 = {
    'desc': "binds f3 to a specific animation",
    'type': 'string'
};
show_sound_all = {
    'desc': "Sound rings will always be drawn, not just when a sound is selected.",
    'type': 'bool'
};
show_sound_spheres = {
    'desc': "Sound spheres will always be drawn, not just when a sound sphere is selected.",
    'type': 'bool'
};
show_sound_rectangles = {
    'desc': "Sound rectangles will always be drawn, not just when a sound Rectangle is selected.",
    'type': 'bool'
};
show_patrolpaths = {
    'desc': "Enables the display of AI patrol path objects",
    'type': 'bool'
};
show_turrets = {
    'desc': "Enables the display of turrets",
    'type': 'bool'
};
turret_show_debug = {
    'desc': "Enables the display of turret debug lines",
    'type': 'bool'
};
sky_show_sky = {
    'desc': "Toggles display of the sky",
    'type': 'bool'
};
sky_show_clouds = {
    'desc': "Toggles display of the clouds",
    'type': 'bool'
};
sky_show_skybox = {
    'desc': "Toggles display of the skybox",
    'type': 'bool'
};
sky_show_stars = {
    'desc': "Toggles display of the stars",
    'type': 'bool'
};
sky_show_planet = {
    'desc': "Toggles display of the planet (sun/moon)",
    'type': 'bool'
};
sky_height = {
    'desc': 'sky height',
    'type': 'float'
};
sound_show_occlusions = {
    'desc': "enables debugging display of sound occlusions",
    'type': 'bool'
};
sound_show_debug = {
    'desc': "Displays sound debugging info",
    'type': 'bool'
};