package asx.number {  

  /**
   * Normalizes a value between 0 and 1, given the minimum and maximum values for the range. 
   *  
   * @param value 
   * @param minimum
   * @param maximum
   * @return value scaled to be between 0 and 1
   */
  public function normalize(value:Number, minimum:Number, maximum:Number):Number {
    
    return (value - minimum) / (maximum - minimum);
  } 
}
