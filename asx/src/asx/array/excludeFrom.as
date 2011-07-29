package asx.array {
	
	/**
	 * Removes matching items from an Array.
	 * 
	 * @param target
	 * @param itemToRemove
	 * @return modified Array
	 */
	public function excludeFrom(target:Array, itemToRemove:*):Array {
		var result:Array = target.slice();
		var index:int = -1;
		while ((index = result.indexOf(itemToRemove)) !== -1) {
			result.splice(index, 1);
		}
		return result;
	}
}