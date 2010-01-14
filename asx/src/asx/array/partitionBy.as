package asx.array
{
	/**
	 * Separates the items of an Array-like Object into separate Arrays
	 * determined by the key returned by the iterator Function.
	 * 
	 * @param iterable Array-like Object
	 * @param iterator Function <code>function(item:Object):String</code>
	 * @return Object
	 */
	public function partitionBy(iterable:Object, iterator:Function):Object {
		var partitions:Object = [];
		
		for each (var item:Object in iterable)
		{
			var key:Object = iterator(item);
			var partition:Array = partitions[key] || (partitions[key] = []);
			partition[partition.length] = item;
		}
		
		return partitions;
	}
}