package asx.fn
{
	import asx.array.map;

	/**
	 * @author ptaylor
	 */
	public function distribute(...fns):Function {
		return function(...args):Array {
			return map(fns, callFunction.apply(null, args));
		}
	}
}