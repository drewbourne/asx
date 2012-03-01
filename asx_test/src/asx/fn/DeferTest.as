package asx.fn 
{
	import flash.events.IEventDispatcher;
	import flash.events.EventDispatcher;
	import flash.events.Event;

	import org.flexunit.async.Async;
	import org.flexunit.assertThat;
	import org.hamcrest.object.isFalse;

	public class DeferTest
	{
		[Test(async)]
		public function defer_should_execute_async():void 
		{
			var dispatcher:IEventDispatcher = new EventDispatcher();
			Async.proceedOnEvent(this, dispatcher, Event.COMPLETE, 10);

			var called:Boolean = false;

			defer(function():void {
				called = true;
				dispatcher.dispatchEvent(new Event(Event.COMPLETE));
			});

			assertThat("should not have called yet", called, isFalse());
		}
	}
}