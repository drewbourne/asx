package asx.array {

	/**
	 * Determines if an Array-like Object contains a value.
	 *
	 * @param iterable Array-like Object to search for the given value
	 * @return true if the iterable contains the value, false otherwise.
	 * 
	 * @see asx.array#contains_()
	 * @see asx.array#excludes()
	 * @see asx.array#excludes_()
	 * 
	 * @example
	 *  <listing version="3.0">
	 *  var foods:Array = [bread", "toast", "waffles"];
	 *  var toast:String = "toast";
	 *
	 *  if (contains(foods, toast)) {
	 *    eat(foods);
	 *  }
	 *  </listing>
	 */
	public function contains(iterable:Object, value:Object):Boolean {
	  if (iterable is Array)
	    return iterable.indexOf(value) > -1;
	  
		for each (var item:Object in iterable)
			if (item == value)
				return true;

		return false;
	}
}
