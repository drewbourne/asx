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
			if (duration && duration.millis < 0)
			{
				throw new ArgumentError("Interval#withDurationAfterStart() received negative Duration: " + duration);
			}

			return new Interval(startMillis, startMillis + (duration ? duration.millis : 0));
		}

		// Creates a new interval with the specified duration before the end instant.
		public function withDurationBeforeEnd(duration:IReadableDuration):Interval
		{
			if (duration && duration.millis < 0)
			{
				throw new ArgumentError("Interval#withDurationBeforeEnd() received negative Duration: " + duration);
			}

			return new Interval(endMillis - (duration ? duration.millis : 0), endMillis);
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
			if (!start)
			{
				// TODO sets start to now. 
				return null;
			}

			return withStartMillis(start.millis);
		}

		// Creates a new interval with the specified end instant.
		public function withEnd(end:IReadableInstant):Interval 
		{
			if (!end)
			{
				// TODO sets start to now. 
				return null;
			}

			return withEndMillis(end.millis);
		}

		public function withStartMillis(millis:Number):Interval 
		{
			return new Interval(millis, endMillis);
		}

		public function withEndMillis(millis:Number):Interval
		{
			return new Interval(startMillis, millis);
		}

		override public function toString():String
		{
			return formatToString(this, 'Interval', ['startMillis', 'endMillis']);
		}
	}
}