package asx.array {

	/**
	 * Filters an Array-like Object returning any items that do not match the predicate.
	 *
	 * @param iterable
	 * @param predicate <code>function(item:Object):Boolean</code>
	 * @returns Array
	 * @example
	 *  <listing version="3.0">
	 *  var obj:Object = { n: 4 };
	 *  var others:Array = reject([1, 2, 3, true, object], isA(Number));
	 *  assertThat(others, equalTo([true, object]));
	 *  </listing>
	 */
	public function reject(iterable:Object, predicate:Function):Array {
		var result:Array = [];
		
		for each (var item:Object in iterable)
			if (!predicate(item))
				result[result.length] = item;
				
		return result;
	}
}
