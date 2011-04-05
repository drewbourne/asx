package asx.number
{
	/**
	 * Lowest Common Multiple. 
	 * 
	 * @param a Number
	 * @param b Number
	 * @returns Number
	 */
	public function lcm(a:Number, b:Number):Number 
	{
		return (a / gcd(a,b)) * b;
	}
}