package asx.number
{
	// -1 is bad, default to 2
	/**
	 * Convert a number to a string with the set precision (number of values after the decimal point).
	 * 
	 * @param value The Number to convert
	 * @param precision The number of decimal places to include in the returned string
	 * @return The converted number
	 */
	public function precision( value:Number, precision:int = 2 ):String
	{
		if( precision == -1 ) return value.toString();
		
		var v:String = "";
		
		// ignoring localisation, *sigh*
		var numArray:Array = value.toString().split('.');
		
		if( precision > 0 )
		{
			var decimalVal:String = numArray[1] ? String(numArray[1]) : "";
			var fraction:String = decimalVal + "000000000000000000000000000000000";
			v = numArray[0] + '.' + fraction.substr(0, precision);
		}
		else
		{
			v = String( numArray[0] );
		}
		
		// todo: enable the removal of .0 by an option parameter
		// replace .0 if 
		// v = v.replace( /\.0$/, '' );
		
		return v;
	}
}