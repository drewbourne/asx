package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function ifElse(condition:Function, then:Function, otherwise:Function):Function {
		return function(...args):* {
			return condition.apply(null, args) ?
				then.apply(null, args) :
				otherwise.apply(null, args);
		}
	}
}