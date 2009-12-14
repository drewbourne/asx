package asx.number {  
  
  /**
   * Match a Number if it is between the minimum and maximum values
   *  
   * Note: No check is made that the minimum is less than the maximum. 
   *  
   * @param value Number to check
   * @param minimum Minimum Number the value must be to be considered between. 
   * @param maximum Maximum Number the value must be to be considered between. 
   */
  public function between(value:Number, minimum:Number, maximum:Number):Boolean {
    return (minimum <= value && value <= maximum);
  } 
}
