package asx.datetime.base
{
	import asx.datetime.*;

	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isTrue;
	import org.hamcrest.object.isFalse;

	public class AbstractInstantTest
	{
		[Test]
		public function millis():void 
		{
			var date:Date = new Date();
			var instant:Instant = new Instant(date.time);

			assertThat(instant.millis, equalTo(date.time));
		}

		[Test]
		public function timezone_should_be_UTC():void 
		{
			var date:Date = new Date();
			var instant:Instant = new Instant(date.time);

			assertThat(instant.timezone, equalTo(TimeZone.UTC));
		}

		[Test]
		public function equals_with_same_instance_should_be_equal():void 
		{
			var date:Date = new Date();
			var instant:Instant = new Instant(date.time);

			assertThat(".equals()", instant.equals(instant), isTrue());
		}

		[Test]
		public function equals_with_same_millis_should_be_equal():void 
		{
			var date:Date = new Date();
			var instant1:Instant = new Instant(date.time);
			var instant2:Instant = new Instant(date.time);

			assertThat(".equals()", instant1.equals(instant2), isTrue());
		}

		[Test]
		public function equals_with_different_millis_should_not_be_equal():void 
		{
			var date:Date = new Date();
			var instant1:Instant = new Instant(date.time);
			var instant2:Instant = new Instant(date.time + 1);

			assertThat(".equals()", instant1.equals(instant2), isFalse());
		}

		[Test]
		public function compareTo():void 
		{
			var date:Date = new Date();
			var base:Instant = new Instant(date.time);
			var same:Instant = new Instant(date.time);
			var before:Instant = new Instant(date.time - 1);
			var after:Instant = new Instant(date.time + 1);

			assertThat(".compareTo(before)", base.compareTo(before), equalTo(1));
			assertThat(".compareTo(same)", base.compareTo(same), equalTo(0));
			assertThat(".compareTo(after)", base.compareTo(after), equalTo(-1));
		}

		[Test]
		public function isBefore():void 
		{
			var date:Date = new Date();
			var base:Instant = new Instant(date.time);
			var same:Instant = new Instant(date.time);
			var before:Instant = new Instant(date.time - 1);
			var after:Instant = new Instant(date.time + 1);			

			assertThat(".isBefore(before)", base.isBefore(before), isFalse());
			assertThat(".isBefore(same)", base.isBefore(same), isFalse());
			assertThat(".isBefore(after)", base.isBefore(after), isTrue());
		}

		[Test]
		public function isAfter():void 
		{
			var date:Date = new Date();
			var base:Instant = new Instant(date.time);
			var same:Instant = new Instant(date.time);
			var before:Instant = new Instant(date.time - 1);
			var after:Instant = new Instant(date.time + 1);			

			assertThat(".isAfter(before)", base.isAfter(before), isTrue());
			assertThat(".isAfter(same)", base.isAfter(same), isFalse());
			assertThat(".isAfter(after)", base.isAfter(after), isFalse());
		}		

		[Test]
		public function isEqual():void 
		{
			var date:Date = new Date();
			var base:Instant = new Instant(date.time);
			var same:Instant = new Instant(date.time);
			var before:Instant = new Instant(date.time - 1);
			var after:Instant = new Instant(date.time + 1);			

			assertThat(".isEqual(before)", base.isEqual(before), isFalse());
			assertThat(".isEqual(base)", base.isEqual(base), isTrue());
			assertThat(".isEqual(same)", base.isEqual(same), isTrue());
			assertThat(".isEqual(after)", base.isEqual(after), isFalse());
		}

		[Test]
		public function toInstant_should_be_equivalent_instant():void 
		{
			var date:Date = new Date();
			var base:Instant = new Instant(date.time);
			var instant:Instant = base.toInstant();

			assertThat(".equals()", instant.equals(base), isTrue());
		}

		[Test]
		public function valueOf_should_be_value_of_millis():void 
		{
			var date:Date = new Date();
			var instant:Instant = new Instant(date.time);

			assertThat(instant.valueOf(), equalTo(date.time));
		}

		[Test]
		public function toString_should_be_formatted_with_millis_value():void 
		{
			var date:Date = new Date();
			var instant:Instant = new Instant(date.time);

			assertThat(instant.toString(), equalTo('[Instant millis=' + date.time + ']'));
		}
	}
}