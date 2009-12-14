package asx.array { 

  /**
   * Returns all the items in an Array except for the first.
   *
   * @param array Array to operate on
   * @return Array
   * @example
   * <listing version="3.0">
   *  var values:Array = [1, 2, 3];
   *  var result:Array = tail(values);
   *  assertThat(result, equalTo([2, 3]));
   * </listing>
   */
  public function tail(array:Array):Array {
    return array.slice(1);
  } 
}
