package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class RejectTest
	{
		[Test]
		public function reject_withArray_shouldReturnItemsNotMatchingPredicate():void 
		{
			var values:Array = [1, 2, 3, 4];
			var predicate:Function = function(n:int):Boolean { return n < 3; };
			
			assertThat(reject(values, predicate), equalTo([3, 4])); 	
		}

		[Test]
		public function reject_withArrayLike_shouldReturnItemsNotMatchingPredicate():void 
		{
			var values:ArrayCollection = new ArrayCollection([1, 2, 3, 4]);
			var predicate:Function = function(n:int):Boolean { return n < 3; };
			
			assertThat(reject(values, predicate), equalTo([3, 4])); 				
		}
	}
}
