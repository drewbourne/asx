package asx.array { 
  
  import asx.fn._;
  import asx.fn.aritize;  
  import asx.fn.not;
  import asx.fn.partial;
  
  /**
   * Find the items that are not in both arrays.
   *  
   * @param a Array
   * @param b Array
   * @return Array of items that were not in both Arrays
   * @see asx.array.union
   * @see asx.array.intersection
   * @example 
   *  <listing version="3.0">
   *  var a:Array = [1, 2, 3, 4];
   *  var b:Array = [3, 4, 5, 6];
   *  var diff:Array = difference(a, b);
   *  assertThat(diff, equalTo([1, 2, 5, 6]));
   *  </listing>
   */
  public function difference(a:Array, b:Array):Array {
    
    var result:Array = [];
    
    result = result.concat(a.filter(aritize(partial(not(contains), b, _), 1)));
    result = result.concat(b.filter(aritize(partial(not(contains), a, _), 1)));
    
    return result;
  } 
}
