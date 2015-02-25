#
# airport_main.bsl
#

var int my_save_point;

func void main(void)
{
	save_point=0 # added for test
	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_start=.995
	gs_farclipplane_set 4000
	env_show 10 0
	env_show 11 0
	env_show 12 0
#	fork airport_cs_intro();
	func_start
	if (my_save_point eq 0)
	{
	airport_cs_intro
	}
}