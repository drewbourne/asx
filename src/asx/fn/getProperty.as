package asx.fn {  
  
  /**
   * Returns an iterator function that when called will get the property on the item.
   *  
   * @example 
   *  <listing version="3.0">
   *  var array:Array = [[1, 2, 3], [4, 5], [6]];
   *  var results:Array = array.map(getProperty('length')));
   *  assertThat(results, equalTo([3, 2, 1]));
   *  </listing>
   */
  public function getProperty(property:String):Function {
    return function(item:Object, i:int, a:Array):Object {
      return item[property];
    };
  } 
}
