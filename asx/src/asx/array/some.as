package asx.array
{
	/**
	 * Check if some items in an Array-like Object matches the given predicate 
	 * Function. Shortcuts on the first matching item.
	 * 
	 * @param iterable
	 * @param predicate <code>function(item:Object):Boolean</code>
	 * @return <code>true</code> if every item matched the predicate, or
	 * 		   <code>false</code> otherwise.
	 */
	public function some(iterable:Object, predicate:Function):Boolean {
		for each (var item:Object in iterable)
			if (predicate(item))
				return true;
		
		return false;
	}
}
