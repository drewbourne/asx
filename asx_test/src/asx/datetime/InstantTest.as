package asx.datetime
{
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.core.not;

	public class InstantTest
	{
		[Test]
		public function plus_withDuration():void 
		{
			var instant:Instant = new Instant(100);
			var duration:Duration = new Duration(200);
			var added:Instant = instant.plus(duration);

			assertThat("millis", added.millis, equalTo(300));
			assertThat("with non-zero duration should return new instance", added, not(equalTo(instant)));
		}

		[Test]
		public function minus_withDuration():void 
		{
			var instant:Instant = new Instant(100);
			var duration:Duration = new Duration(200);
			var removed:Instant = instant.minus(duration);

			assertThat("millis", removed.millis, equalTo(-100));
			assertThat("with non-zero duration removed should return new instance", removed, not(equalTo(instant)));
		}

		[Test]
		public function withDurationAdded():void 
		{
			var instant:Instant = new Instant(100);
			var duration:Duration = new Duration(200);

			assertThat("scalar = 0", instant.withDurationAdded(duration, 0).millis, equalTo(100));
			assertThat("scalar = 1", instant.withDurationAdded(duration, 1).millis, equalTo(300));
			assertThat("scalar = 2", instant.withDurationAdded(duration, 2).millis, equalTo(500));

			assertThat("scalar = 0 should return same instance", instant.withDurationAdded(duration, 0), equalTo(instant));
			assertThat("scalar != 0 should return new instance", instant.withDurationAdded(duration, 1), not(equalTo(instant)));
		}

		[Test]
		public function withDurationRemoved():void 
		{
			var instant:Instant = new Instant(100);
			var duration:Duration = new Duration(200);

			assertThat("scalar = 0", instant.withDurationRemoved(duration, 0).millis, equalTo(100));
			assertThat("scalar = 1", instant.withDurationRemoved(duration, 1).millis, equalTo(-100));
			assertThat("scalar = 2", instant.withDurationRemoved(duration, 2).millis, equalTo(-300));

			assertThat("scalar = 0 should return same instance", instant.withDurationRemoved(duration, 0), equalTo(instant));
			assertThat("scalar != 0 should return new instance", instant.withDurationRemoved(duration, 1), not(equalTo(instant)));
		}
	}
}
