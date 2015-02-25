#
# power_main.bsl
#

var int inroom=0;
var int in_blue=0;
var int my_save_point=0;
var int blue_striker=1;

func void main(void)
{
	obj_create 81 82
	env_shade 777 777 .4 .4 .4
	env_show 778 0
	gl_fog_blue=.15
	gl_fog_red=.15
	gl_fog_green=.15
	gl_fog_start=.99
	gs_farclipplane_set 2500
	start
	if (my_save_point eq 0)
	{
		fork intro
	}
}

