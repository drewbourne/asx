package asx.number
{
	// todo: add formula description
	/**
	 * Calculate the Standard Error of an Array of Number
	 *
	 * @param numbers An Array of Number
	 * @return The Standard Error for the numbers
	 */
	public function se( numbers:Array ):Number
	{
		if( numbers.length < 2 ) return 0;
		return sd( numbers ) / Math.sqrt( numbers.length );
	}
}