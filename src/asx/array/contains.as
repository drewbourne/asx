package asx.array { 

  /**
   * Determines if an Array contains a value.
   *  
   * @param array Array to search for the given value
   * @return true if the Array contains the value, false otherwise. 
   * @example
   *  <listing version="3.0">
   *  var foods:Array = [bread", "toast", "waffles"];
   *  var toast:String = "toast";
   *  
   *  if (contains(foods, toast)) {
   *    eat(foods);
   *  }
   *  </listing>
   */ 
  public function contains(array:Array, value:Object):Boolean {
    return array.indexOf(value) !== -1;
  } 
}
