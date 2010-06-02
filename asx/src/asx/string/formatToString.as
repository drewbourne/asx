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
		return substitute(
		  (!fields || fields.length == 0) ? "[{}]" :"[{} {}]", 
		  type, 
		  (fields || []).map(partial(formatToStringField, object, _)).join(" "));
	}
}

import asx.string.substitute;
import asx.array.map;	

/**
 * Format a field for use with formatToString
 */
internal function formatToStringField(object:Object, field:String):String
{
	var value:Object = object[field];
	
	value = formatValue(value);
	
	return substitute("{}={}", field, value);
}

internal function formatValue(value:Object):String 
{
	var result:String = String(value);
	
	if (value is String)
	{
		result = '"' + value + '"';
	}
	
	if (value is Array)
	{
		result = '[' + map(value as Array, formatValue).join(', ') + ']'; 
	}
	
	return result;
}
