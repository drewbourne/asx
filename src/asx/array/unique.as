package asx.array { 

  /**
   * Preserves unique values in an Array, removes any duplicate values. 
   *  
   * @param array Array from which to remove duplicates
   * @return Array of unique items
   * 
   */
  public function unique(array:Array):Array {
    return inject([], array, uniqueIterator) as Array;
  }
}

internal function uniqueIterator(memo:Array, value:Object):Array {
  if (!contains(memo, value)) {
    memo.push(value);
  }
  return memo;
}
