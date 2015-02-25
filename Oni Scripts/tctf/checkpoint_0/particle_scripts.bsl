#partice scripts
#alex okita
#turns on and off particles for rooms

#room1
func void room1_start(string ai_name)
{
	dprint room1_start
	particle room1 start
	particle smoke start
}
func void room1_stop(string ai_name)
{
	dprint room1_stop
	particle room1 stop
}
#room2
func void room2_start(string ai_name)
{
	dprint room2_start
	particle room2 start
}
func void room2_stop(string ai_name)
{
	dprint room2_stop
	particle room2 stop
}

#room3
func void room3_start(string ai_name)
{
	dprint room3_start
	particle room3 start
}
func void room3_stop(string ai_name)
{
	dprint room3_stop
	particle room3 stop
}

#room4
func void room4_start(string ai_name)
{
	dprint room4_start
	particle room4 start
}
func void room4_stop(string ai_name)
{
	dprint room4_stop
	particle room4 stop
}

#room5
func void room5_start(string ai_name)
{
	dprint room5_start
	particle room5 start
}
func void room5_stop(string ai_name)
{
	dprint room5_stop
	particle room5 stop
}

#room4
func void room6_start(string ai_name)
{
	dprint room6_start
	particle room6 start
}
func void room6_stop(string ai_name)
{
	dprint room6_stop
	particle room6 stop
}

#room7
func void room7_start(string ai_name)
{
	dprint room7_start
	particle room7 start
}
func void room7_stop(string ai_name)
{
	dprint room7_stop
	particle room7 stop
}

#room8
func void room8_start(string ai_name)
{
	dprint room8_start
	particle room8 start
}
func void room8_stop(string ai_name)
{
	dprint room8_stop
	particle room8 stop
	particle smoke stop
}

func void fire_damage(string ai_name)
{	
	dprint fire_hurt_konoko
	chr_poison (ai_name, 5, 30, 30);
}

