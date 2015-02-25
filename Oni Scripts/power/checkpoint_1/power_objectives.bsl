#
# power_objectives.bsl
#
# SCRIPTS TO SET LEVEL OBJECTIVES/HINTS
#
var int cop;
var int nocop;

func void set_objective_1(string ai_name)
{
	dprint set_objective_1
	objective_set(1)
	target_set(5007, 30.0)
}

func void copdied(string ai_name)
{
	dprint copdied
	nocop = 1
}

func void set_objective_3(string ai_name)
{
	dprint set_objective_3
	objective_set(3)
	cop = 1
}

func void target02(string ai_name)
{
	dprint target02
	input 0
	chr_invincible char_0 1


	if(trigvolume_count(28) ne 0)
	{
	cm_interpolate bluedoor 0
	sleep 60
	}
		
	if(blue01 eq 0)
	{
	cm_interpolate bluedoor 0
	sleep 60
	}

	if (blue01 eq 1)
	{
		if (trigvolume_count(28) eq 0)
		{
			ai2_passive A1_s_blue01 1
			chr_teleport A1_s_blue01 7001
			cm_interpolate bluedoor 0
			sleep 60
			ai2_passive A1_s_blue01 0
			ai2_dopath A1_s_blue01 patrol_31_bluedoor
			particle blue_locklight01 do start
			particle b2_locklight01 do start
			sleep 180
		} 
	}

	particle blue_locklight01 do start
	particle b2_locklight01 do start
	sleep 60
	cm_reset
	chr_invincible char_0 0
	input 1
	target_set(2001, 30.0)
#	ai2_spawn A1_s_red01
	ai2_spawn A1_s_red02
	trigvolume_enable trigger_volume_12 1
}

func void target03(string ai_name)
{
	dprint target03
	ai2_spawn char_1
	target_set(5007, 30.0)

}

func void target04(string ai_name)
{
	dprint target04
	target_set(108, 30.0)

}

func void target05(string ai_name)
{
	dprint target05_07_09
	ai2_spawn whiteneut
	ai2_spawn B1_s_Red01
	ai2_spawn B2_s_blue06
	target_set(133, 30.0)
	sleep 60

	music_stop
}

func void target06(string ai_name)
{
	dprint target06
	particle green_locklight01 do start
	target_set(2005, 30.0)
	sleep 120
	trigvolume_enable trigger_volume_13 1
	music_stop
}

func void target08(string ai_name)
{
	dprint target08
	particle white_locklight01 do start
	target_set(3001, 30.0)

}

func void target10(string ai_name)
{
	dprint target10
	target_set(5008, 30.0)

}

func void target11(string ai_name)
{
	dprint target02
	target_set(5009, 30.0)

}

func void target12(string ai_name)
{
	dprint target12
	target_set(119, 30.0)

}

func void target13(string ai_name)
{
	dprint target13_16_18
	target_set(128, 30.0)
}

func void target14(string ai_name)
{
	dprint target14
	particle red_locklight01 do start
	target_set(2085, 30.0)

}

func void target15(string ai_name)
{
	dprint target15
	target_set(125, 30.0)

}

func void target17(string ai_name)
{
	dprint target17
	particle yellow_locklight01 do start
	target_set(3094, 30.0)

}

func void target19(string ai_name)
{
	dprint target19
	target_set(5010, 30.0)

}

func void target20(string ai_name)
{
	dprint target20
	target_set(5006, 30.0)

}

func void unlock_bwhite(string ai_name)
{
	dprint unlock_bwhite
	particle bwhite_locklight01 do start
	s5
# checks to see if cop has already talked to konoko
	if (cop eq 0)
	{
# if not, then see if the cop is dead
		if(nocop eq 1)
		{
# if so, then go ahead and give next objective from console 4
			sleep 180
			set_objective_3
		}
	}
}

func void you_lose(string ai_name)
{
	sleep 240
	fade_out 0 0 0 180 
	sleep 240
	lose
}
func void you_win(int char_index)
{
	outro
	win
}