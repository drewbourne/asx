package asx.object
{
	import flash.utils.Dictionary;

	import org.flexunit.assertThat;
	import org.hamcrest.object.hasProperties;
	import org.hamcrest.object.strictlyEqualTo;

	public class MergeTest
	{
		[Test]
		public function should_merge_keys_and_values_from_anonymous_object_to_target_object():void 
		{
			var target:Object = { one: 1, two: 2 };
			var source:Object = { two: 22, three: 3 };

			var result:Object = merge(target, source);

			assertThat(result, strictlyEqualTo(target));
			assertThat(result, hasProperties({ one: 1, two: 22, three: 3 }));
		}

		[Test]
		public function should_merge_keys_and_values_from_anonymous_object_to_target_Dictionary():void 
		{
			var target:Dictionary = new Dictionary();
			target['one'] = 1;
			target['two'] = 2;

			var source:Object = { two: 22, three: 3 };

			var result:Dictionary = merge(target, source);

			assertThat(result, strictlyEqualTo(target));
			assertThat(result, hasProperties({ one: 1, two: 22, three: 3 }));
		}

		[Test]
		public function should_merge_keys_and_values_from_Dictionary_to_target_Dictionary():void 
		{
			var target:Dictionary = new Dictionary();
			target['one'] = 1;
			target['two'] = 2;

			var source:Dictionary = new Dictionary();
			target['two'] = 22;
			target['three'] = 3;

			var result:Dictionary = merge(target, source);

			assertThat(result, strictlyEqualTo(target));
			assertThat(result, hasProperties({ one: 1, two: 22, three: 3 }));
		}

		[Test]
		public function should_merge_multiple_sources_to_target():void 
		{
			var target:Dictionary = new Dictionary();
			var result:Dictionary = merge(target, { one: 1 }, { two: 2, three: 3 }, { two: 22, four: 4 });

			assertThat(result, strictlyEqualTo(target));
			assertThat(result, hasProperties({ one: 1, two: 22, three: 3, four: 4 }));
		}
	}
}