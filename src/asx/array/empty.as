package asx.array { 
  
  /**
   * Checks if an Array is empty. 
   *  
   * @param array Array to operate on. 
   * @result true if the array has no items, false otherwise. 
   * @example
   * <listing version="3.0">
   *  var one:Array = [];
   *  var two:Array = [null];
   *  var three:Array = [1, 2, 3];
   *  assertThat(empty(one), true);
   *  assertThat(empty(two), false);
   *  assertThat(empty(three), false);
   * </listing>
   */
  public function empty(array:Array):Boolean {
    return array.length == 0;
  } 
}
