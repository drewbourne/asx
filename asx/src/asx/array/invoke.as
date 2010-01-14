package asx.array { 
  
  import asx.fn.callProperty;
  
  /**
   * Invokes a method on each item the array. 
   * 
   * @param array Array of items to invoke method on
   * @param method Name of the method to invoke
   * @param ...args Additional arguments to pass to the method
   * @return Array of return values from the method
   * @example
   *  <listing version="3.0">
   *  var strings:Array = ["once", "upon", "a", "time"];
   *  var uppercased:Array = invoke(strings, 'toUpperCase');
   *  assertThat(uppercased, equalTo(["ONCE", "UPON", "A", "TIME"]));
   *  </listing>
   */
  public function invoke(iterable:Object, method:String, ...args):Array {  
    return map(iterable, callProperty.apply(null, [method].concat(args)));
  } 
}
