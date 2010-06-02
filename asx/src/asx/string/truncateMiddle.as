package asx.string
{
	/**
	 * Truncates a phrase from the middle, keeping the start and end of the string
	 * 
	 * @param string The String to truncate
	 * @param length The target length of the truncated length
	 * @param suffix The string to use where the truncation occurs
	 * @param dontCutWords True to truncate whole words only, false to truncate words
	 * @returns A truncated string if longer than the length, or the string unmodified if shorter than length
	 */
	public function truncateMiddle( 
		string:String, length:int = -1, suffix:String = '...', 
		dontCutWords:Boolean = false 
		):String
	{
		// bail out early if we dont have to modify the string
		if( length == -1 || string.length < length ) return string;
		
		// find the slices
		var sliceLength:Number = (length - suffix.length) / 2;
		var start:String = string.slice( 0, Math.ceil(sliceLength) );
		var end:String 	 = string.slice( string.length - Math.floor(sliceLength) );
		
		if( dontCutWords )
		{
			var whiteSpaceRE:RegExp = /\s/

			// check start
			var startLength:int = start.length;

			while( startLength > 0 && !start.charAt( startLength ).match( whiteSpaceRE ) )
			{
				startLength--;
			}
			
			// ignore dontCutWords if we end up with nothing in the slices
			if( startLength != 0 )
			{
				start = string.slice( 0, startLength + 1 );
			}
			
			// check end
			var endOffset:int = 0;
			var endLength:int = end.length;

			while( endOffset < endLength && !end.charAt( endOffset ).match( whiteSpaceRE ) )
			{
				endOffset++;
			}
			
			// ignore dontCutWords if we end up with nothing in the slices
			if( endOffset != endLength )
			{
				end = end.slice( endOffset );
			}
		}
		
		return start + suffix + end;
	}
}