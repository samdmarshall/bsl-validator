#
# dream_lab_main.bsl
#

var int my_save_point=0;
var int rmusic_counter=2;
var int tanker_counter=2;
var int red_counter=1;
var int swat_counter=1;
var int end1_counter=3;
var int bighead_counter=4;

func void main(void)
{
	sound_ambient_start roomtone_softhum03 0.8

	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_start=.995
	gs_farclipplane_set 2000
	start

	if (my_save_point eq 0)
	{
		intro
	}
}

