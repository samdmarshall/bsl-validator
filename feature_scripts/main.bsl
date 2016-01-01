func void async() {
	sleep 5
	dmsg "hello"
}

func main() {
	fork async
	dmsg "world!"
	
	var int counter = 0
	var int a = 1
	var int b = 2
	var int c = 3
	
	if (counter eq 0) 
	{
		dmsg "counter"
		
		if (a eq  1)
		{
			dmsg "a"
			
			dmsg "testing"
		}
		
		dmsg "test"
		
		if (b eq 2) 
		{
			dmsg "b"
			
			
			dmsg "ok"
			if (c eq 3) 
			{
				dmsg "c"
			}
		}
		
		
	}
	else 
	{
		dmsg "fail"
	}
	
	a = 10
}