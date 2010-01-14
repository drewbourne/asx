package asx.array
{
	/**
	 * Check if every item in an Array-like Object matches the given predicate 
	 * Function. Shortcuts on the first non-matching item.
	 * 
	 * @param iterable
	 * @param predicate <code>function(item:Object):Boolean</code>
	 * @return <code>true</code> if every item matched the predicate, or
	 * 		   <code>false</code> otherwise.
	 */
	public function every(iterable:Object, predicate:Function):Boolean {
		for each (var item:Object in iterable)
			if (!predicate(item))
				return false;
		
		return true;
	}
}