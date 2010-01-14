package asx.array {

	/**
	 * Determines if an Array-like Object excludes a value.
	 *
	 * @param iterable Array-like Object to search for the given value
	 * @return true if the iterable excludes the value, false otherwise.
	 * 
	 * @see asx.array#contains() 
	 * @see asx.array#contains_()
	 * @see asx.array#excludes_()
	 * 
	 * @example
	 *  <listing version="3.0">
	 *  var foods:Array = [bread", "toast", "waffles"];
	 *  var toast:String = "toast";
	 *
	 *  if (excludes(foods, toast)) {
	 *    eat(foods);
	 *  }
	 *  </listing>
	 */
	public function excludes(iterable:Object, value:Object):Boolean {
		for each (var item:Object in iterable)
			if (item == value)
				return false;

		return true;
	}
}
