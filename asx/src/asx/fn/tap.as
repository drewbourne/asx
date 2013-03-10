package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function tap(fn:Function, returnValue:*):Function {
		return function(...args):* {
			fn.apply(null, args);
			return returnValue;
		}
	}
}