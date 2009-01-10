package asx {
  public class ArrayMethods {
    
    public static const pluck:Function = asx.array.pluck;
    
    /**
     * @private
     */
    static protected function pluckProperty(field:String):Function 
    {
      return function(value:Object, i:int, a:Array):Object { return value[field]; };
    }
    
    /**
     * Injects the memo value into an iterator function that is applied to every item in the array.
     *  
     * @param memo Initial value to pass to the iterator
     * @param array Array of values to apply the iterator to
     * @param iterator Function to be applied to each value. Function signatute must match: function(memo:Object, value:Object):Object;
     * @return result of applying the memo and value of each array item to the iterator
     */
    static public function inject(memo:Object, array:Array, iterator:Function):Object
    {
      array.forEach(function(value:Object, i:int, a:Array):void {
        // send only enough parameters as the iterator function can handle
        // bah, except when its a ...rest function *sigh*
        memo = iterator.apply(null, [memo, value, i, a].slice(0, iterator.length));
      });
      return memo;
    }
    
    /**
     * Unfolds a value using a predicate, transformer, and incrementor functions.
     *  
     * @param initial Seed value for the unfold
     * @param predicate Determines whether to continue processing the unfold. Must match: function(state:Object):Boolean;
     * @param transformer Transforms the state to the next result. Must match: function(state:Object):Object;
     * @param incrementor Increments the state to a next state. Must match: function(state:Object):Object;
     * @return result Array of the unfold transformations
     */
    static public function unfold(initial:Object, predicate:Function, transformer:Function, incrementor:Function):Array {
      
      var result:Array = [];
      var state:Object = initial;
      
      do {
        result.push(transformer(state));
        state = incrementor(state);
      } while (predicate(state))
      
      return result;
    }

    /**
     * Iterator function used by #flatten.
     *  
     * @private
     */
    static private function flattenInternal(memo:Array, value:Object):Array
    {
      return memo.concat(value is Array ? flatten(value as Array) : [value]);
    }

    /**
     * Flattens nested Arrays to 1-dimensional Array.
     *  
     * @param Arrays of Arrays
     * @return Array
     */
    static public function flatten(array:Array):Array
    {
      return inject([], array, flattenInternal) as Array;
    }
    
    /**
     * Iterator function used by #zip. Determines if the value is an Array.
     *  
     * @private  
     */
    static private function isArray(value:Object, i:int=0, a:Array=null):Boolean 
    { 
      return value is Array; 
    }

    /**
     * Zips multiple arrays together. 
     *  
     * The first element of each source array goes into result[0], second element of each source array into result[1], ...
     *
     * @param ...arrays
     * @return zipped Array of Arrays
     */
    static public function zip(...arrays):Array
    {
      var arrayCount:int = arrays.length
      
      if (arrayCount == 0) 
      {
        return [];
      } 
      
      /*if (!arrays.every(isArray))
      {
        throw new ArgumentError('ArrayMethods.zip expects all arguments to be Array');
      }*/

      // find the maximum length of the arrays
      var maxLength:Number = Math.max.apply(null, pluck(arrays, 'length'));

      var zipped:Array = [];
      for (var i:int = 0, n:int = maxLength; i < n; i++)
      {
        var zipper:Array = zipped[i] = [];
        for (var j:int = 0, m:int = arrayCount; j < m; j++)
        {
          zipper.push(arrays[j][i]);
        }
      }
      return zipped;
    }

    /**
     * Removes null items from an Array. 
     *  
     * @param array Array possibly containing null values
     * @return Array without items that are == null 
     */
    static public function compact(array:Array):Array
    {
      return array.filter(notNull);
    }

    /**
     * Iterator function used by #compact to determine if item is null
     *   
     * @private
     */
    static private function notNull(v:Object, i:int=0, a:Array=null):Boolean
    {
      return v !== null;
    }

    /**
     * Determines if an Array contains a value
     *  
     * @param array Array to search for the given value
     * @return true if the Array contains the value, false otherwise. 
     */ 
    static public function contains(array:Array, value:Object):Boolean
    {
      return array.indexOf(value) !== -1;
    }

    /**
     * Iterator function to determine if a value is unique in an Array.
     *  
     * @private
     */
    static private function uniqueInternal(memo:Array, value:Object):Array 
    {
      if (!contains(memo, value)) 
      {
        memo.push(value);
      }
      return memo;
    }

    /**
     * Preserves unique values in an Array, removes any duplicate values. 
     *  
     * @param array Array from which to remove duplicates
     * @return Array of unique items
     */
    static public function unique(array:Array):Array
    {
      return inject([], array, uniqueInternal) as Array;
    }

    /**
     * Partition an Array into many divisions. 
     *  
     * @param array Array of items to partition
     * @param iterator Function matching function(value:Object):int; indicating which bucket the item should be placed into.
     * @return Array of Arrays, containing value as determined by iterator function. 
     */
    static public function partitionBy(array:Array, iterator:Function):Array
    {
      var partitions:Array = [];
      array.forEach(function(value:Object, i:int, a:Array):void {
        var index:int = iterator(value);
        var partition:Array = partitions[index];
        if (!partition) {
          partition = partitions[index] = [];
        }
        partition.push(value);
      });
      return partitions;
    }
    
    /**
     * Partition an Array into two divisions.
     *  
     * @param array Array of items to partition
     * @param iterator Function matching function(value:Object):Boolean; indicating which partition the item should be placed into. 
     * @return Array of [[...trues], [...falses]]
     */
    static public function partition(array:Array, iterator:Function):Array
    {
      var trues:Array = []
        , falses:Array = [];
      array.forEach(function(value:Object, i:int, a:Array):void {
        (iterator(value) ? trues : falses).push(value);
      });
      return [trues, falses];
    }
    
    /**
     * Search for an item in an Array. Shortcuts on the first matching item. 
     *  
     * Useful as none of the AS3 Array methods provide this functionality, nor do they shortcut.
     *  
     * @param array Array of items to search in
     * @param iterator function matching: function(item:Object, i:int, a:Array):Boolean; indicating if the item matches. 
     * @return Object
     */
    static public function detect(array:Array, iterator:Function):Object 
    {
      var result:Object = null;
      var item:Object = null;
      
      // for each (var o in array) { ... }
      
      // FIXME do we really want to iterate over every element in sparse arrays?
      for (var i:int = 0, n:int = array.length; i < n; i++) 
      {
        item = array[i];
        if (iterator(item, i, array)) {
          result = item;
          break;
        }
      }
      
      return result;
    }
    
    /**
     * Invokes a method on each item the array. 
     */
    static public function invoke(array:Array, method:String, ...args):Array 
    {  
      return array.map(function(item:Object, i:int, a:Array):Object {
        return item[method].apply(item, args);
      });
    }
    
    /**
     * 
     */ 
    static public function head(array:Array):Object {
      return array[0];
    }
    
    /**
     * 
     */
    static public function tail(array:Array):Array {
      return array.slice(1);
    }
    
    static public function empty(array:Array):Boolean {
      return array.length == 0;
    }
  }
}
