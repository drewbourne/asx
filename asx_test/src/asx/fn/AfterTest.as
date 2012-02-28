package asx.fn
{
	import asx.array.map;

	import org.flexunit.assertThat;
	import org.hamcrest.collection.*;
	import org.hamcrest.core.*;
	import org.hamcrest.object.*;

	public class AfterTest
	{
		[Test]
		public function after_should_pass_args_to_afterFunction():void 
		{
			var items:Array = [1, 2, 3];
			var afterArgs:Array = [];

			var result:Array = map(items, after(function(item:Number):Number { return item * 2; }, 
												function(args:Array, _:Number):void { afterArgs.push(args[0]) }));

			assertThat("result", result, array(2, 4, 6));
			assertThat("afterArgs", afterArgs, array(1, 2, 3));
		}

		[Test]
		public function after_should_pass_result_to_afterFunction():void 
		{
			var items:Array = [1, 2, 3];
			var afterResults:Array = [];

			var result:Array = map(items, after(function(item:Number):Number { return item * 2; }, 
												function(_:Array, result:Number):void { afterResults.push(result) }));

			assertThat("result", result, array(2, 4, 6));
			assertThat("afterResults", afterResults, array(2, 4, 6));
		}

		[Test]
		public function after_should_return_result_from_afterFunction():void 
		{
			var items:Array = [1, 2, 3];

			var result:Array = map(items, after(function(item:Number):Number { return item * 2; }, 
												function(_:Array, result:Number):Number { return result * 3 }));

			assertThat("result", result, array(6, 12, 18));
		}

		[Test]
		public function after_should_ignore_undefined_result_from_afterFunction():void 
		{
			var items:Array = [1, 2, 3];

			var result:Array = map(items, after(function(item:Number):Number { return item * 2; }, 
												function(_:Array, __:Number):* { return undefined; }));

			assertThat("result", result, array(2, 4, 6));
		}
	}
}
