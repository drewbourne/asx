package asx.array
{
	/**
	 * Returns the last item in an Array-like Object.
	 * 
	 * @param iterable
	 * @returns Last Object or <code>null</code>
	 */
	public function last(iterable:Object):Object {
	  var n:int = length(iterable);
	  return (n > 0) ? iterable[n - 1] : null;
	}
}
