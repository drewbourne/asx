package asx.string
{
	/**
	 * Replaces tokens in the formatString with the value from the data for that token.
	 *
	 * Unreplaced tokens will be left as is.
	 *
	 * @param formatString String in which to replace tokens
	 * @param data Object containing values to replace tokens with.
	 * @param pattern Tokenization RegExp
	 *
	 * @example
	 * <listing version="3.0">
	 *  var baseURL:String = "http://{host}/{resource}.{format}"
	 *  var url:String = replaceTokens(baseURL, { host: "example.org", resource: "example", format: "json" });
	 *	// url = "http://example.org/example.json"
	 * </listing>
	 */
	public function replaceTokens(formatString:String, data:Object, pattern:RegExp = null):String
	{
		return formatString.replace(pattern || DEFAULT_TOKEN_PATTERN, data is Function ? data as Function : function(... rest):String
			{
				return (data && data.hasOwnProperty(rest[1])) ? data[rest[1]] : rest[0];
			});
	}
}

internal var DEFAULT_TOKEN_PATTERN:RegExp = /{([^\s{}]+)}/g;