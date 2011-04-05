package asx.number
{
	/**
	 * Generate a random Number between the min and max Numbers.
	 * 
	 * @param minimum
	 * @param maximum
	 * @returns Number
	 * 
	 * @example
	 * <listing version="3.0">
	 * 
	 * 	var n:Number = randomNumber(1.1, 3.5);
	 * 
	 * </listing>  
	 */
	public function randomNumber(minimum:Number, maximum:Number):Number
	{
		return minimum + (Math.random() * maximum);
	}
}