package asx.fn 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
 	 * Creates and returns a new debounced version of the passed function that 
 	 * will postpone its execution until after wait milliseconds have elapsed 
 	 * since the last time it was invoked.
 	 *
 	 * @param fn
 	 * @param millisecondsToWait
 	 */
	public function debounce(fn:Function, millisecondsToWait:Number):Function
	{
		var timer:Timer = new Timer(millisecondsToWait, 1);
		var listener:Function;

		return function(...args):void {
			if (listener !== null) {
				timer.removeEventListener(TimerEvent.TIMER_COMPLETE, listener);
			}

			listener = function(event:TimerEvent):void {
				fn.apply(null, args);
			}

			timer.addEventListener(TimerEvent.TIMER_COMPLETE, listener);
			timer.reset();
			timer.start();
		};
	}
}