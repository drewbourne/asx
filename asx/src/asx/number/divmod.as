package asx.number
{
	/**
	 * Return a pair of numbers consisting of their quotient and remainder.
	 * 
	 * (see http://docs.python.org/library/functions.html#divmod)
	 *  
	 * @param n Number
	 * @param divisor Number
	 * @return Array [quotient, remainder]
	 * 
	 * @example
	 * <listing version="3.0">
	 * 
	 * 	
	 * 
	 * </listing>
	 */
	public function divmod(n:Number, divisor:Number):Array {
		return [ Math.floor(div(n, divisor)), mod(n, divisor) ];
	}
}