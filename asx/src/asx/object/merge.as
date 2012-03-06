package asx.object 
{
	/**
	 * Merge enumerable fields from sources -> target, returns target.
	 *  
	 * @param target Target Object to populate with keys and values.
	 * @param ...source Source objects to retrieve keys and values from.
	 * @return target
	 */
	public function merge(target:Object, ...sources):* 
	{
		for each (var source:* in sources)
		{
			for (var field:String in source) 
			{
				target[field] = source[field];
			}
		}
		
		return target;
	} 
}
