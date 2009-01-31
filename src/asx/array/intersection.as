package asx.array { 
  
  import asx.fn._;
  import asx.fn.aritize;
  import asx.fn.partial;
  
  /**
   * Find the items that are in both arrays.
   *  
   * @param a Array
   * @param b Array
   * @return Array of items that were in both Arrays
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
  public function intersection(a:Array, b:Array):Array {
    
    var result:Array = [];
    
    result = result.concat(a.filter(aritize(partial(contains, b, _), 1)));
    result = result.concat(b.filter(aritize(partial(contains, a, _), 1)));
    result = unique(result);
    
    return result;
  } 
}
