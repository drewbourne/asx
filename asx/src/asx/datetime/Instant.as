package asx.datetime
{
	import asx.datetime.base.AbstractInstant;
	import asx.string.formatToString;	

	public class Instant extends AbstractInstant implements IReadableInstant
	{
		public function Instant(millis:Number)
		{
			super(millis, TimeZone.UTC);
		}

		public function plus(duration:IReadableDuration):Instant
		{
			return withDurationAdded(duration, 1);
		}

		public function minus(duration:IReadableDuration):Instant
		{
			return withDurationRemoved(duration, 1);
		}

		public function withDurationAdded(duration:IReadableDuration, scalar:int = 1):Instant
		{
			return scalar === 0 ? this : new Instant(millis + (duration.millis * scalar));
		}

		public function withDurationRemoved(duration:IReadableDuration, scalar:int = 1):Instant
		{
			return scalar === 0 ? this : new Instant(millis - (duration.millis * scalar));
		}

		override public function toString():String
		{
			return formatToString(this, 'Instant', ['millis']);
		}
	}
}