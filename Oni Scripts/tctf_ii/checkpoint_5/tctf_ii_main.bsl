#
# tctf_ii_main.bsl
#

func void main(void)
{
	env_shade 321 325 .3 .3 .3
	gl_fog_blue=0
	gl_fog_red=0
	gl_fog_green=0
	gl_fog_start=.995
	gs_farclipplane_set 5000
	#hide trigger for Base
	trig_hide 9
	#Hide Chair Gunk
	env_show 171 0
	env_show 172 0
	env_show 173 0
	env_show 174 0

##### THEESE TRIGGERS ARE FOR ZOMBIE SHINATAMA ############

	trig_hide 91
	trig_hide 92
	trig_hide 93
	trig_hide 94

	trig_hide 910

	trig_hide 10

	trig_hide 210
	trig_hide 2101
	trig_hide 214

	trig_hide 310
	trig_hide 3101
	trig_hide 314

	trig_hide 410
	trig_hide 4101
	trig_hide 414

	trig_hide 510
	trig_hide 5101
	trig_hide 514
	
	start
}
