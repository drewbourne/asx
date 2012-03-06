package asx.datetime
{
	/**
	 * An Instant is defined as an instant in the datetime continuum specified as 
	 * a number of milliseconds from 1970-01-01T00:00Z. This definition of 
	 * milliseconds is consistent with that of <code>Date</code> in ActionScript 3.
	 */
	public interface IReadableInstant
	{
		function get millis():Number;

		function get timezone():ITimeZone;

		function equals(reableInstant:Object):Boolean;

		function compareTo(readableInstant:Object):int;

		function isBefore(instant:IReadableInstant):Boolean;

		function isAfter(instant:IReadableInstant):Boolean;

		function isEqual(instant:IReadableInstant):Boolean;

		function toInstant():Instant;

		function toString():String;

		function valueOf():Object;
	}	
}
