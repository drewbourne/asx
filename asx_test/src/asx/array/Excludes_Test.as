package asx.array
{
	import asx.fn._;
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class Excludes_Test
	{
		[Test]
		public function excludes_withArray_shouldReturnFunctionExpectingItem():void 
		{
			var values:Array = [1, 2, 3];
			assertThat(excludes_(values)(2), equalTo(false));
			assertThat(excludes_(values)(4), equalTo(true));
		} 
		
		[Test]
		public function excludes_withArrayLike_shouldReturnFunctionExpectingItem():void 
		{
			var values:ArrayCollection = new ArrayCollection([1, 2, 3]);
			assertThat(excludes_(values)(2), equalTo(false));
			assertThat(excludes_(values)(4), equalTo(true));
		}
		
		[Test]
		public function excludes_withItem_shouldReturnFunctionExpectingArray():void 
		{
			assertThat(excludes_(_, 2)([1, 2, 3]), equalTo(false));
			assertThat(excludes_(_, 4)([1, 2, 3]), equalTo(true));			
		}
	}
}