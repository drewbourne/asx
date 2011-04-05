package asx.number
{
	/**
	 * Generate a random int between the minimum and maximum ints.
	 * 
	 * @param minimum
	 * @param maximum
	 * @returns int
	 * 
	 * @example
	 * <listing version="3.0">
	 * 
	 * 	var n:int = randomInt(1, 3);
	 * 
	 * </listing>  
	 */
	public function randomInt(minimum:int, maximum:int):int
	{
		return int(Math.floor(minimum + (Math.random() * maximum)));
	}
}