package asx.string {  
  
  /**
   * Removes whitespace characters from the start of a String
   */
  public function trimStart(value:String):String {
    return value.replace(/^\s+/, '');
  }
}
