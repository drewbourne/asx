package asx.fn
{
	import flash.events.EventDispatcher;
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	import flash.utils.Timer;

	import org.flexunit.async.Async;
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.number.greaterThan;

	public class DebounceTest
	{
		[Test(async)]
		public function invokes_the_original_function_after_debounced_function_stops_being_called_for_wait_milliseconds():void 
		{
			var dispatcher:EventDispatcher = new EventDispatcher();
			Async.proceedOnEvent(this, dispatcher, Event.COMPLETE, 1500);

			var start:int = getTimer();
			var complete:Function = function():void { 
				assertThat(getTimer() - start, greaterThan(700));
				dispatcher.dispatchEvent(new Event(Event.COMPLETE));
			};

			var timer:Timer = new Timer(50, 8);
			timer.addEventListener(TimerEvent.TIMER, debounce(complete, 300));
			timer.start();
		}
	}
}