###################################building 1
func void rain1(string ai_name)
{
	dprint b1r1of3
	particle b01_rain1 start
	particle b01_rain2 stop
}
func void rain2(string ai_name)
{
	dprint b1r2of3
	particle b01_rain1 stop
	particle b01_rain2 start
	particle b01_rain3 stop
}
func void rain3(string ai_name)
{
	dprint b1r3of3
	particle b01_rain2 stop
	particle b01_rain3 start
	particle b02_rain1 stop
}
###################################building 2
func void rain4(string ai_name)
{
	dprint b2r1of2
	particle b01_rain3 stop
	particle b02_rain1 start
	particle b02_rain2 stop
}
func void rain5(string ai_name)
{
	dprint b2r2of2
	particle b02_rain1 stop
	particle b02_rain2 start
	particle b03_rain1 stop
}
###################################building 3
func void rain6(string ai_name)
{
	dprint b3r1of3
	particle b02_rain2 stop
	particle b03_rain1 start
	particle b03_rain2 stop
}
func void rain7(string ai_name)
{
	dprint b3r2of3
	particle b03_rain1 stop
	particle b03_rain2 start
	particle b03_rain3 stop
}
func void rain8(string ai_name)
{
	dprint b3r3of3
	particle b02_rain2 stop
	particle b03_rain3 start
	particle b03_rain1 stop
}
###################################building 4/6
func void rain9(string ai_name)
{
	dprint b4r1of6
	particle b03_rain3 stop
	particle b04_rain1 start
	particle b04_rain2 stop
}
func void rain10(string ai_name)
{
	dprint b4r2of6
	particle b04_rain1 stop
	particle b04_rain2 start
	particle b04_rain3 stop
}
func void rain11(string ai_name)
{
	dprint b4r3of6
	particle b04_rain2 stop
	particle b04_rain3 start
	particle b04_rain4 stop
}
func void rain12(string ai_name)
{
	dprint b4r4of6
	particle b04_rain3 stop
	particle b04_rain4 start
	particle b04_rain5 stop
}
func void rain13(string ai_name)
{
	dprint b4r5of6
	particle b04_rain4 stop
	particle b04_rain5 start
	particle b04_rain6 stop
}
func void rain14(string ai_name)
{
	dprint b4r6of6
	particle b04_rain5 stop
	particle b04_rain6 start
	particle b06_rain1 stop
}
###################################building 6/6
func void rain15(string ai_name)
{
	dprint b6r1of6
	particle b04_rain6 stop
	particle b06_rain1 start
	particle b06_rain2 stop
}
func void rain16(string ai_name)
{
	dprint b6r2of6
	particle b06_rain1 stop
	particle b06_rain2 start
	particle b06_rain3 stop
}
func void rain17(string ai_name)
{
	dprint b6r3of6
	particle b06_rain2 stop
	particle b06_rain3 start
	particle b06_rain4 stop
}
func void rain18(string ai_name)
{
	dprint b6r4of6
	particle b06_rain3 stop
	particle b06_rain4 start
	particle b06_rain5 stop
}
func void rain19(string ai_name)
{
	dprint b6r5of6
	particle b06_rain4 stop
	particle b06_rain5 start
	particle b06_rain6 stop
}
func void rain20(string ai_name)
{
	dprint b6r6of6
	particle b06_rain5 stop
	particle b06_rain6 start
	particle b06_rain5 stop
}
func void rain21(string ai_name)
{
	dprint b6_off
	particle b06_rain6 stop
}
################# kill lower clouds ###########
func void cloudkiller(string ai_name)
{
	dprint makingLowCloudsDie
	particle b01a die
	particle b01b die
	particle b01c die
	particle b01d die
	particle b01e die
	particle b01f die
	particle b01g die
	particle b01h die
	particle b01i die
	particle b01j die
	particle b01k die
	particle b01l die
	particle b01m die
	particle b01n die
	particle b01o die
	particle b01p die
	particle b01q die
	particle b01r die
	particle b01s die
	particle b01t die
	particle b01u die
	particle b01v die
	particle b01w die
	particle b01x die
	particle b01y die
	particle b01z die
	particle b02a die
	particle b02b die
	particle b02c die
	particle b02d die
	particle b02e die
	particle b02f die
	particle b02g die
	particle b02h die
	particle b02i die
	particle b02j die
	particle b02k die
	particle b02l die
	particle b02m die
	particle b02n die
	particle b02o die
	particle b02p die
	particle b02q die
	particle b02r die
	particle b02s die
	particle b02t die
	particle b02u die
	particle b02v die
	particle b02w die
	particle b02x die
	particle b02y die
	particle b02z die
	particle b03a die
	particle b03b die
	particle b03c die
	particle b03d die
	particle b03e die
	particle b03f die
	particle b03g die
	particle b03h die
	particle b03i die
	particle b03j die
	particle b03k die
	particle b03l die
	particle b03m die
	particle b03n die
	particle b03o die
	particle b03p die
	particle b03q die
	particle b03r die
	particle b03s die
	particle b03t die
	particle b03u die
	particle b03v die
	particle b03w die
	particle b03x die
	particle b03y die
	particle b03z die
	particle b04a die
	particle b04b die
	particle b04c die
	particle b04d die
	particle b04e die
	particle b04f die
	particle b04g die
	particle b04h die
	particle b04i die
	particle b04j die
	particle b04k die
	particle b04l die
	particle b04m die
	particle b04n die
	particle b04o die
	particle b04p die
	particle b04q die
	particle b04r die
	particle b04s die
	particle b04t die
	particle b04u die
	particle b04v die
	particle b04w die
	particle b04x die
	particle b04y die
	particle b04z die
}
###################################lightningFlashes	
func void b01(string ai_name)
{
	dprint Building01_flash
	particle b01a start
	sleep f9
	particle b01a start
	sleep f9
	particle b01a start
	sleep f9
	particle b01b start
	sleep f9
	particle b01b start
	sleep f9
	particle b01b start
	sleep f9
	particle b01c start
	sleep f9
	particle b01c start
	sleep f9
	particle b01c start
	sleep f9
	particle b01d start
	sleep f9
	particle b01d start
	sleep f9
	particle b01d start
	sleep f9
	particle b01d start
	sleep f9

}
func void b02(string ai_name)
{
	dprint Building02_flash
	particle b02a start
	sleep f2
	particle b02a start
	sleep f3
	particle b02a start
	sleep f3
	particle b02a start
	sleep f5
	particle b02b start
	sleep f5
	particle b02b start
	sleep f6
	particle b02b start
	sleep f6
	particle b02b start
	sleep f6
	particle b02c start
	sleep f5
	particle b02d start
	sleep f5
	particle b02d start
	sleep f4
	particle b02e start
	sleep f4
	particle b02e start
	sleep f4
	particle b02f start
	sleep f3
	particle b02f start
	sleep f3
	particle b02f start
	sleep f5
	particle b02g start
	sleep f5
	particle b02h start
	sleep f4
	particle b02i start
	sleep f4
	particle b02j start
	sleep f6
	particle b02j start
	sleep f6
	particle b02k start
	sleep f7
	particle b02k start
	sleep f6
	particle b02l start
	sleep f5
	particle b02m start
	sleep f4
	particle b02m start
	sleep f3
	particle b02m start
	sleep f5
	particle b02n start
	sleep f6
	particle b02n start
}
func void b03a(string ai_name)
{
	dprint Building03_flash
	particle b03a start
	sleep f5
	particle b03b start
	sleep f5
	particle b03a start
	sleep f5
	particle b03b start
	sleep f5
	particle b03b start
	sleep f5
	particle b03c start
	sleep f5
	particle b03c start
	sleep f5
	particle b03c start
	sleep f5
	particle b03d start
	sleep f5
	particle b03d start
	sleep f5
	particle b03d start
	sleep f5
	particle b03d start
	sleep f5
	particle b03e start
	sleep f5
	particle b03e start
	sleep f5
	particle b03f start
	sleep f5
	particle b03f start
	sleep f5
	particle b03f start
	sleep f5
	particle b03g start
	sleep f5
	particle b03g start
	sleep f5
	particle b03g start
	sleep f5
	particle b03g start
	sleep f5
	particle b03g start
	sleep f5
	particle b03h start
	sleep f5
	particle b03h start
	sleep f5
}
func void b03b(string ai_name)
{
	dprint Building03_flash
	particle b03i start
	sleep f5
	particle b03i start
	sleep f5
	particle b03j start
	sleep f5
	particle b03j start
	sleep f5
	particle b03i start
	sleep f5
	particle b03k start
	sleep f5
	particle b03k start
	sleep f5
	particle b03k start
	sleep f5
	particle b03l start
	sleep f5
	particle b03l start
	sleep f5
	particle b03m start
	sleep f5
	particle b03n start
	sleep f5
	particle b03o start
	sleep f5
	particle b03n start
	sleep f5
	particle b03m start
	sleep f5
	particle b03l start
	sleep f5
	particle b03l start
	sleep f5
	particle b03l start
	sleep f5
	particle b03k start
	sleep f5
	particle b03k start
	sleep f5
	particle b03j start
	sleep f5
	particle b03i start
	sleep f5
	particle b03i start
	sleep f5
	particle b03h start
	sleep f5
}

func void l1(string ai_name)
{
	dprint Flash
	particle c01 start
	sleep f9
	particle c01 start
	sleep f9
	particle c01 start
	sleep f9
	particle c02 start
	sleep f9
	particle c02 start
	sleep f7
	particle c03 start
	particle c04 start
	sleep f7
	particle c04 start
	sleep f7
	particle c04 start
	sleep f7
	particle c02 start
	sleep f7
	particle c02 start
	sleep f7
	particle c01 start
	particle c05 start
}
func void l2(string ai_name)
{
	dprint Flash
	particle c06 start
	sleep f7
	particle c07 start
	sleep f7
	particle c08 start
	sleep f7
	particle c09 start
	sleep f7
	particle c10 start
	sleep f7
	particle c11 start
	sleep f7
	particle c12 start
	sleep f7
	particle c11 start
	sleep f7
	particle c10 start
	sleep f7
	particle c09 start
	sleep f7
	particle c08 start
	sleep f7
	particle c07 start
	sleep f7

}
######################################
### NINJA CLOUD COVER START SCRIPT ###
######################################
func void storm(string ai_name)
{
	dprint Starting_Storm
	particle storm create
	particle wind start
}
