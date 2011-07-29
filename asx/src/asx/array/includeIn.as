package asx.array {
	
	/** 
	 * Adds an item to an Array if it is not already in it. 
	 * 
	 * @param target 
	 * @param itemToAdd
	 * @return modified Array
	 */
	public function includeIn(target:Array, itemToAdd:*):Array {
		var result:Array = target.slice();
		if (result.indexOf(itemToAdd) == -1) {
			result[result.length] = itemToAdd;
		}
		return result;
	}
}