#
# power_main.bsl
#

func void
main(
	void)
{
	env_show 100 0
	env_show 101 0
	env_show 102 0
	env_show 103 0
	env_show 104 0
	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_start=.99
	gs_farclipplane_set 3000	
	#hide elevator gunk
	env_show 802 0
	env_show 822 0

	my_save_point = save_point
	
	start

	if (my_save_point eq 0)
	{
		fork intro();
	}
}

#func void chase1(int chr_index)
#{
#}
	
