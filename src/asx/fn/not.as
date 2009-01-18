package asx.fn {
  
  public function not(fn:Function, thisObject:Object = null):Function {
    return function(...rest):Boolean {
      return !fn.apply(thisObject, rest);
    }
  } 
}
