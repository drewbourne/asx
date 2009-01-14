package asx.number {  
  
  // TODO mod() examples
  /**
   * Modulus iterator 
   */
  public function mod(n:Number):Function {
    return function(value:Number, i:int, a:Array):Number {
      return value % n;
    }
  } 
}
