package asx.fn
{
	import flash.utils.Dictionary;

	/**
	 * @author ptaylor
	 */
	public function memoize(func:Function, hasher:Function):Function {
		const memo:Dictionary = new Dictionary(true);
		
		return function(...args):* {
			const key:Object = hasher.apply(null, args);
			return memo[key] == null ?
				memo[key] = func.apply(null, args) :
				memo[key];
		};
	}
}