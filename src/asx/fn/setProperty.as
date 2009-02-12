package asx.fn {  
  
  /**
   * Returns function that when called will set the property on the item to the value
   *  
   * @example 
   *  <listing version="3.0">
   *  var array:Array = [{ n: 0 }, { n: 1 }, { n: 2 }];
   *  var results:Array = array.map(setProperty('n', 5));
   *  assertThat(results, equalTo([{ n:5 }, { n:5 }, { n:5 }]));
   *  </listing>
   */
  public function setProperty(property:String, value:Object):Function {
    return function(item:Object, ...rest):Object {
      item[property] = value;
      return item;
    };
  } 
}
