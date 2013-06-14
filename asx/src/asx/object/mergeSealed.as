package asx.object
{
	/**
	 * @author ptaylor
	 */
	public function mergeSealed(target:Object, ...sources):* 
	{
		for each (var source:* in sources)
		{
			for (var field:String in source) 
			{
				if(target.hasOwnProperty(field) && !(target[field] is Function)) {
					target[field] = source[field];
				}
			}
		}
		
		return target;
	}
}