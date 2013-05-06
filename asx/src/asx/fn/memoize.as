package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function memoize(func:Function, hasher:Function):Function {
		const memo:Object = {};
		
		return function(...args):* {
			const key:String = hasher.apply(null, args);
			return memo.hasOwnProperty(key) ?
				memo[key] :
				memo[key] = func.apply(null, args);
		};
	}
}