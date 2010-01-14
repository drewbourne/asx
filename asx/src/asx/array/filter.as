package asx.array
{
	/**
	 * Alias of <code>select()</code>
	 * 
	 * @see asx.array#select()
	 */
	public function filter(iterable:Object, predicate:Function):Array {
		return select(iterable, predicate);
	}
}