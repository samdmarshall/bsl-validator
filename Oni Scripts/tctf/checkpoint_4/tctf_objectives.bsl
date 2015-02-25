#
# tctf_objectives.bsl
#
# SCRIPTS TO SET LEVEL OBJECTIVES/HINTS
#
func void set_objective_1(void)
{
	dprint set_objective_1
	objective_set(1)
	target_set(323,30.0)
}
func void set_objective_2(string ai_name)
{
	dprint set_objective_2
	objective_set(2)
	target_set(1111, 30.0)

}
func void set_objective_3(string ai_name)
{
	dprint set_objective_3
	objective_set(3)
	target_set(60,30.0)
}
func void set_objective_4(string ai_name)
{
	dprint set_objective_4
	if(elev_count ne 1)
	{
		trigvolume_enable trigger_volume_81 1
		objective_set(4)
		particle obj1 create
		target_set(9999, 30.0)
	}
}

func void set_objective_5(string ai_name)
{
	dprint set_objective_5
	objective_set(5)
	target_set(58,30.0)
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
	win
}

### TEXT CONSOLES ###

func void level_8a(void)
{
	dprint text_8a
	text_console level_8a
	console_reset 17
}

func void level_8b(void)
{
	dprint text_8b
	text_console level_8b
	console_reset 12
}

func void level_8c(void)
{
	dprint text_8c
	text_console level_8c
	console_reset 14
}

func void level_8d(void)
{
	dprint text_8d
	text_console level_8d
	console_reset 16
}

func void level_8e(void)
{
	dprint text_8e
	text_console level_8e
	console_reset 15
}

func void level_8f(void)
{
	dprint text_8f
	text_console level_8f
	console_reset 13
}
