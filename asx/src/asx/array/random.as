package asx.array { 
  
  /**
   * Returns a random item from an Array.
   *  
   * @param array
   * @return Item from array
   */
  public function random(iterable:Object):Object {
    return iterable[ Math.floor(Math.random() * length(iterable)) ];
  }
}