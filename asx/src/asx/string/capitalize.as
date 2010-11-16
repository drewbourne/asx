package asx.string {  
   
	/**
	 * Convert the first character to uppercase and the remainder to lowercase. 
	 * 
	 * @see #titleCase() 
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	capitalize("all lowercase"); // All lowercase
	 * 	capitalize("WAS UPPERCASE"); // Was uppercase
	 * 	capitalize("WAs MixED"); 	 // Was mixed 
	 * </listing>
	 * 
	 * @author drewbourne 
	 */
	public function capitalize(value:String):String {
		return value.charAt(0).toUpperCase() 
			+ value.substr(1).toLowerCase();
	}
}
