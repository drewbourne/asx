package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function pull(instance:Object, field:String, ...args):Function {
		return function(...rest):* {
			const val:* = instance[field];
			return val is Function ? val.apply(instance, args) : val;
		}
	}
}