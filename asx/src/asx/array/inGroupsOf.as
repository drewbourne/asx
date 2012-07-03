package asx.array
{
	/**
	 *
	 */
	public function inGroupsOf(iterable:Object, size:int):Array
	{
		var i:int = size;
		var group:Array;
		var groups:Array = [];
		
		for each(var item:Object in iterable)
		{
			if( i == size )
			{
				i = 0;
				group = [];
				groups[groups.length] = group;
			}
			
			group[group.length] = item;
			i++;
		}
		
		return groups;
	}
}
