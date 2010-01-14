package asx.array
{
	/**
	 * Alias of <code>partitionBy()</code>
	 * 
	 * @see asx.array#partitionBy() 
	 */
	public function bucket(iterable:Object, iterator:Function):Object {
		return partitionBy(iterable, iterator);
	}
}