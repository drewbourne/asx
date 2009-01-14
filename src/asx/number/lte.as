package asx.number {  
  
  // TODO lte examples
  /**
   * Less than or equal to iterator 
   */
  public function lte(n:Number):Function {
    return function(value:Number, i:int, a:Array):Boolean {
      return value <= n;
    };
  } 
}
