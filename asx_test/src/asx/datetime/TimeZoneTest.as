package asx.datetime
{
	import asx.date.hoursAsMillis;
	import asx.date.minutesAsMillis;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.isFalse;

	public class TimeZoneTest
	{
		[Test]
		public function equals_with_same_instance_should_be_equal():void 
		{
			var timezone:TimeZone = new TimeZone(0, 'Z');

			assertThat(".equals()", timezone.equals(timezone), isTrue());
		}

		[Test]
		public function equals_with_same_millis_should_be_equal():void 
		{
			var timezone1:TimeZone = new TimeZone(hoursAsMillis(1), '+01:00');
			var timezone2:TimeZone = new TimeZone(hoursAsMillis(1), '+01:00');

			assertThat(".equals()", timezone1.equals(timezone2), isTrue());
		}

		[Test]
		public function equals_with_different_millis_should_not_be_equal():void 
		{
			var timezone1:TimeZone = new TimeZone(0, 'Z');
			var timezone2:TimeZone = new TimeZone(minutesAsMillis(30), '+00:30');

			assertThat(".equals()", timezone1.equals(timezone2), isFalse());
		}
	}
}
