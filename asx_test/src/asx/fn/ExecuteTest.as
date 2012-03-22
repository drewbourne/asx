package asx.fn
{
	import org.flexunit.assertThat;
	import org.hamcrest.collection.array;

	public class ExecuteTest
	{
		[Test]
		public function functions_in_flat_array_should_execute_in_sequence():void 
		{
			var sequence:Array = [];
			
			execute([
				[function(next:Function):void { sequence.push(1); next(); }],
				[function(next:Function):void { sequence.push(2); next(); }],
				[function(next:Function):void { sequence.push(3); next(); }],
			]);
			
			assertThat(sequence, array(1, 2, 3));
		}
		
		[Test]
		public function functions_in_nested_array_should_execute_in_parallel():void 
		{
			var sequence:Array = [];
			
			execute([
				[function(next:Function):void { sequence.push(10); next(); }],
				[[function(next:Function):void { sequence.push(20); next(); }, function(next:Function):void { sequence.push(21); next(); }]],
				[function(next:Function):void { sequence.push(30); next(); }],
			]);
			
			assertThat(sequence, array(10, 20, 21, 30)); 
		}
		
		[Test]
		public function functions_should_receive_args():void 
		{
			var sequence:Array = [];
			
			execute([
				[function(value:*, next:Function):void { sequence.push(value); next(); }, [1]],
				[[function(value:*, next:Function):void { sequence.push(value); next(); }, function(value:*, next:Function):void { sequence.push(value); next(); }], [2]],
				[function(value:*, next:Function):void { sequence.push(value); next(); }, [3]]
			]);
			
			assertThat(sequence, array(1, 2, 2, 3));
		}
	}
}