package asx.number {  
  
  /**
   * Takes a normalized value and expands it to fit the range given by minumum and maximum.
   *  
   * Note: No range checks are made on the normalised value, though it is expected to be between 0 and 1.
   *  
   * @param value Normalised value to expand. 
   * @param minimum
   * @param maximum
   * @return value scaled to be between minimum and maximum
   */
  public function interpolate(normalizedValue:Number, minimum:Number, maximum:Number):Number {
    
    return minimum + (maximum - minimum) * normalizedValue;
  } 
}
