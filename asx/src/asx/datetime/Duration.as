package asx.datetime
{
	import asx.datetime.base.AbstractDuration;
	import asx.string.formatToString;

	public class Duration extends AbstractDuration implements IReadableDuration
	{
		public function Duration(millis:Number)
		{
			super(millis);
		}

		public function plus(duration:IReadableDuration):Duration 
		{
			return withDurationAdded(duration, 1);
		}

		public function minus(duration:IReadableDuration):Duration 
		{
			return withDurationRemoved(duration, 1);
		}

		public function withDurationAdded(duration:IReadableDuration, scalar:int = 1):Duration
		{
			return scalar === 0 ? this : new Duration(millis + (duration.millis * scalar));
		}

		public function withDurationRemoved(duration:IReadableDuration, scalar:int = 1):Duration
		{
			return scalar === 0 ? this : new Duration(millis - (duration.millis * scalar));
		}

		override public function toString():String 
		{
			return formatToString(this, 'Duration', ['millis']);
		}
	}
}