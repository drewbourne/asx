package asx.number {  
  
  import asx.array.inject;
  
  /**
   * Sum an Array of Numbers
   *  
   * @param numbers Array of Numbers to sum
   * @return total of the numbers in the source Array
   */
  public function sum(numbers:Array):Number {
    return inject(0, numbers, add) as Number;
  } 
}
