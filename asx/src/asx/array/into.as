package asx.array
{
	import asx.fn._;
	import asx.fn.partial;
	
	// deliberately specificly hideous
	
	public function into(fns:Array, memo:Object):Object
	{
		var fn:Function = fns[0] as Function;
		
		if (fn != null)
		{
			// fn(memo, partial(into, fns.slice(1), _));
			fn(memo, function(memo:Object):void {
				into(fns.slice(1), memo);
			});
		}
				
		return memo;
	}
}
