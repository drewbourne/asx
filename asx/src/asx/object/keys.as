package asx.object
{
	/**
	 * Returns the iterable keys from an Object. 
	 * 
	 * @param object Object to extract keys from.
	 * @returns Array of keys, empty Array if no values.
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	trace(keys({ one: 1, two: 2, three: 3 });
	 * 	// one two three
	 * </listing>
	 */
	public function keys(object:Object):Array
	{
		var result:Array = [];

		for (var key:* in object) 
		{
			result[result.length] = key;
		}

		return result;
	}
}