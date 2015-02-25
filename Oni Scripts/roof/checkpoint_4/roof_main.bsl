#
# power_main.bsl
#

func void
main(
	void)
{
	env_shade 1500 1501 .9 .8 .9
	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_start=.975
	gs_farclipplane_set 900
	start
	if (my_save_point eq 0)
	{
		fork intro	
	}
	env_show 31 0
	env_show 41 0
}
