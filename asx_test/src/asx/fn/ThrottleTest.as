package asx.fn
{
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	import flash.utils.Timer;

	import org.flexunit.async.Async;
	import org.flexunit.assertThat;
	import org.hamcrest.core.allOf;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.number.greaterThan;
	import org.hamcrest.number.lessThan;

	public class ThrottleTest
	{
		[Test(async)]
		public function invokes_the_original_function_at_most_once_within_the_given_window_of_time():void 
		{
			var start:int = getTimer();
			var invoked:int = 0;
			var throttled:Function = throttle(function():void { invoked++; }, 200);

			var timer:Timer = new Timer(40, 6);
			timer.addEventListener(TimerEvent.TIMER, function(event:TimerEvent):void { throttled(); });

			Async.handleEvent(this, timer, TimerEvent.TIMER_COMPLETE, function(event:TimerEvent, unused:Object):void {
				assertThat("should be delayed", getTimer() - start, allOf(greaterThan(240), lessThan(280)));
				assertThat("should be invoked twice within the window of time", invoked, equalTo(2));
			});

			timer.start();
		}	
	}
}