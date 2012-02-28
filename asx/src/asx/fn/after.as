package asx.fn
{
	/**
	 * Calls a <code>Function</code> then passes the original arguments and result to another <code>Function</code>.
	 *
	 * @param callingThis Function
	 * @param passArgsAndResultTo <code>function(args:Array, result:*):*</code>
	 * @result Function <code>function(...args):*</code>
	 */
	function after(callingThis:Function, passArgsAndResultTo:Function):Function
	{
		return function(...args):*
		{
			var result:* = callingThis.apply(null, args);
			var modified:* = passArgsAndResultTo(args, result);
			return modified === undefined ? result : modified;
		}
	}	
}
