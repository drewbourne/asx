package asx.number
{
	// todo: add formula description
	/** 
	 * Calculate the mean or average of an Array of Number
	 *
	 * @param numbers An Array of Number
	 * @return The mean
	 */
	public function mean( numbers:Array ):Number
	{
		if( numbers.length == 0 ) return 0;
		return sum( numbers ) / numbers.length;
	}
}