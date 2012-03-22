package asx.datetime.base
{
	import asx.datetime.*;
	import asx.string.formatToString;

	public class AbstractInterval implements IReadableInterval
	{
		public function AbstractInterval(startMillis:Number, endMillis:Number)
		{
			if (startMillis > endMillis)
			{
				throw new ArgumentError("startMillis is after endMillis, received: startMillis=" + startMillis + " endMillis=" + endMillis);
			}

			_startMillis = startMillis;
			_endMillis = endMillis;
		}

		private var _startMillis:Number;

		public function get startMillis():Number
		{
			return _startMillis;
		}

		private var _endMillis:Number;

		public function get endMillis():Number
		{
			return _endMillis;
		}

		/*
		private var _start:DateTime;

		public function get start():DateTime
		{
			return null;
		}

		private var _end:DateTime;

		public function get end():DateTime
		{
			return null;
		}
		*/

		public function equals(readableInterval:Object):Boolean
		{
			if (readableInterval is IReadableInterval)
			{
				return isEqual(readableInterval as IReadableInterval);
			}

			return false;
		}

		public function containsInterval(interval:IReadableInterval):Boolean
		{
			return startMillis <= interval.startMillis
				&& endMillis >= interval.endMillis;
		}

		public function containsInstant(instant:IReadableInstant):Boolean
		{
			// start is inclusive
			// end is exclusive

			return startMillis <= instant.millis
				&& endMillis > instant.millis;
		}

		public function overlaps(interval:IReadableInterval):Boolean
		{
			if (startMillis > interval.endMillis)
			{
				return false
			}
			else if (endMillis < interval.startMillis)
			{
				return false;
			}
			else 
			{
				return true;
			}
		}

		public function isEqual(interval:IReadableInterval):Boolean
		{
			return (startMillis === interval.startMillis && endMillis === interval.endMillis);
		}

		public function isAfterInterval(interval:IReadableInterval):Boolean
		{
			return startMillis > interval.startMillis;
		}

		public function isAfterInstant(instant:IReadableInstant):Boolean
		{
			return startMillis > instant.millis;
		}

		public function isBeforeInterval(interval:IReadableInterval):Boolean
		{
			return endMillis < interval.endMillis;
		}

		public function isBeforeInstant(instant:IReadableInstant):Boolean
		{
			return endMillis < instant.millis;
		}

		public function toDuration():Duration
		{
			return new Duration(toDurationMillis());
		}

		public function toDurationMillis():Number
		{
			return endMillis - startMillis;
		}

		public function toInterval():Interval
		{
			return new Interval(startMillis, endMillis);
		}

		// function toPeriod():Period;

		public function valueOf():Object
		{
			return this;
		}

		public function toString():String
		{
			return formatToString(this, 'AbstractInterval', ['startMillis', 'endMillis']);
		}
	}
}