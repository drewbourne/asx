package asx.array {

	/**
	 * Search for an item in an Array. Shortcuts on the first matching item.
	 *
	 * Useful as none of the AS3 Array methods provide this functionality, nor do they shortcut.
	 *
	 * @param array Array of items to search in
	 * @param iterator function matching: <code>function(item:Object, i:int, a:Array):Boolean</code> indicating if the item matches.
	 * @return First matching item or null
	 * @example
	 * <listing version="3.0">
	 *  var values:Array = [0, 1, 2, 3, 4, 5];
	 *  var value:Object = detect(values, function(item:Object, i:int, a:Array):Boolean {
	 *    return value > 3;
	 *  });
	 *  assertThat(value, equalTo(4));
	 * </listing>
	 */
	public function detect(iterable:Object, iterator:Function):Object {
		for each (var item:Object in iterable)
			if (iterator(item))
				return item;

		return null;
	}
}
