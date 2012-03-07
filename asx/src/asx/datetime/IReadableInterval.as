package asx.datetime
{
	// start is inclusive
	// end is exclusive

	public interface IReadableInterval
	{
		// function get start():DateTime;

		// function get end():DateTime;

		function get startMillis():Number;

		function get endMillis():Number;

		function equals(readableInterval:Object):Boolean;

		function containsInterval(interval:IReadableInterval):Boolean;

		function containsInstant(instant:IReadableInstant):Boolean;

		function overlaps(interval:IReadableInterval):Boolean;

		function isEqual(interval:IReadableInterval):Boolean;

		function isAfterInterval(interval:IReadableInterval):Boolean;

		function isAfterInstant(instant:IReadableInstant):Boolean;

		function isBeforeInterval(interval:IReadableInterval):Boolean;

		function isBeforeInstant(instant:IReadableInstant):Boolean;

		function toDuration():Duration;

		function toDurationMillis():Number;

		function toInterval():Interval;

		// function toPeriod():Period;

		function valueOf():Object;

		function toString():String;
	}
}