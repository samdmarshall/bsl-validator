#
# neuro_main.bsl
#

func void
main(void)
{
	gl_fog_blue=.15
	gl_fog_red=.15
	gl_fog_green=.15
	gl_fog_start=.985
	gs_farclipplane_set 4000
		obj_create 401 409
		env_anim 401 409
		obj_create 71 74
	level_start

	if (save_point eq 0)
	{
		neuro_cs_intro
		save_game 1 autosave
	}
}