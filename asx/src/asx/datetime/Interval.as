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

		override public function toString():String
		{
			return formatToString(this, 'Interval', ['startMillis', 'endMillis']);
		}
	}
}