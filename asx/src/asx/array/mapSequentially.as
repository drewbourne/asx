package asx.array {
  
  /**
   * Call an iterator Function with each item of an Array or Array-like Object
   * sequentially waiting until the previous item has completed, and then calling
   * the complete Function with the results.
   * 
   * @param iterable Array or Array-like Object 
   * @param iterator Function <code>function(result:*, next:Function):void</code>
   * @param complete Function <code>function(results:Array):void</code>  
   */
  public function mapSequentially(iterable:Object, iterator:Function, complete:Function):void {
    var items:Array = toArray(iterable);
    var results:Array = []; 
    
    function next():Object {
      return items.shift();
    }
    
    function iterate():void {
      if (!empty(items)) {
        iterator(next(), progress());
      }
      else {
        complete(results);
      }
    }
    
    function progress():Function {
      return function(result:Object):void {
        results[results.length] = result;
        iterate()
      };
    }
  
    iterate(); 
  }
}
