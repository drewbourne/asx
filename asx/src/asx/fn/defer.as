package asx.fn 
{
	import flash.utils.setTimeout;

	/**
	 * Defers invoking the function to the next execution cycle.
	 * 
	 * @example 
	 * <listing version="3.0">
	 * 	defer(function():void { ... });
	 * </listing>
	 */
	public function defer(fn:Function):void 
	{
		setTimeout(fn, 0);
	}
}