package asx.array { 
  
  /**
   * Search for an item in an Array. Shortcuts on the first matching item. 
   *  
   * Useful as none of the AS3 Array methods provide this functionality, nor do they shortcut.
   *  
   * @param array Array of items to search in
   * @param iterator function matching: <code>function(item:Object, i:int, a:Array):Boolean</code> indicating if the item matches. 
   * @return First matching item or null
   * @example
   * <listing version="3.0">
   *  var values:Array = [0, 1, 2, 3, 4, 5];
   *  var value:Object = detect(values, function(item:Object, i:int, a:Array):Boolean {
   *    return value > 3;
   *  });
   *  assertThat(value, equalTo(4));
   * </listing>
   */
  public function detect(array:Array, iterator:Function):Object {

    var result:Object = null;
    var item:Object = null;

    // FIXME profile for vs for each
    // FIXME do we really want to iterate over every element in sparse arrays?
    
    // for each (var o in array) { ... }
    for (var i:int = 0, n:int = array.length; i < n; i++) {
      item = array[i];
      if (iterator(item, i, array)) {
        result = item;
        break;
      }
    }
    
    return result;
  } 
}
