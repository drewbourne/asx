package asx.array
{
	/**
	 *  
	 */
	public function inGroupsOf(iterable:Object, size:int):Array
	{
	  var i:int = 0;
	  var group:Array = [];
		var groups:Array = [group];

		for each (var item:Object in iterable)
		{
		  group[group.length] = item;
		  i++;
		  
			if (i == size)
			{
			  i = 0;
				group = [];
				groups[groups.length] = group;
			}
		}
			
		return groups;
	}
}