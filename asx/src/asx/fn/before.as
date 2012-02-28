package asx.fn
{
	/**
	 * Calls a <code>Function</code> before calling another <code>Function</code> allowing the arguments to be modified.
	 *
	 * @param callingThis Function
	 * @param passArgsTo <code>function(args:Array):*</code>
	 * @result Function <code>function(...args):*</code>
	 */
	function before(callingThis:Function, passArgsTo:Function):Function
	{
		return function(...args):* 
		{
			var modified:Array = passArgsTo(args);
			var result:* = callingThis.apply(null, modified === undefined ? args : modified);
			return result;
		}
	}
}