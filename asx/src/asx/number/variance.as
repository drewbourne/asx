package asx.number
{
	// todo: add formula description
	/**
	 * The variance of sample data
	 *
	 * @param numbers An Array of Number
	 * @return The variance
	 */
	public function variance( numbers:Array ):Number
	{
		if( numbers.length < 2 ) return 0;
		return summedSquaredMeanDeviation( numbers ) / (numbers.length - 1);
	}
}