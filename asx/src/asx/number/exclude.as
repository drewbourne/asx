package asx.number {  
  
  /**
   * Force a value to be outside a specified range. If the value is not between the minimum or maximum then it is returned as is, else the closer of the minimum or maximum value is returned. 
   *  
   * @param value
   * @param minimum
   * @param maximum
   */
  public function exclude(value:Number, minimum:Number, maximum:Number):Number {
    if (!between(value, minimum, maximum))
      return value;

    if (value == minimum && value == maximum)
      return NaN;

    var mindiff:Number = value - minimum;
    var maxdiff:Number = maximum - value;
    return mindiff <= maxdiff ? minimum : maximum;
  }
}
