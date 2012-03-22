package asx.datetime
{
	import asx.datetime.base.AbstractInterval;
	import asx.string.formatToString;

	public class Interval extends AbstractInterval implements IReadableInterval
	{
		public function Interval(startMillis:Number, endMillis:Number)
		{
			super(startMillis, endMillis);
		}

		// Does this interval abut with the interval specified
		public function abuts(interval:IReadableInterval):Boolean 
		{
			return startMillis == interval.endMillis
				|| endMillis == interval.startMillis;
		}

		// Gets the gap between this interval and another interval.
		public function gap(interval:IReadableInterval):Interval 
		{
			if (!interval)
			{
				// TODO measure gap to _now_
				return null;
			}

			if (abuts(interval) || overlaps(interval) || equals(interval))
			{
				return null;
			}

			var gapStartMillis:Number;
			var gapEndMillis:Number;

			if (isAfterInterval(interval))
			{
				gapStartMillis = interval.endMillis + 1;
				gapEndMillis = startMillis - 1;
			}
			
			if (isBeforeInterval(interval))
			{
				gapStartMillis = endMillis + 1;
				gapEndMillis = interval.startMillis - 1;
			}

			return new Interval(gapStartMillis, gapEndMillis);
		}

		// Creates a new interval with the specified duration after the start instant.
		public function withDurationAfterStart(duration:IReadableDuration):Interval
		{
			return null;
		}

		// Creates a new interval with the specified duration before the end instant.
		public function withDurationBeforeEnd(duration:IReadableDuration):Interval
		{
			return null;
		}

		// public function withPeriodAfterStart(start:IReadablePeriod):Interval 
		// {
		// }

		// public function withPeriodABeforeEnd(end:IReadablePeriod):Interval 
		// {
		// }

		// Creates a new interval with the specified start instant.
		public function withStart(start:IReadableInstant):Interval 
		{
			return null;
		}

		// Creates a new interval with the specified end instant.
		public function withEnd(end:IReadableInstant):Interval 
		{
			return null;
		}

		public function withStartMillis(startMillis:Number):Interval 
		{
			return null;
		}

		public function withEndMillis(endMillis:Number):Interval
		{
			return null;
		}

		override public function toString():String
		{
			return formatToString(this, 'Interval', ['startMillis', 'endMillis']);
		}
	}
}