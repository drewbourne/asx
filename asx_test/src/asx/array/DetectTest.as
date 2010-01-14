package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class DetectTest
	{
		[Test]
		public function detect_withArray_shouldFindFirstMatchingItem():void 
		{
			var values:Array = [1, 1, 2, 3, 5, 8];
			var finder:Function = function (n:int):Boolean { return n > 4; };
			assertThat(detect(values, finder), equalTo(5));
		}
		
		[Test]
		public function detect_withArrayLike_shouldFindFirstMatchItem():void 
		{
			var values:ArrayCollection = new ArrayCollection([1, 1, 2, 3, 5, 8]);
			var finder:Function = function (n:int):Boolean { return n > 4; };
			assertThat(detect(values, finder), equalTo(5));			
		}
	}
}