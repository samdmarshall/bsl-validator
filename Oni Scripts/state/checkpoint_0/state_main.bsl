#
# state_main.bsl
#
var int my_save_point;

func void main(void)
{

	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_start=.99
	gs_farclipplane_set 3000	

	my_save_point = save_point;

	level_start

	if (my_save_point eq 0)
	{
		particle lock99_locklight01 do start
		music_script_start();
		state_cs_intro
	}
}