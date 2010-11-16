package asx.string
{
	import asx.array.map;
	
	import flash.display.JointStyle;

	/**
	 * Converts a String with a word or phrase to a CamelCaseString.
	 * 
	 * Words can be separated by spaces, underscores and hyphens.
	 * 
	 * @param value String to camelize.
	 * @param lowerCaseFirstWord Indicates if the first word should be lowercase or camel cased. 
	 * 
	 * @example
	 * <listing version="3.0">
	 *	trace(camelize("I can has camel-cases"));
	 *	// ICanHasCamelCases
	 * 
	 *	trace(camelize("all your camel cases", true));	
	 *	// allYourCamelCases
	 * 
	 *	trace(camelize("all_the_hyphens_are_goners"));
	 *	// allTheHyphensAreGoners
	 * </listing>
	 * 
	 * @author drewbourne
	 */
	public function camelize(value:String, lowerCaseFirstWord:Boolean=false):String
	{
		const underscoresHyphensAndWhitespace:RegExp = /[_-\s]+/g;
		
		var camelized:String = map(
			value.split(underscoresHyphensAndWhitespace),
			capitalize)
			.join("");
			
		return lowerCaseFirstWord 
			? camelized.slice(0, 1).toLowerCase() + camelized.slice(1) 
			: camelized;
	}
}
