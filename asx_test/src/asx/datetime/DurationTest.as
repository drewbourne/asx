package asx.datetime
{
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.core.not;

	public class DurationTest
	{
		[Test]
		public function plus_with_non_zero_duration():void 
		{
			var duration:Duration = new Duration(100);
			var toAdd:Duration = new Duration(2000);
			var added:Duration = duration.plus(toAdd);

			assertThat("millis", added.millis, equalTo(2100));
			assertThat("should return new instance", added, not(equalTo(duration)));
			assertThat("should return new instance", added, not(equalTo(toAdd)));
		}

		[Test]
		public function minus_with_non_zero_duration():void 
		{
			var duration:Duration = new Duration(100);
			var toRemove:Duration = new Duration(2000);
			var removed:Duration = duration.minus(toRemove);

			assertThat("millis", removed.millis, equalTo(-1900));
			assertThat("should return new instance", removed, not(equalTo(duration)));
			assertThat("should return new instance", removed, not(equalTo(toRemove)));
		}

		[Test]
		public function withDurationAdded():void 
		{
			var duration:Duration = new Duration(100);
			var toAdd:Duration = new Duration(200);

			assertThat("scalar = 0", duration.withDurationAdded(toAdd, 0).millis, equalTo(100));
			assertThat("scalar = 1", duration.withDurationAdded(toAdd, 1).millis, equalTo(300));
			assertThat("scalar = 2", duration.withDurationAdded(toAdd, 2).millis, equalTo(500));

			assertThat("scalar = 0 should return same instance", duration.withDurationAdded(toAdd, 0), equalTo(duration));
			assertThat("scalar != 0 should return new instance", duration.withDurationAdded(toAdd, 1), not(equalTo(duration)));
		}

		[Test]
		public function withDurationRemoved():void 
		{
			var duration:Duration = new Duration(1000);
			var toRemove:Duration = new Duration(200);

			assertThat("scalar = 0", duration.withDurationRemoved(toRemove, 0).millis, equalTo(1000));
			assertThat("scalar = 1", duration.withDurationRemoved(toRemove, 1).millis, equalTo(800));
			assertThat("scalar = 2", duration.withDurationRemoved(toRemove, 2).millis, equalTo(600));

			assertThat("scalar = 0 should return same instance", duration.withDurationRemoved(toRemove, 0), equalTo(duration));
			assertThat("scalar != 0 should return new instance", duration.withDurationRemoved(toRemove, 1), not(equalTo(duration)));
		}
	}
}