package asx.string
{
	
	/**
	 *
	 */
	public function substitute(formatString:String, ... replacements):String
	{
		
		// when called as substitute(String, Array)
		if (replacements.length == 1 && replacements[0] is Array)
		{
			replacements = replacements[0];
		}
		
		var autofillIndex:int = 0;
		
		// replace {} or {\d} except when a backslash is before the first {, eg "\\{}"
		// note well the escaped slash in the string
		var pattern:RegExp = /(?<!\\){(\d*)}/g;
		
		// do the replacement
		var result:String = formatString.replace(pattern, function(... matchData):String
			{
				// when the pattern finds an index, use the replacement at that index
				// when the pattern does not find an index, increment the autofill index, and use the replacement at that index
				var index:int = !empty(String(matchData[1])) ? int(matchData[1]) : autofillIndex++;
				
				// when no replacement is at the index in the replacements, use an empty string.
				return replacements[index] || "";
			});
		
		// kill backslashes in the output, why?!
		// return result.replace(/\\/, '');
		
		return result;
	}
}