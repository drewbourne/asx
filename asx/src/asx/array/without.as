package asx.array { 
  
  /**
   * Returns a new Array without the specified items
   *  
   * @param array Array to filter
   * @param item Item to remove if in array
   * @return Array without the items
   * @example 
   * <listing version="3.0">
   *  var values:Array = [0, 1, 2, 3];
   *  assertThat(without(values, 2), equalTo([0, 1, 3]));
   *  assertThat(without(values, 0, 1), equalTo([2, 3]));
   * </listing>
   */
  public function without(iterable:Object, ...items):Array {
    return reject(iterable, contains_(items));
  } 
}
