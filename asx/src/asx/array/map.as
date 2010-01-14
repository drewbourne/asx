package asx.array
{
	/**
	 * 
	 */
	public function map(iterable:Object, transformer:Function):Array {
		var result:Array = [];
		
		for each (var item:Object in iterable)
			result[result.length] = transformer(item);
		
		return result;
	}
}