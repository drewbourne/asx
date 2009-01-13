package asx.fn {  
  
  // TODO examples for aritize()
  /**
   * Returns a function that passes only the specified number of arguments to the original function.
   */
  public function aritize(fn:Function, n:int):Function {
    return function(...rest):Object {
      return fn.apply(null, rest.slice(0, n));
    }
  } 
}
