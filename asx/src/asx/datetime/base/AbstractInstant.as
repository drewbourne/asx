package asx.datetime.base
{
	import asx.datetime.*;
	import asx.string.formatToString;

	public class AbstractInstant implements IReadableInstant
	{
		public function AbstractInstant(millis:Number, timezone:TimeZone)
		{
			_millis = millis;
			_timezone = timezone;
		}

		private var _millis:Number;

		public function get millis():Number 
		{
			return _millis;
		}

		private var _timezone:ITimeZone;

		public function get timezone():ITimeZone 
		{
			return _timezone;
		}

		public function equals(readableInstant:Object):Boolean
		{
			if (readableInstant is IReadableInstant)
			{
				return isEqual(readableInstant as IReadableInstant);
			}

			return false;
		}

		public function compareTo(readableInstant:Object):int
		{
			if (!(readableInstant is IReadableInstant))
			{
				throw new ArgumentError("Unsupported value, expected IReadableInstant, received " + readableInstant);
			}

			var instant:IReadableInstant = readableInstant as IReadableInstant;

			if (isBefore(instant))
			{
				return -1;
			}
			else if (isAfter(instant))
			{
				return 1;
			}
			else 
			{
				return 0;
			}
		}

		public function isBefore(instant:IReadableInstant):Boolean
		{
			return valueOf() < instant.valueOf();
		}

		public function isAfter(instant:IReadableInstant):Boolean
		{
			return valueOf() > instant.valueOf();
		}

		public function isEqual(instant:IReadableInstant):Boolean
		{
			return valueOf() === instant.valueOf();
		}

		public function toInstant():Instant
		{
			return new Instant(Number(valueOf()));
		}

		public function toString():String
		{
			return formatToString(this, 'AbstractInstant', ['millis', 'timezone']);
		}

		public function valueOf():Object
		{
			return millis + timezone.offsetMillis;
		}
	}
}