package asx.number
{
	/**
	 * Greatest Common Divisor.
	 * 
	 * @param a Number
	 * @param b Number
	 * @returns Number
	 */
	public function gcd(a:Number, b:Number):Number 
	{
		var t:Number;
		while (b != 0)
		{
			t = b;
			b = a % b;
			a = t;
		}
		return a;		
	}
}