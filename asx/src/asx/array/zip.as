package asx.array { 
  
  /**
   * Zips multiple arrays together. 
   *  
   * The first element of each source array goes into result[0], second element of each source array into result[1], ...
   *
   * @param ...arrays
   * @return zipped Array of Arrays
   * @example
   *  <listing version="3.0">
   *  var first:Array = [1, 1, 1];
   *  var second:Array = [2, null, null, 2];
   *  var third:Array = [3, 3, 3, 3];
   *  var zipped:Array = zip(first, second, third);
   *  assertThat(zipped, equalTo([
   *    [1,    2,    3],
   *    [1,    null, 3],
   *    [1,    null, 3],
   *    [null, 2,    3]
   *  ]));
   *  </listing>
   */
  public function zip(...arrays):Array {
    
    var arrayCount:int = arrays.length
    
    if (arrayCount == 0) {
      return [];
    } 
    
    var minLength:Number = Number(min(map(arrays, length)));
    var zipped:Array = [];
    
    for (var i:int = 0; i < minLength; i++) {
      var zipper:Array = zipped[i] = [];
      for (var j:int = 0; j < arrayCount; j++) {
        zipper[zipper.length] = arrays[j][i];
      }
    }
    return zipped;
  } 
}
