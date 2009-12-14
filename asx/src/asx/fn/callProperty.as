package asx.fn {  
  
  /**
   * Returns an function that when called will call the method on the item with the given args. 
   *  
   * @example 
   *  <listing version="3.0">
   *  var array:Array = ["a", "bees seas", "deez e eff"];
   *  var results:Array = array.map(callProperty('split', ' '));
   *  assertThat(results, equalTo([["a"], ["bees", "seas"], ["deez", "e", "eff"]]));
   *  </listing>
   */
  public function callProperty(method:String, ...args):Function {
    return function(item:Object, ...rest):Object {
      return item[method].apply(item, args);
    };
  } 
}
