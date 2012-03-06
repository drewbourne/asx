package asx.datetime
{
	/**
	 * An exact duration of time in milliseconds.
	 */
	public interface IReadableDuration
	{
		function get millis():Number;

		function equals(readableDuration:Object):Boolean;

		function isEqual(duration:IReadableDuration):Boolean;

		function isLongerThan(duration:IReadableDuration):Boolean;

		function isShorterThan(duration:IReadableDuration):Boolean;

		function toDuration():Duration;

		// function toPeriod():Period;

		function toString():String;
	}
}