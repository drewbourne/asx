package asx.array { 

  /**
   * Determines if an Array contains a value
   *  
   * @param array Array to search for the given value
   * @return true if the Array contains the value, false otherwise. 
   */ 
  public function contains(array:Array, value:Object):Boolean {
    return array.indexOf(value) !== -1;
  } 
}
