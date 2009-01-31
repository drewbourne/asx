package asx.number {  
  
  /**
   * Maps an iterator function n times and returns the results.
   */
  public function times(n:int, fn:Function):Array {
    n = Math.max(0, n);
    var result:Array = [];
    for (var i:int=0; i < n; i++) {
      result.push(fn(i, i, result));
    }
    return result;
  } 
}
