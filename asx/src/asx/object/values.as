package asx.object
{
	/**
	 * Returns the iterable values from an Object. 
	 * 
	 * @param object Object to extract values from.
	 * @returns Array of values, empty Array if no values.
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	trace(values({ one: 1, two: 2, three: 3 });
	 * 	// 1 2 3
	 * </listing>
	 */
	public function values(object:Object):Array
	{
		var result:Array = [];

		for each (var value:* in object) 
		{
			result[result.length] = value;
		}

		return result;
	}
}