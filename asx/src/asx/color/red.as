package asx.color
{
	/**
	 * Get the Red component of a color.
	 */
	public function red(color:int):int
	{
		return (( color >> 16 ) & 0xFF);
	}
}