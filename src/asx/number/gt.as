package asx.number {  
  
  // TODO gt examples
  /**
   * Greater than iterator
   */
  public function gt(n:Number):Function {
    return function(value:Number, i:int, a:Array):Boolean {
      return value < n;
    };
  } 
}
