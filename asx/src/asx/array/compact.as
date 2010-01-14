package asx.array {

	/**
	 * Removes null items from an Array-like Object.
	 *
	 * @param iterable Array-like Object iterable with for-each.
	 * @return Array without items that are == null
	 * @example
	 *  <listing version="3.0">
	 *  var values:Array = [1, 2, null, 3, null];
	 *  var compacted:Array = compact(value);
	 *  assertThat(compacted, equalTo([1, 2, 3]));
	 *  </listing>
	 */
	public function compact(iterable:Object):Array {
		var result:Array = [];

		for each (var item:Object in iterable)
			if (item != null)
				result[result.length] = item;

		return result;
	}
}
