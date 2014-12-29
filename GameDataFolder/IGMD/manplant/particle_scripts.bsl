#partice scripts
#alex okita
#turns on and off particles for rooms
####################################
##             brain1		    ##
####################################
func void brain1_on(string ai_name)
{
	dprint begin_evil_particles
	particle brain1 do start
}
func void brain1_off(string ai_name)
{
	dprint stop_the_evil
	particle brain1 do stop
}