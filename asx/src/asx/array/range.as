package asx.array
{
	import asx.fn.I;

	/**
	 * Same as python range function.
	 * 
	 * If only one arg is specified, start is zero, step is one and stop is the arg.
	 * Otherwise, args=start, stop, step.
	 * Negative stop and step can be used.
	 * Will throw ArgumentError if step is zero.
	 * 
	 * @see http://docs.python.org/library/functions.html#range
	 */
	public function range(...args):Array {
		var start:int = 0;
		var stop:int = 0;
		var step:int = 1;
		
		if (args.length == 1 ) {
			stop = int(args[0]);
		} else if (args.length > 1) {
			start = int(args[0]);
			stop = int(args[1]);
		}
		if (args.length == 3)
			step = int(args[2]);
		
		if (step == 0)
			throw new ArgumentError("Step must not be null");
		
		var p:Function = function(n:Number):Boolean { 
			return step > 0 ? n < stop : n > stop
		};
		var i:Function = function(n:Number):Number { 
			return n + step;
		};
		
		return unfold(start, p, I, i);
	}
}