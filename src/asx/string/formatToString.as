package asx.string
{
	import asx.fn._;
	import asx.fn.partial;
	
	/**
	 * Returns a formattted string for use with toString().
	 *
	 * @example
	 * <listing version="3.0">
	 *  // in Example.as
	 *  public function toString():String
	 *  {
	 *      return formatToString(this, "Example", ["id", "greeting", "departing"]);
	 *  }
	 *
	 *  // in use
	 *  assertThat(example.toString(), equalTo("[Example id=1 greeting=HELLO departing=GOODBYE]"));
	 * </listing>
	 */
	public function formatToString(object:Object, type:String, fields:Array = null):String
	{
		return substitute("[{} {}]", type, (fields || []).map(partial(formatToStringField, object, _)).join(" "));
	}
}

import asx.string.substitute;	

/**
 * Format a field for use with formatToString
 */
internal function formatToStringField(object:Object, field:String):String
{
	var value:Object = object[field];
	if (value is String)
	{
		value = '"' + value + '"';
	}
	return substitute("{}={}", field, value);
}
