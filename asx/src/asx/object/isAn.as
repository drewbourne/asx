package asx.object {  
  
  /**
   * Returns a function that returns true if the item is the given type.
   *  
   * @example
   *  <listing version="3.0">
   *  var numbers:Array = [1, 2, 3, null, true, false, 7].filter(isA(Number));
   *  assertThat(numbers, equalTo([1, 2, 3, 7]));
   *  </listing>
   */
  public function isAn(type:Class):Function {
    return function(object:Object, ...rest):Boolean {
      return object is type;
    }
  } 
}

