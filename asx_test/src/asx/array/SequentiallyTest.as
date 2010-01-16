package asx.array
{
  import asx.fn.noop;
  
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IEventDispatcher;
  import flash.utils.getTimer;
  import flash.utils.setTimeout;
  
  import mx.automation.events.EventDetails;
  
  import org.flexunit.assertThat;
  import org.flexunit.async.Async;
  import org.hamcrest.collection.array;
  import org.hamcrest.collection.emptyArray;
  import org.hamcrest.number.closeTo;
  import org.hamcrest.object.strictlyEqualTo;
  
  public class SequentiallyTest
  {
    [Test(async)]
    public function mapSequentially_withEmptyArray_shouldCallCompleteWithEmptyArray():void 
    {
      var ok:IEventDispatcher = new EventDispatcher();
      Async.proceedOnEvent(this, ok, Event.COMPLETE, 10000);
  
      mapSequentially([], noop, function(result:Array):void {
        assertThat("mapSequentially with empty array completes with empty array", 
          result, emptyArray());
       
        ok.dispatchEvent(new Event(Event.COMPLETE));
      });  
    }
    
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
          assertThat("mapSequentially", results, 
            array(closeTo(0, 100), closeTo(1000, 100), closeTo(2000, 100)));
            
          ok.dispatchEvent(new Event(Event.COMPLETE));
        });
    }
    
    [Test(async)]
    public function mapParallelized_withEmptyArray_shouldCallCompleteWithEmptyArray():void 
    {
      var ok:IEventDispatcher = new EventDispatcher();
      Async.proceedOnEvent(this, ok, Event.COMPLETE, 10000);
  
      mapParallelized([], noop, function(result:Array):void {
        assertThat("mapParallelized with empty array completes with empty array", 
          result, emptyArray());
       
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
          assertThat("mapParallelized", results, 
            array(closeTo(0, 100), closeTo(0, 100), closeTo(0, 100)));
            
          ok.dispatchEvent(new Event(Event.COMPLETE));
        });
    }
    
    [Test(async)]
    public function injectSequentially_withEmptyArray_shouldCallCompleteWithInitialMemo():void 
    {
      var ok:IEventDispatcher = new EventDispatcher();
      Async.proceedOnEvent(this, ok, Event.COMPLETE, 10000);
  
      var memo:Array = [];
      injectSequentially(memo, noop, noop, function(result:Array):void {
        assertThat("injectSequentially with empty array completes with empty array", 
          result, strictlyEqualTo(memo));
       
        ok.dispatchEvent(new Event(Event.COMPLETE));
      });  
    }
    
    [Test(async, timeout=10000)]
    public function injectSequentially_withArray_shouldCollectResultsOfCallingIteratorFunctionOnEachItem():void
    {
      var ok:IEventDispatcher = new EventDispatcher();
      Async.proceedOnEvent(this, ok, Event.COMPLETE, 10000);
      
      var items:Array = [1, 2, 3];
      var init:Number = getTimer();
      
      injectSequentially(0, items, 
        function(memo:Number, item:Number, next:Function):void {
          var elapsed:Number = getTimer() - init;
          
          // pretend to do some work
          // and then later carry on
          setTimeout(function():void {
            next(memo + elapsed);
          }, 1000);
        },
        function(memo:Number):void {
          
          // the results of injecting sequentially should be that the memo 
          // is the sum of all the elapsed times, (~0, ~1000, ~2000) = ~3000
          // 
          // setTimeouts are finnicky so we given it 1/2 second leeway. 
          // not really an issue. 
          // 
          assertThat("injectSequentially", memo, closeTo(3000, 500));
          ok.dispatchEvent(new Event(Event.COMPLETE));
        });
    }
  }
}
