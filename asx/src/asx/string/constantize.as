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
	 * 
	 * 	var urlRequestName:String = "URLRequest";
	 * 	trace(constantize(urlRequestName)); // Traces 'URL_REQUEST' to the console
	 * </listing>
	 * 
	 * @see asx.string.camelize()
	 * 
	 * @author nrobson
	 * @author drewbourne
	 */
	public function constantize(value:String):String
	{
		return value.replace(/([A-Z]+)?([A-Z]{1})/g, function():String {
			return arguments[1] + "_" + arguments[2];
		}).toUpperCase();
	}
}