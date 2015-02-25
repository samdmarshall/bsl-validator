#
# warehouse_main.bsl
#

var int my_save_point;

func void main(void)
{
	save_point=4 # added for tests
	env_show 2010 0
	gl_fog_blue=.15
	gl_fog_red=.15
	gl_fog_green=.15
	gl_fog_start=.99
	gs_farclipplane_set 5000
	obj_create 20 20
	level_start

}