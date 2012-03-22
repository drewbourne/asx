package asx.datetime.base
{
	import asx.date.timeAsMillis;
	import asx.datetime.*;

	import org.flexunit.assertThat;
	import org.flexunit.asserts.fail;
	import org.hamcrest.core.throws;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.instanceOf;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.text.containsString;

	public class AbstractIntervalTest
	{
		private const START_MILLIS:Number = 100;
		private const END_MILLIS:Number = 200;

		private var interval:Interval;

		[Test]
		public function constructor_complains_when_startMillis_is_after_endMillis():void 
		{
			try 
			{
				new Interval(0, -1);
				fail("expected ArgumentError as startMillis is after endMillis");
			}
			catch (error:Error)
			{
				assertThat("expecting Argumented", error, instanceOf(ArgumentError));
				assertThat(error.message, containsString("startMillis is after endMillis"));
				assertThat(error.message, containsString("startMillis=0"));
				assertThat(error.message, containsString("endMillis=-1"));
			}
		}

		[Test]
		public function startMillis_should_be_given_value():void 
		{
			interval = new Interval(START_MILLIS, END_MILLIS);

			assertThat(interval.startMillis, equalTo(START_MILLIS));
		}

		[Test]
		public function endMillis_should_be_given_value():void 
		{
			interval = new Interval(START_MILLIS, END_MILLIS);

			assertThat(interval.endMillis, equalTo(END_MILLIS));
		}

		[Test]
		public function equals_with_same_instance_should_be_equal():void 
		{
			interval = new Interval(START_MILLIS, END_MILLIS);

			assertThat(interval.equals(interval), isTrue());
		}

		[Test]
		public function equals_with_same_startMillis_and_endMillis_should_be_equal():void 
		{
			var interval1:Interval = new Interval(START_MILLIS, END_MILLIS);
			var interval2:Interval = new Interval(START_MILLIS, END_MILLIS);

			assertThat(interval1.equals(interval2), isTrue());
		}

		[Test]
		public function equals_with_different_startMillis_and_endMillis_should_not_be_equal():void 
		{
			var interval1:Interval = new Interval(START_MILLIS, END_MILLIS);
			var interval2:Interval = new Interval(START_MILLIS, END_MILLIS - 1);
			var interval3:Interval = new Interval(START_MILLIS + 1, END_MILLIS - 1);

			assertThat(interval1.equals(interval2), isFalse());
			assertThat(interval1.equals(interval3), isFalse());
			assertThat(interval2.equals(interval3), isFalse());
		}

		[Test]
		public function containsInterval_with_equal_interval_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var same:Interval = new Interval(START_MILLIS, END_MILLIS);

			assertThat(interval.containsInterval(same), isTrue());
		}

		[Test]
		public function containsInterval_with_given_interval_within_startMillis_and_endMillis_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var insideStart:Interval = new Interval(START_MILLIS + 1, END_MILLIS);
			var insideEnd:Interval = new Interval(START_MILLIS, END_MILLIS - 1);

			assertThat("insideStart", interval.containsInterval(insideStart), isTrue());
			assertThat("insideEnd", interval.containsInterval(insideEnd), isTrue());
		}		

		[Test]
		public function containsInterval_with_given_internval_outside_startMillis_should_be_false():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var outsideStart:Interval = new Interval(START_MILLIS - 1, END_MILLIS);

			assertThat("outsideStart", interval.containsInterval(outsideStart), isFalse());
		}

		[Test]
		public function containsInterval_with_given_internval_outside_endMillis_should_be_false():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var outsideEnd:Interval = new Interval(START_MILLIS, END_MILLIS + 1);

			assertThat("outsideEnd", interval.containsInterval(outsideEnd), isFalse());
		}

		[Test]
		public function containsInstant_with_instant_at_startMillis_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var instant:Instant = new Instant(START_MILLIS);

			assertThat(interval.containsInstant(instant), isTrue());
		}

		[Test]
		public function containsInstant_with_instant_at_endMillis_should_be_false():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var instant:Instant = new Instant(END_MILLIS);

			assertThat(interval.containsInstant(instant), isFalse());
		}

		[Test]
		public function containsInstant_with_instant_between_startMillis_and_endMillis_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var instant:Instant = new Instant(START_MILLIS + 1);

			assertThat(interval.containsInstant(instant), isTrue());
		}

		[Test]
		public function overlaps_with_equal_interval_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var same:Interval = new Interval(START_MILLIS, END_MILLIS);

			assertThat(interval.overlaps(same), isTrue());
		}

		[Test]
		public function overlaps_with_interval_around_startMillis_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var aroundStart:Interval = new Interval(START_MILLIS - 1, START_MILLIS + 1);

			assertThat(interval.overlaps(aroundStart), isTrue());
			assertThat(aroundStart.overlaps(interval), isTrue());
		}

		[Test]
		public function overlaps_with_interval_around_endMillis_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var aroundEnd:Interval = new Interval(END_MILLIS - 1, END_MILLIS + 1);

			assertThat(interval.overlaps(aroundEnd), isTrue());
			assertThat(aroundEnd.overlaps(interval), isTrue());
		}

		[Test]
		public function overlaps_with_interval_around_interval_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var around:Interval = new Interval(START_MILLIS - 1, END_MILLIS + 1);

			assertThat(interval.overlaps(around), isTrue());
			assertThat(around.overlaps(interval), isTrue());
		}

		[Test]
		public function overlaps_with_interval_outside_startMillis_and_endMillis_should_be_true():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Interval = new Interval(START_MILLIS - 2, START_MILLIS - 1);
			var after:Interval = new Interval(END_MILLIS + 1, END_MILLIS + 2);

			assertThat(".overlaps(before)", interval.overlaps(before), isFalse());
			assertThat("before.overlaps()", before.overlaps(interval), isFalse());

			assertThat(".overlaps(after)", interval.overlaps(after), isFalse());
			assertThat("after.overlaps()", after.overlaps(interval), isFalse());
		}

		[Test]
		public function isAfterInterval():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Interval = new Interval(START_MILLIS - 2, START_MILLIS - 1);
			var after:Interval = new Interval(END_MILLIS + 1, END_MILLIS + 2);

			assertThat(".isAfterInterval(before)", interval.isAfterInterval(before), isTrue());
			assertThat(".isAfterInterval(after)", interval.isAfterInterval(after), isFalse());
		}

		[Test]
		public function isAfterInstant():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Instant = new Instant(START_MILLIS - 1);
			var after:Instant = new Instant(END_MILLIS + 1);

			assertThat(".isAfterInstant(before)", interval.isAfterInstant(before), isTrue());
			assertThat(".isAfterInstant(after)", interval.isAfterInstant(after), isFalse());
		}

		[Test]
		public function isBeforeInterval():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Interval = new Interval(START_MILLIS - 2, START_MILLIS - 1);
			var after:Interval = new Interval(END_MILLIS + 1, END_MILLIS + 2);

			assertThat(".isBeforeInterval(before)", interval.isBeforeInterval(before), isFalse());
			assertThat(".isBeforeInterval(after)", interval.isBeforeInterval(after), isTrue());
		}

		[Test]
		public function isBeforeInstant():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Instant = new Instant(START_MILLIS - 1);
			var after:Instant = new Instant(END_MILLIS + 1);

			assertThat(".isBeforeInstant(before)", interval.isBeforeInstant(before), isFalse());
			assertThat(".isBeforeInstant(after)", interval.isBeforeInstant(after), isTrue());
		}

		[Test]
		public function toDuration_should_have_millis_between_startMillis_and_endMillis():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var duration:Duration = interval.toDuration();

			assertThat(duration.millis, equalTo(END_MILLIS - START_MILLIS));
		}

		[Test]
		public function toDurationMillis_should_have_millis_between_startMillis_and_endMillis():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);

			assertThat(interval.toDurationMillis(), equalTo(END_MILLIS - START_MILLIS));
		}

		[Test]
		public function toInterval_should_be_equivalent_interval():void 
		{
			var base:Interval = new Interval(START_MILLIS, END_MILLIS);
			var interval:Interval = base.toInterval();

			assertThat(".equals()", interval.equals(base));
		}

		[Test]
		public function valueOf_should_be_self():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);

			assertThat(interval.valueOf(), equalTo(interval));
		}
	}
}