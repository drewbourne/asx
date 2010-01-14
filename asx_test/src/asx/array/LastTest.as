package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;

	public class LastTest
	{		
		[Test]
		public function last_withArray():void 
		{
			var values:Array = [1, 2, 3];
			
			assertThat(last(values), equalTo(3));			
		}
		
		[Test]
		public function last_withArrayLike():void 
		{
			var values:ArrayCollection = new ArrayCollection([1, 2, 3]);
			
			assertThat(last(values), equalTo(3));
		}
		
		[Test]
		public function last_withObject():void 
		{
			var values:Object = { first: "first", second: "second" };
			
			assertThat(last(values), nullValue());
		}
	}
}