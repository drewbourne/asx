package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function distribute(fn:Function):Function {
		return function(array:Array):* {
			return fn.apply(null, array);
		}
	}
}