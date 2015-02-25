#
# anim_scripts.bsl
#

func void patrolscript0001 (string ai_name)
{
	playback_block Pod1_TCL_1 alarm1 interp 20
}
func void patrolscript0002 (string ai_name)
{
	playback_block Pod1_TCL_2 alarm2 interp 20
}
func void patrolscript0003 (string ai_name)
{
	playback_block Pod2_TCL_1 pod2alarm1 interp 20
}
func void patrolscript0004 (string ai_name)
{
	playback_block Pod2_TCL_2 pod2alarm2 interp 20
}


func void patrolscript0009 (string ai_name)
{
	particle lock99_locklight01 do start
	door_unlock 11
	sleep 540
	particle lock99_locklight01 do stop
	door_lock 11
}
func void patrolscript0010 (string ai_name)
{
	particle lock99_locklight01 do start
	door_unlock 11
# WAIT AND RELOCK DOORS
	sleep 540
	particle lock99_locklight01 do stop
	door_lock 11
}
