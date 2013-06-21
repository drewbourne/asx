package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function bindSetProp(instance:Object, field:String):Function {
		return function(val:*):void {
			instance[field] = val;
		};
	}
}