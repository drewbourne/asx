package asx.fn {  
  
  /**
   * Shorthand marker variable for use with partial()
   *  
   * @see asx.fn.partial
   */
  // don't use undefined because the AVM automatically casts undefined to
  // false-y values and we lose the uniqueness of the constant; 
  public var _:Object = {};
}
