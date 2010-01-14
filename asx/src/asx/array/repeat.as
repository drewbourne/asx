package asx.array {
  
  /**
   * Create an Array by repeating a value the given number of times.
   * 
   * @param value Object to repeat
   * @param n Number of times to repeat value.
   */
  public function repeat(value:Object, n:int):Array {
    var result:Array = [];
    
    while (n-- > 0)
      result[result.length] = value;
      
    return result; 
  }
}