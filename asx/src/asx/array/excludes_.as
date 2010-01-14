package asx.array
{
	import asx.fn.partial;
	
	/**
	 * <code>excludes()</code> as a predicate Function.
	 * 
	 * @param iterable Array-like Object or <code>_</code>
	 * @param item Object to search for or <code>_</code>
	 * @return Function
	 * 
	 * @see asx.array#excludes()
	 * @see asx.fn#_
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	var values:Array = [1, 2, 3];
	 * 	var others:Array = [2, 3, 4];
	 * 	var selected:Array = select(values, excludes_(otherValues));
	 * 	// [1]
	 * </listing>
	 */
	public function excludes_(iterable:*, ...rest):Function {
		return partial(excludes, iterable, rest[0]);
	}
}
