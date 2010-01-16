package asx.array {
  
  /**
   * Call an iterator Function with each item of an Array or Array-like Object
   * sequentially waiting until the previous item has completed, and then calling
   * the complete Function with the results.
   * 
   * @param memo Initial Object give to iterator
   * @param iterable Array or Array-like Object 
   * @param iterator Function <code>function(memo:*, result:*, next:Function):void</code>
   * @param complete Function <code>function(results:*):void</code>  
   */
  public function injectSequentially(memo:Object, iterable:Object, iterator:Function, complete:Function):void {
    var items:Array = toArray(iterable);
    
    if (items.length == 0)
      complete(memo);    
    
    function next():Object {
      return items.shift();
    }
    
    function iterate():void {
      if (!empty(items)) {
        iterator(memo, next(), progress());
      }
      else {
        complete(memo);
      }
    }
    
    function progress():Function {
      return function(result:Object):void {
        memo = result;
        iterate()
      };
    }
  
    iterate(); 
  }
}
