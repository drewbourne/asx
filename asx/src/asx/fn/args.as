package asx.fn
{
	/**
	 * @author ptaylor
	 */
	public function args(...args):Array {
		return merge(args);
	}	
}

internal const merge:Function = [].concat;