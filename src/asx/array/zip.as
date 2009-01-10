package asx.array { 
  
  /**
   * Zips multiple arrays together. 
   *  
   * The first element of each source array goes into result[0], second element of each source array into result[1], ...
   *
   * @param ...arrays
   * @return zipped Array of Arrays
   */
  public function zip(...arrays):Array {
    
    var arrayCount:int = arrays.length
    
    if (arrayCount == 0) {
      return [];
    } 
    
    var maxLength:Number = Math.max.apply(null, pluck(arrays, 'length'));
    var zipped:Array = [];
    
    for (var i:int = 0; i < maxLength; i++) {
      var zipper:Array = zipped[i] = [];
      for (var j:int = 0; j < arrayCount; j++) {
        zipper.push(arrays[j][i]);
      }
    }
    return zipped;
  } 
}
