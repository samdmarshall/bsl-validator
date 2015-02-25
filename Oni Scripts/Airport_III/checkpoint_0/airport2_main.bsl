#
# airportiii_main.bsl
#

var int my_save_point;
var int lock5_counter=3;
var int hangar1d_counter=2;
var int hangar1f_counter=2;

func void main(void)
{
	save_point=0 # added for test
	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_start=.99
	gs_farclipplane_set 5000

	my_save_point = save_point;

	func_start

	if (my_save_point eq 0)
	{
		airportiii_cs_intro();
	}
}
