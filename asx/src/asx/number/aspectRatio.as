package asx.number
{
	/**
	 * Calculate the Aspect Ratio of a width and height.
	 * 
	 * @param width Number
	 * @param height Number
	 * @returns Array of Number [ widthFactor, heightFactor ]
	 * 
	 * @see asx.number#gcd()
	 * 
	 * @example
	 * <listing version="3.0">
	 * 
	 * 	var r:Array = aspectRatio(1920, 1080);
	 * 	var s:String = substitute("{}:{}", r);
	 * 	trace(s);
	 * 	// "16:9"
	 * 
	 * </listing>
	 */
	public function aspectRatio(width:Number, height:Number):Array 
	{
		var divisor:Number = gcd(width, height);
		return [ width / divisor, height / divisor ];
	}
}