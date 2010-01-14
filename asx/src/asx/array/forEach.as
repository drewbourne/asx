package asx.array
{
	/**
	 * Calls the iterator function on each element of the Array-like iterable Object.
	 * 
	 * @param iterable
	 * @param iterator
	 * @returns iterable 
	 */
	public function forEach(iterable:Object, iterator:Function):Object {
		for each (var item:Object in iterable)
			iterator(item);
		return iterable;
	}
}