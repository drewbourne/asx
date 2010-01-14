package asx.array {
	
	/**
	 * Selects all the items from an Array-like Object where the predicate Function
	 * returns <code>true</code>.
	 * 
	 * @param iterable
	 * @param predicate <code>function(item:Object):Boolean</code>
	 * @returns Array  
	 */
	public function select(iterable:Object, predicate:Function):Array {
		var result:Array = [];
		
		for each (var item:Object in iterable)
			if (predicate(item))
				result[result.length] = item;
				
		return result;
	}
}