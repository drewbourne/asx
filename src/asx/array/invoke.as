package asx.array { 
  
  /**
   * Invokes a method on each item the array. 
   */
  public function invoke(array:Array, method:String, ...args):Array {  
    return array.map(function(item:Object, i:int, a:Array):Object {
      return item[method].apply(item, args);
    });
  } 
}
