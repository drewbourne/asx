package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function args(...args):Array {
		return merge.apply(null, args);
	}	
}

internal const merge:Function = [].concat;