package asx.array
{
	import asx.fn.aritize;
	import asx.fn.partial;
	import asx.object.newInstance;

	/**
	 *	
	 */
	public function inGroupsOf(iterable:Object, size:int):Array
	{
		if(size < 1) size = 1;
		
		const l:int = len(iterable);
		const groups:Array = map(range(Math.ceil(l / size)), aritize(partial(newInstance, Array), 0));
		
		var group:Array;
		var i:int = -1;
		
		for each(var item:Object in iterable) {
			if(++i % size == 0) {
				group = groups[i / size];
			}
			
			group[group.length] = item;
		}
		
		return groups;
	}
}