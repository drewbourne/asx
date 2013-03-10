package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function guard(fn:Function, ...args):Function {
		return function(...a):* {
			return fn.apply(null, a.slice(0, fn.length || a.length));
		}
	}
}