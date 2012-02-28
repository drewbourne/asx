package asx.fn
{
	import asx.array.map;

	import org.flexunit.assertThat;
	import org.hamcrest.collection.*;
	import org.hamcrest.core.*;
	import org.hamcrest.object.*;

	public class BeforeTest
	{
		[Test]
		public function before_should_pass_args_to_beforeFunction():void 
		{
			var items:Array = [1, 2, 3];
			var beforeArgs:Array = [];

			var result:Array = map(items, before(function(item:Number):Number { return item * 2; }, 
												 function(args:Array):void { beforeArgs.push(args[0]) }));

			assertThat("result", result, array(2, 4, 6));
			assertThat("beforeArgs", beforeArgs, array(1, 2, 3));
		}

		[Test]
		public function before_should_pass_modified_args_to_original_function():void 
		{
			var items:Array = [1, 2, 3];

			var result:Array = map(items, before(function(item:Number):Number { return item * 2; }, 
												 function(args:Array):Array { return [args[0] * 3] }));

			assertThat("result", result, array(6, 12, 18));
		}

		[Test]
		public function before_should_ignore_modified_args_from_before_function_when_undefined():void 
		{
			var items:Array = [1, 2, 3];

			var result:Array = map(items, before(function(item:Number):Number { return item * 2; }, 
												 function(args:Array):void { false; }));

			assertThat("result", result, array(2, 4, 6));
		}
	}
}
