package asx.object
{
	import flash.utils.Dictionary;

	import org.flexunit.assertThat;
	import org.hamcrest.collection.emptyArray;
	import org.hamcrest.collection.hasItems;

	public class KeysTest
	{
		[Test]
		public function should_return_all_iterable_keys_of_anonymous_object():void 
		{
			assertThat(keys({ one:1, two:2, three:3 }), hasItems('one', 'two', 'three'));
		}

		[Test]
		public function should_return_all_iterable_keys_of_Dictionary():void 
		{
			var dict:Dictionary = new Dictionary();
			dict['one'] = 1;
			dict['two'] = 2;
			dict['three'] = 3;
			assertThat(keys(dict), hasItems('one', 'two', 'three'));
		}	

		[Test]
		public function should_not_return_keys_for_class_instance():void 
		{
			var inst:Instance = new Instance();
			assertThat(keys(inst), emptyArray());
		}
	}
}

internal class Instance 
{
	public var one:int = 1;
	public var two:int = 2;
	public var three:int = 3;
}