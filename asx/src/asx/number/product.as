package asx.number {
    
	import asx.array.inject;
	
	/**
	 * Calculate the product of an Array of Number
	 * 
	 * @param numbers An Array of Number for which to calculate the product
	 * @return The product of the numbers
	 */
	public function product( numbers:Array ):Number {
	    
	    var result:Number = 1;
	    for each (var number:Number in numbers) {
	        result *= number;
	    }
	    return result;
	    
//	    return Number(inject(numbers, 1, function( a:Number, b:Number ):Number {
//			return a * b;
//		}));
//	    
//		return Number(inject(numbers, 1, mul));
	}
}