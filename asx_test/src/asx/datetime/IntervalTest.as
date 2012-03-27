package asx.datetime
{
	import asx.date.timeAsMillis;
	import asx.datetime.*;

	import org.flexunit.assertThat;
	import org.flexunit.asserts.fail;
	import org.hamcrest.core.throws;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.instanceOf;
	import org.hamcrest.object.nullValue;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.text.containsString;

	public class IntervalTest
	{
		private const START_MILLIS:Number = 100;
		private const END_MILLIS:Number = 200;
		private const DURATION_MILLIS:Number = 500;

		[Test]
		public function abuts_with_zero_duration():void 
		{
			var interval:Interval = new Interval(START_MILLIS, START_MILLIS);
			var noDuration:Interval = new Interval(START_MILLIS, START_MILLIS);

			assertThat(".abuts(noDuration)", interval.abuts(noDuration), isTrue());
		}

		[Test]
		public function abuts_with_abutting_intervals():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var abutBefore:Interval = new Interval(START_MILLIS - 1, START_MILLIS);
			var abutAfter:Interval = new Interval(END_MILLIS, END_MILLIS + 1);

			assertThat(".abuts(abutBefore)", interval.abuts(abutBefore), isTrue());
			assertThat(".abuts(abutAfter)", interval.abuts(abutBefore), isTrue());
		}

		[Test]
		public function abuts_with_non_abutting_intervals():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Interval = new Interval(START_MILLIS - 2, START_MILLIS - 1);
			var after:Interval = new Interval(END_MILLIS + 1, END_MILLIS + 2);

			assertThat(".abuts(before)", interval.abuts(before), isFalse());
			assertThat(".abuts(after)", interval.abuts(after), isFalse());
		}

		[Test]
		public function abuts_with_overlapping_intervals():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Interval = new Interval(START_MILLIS - 1, END_MILLIS - 1);
			var after:Interval = new Interval(START_MILLIS + 1, END_MILLIS + 1);

			assertThat(".abuts(before)", interval.abuts(before), isFalse());
			assertThat(".abuts(after)", interval.abuts(after), isFalse());	
		}

		[Ignore]
		[Test]
		public function gap_with_null_should_return_interval_to_now():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);

			fail("requires a millis provider");
		}

		[Test]
		public function gap_with_overlapping_intervals_should_return_null():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Interval = new Interval(START_MILLIS - 1, END_MILLIS - 1);
			var after:Interval = new Interval(START_MILLIS + 1, END_MILLIS + 1);

			assertThat(".gap(before)", interval.gap(before), nullValue());
			assertThat(".gap(after)", interval.gap(before), nullValue());
		}

		[Test]
		public function gap_with_abutting_intervals_should_return_null():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Interval = new Interval(START_MILLIS - 1, START_MILLIS);
			var after:Interval = new Interval(END_MILLIS, END_MILLIS + 1);

			assertThat(".gap(before)", interval.gap(before), nullValue());
			assertThat(".gap(after)", interval.gap(before), nullValue());
		}

		[Test]
		public function gap_should_return_interval():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var before:Interval = new Interval(START_MILLIS - 5, START_MILLIS - 4);
			var after:Interval = new Interval(END_MILLIS + 7, END_MILLIS + 9);

			var gapBefore:Interval = interval.gap(before);
			var gapAfter:Interval = interval.gap(after);

			assertThat(".gap(before).startMillis", gapBefore.startMillis, equalTo(before.endMillis + 1));
			assertThat(".gap(before).endMillis", gapBefore.endMillis, equalTo(interval.startMillis - 1));
			assertThat(".gap(after).startMillis", gapAfter.startMillis, equalTo(interval.endMillis + 1));
			assertThat(".gap(after).endMillis", gapAfter.endMillis, equalTo(after.startMillis - 1));
		}

		[Test]
		public function withDurationAfterStart_with_null():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var zero:Interval = interval.withDurationAfterStart(null);

			assertThat(".startMillis", zero.startMillis, equalTo(START_MILLIS));
			assertThat(".endMillis", zero.endMillis, equalTo(START_MILLIS));
		}

		[Test]
		public function withDurationAfterStart_with_positive_duration():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var duration:Duration = new Duration(DURATION_MILLIS);
			var after:Interval = interval.withDurationAfterStart(duration);

			assertThat(".startMillis", after.startMillis, equalTo(START_MILLIS));
			assertThat(".endMillis", after.endMillis, equalTo(START_MILLIS + DURATION_MILLIS));
		}

		[Test(expected="ArgumentError")]
		public function withDurationAfterStart_with_negative_duration():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var duration:Duration = new Duration(-DURATION_MILLIS);
			
			interval.withDurationAfterStart(duration);
		}

		[Test]
		public function withDurationBeforeEnd_with_null():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var zero:Interval = interval.withDurationBeforeEnd(null);

			assertThat(".startMillis", zero.startMillis, equalTo(END_MILLIS));
			assertThat(".endMillis", zero.endMillis, equalTo(END_MILLIS));
		}

		[Test]
		public function withDurationBeforeEnd_with_positive_duration():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var duration:Duration = new Duration(DURATION_MILLIS);
			var after:Interval = interval.withDurationBeforeEnd(duration);

			assertThat(".startMillis", after.startMillis, equalTo(END_MILLIS - DURATION_MILLIS));
			assertThat(".endMillis", after.endMillis, equalTo(END_MILLIS));
		}

		[Test(expected="ArgumentError")]
		public function withDurationBeforeEnd_with_negative_duration():void 
		{
			var interval:Interval = new Interval(START_MILLIS, END_MILLIS);
			var duration:Duration = new Duration(-DURATION_MILLIS);
			
			interval.withDurationBeforeEnd(duration);
		}

		[Test]
		public function withStart():void 
		{

		}

		[Test]
		public function withEnd():void 
		{

		}

		[Test]
		public function withStartMillis():void 
		{

		}

		[Test]
		public function withEndMillis():void 
		{

		}
	}
}
