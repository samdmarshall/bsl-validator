#
# lab_main.bsl
#


var int my_save_point;

func void main(void)
{
	trigvolume_enable save_1_trig 0
	env_show 776 0
	env_show 777 0
	gl_fog_blue=.15
	gl_fog_red=.30
	gl_fog_green=.17
	gl_fog_start=.99
	gs_farclipplane_set 5000

	obj_create 2 7

	my_save_point = save_point;

	level_start

	if (my_save_point eq 0)
	{
		trigvolume_enable outside_left 0
		trigvolume_enable outside_right 0
		trigvolume_enable outside_back 0

		intro
	}
}

func void chase1(void)
{
}


