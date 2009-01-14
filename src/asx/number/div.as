package asx.number {  
  
  // TODO div() examples
  /**
   * Division iterator
   */
  public function div(n:Number):Function {
    return function(value:Number, i:int, a:Array):Number {
      return value / n;
    }
  }
}
