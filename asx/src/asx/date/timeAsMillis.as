package asx.date
{
	public function timeAsMillis(hours:Number = 0, minutes:Number = 0, seconds:Number = 0, millis:Number = 0):Number 
	{
		return hoursAsMillis(hours)
			 + minutesAsMillis(minutes)
			 + secondsAsMillis(seconds)
			 + millis;
	}
}