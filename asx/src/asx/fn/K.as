package asx.fn {  
  
  // TODO K() examples
  /**
   * Returns a function that when called always returns the initial value given.
   */
  public function K(value:Object):Function {
    return function(...rest):Object {
      return value;
    }
  } 
}
