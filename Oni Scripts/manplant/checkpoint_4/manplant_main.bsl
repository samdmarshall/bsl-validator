#
# CZ_main.bsl
#

var int my_save_point;
var int brain_counter_var=0;
var int striker_counter=2;
var int backup1a_counter=1;
var int backup1b_counter=1;
var int mus_cool4_playing=0;
var int alarm_counter;

func void main(void)
{
	env_show 555 0
	#obj_create 1101 1111
	obj_create 1201 1208
	#env_anim 1101 1111
	env_anim 1201 1208
	gl_fog_blue=.15
	gl_fog_red=.15
	gl_fog_green=.15
	gl_fog_start=.98
	gs_farclipplane_set 5000
	func_start
	if (my_save_point eq 0)
	{
	intro
	}
}