package asx.array
{
	import flash.utils.Dictionary;
	
	import asx.fn._;
	import asx.fn.partial;

	/**
	 * Returns a multi-dimensional Array of all combinations of values in the Array, 
	 * 
	 * 
	 * <p>Example:</p> 
	 * <blockquote>
	 * trace(permutate([1, 2, 3], 2)); //[ [1, 1], [1, 2], [1, 3], [2, 1], [2, 2], [2, 3], [3, 1], [3, 2], [3, 3] ]
	 * trace(permutate([1, 2, 3], 3));
	 * // yields:
	 * //[
	 * //	[0,0,0], [0,0,1], [0,0,2],
	 * //	[0,1,0], [0,1,1], [0,1,2],
	 * //	[0,2,0], [0,2,1], [0,2,2],
	 * //	[1,0,0], [1,0,1], [1,0,2],
	 * //	[1,1,0], [1,1,1], [1,1,2],
	 * //	[1,2,0], [1,2,1], [1,2,2],
	 * //	[2,0,0], [2,0,1], [2,0,2],
	 * //	[2,1,0], [2,1,1], [2,1,2],
	 * //	[2,2,0], [2,2,1], [2,2,2]
	 * //]
	 * </blockquote>
	 */
	public function permutate(array:Array, combinations:int = 2):Array {
		
		const size:int = length(array);
		
		combinations = (combinations < 2) ? 2 : combinations;
		
		if(size < 2)
			return array;
		
		if(size < combinations)
			return [array];
		
		// Initialize a cache to store the permutations for each unique value.
		// If we encounter that value again, we won't have to iterate, reducing
		// the runtime from O(n^combinations) to O((n - duplicates)^combinations)
		const cache:Dictionary = new Dictionary();
		
		const permutations:Array = [];
		const merge:Function = [].concat;
		
		const recurse:Function = function(array:Array, togo:int, values:Array):Array {
			return togo < 1 ?
				[values] :
				merge.apply(null, map(array, function(x:Object):Array {
					return recurse(array, togo - 1, values.concat(x));
				}));
		};
		
		// Do a merge/map instead of calling recurse so that we can cache
		// the results of unique value permutations.
		return merge.apply(null, map(array, function(e:*):Array {
			return e in cache ?
				cache[e] :
				cache[e] = recurse(array, combinations - 1, [e]);
		}));
	}
}
