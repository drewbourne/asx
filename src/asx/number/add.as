package asx.number {  
  
  public function add(n:Number):Function {
    return function(value:Number, i:int, a:Array):Boolean {
      return value + n;
    }
  }
}
