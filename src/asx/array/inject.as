package asx.array { 

  /**
   * Injects the memo value into an iterator function that is applied to every item in the array.
   *  
   * @param memo Initial value to pass to the iterator
   * @param array Array of values to apply the iterator to
   * @param iterator Function to be applied to each value. Function signature must match one of: 
   *  <ul>
   *  <li>function(memo:Object, value:Object):Object;</li>
   *  <li>function(memo:Object, value:Object, i:int):Object;</li>
   *  <li>function(memo:Object, value:Object, i:int, a:Array):Object;</li>
   *  </ul>
   * @return result of applying the memo and value of each array item to the iterator
   * @example Summing an array of numbers can be implemented with inject.
   *  <listing version="3.0">
   *  var numbers:Array = [1, 2, 3, 4, 5];
   *  var sum:Number = inject(0, function(total:Number, n:Number):Number {
   *    return total + n;
   *  });
   *  </listing>
   */
  public function inject(memo:Object, array:Array, iterator:Function):Object {
    array.forEach(function(value:Object, i:int, a:Array):void {
      memo = iterator.apply(null, [memo, value, i, a].slice(0, Math.max(2, iterator.length)));
    });
    return memo;
  } 
}
