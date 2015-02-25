#
# tctf_door_lock_lights.bsl
#
# SCRIPTS TO CHANGE THE LOCKED LIGHTS ON DOORS
#
# GREEN TO RED: do stop
# RED TO GREEN: do start

func void floor4_lock(void)
{
	music_stop
	input 0
	fade_out 0 0 0 30
	cm_interpolate floor4_lock 0
	fade_in 30
	sleep 60
	particle floor4_lock_locklight01 do start
	sleep 90
	fade_out 0 0 0 30
	cm_reset
	fade_in 30
	input 1
	target_set(60,30.0)
	sound_dialog_play_block c00_01_28shinatama
}

func void shin_lock(void)
{
	particle shin_lock_locklight01 do start
	particle roof_locklight01 do start
}