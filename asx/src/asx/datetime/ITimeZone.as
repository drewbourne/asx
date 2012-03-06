package asx.datetime
{
	public interface ITimeZone
	{
		function get offsetMillis():Number;

		function equals(timezone:Object):Boolean;

		function toString():String;
	}
}