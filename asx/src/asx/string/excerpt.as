package asx.string
{
	/**
	 * Extracts an excerpt from a string, using characters surrounding a specified phrase.
	 */
	public function excerpt( 
		string:String, phrase:String, radius:int = 100, excerpt:String = '...'
		/*, dontCutWords:Boolean = false*/ 
		):String
	{
		if( !string || !phrase ) return '';
		
		var index:int = string.toLowerCase().indexOf( phrase.toLowerCase() );
		
		if( index == -1 ) return string;
		
		var start:int = Math.max( index - Math.min( index, radius ), 0 );
		var end:int = Math.min( index + phrase.length + radius, string.length );
		
		/*
		if( dontCutWords )
		{
			// move start end end positions closer to the phrase index
			var whiteSpaceRE:RegExp = /\s/;	
		}
		*/
		
		var prefix:String = start > 0 ? excerpt : '';
		var suffix:String = end < string.length ? excerpt : '';
		
		return prefix + string.slice( start, end ) + suffix;
	}
}