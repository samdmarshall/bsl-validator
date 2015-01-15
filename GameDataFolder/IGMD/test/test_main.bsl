func void main {
	sleep 30
	dmsg "hello world";
	
	var int test = 1
	test = 10
	
	
	var int foo =  5;
	foo = chr_has_lsi(0);
	
	var int has_lsi = chr_has_lsi(1);
	
	chr_has_lsi(1);
	
	if (my_save_point eq 0) 
	{
		dmsg "foo";
	}
	else 
	{
		dmsg "bar";
	}
	
	sleep 40
}
