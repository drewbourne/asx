package asx.array { 

  /**
   * 
   */
  public function eachSlice(iterable:Object, size:int, iterator:Function):Array {
    return map(inGroupsOf(iterable, size), iterator);
  } 
}
