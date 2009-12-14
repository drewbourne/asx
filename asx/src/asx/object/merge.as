package asx.object {  
  
  /**
   * Merge enumerable fields from b -> a, returns a
   *  
   * @param a Target
   * @param b Source
   * @return a
   */
  public function merge(a:Object, b:Object):Object {
    
    for (var field:String in b) {
      a[field] = b[field];
    }
    
    return a;
  } 
}
