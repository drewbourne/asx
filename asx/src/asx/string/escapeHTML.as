package asx.string
{
	/**
	 * Escape a String so that HTML special chars are escaped for output into HTML textfields
	 * <p>Escapes &amp;, &lt;, &gt;, &quot;, &#039.</p>
	 * 
	 * @param value The String to escape
	 * @return The escaped String
	 */
	public function escapeHTML( value:String ):String
	{
		return value.replace('&', '&amp;')
					.replace('<', '&lt;')
					.replace('>', '&gt;')
					.replace('"', '&quot;')
					.replace("'", '&#039;');
	}
}