package asx.array
{
  /**
   * Calls an iterator Function with each item of an Array or Array-like Object
   * parallellised, waiting for all results before calling the complete Function
   * with the results.
   * 
   * @param iterable Array or Array-like Object 
   * @param iterator Function <code>function(result:*, next:Function):void</code>
   * @param complete Function <code>function(results:Array):void</code>  
   */
  internal function mapParallelized(iterable:Object, iterator:Function, complete:Function):void {
    var items:Array = toArray(iterable);
    var results:Array = [];
    
    function iterate(item:Object):void {
      iterator(item, progress());
    }
    
    function progress():Function {
      return function(result:Object):void {
        results[results.length] = result;
        if (results.length == items.length) {
          complete(results);
        }
      }
    }
    
    for each (var item:Object in iterable) {
      iterate(item);
    }  
  }
}