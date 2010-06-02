package asx.number
{
	// todo: add formula description
	/**
	 * The mid point of the population, at which 50% is below and 50% is above
	 * 
	 * @param numbers An Array of Number
	 * @return The median
	 */
	public function median( numbers:Array ):Number
	{
		if( numbers.length == 0 ) return 0;
		var nums:Array = numbers.slice(0, numbers.length).sort();
		var mid:Number = Math.floor( nums.length / 2 );
		if( (nums.length % 2) == 0 )
		{
			return (nums[ mid - 1 ] + nums[ mid ]) / 2;
		}
		else
		{
			return nums[ mid ];
		}
	}
}