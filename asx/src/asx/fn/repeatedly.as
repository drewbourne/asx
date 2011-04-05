package asx.fn
{
	/**
	 * Repeatedly calls a function the given number of times, returns the collected result of each call.
	 * 
	 * @param repeatCount Number of times to call the function
	 * @param fn Function to call
	 * @returns Array of return value from calling the function.   
	 * 
	 * @example
	 * <listing version="3.0">
	 * 
	 * 	var xs:Array = repeatedly(4, function(a:int, b:int):Object { return a + b; }, [3, 1]);
	 * 
	 * </listing>
	 */
	public function repeatedly(repeatCount:int, fn:Function, args:Array = null):Array
	{
		var result:Array = [];
		while (repeatCount-- > 0) 
		{
			result[result.length] = fn.apply(null, args);
		}
		return result; 
	}
}