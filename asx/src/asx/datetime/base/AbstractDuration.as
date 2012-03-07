package asx.datetime.base
{
	import asx.datetime.*;
	import asx.string.formatToString;

	public class AbstractDuration implements IReadableDuration
	{
		public function AbstractDuration(millis:Number)
		{
			_millis = millis;
		}

		private var _millis:Number;

		public function get millis():Number 
		{
			return _millis;
		}

		public function equals(readableDuration:Object):Boolean
		{
			if (readableDuration is IReadableDuration)
			{
				return isEqual(readableDuration as IReadableDuration);
			}

			return false;
		}

		public function compareTo(readableDuration:Object):int 
		{
			if (!(readableDuration is Duration))
			{
				throw new ArgumentError("Unsupported value, expected IReadableDuration, received " + readableDuration);
			}

			var duration:IReadableDuration = readableDuration as IReadableDuration;

			if (isShorterThan(duration))
			{
				return -1;
			}
			else if (isLongerThan(duration))
			{
				return 1;
			}
			else 
			{
				return 0;
			}
		}

		public function isEqual(duration:IReadableDuration):Boolean 
		{
			return millis === duration.millis;
		}

		public function isLongerThan(duration:IReadableDuration):Boolean
		{
			return millis > duration.millis;
		}

		public function isShorterThan(duration:IReadableDuration):Boolean
		{
			return millis < duration.millis;
		}

		public function valueOf():Object 
		{
			return millis;
		}

		public function toDuration():Duration
		{
			return new Duration(millis);
		}

		public function toString():String 
		{
			return formatToString(this, 'AbstractDuration', ['millis']);
		}
	}
}