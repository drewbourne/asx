package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;
	
	public class FirstTest
	{
		[Test]
		public function first_withArray():void 
		{
			var values:Array = [1, 2, 3];
			
			assertThat(first(values), equalTo(1));			
		}
		
		[Test]
		public function first_withArrayLike():void 
		{
			var values:ArrayCollection = new ArrayCollection([1, 2, 3]);
			
			assertThat(first(values), equalTo(1));			
		}
		
		[Test]
		public function first_withObject():void 
		{
			var values:Object = { first: "first", second: "second" };
			
			assertThat(first(values), nullValue());
		}
	}
}