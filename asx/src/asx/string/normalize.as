package asx.string {  
  
  /**
   * Trims the String then replaces sequences of whitespace characters with a single space
   */
  public function normalize(value:String):String  {
    return trim(value.replace(/[\s]+/g, ' '));
  } 
}
