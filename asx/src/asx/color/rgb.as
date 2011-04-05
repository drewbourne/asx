package asx.color
{
	import asx.number.bound;

	/**
	 * Converts separate Red, Green, Blue 0-255 values to an single int.
	 * 
	 * NOTE Colours are bounded between 0 and 255.
	 */
	public function rgb(red:int, green:int, blue:int):int
	{
		red = bound(red, 0, 255);
		green = bound(green, 0, 255);
		blue = bound(blue, 0, 255);
		
		return (red << 16) | (green << 8) | blue;
	}
}