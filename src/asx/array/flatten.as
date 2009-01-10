package asx.array { 
   
   /**
    * Flattens nested Arrays to 1-dimensional Array.
    *  
    * @param Arrays of Arrays
    * @return Array
    * 
    * @example
    * <listing version="3.0">
    * var nested:Array = [1, [2, 3, [4, 5, [6]]]];
    * var flattened:Array = flatten(nested);
    * assertThat(flattened, equalTo([1, 2, 3, 4, 5, 6]));
    * </listing>
    */
   public function flatten(array:Array):Array {
     return inject([], array, flattenInternal) as Array;
   }
}

internal function flattenInternal(memo:Array, value:Object):Array {
  return memo.concat(value is Array ? flatten(value as Array) : [value]);
}
