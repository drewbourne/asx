package asx.datetime.base
{
	import asx.date.timeAsMillis;
	import asx.datetime.*;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.isFalse;

	public class AbstractDurationTest
	{
		private const millis:Number = timeAsMillis(5, 45, 23, 987);

		[Test]
		public function millis_should_be_given_value():void 
		{
			var duration:Duration = new Duration(millis);

			assertThat(duration.millis, equalTo(millis));
		}

		[Test]
		public function equals_with_same_instance_should_be_equal():void 
		{
			var duration:Duration = new Duration(millis);

			assertThat(duration.equals(duration), isTrue());
		}

		[Test]
		public function equals_with_same_millis_should_be_equal():void 
		{
			var duration1:Duration = new Duration(millis);
			var duration2:Duration = new Duration(millis);

			assertThat(duration1.equals(duration2), isTrue());
		}

		[Test]
		public function equals_with_different_millis_should_not_be_equal():void 
		{
			var duration1:Duration = new Duration(millis);
			var duration2:Duration = new Duration(millis + 1);

			assertThat(duration1.equals(duration2), isFalse());
		}

		[Test]
		public function compareTo():void 
		{
			var base:Duration = new Duration(millis);
			var same:Duration = new Duration(millis);
			var longer:Duration = new Duration(millis + 1);
			var shorter:Duration = new Duration(millis - 1);

			assertThat(".compareTo(base)", base.compareTo(base), equalTo(0));
			assertThat(".compareTo(same)", base.compareTo(same), equalTo(0));
			assertThat(".compareTo(longer)", base.compareTo(longer), equalTo(-1));
			assertThat(".compareTo(shorter)", base.compareTo(shorter), equalTo(1));
		}

		[Test]
		public function isEqual():void 
		{
			var base:Duration = new Duration(millis);
			var same:Duration = new Duration(millis);
			var longer:Duration = new Duration(millis + 1);
			var shorter:Duration = new Duration(millis - 1);

			assertThat(".isEqual(base)", base.isEqual(base), isTrue());
			assertThat(".isEqual(same)", base.isEqual(same), isTrue());
			assertThat(".isEqual(longer)", base.isEqual(longer), isFalse());
			assertThat(".isEqual(shorter)", base.isEqual(shorter), isFalse());
		}

		[Test]
		public function isLongerThan():void 
		{
			var base:Duration = new Duration(millis);
			var same:Duration = new Duration(millis);
			var longer:Duration = new Duration(millis + 1);
			var shorter:Duration = new Duration(millis - 1);

			assertThat(".isLongerThan(base)", base.isLongerThan(base), isFalse());
			assertThat(".isLongerThan(same)", base.isLongerThan(same), isFalse());
			assertThat(".isLongerThan(longer)", base.isLongerThan(longer), isFalse());
			assertThat(".isLongerThan(shorter)", base.isLongerThan(shorter), isTrue());
		}

		[Test]
		public function isShorterThan():void 
		{
			var base:Duration = new Duration(millis);
			var same:Duration = new Duration(millis);
			var longer:Duration = new Duration(millis + 1);
			var shorter:Duration = new Duration(millis - 1);

			assertThat(".isShorterThan(base)", base.isShorterThan(base), isFalse());
			assertThat(".isShorterThan(same)", base.isShorterThan(same), isFalse());
			assertThat(".isShorterThan(longer)", base.isShorterThan(longer), isTrue());
			assertThat(".isShorterThan(shorter)", base.isShorterThan(shorter), isFalse());
		}

		[Test]
		public function toDuration_should_be_equivalent_duration():void 
		{
			var base:Duration = new Duration(millis);
			var duration:Duration = base.toDuration();

			assertThat(".equals()", duration.equals(base), isTrue());
		}

		[Test]
		public function valueOf_should_be_value_of_millis():void 
		{
			var duration:Duration = new Duration(millis);

			assertThat(duration.valueOf(), equalTo(millis));
		}

		[Test]
		public function toString_should_be_formatted_with_millis_value():void 
		{
			var duration:Duration = new Duration(millis);

			assertThat(duration.toString(), equalTo('[Duration millis=' + millis + ']'));
		}
	}
}
