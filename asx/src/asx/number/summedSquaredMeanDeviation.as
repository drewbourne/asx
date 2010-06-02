package asx.number
{
	// todo: add formula description
	/**
	 * The Summed Squared Mean Deviation
	 * 
	 * @param numbers An Array of Number
	 * @return The summed squared mean deviation
	 */
	public function summedSquaredMeanDeviation( numbers:Array ):Number
	{
		if( numbers.length < 2 ) return 0;
		var m:Number = mean( numbers );
		return sum( numbers.map( function( x:Number, i:int, a:Array ):Number 
		{ 
			return Math.pow( x - m, 2 );
		}));
	}
}