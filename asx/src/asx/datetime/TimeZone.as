package asx.datetime
{
	import asx.string.formatToString;

	public class TimeZone implements ITimeZone
	{
		public static const UTC:TimeZone = new TimeZone(0, 'UTC');

		public function TimeZone(offsetMillis:Number, id:String = null)
		{
			_offsetMillis = offsetMillis;
			_id = id;
		}

		private var _offsetMillis:Number;

		public function get offsetMillis():Number 
		{
			return _offsetMillis;
		}

		private var _id:String;

		public function get id():String 
		{
			return _id;
		}

		public function equals(timezone:Object):Boolean 
		{
			if (timezone is ITimeZone)
			{
				return offsetMillis === (timezone as ITimeZone).offsetMillis;
			}

			return false;
		}

		public function toString():String 
		{
			return formatToString(this, 'TimeZone', ['offsetMillis', 'id']);
		}
	}
}