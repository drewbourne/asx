package asx.fn {  
  
  // TODO K() examples
  /**
   * K
   */
  public function K(value:Object):Function {
    return function(...rest):Object {
      return value;
    }
  } 
}
