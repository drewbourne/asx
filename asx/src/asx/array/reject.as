package asx.array { 
  
  import asx.fn.not;
  
  /**
   * Filters an array returning any items that do not match the iterator.
   *  
   * @example
   *  <listing version="3.0">
   *  var obj:Object = { n: 4 };
   *  var others:Array = reject([1, 2, 3, true, object], isA(Number));
   *  assertThat(others, equalTo([true, object]));
   *  </listing>
   */
  public function reject(array:Array, iterator:Function):Array {
    return array.filter(not(iterator));
  } 
}
