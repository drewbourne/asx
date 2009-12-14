package asx.number {  
  
  /**
   * Force a value to stay within the specified bounds. If value is less than minimum it is set to the minimum, If value is greater than maximum than it is set to the maximum, else it stays at its set value. 
   *  
   * @param value
   * @param minimum 
   * @param maximum
   */
  public function bound(value:Number, minimum:Number, maximum:Number):Number {
    return Math.min(Math.max(minimum, value), maximum);
  } 
}
