package asx.string {  
  
  /**
   * Repeats the value string count number of times. 
   *  
   * @param value String to repeat
   * @param count Number of times to repeat the value String.
   * @return repeated String
   */
  public function repeat(value:String, count:Number = 1):String {
    var out:String = '';
    while(count > 0) { 
      out += value; 
      --count; 
    }
    return out;
  } 
}
