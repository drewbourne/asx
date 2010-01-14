package asx.array { 
  
  import asx.fn._;
  import asx.fn.aritize;
  import asx.fn.partial;
  
  /**
   * Find the items that are in both Arrays.
   *  
   * @param a Array or Array-like Object.
   * @param b Array or Array-like Object.
   * @return Array of items that were in both Arrays
   * 
   * @see asx.array.difference
   * @see asx.array.union
   * @example 
   *  <listing version="3.0">
   *  var a:Array = [1, 2, 3, 4];
   *  var b:Array = [3, 4, 5, 6];
   *  var both:Array = intersection(a, b);
   *  assertThat(both, equalTo([3, 4]));
   *  </listing>
   */
  public function intersection(a:Object, b:Object):Array {
    
    var result:Array = [];

		result = result.concat(select(a, contains_(b)));
		result = result.concat(select(b, contains_(a)));
    result = unique(result);
    
    return result;
  } 
}
