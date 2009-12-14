package asx.array { 

  /**
   * 
   */
  public function eachSlice(array:Array, size:int, iterator:Function):Array {
    var index:int = -size;
    var slices:Array = [];
    
    while ((index += size) < array.length) {
      slices.push(array.slice(index, index + size));
    }
    return slices.map(iterator);
  } 
}
