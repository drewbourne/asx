package asx.fn
{
	import flash.utils.getTimer;

	/**
	 * Creates a new function that when invoked repeatedly will only call the 
	 * original function at most once within every <code>millisecondsToWait</code>. 
	 * 
	 * @param fn Function to throttle
	 * @param millisecondsToWait Milliseconds to wait.
	 */
	public function throttle(fn:Function, millisecondsToWait:Number):Function
	{
		var lastTime:int = 0;
		return function(...args):void {
			var thisTime:int = getTimer();
			if ((thisTime - lastTime) > millisecondsToWait) {
				fn.apply(null, args);
				lastTime = thisTime;
			}
		};
	}
}