package asx.array
{
	import asx.fn._;
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class Contains_Test
	{
		[Test]
		public function contains_withArray_shouldReturnFunctionExpectingItem():void 
		{
			var values:Array = [1, 2, 3];
			assertThat(contains_(values)(2), equalTo(true));
			assertThat(contains_(values)(4), equalTo(false));
		} 
		
		[Test]
		public function contains_withArrayLike_shouldReturnFunctionExpectingItem():void 
		{
			var values:ArrayCollection = new ArrayCollection([1, 2, 3]);
			assertThat(contains_(values)(2), equalTo(true));
			assertThat(contains_(values)(4), equalTo(false));
		}
		
		[Test]
		public function contains_withItem_shouldReturnFunctionExpectingArray():void 
		{
			assertThat(contains_(_, 2)([1, 2, 3]), equalTo(true));
			assertThat(contains_(_, 4)([1, 2, 3]), equalTo(false));			
		}
	}
}