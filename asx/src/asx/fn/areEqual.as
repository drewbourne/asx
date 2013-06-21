package asx.fn
{
	import asx.array.allOf;
	import asx.array.head;
	import asx.array.last;
	import asx.array.permutate;

	/**
	 * @author ptaylor
	 */
	public function areEqual(...items):Boolean {
		
		if(items.length < 2) return head(items);
		if(items.length == 2) return head(items) === last(items);
		
		const permutations:Array = permutate(items, 2);
		
		return allOf(permutations, apply(areEqual));
	}
}