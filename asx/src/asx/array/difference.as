package asx.array {

	/**
	 * Find the items that are not in both arrays.
	 *
	 * @param a Array-like Object
	 * @param b Array like Object
	 * @return Array of items that were not in both Objects
	 *
	 * @see asx.array.union
	 * @see asx.array.intersection
	 *
	 * @example
	 *  <listing version="3.0">
	 *  var a:Array = [1, 2, 3, 4];
	 *  var b:Array = [3, 4, 5, 6];
	 *  var diff:Array = difference(a, b);
	 *  assertThat(diff, equalTo([1, 2, 5, 6]));
	 *  </listing>
	 */
	public function difference(a:Object, b:Object):Array {
		var result:Array = [];

		result = result.concat(select(a, excludes_(b)));
		result = result.concat(select(b, excludes_(a)));

		return result;
	}
}
