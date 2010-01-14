package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class SelectTest
	{
		[Test]
		public function select_withArray_shouldReturnItemsMatchingPredicate():void 
		{
			var values:Array = [1, 2, 3, 4];
			var predicate:Function = function(n:int):Boolean { return n < 3; };
			
			assertThat(select(values, predicate), equalTo([1, 2])); 	
		}

		[Test]
		public function select_withArrayLike_shouldReturnItemsMatchingPredicate():void 
		{
			var values:ArrayCollection = new ArrayCollection([1, 2, 3, 4]);
			var predicate:Function = function(n:int):Boolean { return n < 3; };
			
			assertThat(select(values, predicate), equalTo([1, 2])); 				
		}
	}
}
