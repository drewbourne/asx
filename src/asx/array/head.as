package asx.array { 
  
  /**
   * Returns item at index 0 of an Array, or null.
   *  
   * @param array Array
   * @return First item in Array, or null if the array is empty.
   * @example
   *  <listing version="3.0">
   *  var values:Array = [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"]];
   *  
   *  // first item from the values
   *  var result:Array = head(values);
   *  assertThat(result, equalTo(["A", "B", "C"]));
   *  
   *  // first item from each of the value arrays
   *  result = values.map(aritize(head, 1));
   *  assertThat(result, equalTo(["A", "D", "G"]));
   *  </listing>
   */ 
  public function head(array:Array):Object {
    return array[0] || null;
  }
}
