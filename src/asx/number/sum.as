package asx.number {  
  
  /**
   * Sum an Array of Numbers
   *  
   * @param numbers Array of Numbers to sum
   * @return total of the numbers in the source Array
   */
  public function sum(numbers:Array):Number {
    
    return inject(0, numbers, function(memo:Number, n:Number):Number {
      return memo + n;
    }) as Number;
  } 
}
