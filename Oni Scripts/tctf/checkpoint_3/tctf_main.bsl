#
# tctf_main.bsl
#

func void
main(
	void)
{	

	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_start=.995
	gs_farclipplane_set 5000
	env_show 601 0
	env_show 602 0	
	env_show 321 0
	env_show 322 0
	env_show 323 0
	env_show 324 0
	env_show 325 0			
	start
	if (my_save_point eq 0)
	{
		Cut01
	}
}
	
