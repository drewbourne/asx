package asx.number {  
  
  // TODO gte examples
  /**
   * Greater than or equal to iterator 
   */
  public function lgte(n:Number):Function {
    return function(value:Number, i:int, a:Array):Boolean {
      return value >= n;
    };
  } 
}
