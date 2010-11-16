package asx.string
{
	/**
	 * Checks if the given String is <code>null</code> or contains only whitespace characters.
	 * 
	 * Whitespace characters are: 
	 * space <code>" "</code>, 
	 * tab <code>"\t"</code>,
	 * linefeed <code>"\n"</code>, 
	 * carriage-return <code>"\r"</code>. 
	 * 
	 * @example
	 * <listing version="3.0">
	 * 	if (isEmptyString(potentiallyEmptyString)) {
	 *  	// do something with the string
	 * 	} 
	 * </listing>
	 * 
	 * @author drewbourne 
	 */
	public function isEmptyString(value:String):Boolean {
		return !value || value.match(/^[\s]+$/);
	}
}