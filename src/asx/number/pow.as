package asx.number {  
  
  // TODO pow() examples
  /**
   * Power iterator
   */
  public function pow(n:Number):Function {
    return function(value:Number, i:int, a:Array):Number {
      return value ^ n;
    }
  }
}
