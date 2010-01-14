package asx.array { 
  
  /**
   * Returns item at index 0 of an Array-like Object.
   *  
   * @param iterable Array or Array-like object.
   * @return First item in iterable, or null if the iterable is empty.
   * @example
   *  <listing version="3.0">
   *  var values:Array = [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"]];
   *  
   *  // first item from the values
   *  var result:Array = head(values);
   *  assertThat(result, equalTo(["A", "B", "C"]));
   *  
   *  // first item from each of the value arrays
   *  result = map(values, head);
   *  assertThat(result, equalTo(["A", "D", "G"]));
   *  </listing>
   */ 
  public function head(iterable:Object):Object {
    return empty(iterable) ? null : iterable[0];
  }
}
