package asx.number {  
  
  // TODO mul() examples
  /**
   * Multiplication iterator
   */
  public function mul(n:Number):Function {
    return function(value:Number, i:int, a:Array):Number {
      return value * n;
    }
  }
}
