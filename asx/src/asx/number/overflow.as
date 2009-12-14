package asx.number {  

  /**
   * Causes a value to wrap between the minimum and maximum overflow points. 
   *  
   * @param value
   * @param minimum
   * @param maximum
   */
  public function overflow(value:Number, minimum:Number, maximum:Number):Number {

    var range:Number;
    var difference:Number;
    var modulus:Number;
    
    if (between(value, minimum, maximum)) {
      return value;
    }

    range = maximum - minimum;

    if (value < minimum) {
      difference = minimum - value;
      modulus = difference % range;
      return maximum - modulus;  
    } 
    else if (value > maximum) {
      difference = value - maximum;
      modulus = difference % range;
      return minimum + modulus;
    }
    
    return value;
  }
}
