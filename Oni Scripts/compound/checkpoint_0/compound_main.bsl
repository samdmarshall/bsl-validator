#
# compound_main.bsl
#

func void
main(
	void)
{
	save_point=0 # added for test
	env_shade 912 913 .4 .4 .4
	env_show 911 0
	env_show 914 0
	env_show 915 0
	env_show 916 0
	input	1	
	#hide animation Truck Gunk
	env_show 151 0
	env_show 152 0
	env_show 153 0
	env_show 154 0
	env_show 155 0
	env_show 156 0
	env_show 157 0
	env_show 158 0
	env_show 159 0
	env_show 251 0
	env_show 252 0
	env_show 253 0
	env_show 254 0
	env_show 255 0
	env_show 256 0
	env_show 257 0
	env_show 258 0
	env_show 259 0
	#Hide dish2 gunk
	env_show 401 0
	env_show 402 0
	env_show 403 0
	env_show 404 0
	env_show 405 0
	env_show 406 0
	env_show 407 0
	env_show 408 0
	env_show 409 0

	my_save_point = save_point;

	start

	if (my_save_point eq 0)
	{
		gl_fog_blue=0.0
		gl_fog_red=0.0
		gl_fog_green=0.0
		gl_fog_start=.985
		intro
		gs_farclipplane_set 1000
	}

	gl_fog_blue=0.0
	gl_fog_red=0.0
	gl_fog_green=0.0
	gl_fog_start=.985
	gs_farclipplane_set 1000
}
