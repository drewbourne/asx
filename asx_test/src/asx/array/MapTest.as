package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class MapTest
	{
		[Test]
		public function map_withArray():void 
		{
			var values:Array = [1, 2, 3];
			var transform:Function = function(n:int):int { return n * 2; };
			
			assertThat(map(values, transform), equalTo([2, 4, 6]));
		}

		[Test]
		public function map_withArrayLike():void 
		{
			var values:ArrayCollection = new ArrayCollection([1, 2, 3]);
			var transform:Function = function(n:int):int { return n * 2; };
			
			assertThat(map(values, transform), equalTo([2, 4, 6]));
		}
	}
}