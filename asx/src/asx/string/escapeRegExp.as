package asx.string
{
	/**
	 * Escape RegExp special characters.
	 */
	public function escapeRegExp(value:String):String
	{
		return value.replace(REGEXP_SPECIAL_CHARACTERS_PATTERN, '\\$1');
	}
}

import asx.string.substitute;

internal const REGEXP_SPECIAL_CHARACTERS:Array = ('/.*+?|)_[]{}\\').split('');
internal const REGEXP_SPECIAL_CHARACTERS_PATTERN:RegExp = new RegExp(
	substitute('(\\\\{0})', REGEXP_SPECIAL_CHARACTERS.join('|\\\\')),
	'g');