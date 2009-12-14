package asx.array { 
  
  /**
   * Combines items from two Arrays removing duplicates.
   *  
   * @param a Array
   * @param b Array
   * @return Array of all items without duplicates
   * @see asx.array.difference
   * @see asx.array.intersection
   * @example 
   *  <listing version="3.0">
   *  var a:Array = [1, 2, 3, 4];
   *  var b:Array = [3, 4, 5, 6];
   *  var combined:Array = union(a, b);
   *  assertThat(combined, equalTo([1, 2, 3, 4, 5, 6]));
   *  </listing>
   */
  public function union(a:Array, b:Array):Array {
    return unique(a.concat(b));
  } 
}
