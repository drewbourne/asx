package asx.string {
  
  /**
   * Returns <code>true</code> if the given String is null or contains only whitespace, <code>false</code> otherwise.
   * 
   * @param value
   * 
   * @example
   * <listing version="3.0">
   *  if (empty(potentiallyNullableString)) {
   *    // do some operation to populate the string
   *  }
   * </listing>
   */
  public function empty(value:String):Boolean {
    return !value || value.match(/^[\s]+$/);
  }
}