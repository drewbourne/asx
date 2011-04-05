package asx.color
{
	/**
	 * Get the Green component of a color.
	 */
	public function green(color:int):int
	{
		return (( color >> 8 ) & 0xFF);
	}
}