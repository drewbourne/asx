package asx.array { 
  
  /**
   * Randomise the position of items in an Array or Array-like Object. 
   */
  public function shuffle(iterable:Object):Array {
    return toArray(iterable).sort($shuffleIt);
  } 
}

internal function $shuffleIt(a:Object, b:Object):int {
  return -1 + Math.round(Math.random() * 2);
}