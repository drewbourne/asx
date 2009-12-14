package asx.string {  
  
  /**
   * Removes whitespace from the end of a String
   */
  public function trimEnd(value:String):String {
    return value.replace(/\s+$/, '');
  } 
}
