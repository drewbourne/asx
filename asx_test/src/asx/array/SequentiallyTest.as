package asx.array
{
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IEventDispatcher;
  import flash.utils.getTimer;
  import flash.utils.setTimeout;
  
  import mx.automation.events.EventDetails;
  
  import org.flexunit.assertThat;
  import org.flexunit.async.Async;
  import org.hamcrest.collection.array;
  import org.hamcrest.number.closeTo;
  
  public class SequentiallyTest
  {
    [Test(async, timeout=10000)]
    public function mapSequentially_withArray_shouldCollectResultsOfCallingIteratorFunctionOnEachItem():void
    {
      var ok:IEventDispatcher = new EventDispatcher();
      Async.proceedOnEvent(this, ok, Event.COMPLETE, 10000);
      
      var items:Array = [1, 2, 3];
      var init:Number = getTimer();
      
      mapSequentially(items, 
        function(item:Object, next:Function):void {
          var elapsed:Number = getTimer() - init;
          
          // pretend to do some work
          // and then later carry on
          setTimeout(function():void {
            next(elapsed);
          }, 1000);
        },
        function(results:Array):void {
          
          // the results of mapping sequentially should be that the elapsed time
          // for each item is about 1 second after the previous. this shows that
          // the iterator was called for that item sequentially after the previous. 
          //
          assertThat("mapS", results, array(closeTo(0, 100), closeTo(1000, 100), closeTo(2000, 100)));
          ok.dispatchEvent(new Event(Event.COMPLETE));
        });
    }
    
    [Test(async, timeout=10000)]
    public function mapParallelized_withArray_shouldCollectResultsOfCallingIteratorFunctionOnEachItem():void 
    {
      var ok:IEventDispatcher = new EventDispatcher();
      Async.proceedOnEvent(this, ok, Event.COMPLETE, 10000);
      
      var items:Array = [1, 2, 3];
      var init:Number = getTimer();
      
      mapParallelized(items, 
        function(item:Object, next:Function):void {
          var elapsed:Number = getTimer() - init;
          
          // pretend to do some work
          // and then later carry on
          setTimeout(function():void {
            next(elapsed);
          }, 1000);
        },
        function(results:Array):void {
          
          // the results of mapping parallelized should be that the elapsed time
          // for each item is roughly the same time. this shows that the iterator
          // was called for that item roughly parallel with the other items. 
          // (although in the Flash Player environment they are actually called
          // in sequence but we wait until all the of the iterators have called
          // their next functions. 
          //
          assertThat("mapP", results, array(closeTo(0, 100), closeTo(0, 100), closeTo(0, 100)));
          ok.dispatchEvent(new Event(Event.COMPLETE));
        });
    }
  }
}
