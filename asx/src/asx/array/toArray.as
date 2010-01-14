package asx.array {
	
	/**
	 * Converts an Array-like Object to an Array.
	 * 
	 * @param iterable Object
	 * @returns Array
	 * 
	 * @example
	 * <listing version="3.0">
	 * </listing>
	 */
	public function toArray(iterable:Object):Array {
		var result:Array = [];
		
		for each (var item:Object in iterable)
			result[result.length] = item;
		
		return result;		
	}
}
