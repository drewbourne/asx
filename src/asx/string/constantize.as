package asx.string
{
	/**
	 * Converts a camelCased word into an AS3_OR_JAVA_CONSTANT by inserting
	 * an underscore infront of each uppercase letter except the first then 
	 * converting all to uppercase.
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	var myValue:String = "aCamelCasedString";
	 * 	trace(constantize(myValue)); 		// Traces 'A_CAMEL_CASED_STRING' to the console
	 * 	
	 * 	var myOtherValue:String = "ACapitalizedMonstrosity";
	 * 	trace(constantize(myOtherValye));	// Traces 'A_CAPITALIZED_MONSTROSITY' to the console
	 * </listing>
	 * 
	 * @see asx.string.camelize
	 * 
	 * @author nrobson
	 */
	public function constantize(value:String):String
	{
		return (value.charAt(0) + value.substring(1).replace(/([A-Z])/g, "_$1")).toUpperCase();
	}
}