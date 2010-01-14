package asx.array
{
	import asx.fn.getProperty;
	
	import flash.utils.Dictionary;
	
	/**
	 * Converts an Array-like object to a Dictionary
	 * 
	 * @param iterable Array or Array-like Object
	 * @param key String of the field value to use as the key, or 
	 * 			  Function to return key. 
	 * @return Dictionary
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	var value:Array = [{ id: 1, value: 4 }, { id: 3, value: 5 }];
	 * 	var dict:Dictionary = toDictionary(value, 'id');
	 * 	trace(dict[1].value); // 4 
	 * 	trace(dict[3].value); // 5
	 * </listing>
	 */
	public function toDictionary(iterable:Object, key:Object):Dictionary
	{
		var dict:Dictionary = new Dictionary();
		
		var keyFn:Function 
			= key is Function 
			? key as Function
			: getProperty(String(key));
		
		for each (var item:Object in iterable)
			dict[ keyFn(item) ] = item;
			
		return dict;
	}
}