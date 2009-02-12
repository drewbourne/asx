package asx.string {  
  
  /**
   * Removes whitespace characters from the start and end of a String
   */
  public function trim(value:String):String {
    return trimStart(trimEnd(value));
  } 
}
