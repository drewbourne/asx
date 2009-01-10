package asx.array { 

  /**
   * Injects the memo value into an iterator function that is applied to every item in the array.
   *  
   * @param memo Initial value to pass to the iterator
   * @param array Array of values to apply the iterator to
   * @param iterator Function to be applied to each value. Function signatute must match: function(memo:Object, value:Object):Object;
   * @return result of applying the memo and value of each array item to the iterator
   */
  public function inject(memo:Object, array:Array, iterator:Function):Object {
    array.forEach(function(value:Object, i:int, a:Array):void {
      // send only enough parameters as the iterator function can handle
      // bah, except when its a ...rest function *sigh*
      // FIXME fix the case where the length cannot be determined
      memo = iterator.apply(null, [memo, value, i, a].slice(0, iterator.length));
    });
    return memo;
  } 
}
