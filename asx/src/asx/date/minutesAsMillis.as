package asx.date
{
	public function minutesAsMillis(minutes:Number):Number 
	{
		return minutes * secondsAsMillis(60);
	}
}