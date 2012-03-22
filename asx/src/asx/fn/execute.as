package asx.fn
{
	/**
 	 * Executes a sequence of Functions. 
 	 * 
 	 * Each function should have the signature: <code>function(...args, next:Function):void</code>. 
 	 * 
 	 * @param Array of Arrays of Function
 	 *
 	 * @example
 	 * <listing version="3.0">
 	 * 	execute([
 	 * 		[first],
 	 * 		[second],
 	 * 		[[third_part1, third_part2], [arg1, arg2]],
 	 *		[fouth, [arg1, arg2]]
 	 * 	]);
 	 * </listing>
 	 */
	public function execute(steps:Array):void 
	{
		if (steps.length === 0)
		{
			return;	
		}
		
		var step:Array 	= steps[0];
		var func:* 		= step[0];
		var args:Array 	= step[1] || [];
		var fn:Function;
		var funcs:Array;
		var next:Function;
		
		steps = steps.slice(1);
		
		funcs = func is Array ? func as Array : [func];
		
		next = (function(expected:int):Function {
			var current:int = 0;
			return function():void {
				current++;
				
				if (current === expected) {
					execute(steps);	
				}
			}
		})(funcs.length);
		
		args = args.slice();
		args.push(next);
		
		for each (fn in funcs)
		{
			fn.apply(null, args);
		}
	}
}