package asx.array {
	import asx.fn._;
	
	/**
	 * Injects the memo value into an iterator function that is applied to every 
	 * item in an Array-like Object 
	 *
	 * @param memo Initial value to pass to the iterator
	 * @param iterable Array-like Object iterable with for-each.
	 * @param iterator Function to be applied to each value. Function signature must match one of:
	 *  <ul>
	 *  <li>function(memo:Object, value:Object):Object;</li>
	 *  <li>function(memo:Object, value:Object, i:int):Object;</li>
	 *  </ul>
	 * @return result of applying the memo and value of each array item to the iterator
	 * 
	 * @example Summing an array of numbers can be implemented with inject.
	 *  <listing version="3.0">
	 *  var numbers:Array = [1, 2, 3, 4, 5];
	 *  var sum:Number = inject(0, numbers, function(total:Number, n:Number):Number {
	 *    return total + n;
	 *  });
	 *  </listing>
	 */
	public function inject(seed:Object, iterable:Object, iterator:Function):Object {
		var i:int = 0;
		var n:int = iterator.length;
		var memo:Object = seed;
		for each (var value:Object in iterable) {
			memo = seed == _ && i == 0 ?
				value :
				iterator.apply(null, [ memo, value, i ].slice(0, Math.max(2, n)));
			i++;
		}
		return memo;
	}
}
