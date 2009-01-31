package asx.array { 
  
  /**
   * Returns a random item from an Array.
   *  
   * @param array
   * @return Item from array
   */
  public function random(array:Array):Object {
    return array[ Math.floor(Math.random() * array.length) ];
  }
}