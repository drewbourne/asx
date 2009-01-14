package asx.number {  
  
  // TODO lt examples
  /**
   * Less than iterator 
   */
  public function lt(n:Number):Function {
    return function(value:Number, i:int, a:Array):Boolean {
      return value < n;
    };
  } 
}
