package asx.number
{
	// todo: add formula description
	/** 
	 * Calculate the Standard Deviation of an Array of Number
	 *
	 * @param numbers An Array of Number
	 * @return The Standard Deviation for the numbers
	 */
	public function sd( numbers:Array ):Number
	{
		return Math.sqrt( variance( numbers ) );
	}
}
