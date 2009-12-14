package asx.string {
  
  /**
   * Reverses the order of characters in a String. 
   *
   * @param value String to reverse.
   */
  public function reverse(value:String):String {
    return value ? value.split("").reverse().join("") : "";
  }
}