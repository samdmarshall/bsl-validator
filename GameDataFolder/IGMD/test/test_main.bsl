func void 
testing(int a) 
{
	dmsg "hello from testing"
	return;
}

func int foobar(int a) {
	return 0
	dmsg "asfdsdfas";
}

func int error_test (int a) {
	dmsg "this should be ok"
	return 5;
}

var int my_save_point = 0;

func void main2 {
	sleep 20
	
	dmsg "test"
	
	testing(6)
	
	dmsg "hi"
	
}

func void main {
	
	sleep 30
	dmsg "hello world";
	
	var int test = 1
	test = 10
	
	if (my_save_point eq 0) 
	{
		dmsg "a";
		dmsg "b"
	}
	else 
	{
		dmsg "c";
		dmsg "d"
	}
	
	if (test eq 10 and my_save_point eq 0) {
		dmsg "valid operations!"
	}
	else 
	{
		dmsg "invalid operations!"
	}
	
	var int foo =  5;
	foo = chr_has_lsi(0);
	
	var int has_lsi = chr_has_lsi(1);
	
	chr_has_lsi(1);
	
	if (my_save_point eq 0) 
	{
		dmsg "foo";
		dmsg "hello"
	}
	else 
	{
		dmsg "bar";
		dmsg "world"
	}
	
	if (chr_has_lsi() eq 0) 
	{
		dmsg "it works!";
	}
	
	if (test eq 10)
	{
		dmsg "is this broken?"
	}
	
	sleep 40
	
	fork testing 6
	
	iterate over test using b {
		dmsg "hi";
	}
	
	sleep 20
	
	main2
	
	schedule error_test(5) at 500

	#schedule error_test(8) repeat every 100

}