package asx.string
{
	/**
	 *
	 */
	public function extractTokens(value:String, pattern:RegExp = null):Array
	{
		var tokens:Array = [];
		
		// FIXME profile to see if this is the fastest way to do this.
		value.replace(pattern || DEFAULT_TOKEN_PATTERN, function(... rest):String
			{
				tokens.push(rest[1]);
				return rest[0];
			});
		
		return tokens;
	}
}

internal var DEFAULT_TOKEN_PATTERN:RegExp = /{([^}]+)}/g;