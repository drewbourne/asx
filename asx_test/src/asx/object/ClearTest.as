package asx.object
{
	import flash.utils.Dictionary;

	import org.flexunit.assertThat;
	import org.hamcrest.collection.emptyArray;
	import org.hamcrest.object.strictlyEqualTo;

	public class ClearTest
	{
		[Test]
		public function should_clear_array_items():void 
		{
			var items:Array = [1, 2, 3];
			var cleared:Array = clear(items);

			assertThat(cleared, strictlyEqualTo(items));
			assertThat(cleared, emptyArray());
		}

		[Test]
		public function should_clear_anonymous_object_keys():void 
		{
			var object:Object = { one: 1, two: 2, three: 3 };
			var cleared:Object = clear(object);

			assertThat(cleared, strictlyEqualTo(object));
			assertThat(keys(cleared), emptyArray());
		}

		[Test]
		public function should_clear_Dictionary_keys():void 
		{
			var dict:Dictionary = merge(new Dictionary(), { one: 1, two: 2, three: 3 });
			var cleared:Dictionary = clear(dict);

			assertThat(cleared, strictlyEqualTo(dict));
			assertThat(keys(cleared), emptyArray());
		}
	}
}
