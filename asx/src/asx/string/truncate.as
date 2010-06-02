package asx.string
{
	/**
	 * Truncate a string to a specified length and append a suffix to it. 
	 */
	public function truncate( 
		string:String, length:int = -1, suffix:String = '...', 
		removeLastSpace:Boolean = true, 
		dontCutLastWord:Boolean = false 
		):String
	{
		// bail out early if we dont have to modify the string
		if( length == -1 || string.length < length ) return string;

		// get the initial slice of the string
		var truncated:String = string.slice( 0, length - suffix.length );
		
		// is cutting the last word ok?
		if( dontCutLastWord )
		{
			var truncatedLength:int = truncated.length;
			var whiteSpaceRE:RegExp = /\s/
			while( truncatedLength > 0 && !truncated.charAt( truncatedLength ).match( whiteSpaceRE ) )
			{
				truncatedLength--;
			}
			
			// fixme: seems odd that i need to do a +1 here, however it makes the tests pass
			truncated = string.slice( 0, truncatedLength + 1 );
		}

		// should we remove any trailing spaces before returning the string?
		if( removeLastSpace )
		{
			truncated = truncated.replace( /\s+$/, '' );
		}
		
		return truncated + suffix;
	}
}
