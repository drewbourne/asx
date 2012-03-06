package asx.date
{
	public function hoursAsMillis(hours:Number):Number 
	{
		return hours * minutesAsMillis(60);
	}
}