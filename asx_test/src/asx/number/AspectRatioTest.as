package asx.number
{
	import org.flexunit.assertThat;
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.collection.array;
	import org.hamcrest.object.equalTo;
	
	Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class AspectRatioTest
	{
		public static function aspectRatioData():Array 
		{
			return [
				[[400, 300], [4, 3]],
				[[640, 360], [16, 9]],
				[[1280, 720], [16, 9]],
				[[1680, 1050], [8, 5]],
			];
		}
		
		[Test(dataProvider="aspectRatioData")]
		public function aspectRatioTest(numbers:Array, expected:Array):void 
		{
			assertThat(aspectRatio(numbers[0], numbers[1]), array(expected[0], expected[1]));
		}
	}
}