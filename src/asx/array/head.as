package asx.array { 
  
  // TODO include an example showing the usage of head() and tail() for recursive functions.
  /**
   * Returns item at index 0 of an Array.
   *  
   * @param array Array
   * @return First item in Array, or null if the array is empty.
   */ 
  static public function head(array:Array):Object {
    return array[0] || null;
  }
}
