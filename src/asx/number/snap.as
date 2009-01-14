package asx.number {  
  
  /**
   * Round a value to the nearest step value. Allows for offsetting from an optional origin value.
   *  
   * @param value
   * @param step
   * @param origin
   */
  public function snap(value:Number, step:Number = 1, origin:Number = 0):Number {
    
    return origin + (Math.round(value / step) * step);
  }
}
