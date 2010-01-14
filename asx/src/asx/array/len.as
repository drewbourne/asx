package asx.array
{
  // NOTE I would like to call this length() but it seems the flex compiler
  // flags any package-level function callled 'length' as a warning, and/or
  // doesn't compile with a bogus error about not finding the method. kthx.
  
  /**
   * Determine the length of an Array-like Object.
   * 
   *  
   */
  public function len(iterable:Object):int
  {
    return length(iterable);
  }
}