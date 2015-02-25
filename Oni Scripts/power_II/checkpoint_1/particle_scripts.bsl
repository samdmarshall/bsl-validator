#partice scripts
#alex okita
#turns on and off particles for rooms

####################################
##             ROOM 1             ##
####################################
func void particle_room1_start(string ai_name)
{
	dprint start_room1_particles
	particle room1 do start
}
func void particle_room1_stop(string ai_name)
{
	dprint stop_room1_particles
	particle room1 do stop
}

####################################
##             ROOM 2             ##
####################################
func void particle_room2_start(string ai_name)
{
	dprint start_room2_particles
	particle room2 do start
}
func void particle_room2_stop(string ai_name)
{
	dprint stop_room2_particles
	particle room2 do stop
}

####################################
##             ROOM 3             ##
####################################
func void particle_room3_start(string ai_name)
{
	dprint start_room3_particles
	particle room3 do start
}
func void particle_room3_stop(string ai_name)
{
	dprint stop_room3_particles
	particle room3 do stop
}

####################################
##             ROOM 4             ##
####################################
func void particle_room4_start(string ai_name)
{
	dprint start_room4_particles
	particle room4 do start
}
func void particle_room4_stop(string ai_name)
{
	dprint stop_room4_particles
	particle room4 do stop
}

####################################
##             ROOM 5             ##
####################################
func void particle_room5_start(string ai_name)
{
	dprint start_room5_particles
	particle room5 do start
}
func void particle_room5_stop(string ai_name)
{
	dprint stop_room5_particles
	particle room5 do stop
}

####################################
##           vat room             ##
####################################
func void particle_vatroom1_start(string ai_name)
{
	dprint start_vatroom1_particles
	particle vatroom1 do start
}
func void particle_vatroom1_stop(string ai_name)
{
	dprint stop_vatroom1_particles
	particle vatroom1 do stop
}

####################################
# first energy sprinkler activator #
# this one starts over the first   #
# vat.                             #
# the particle name is "zap1"      #
####################################

var int zap=1;

func void zap_start(string ai_name)
{
	dprint zap_on
	
	trigvolume_enable zap1 0

	if (zap eq 1)
	{
	particle zap1 do start
	sleep 120
	particle zap1 stop
	}
	
	if (zap eq 1)
	{
	particle zap2 start
	sleep 120
	particle zap2 stop
	}
	
	if (zap eq 1)
	{
	particle zap3 start
	sleep 120
	particle zap3 stop
	}

	# CB: this delay ensures we don't execute every frame
	sleep 60
	trigvolume_enable zap1 1
}

func void zap_timer_1(string ai_name)
{
	dprint do_zap_timer_1
	zap = 0
	timer_start 15 zap_start_again
}

func void zap_timer_2(string ai_name)
{
	dprint do_zap_timer_2
	zap = 0
	timer_start 10 zap_start_again
}

func void zap_timer_3(string ai_name)
{
	dprint do_zap_timer_3
	zap = 0
	timer_start 5 zap_start_again
}

func void zap_start_again(string ai_name)
{
	dprint zap_on_again
	zap = 1
	console_reset 4
}

# FINAL PIPE
func void pipe3_start(string ai_name)
{
	dprint pipe_started
	particle pipe3 do start
}


func void zap_kill(string ai_name)
{
	dprint zap_die
	particle zap1 kill
	particle zap2 kill
	particle zap3 kill
}

func void zap_create(string ai_name)
{
	dprint zap_live
	particle zap1 create
	particle zap2 create
	particle zap3 create
}