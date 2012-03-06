package asx.object
{
	/**
	 * Clears all the items from an Array, or keys from an Object or Dictionary, returning the given object. 
	 * 
	 * @param object Array, Object or Dictionary to clear;
	 */
	public function clear(object:Object):* 
	{
		if (object is Array)
		{
			var array:Array = object as Array;
			array.splice(0, array.length);
		}
		else
		{
			for (var key:* in object)
			{
				delete object[key];
			}
		}

		return object;
	}
}