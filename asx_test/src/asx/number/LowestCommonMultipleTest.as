package asx.number
{
	import org.flexunit.assertThat;
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.collection.array;
	import org.hamcrest.object.equalTo;

	Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class LowestCommonMultipleTest
	{
		public static function lcmData():Array 
		{
			return [
				[[2, 4], 4],
				[[3, 6], 6],
				[[6, 9], 18]
				];
		}
		
		[Test(dataProvider="lcmData")]
		public function lcmTest(numbers:Array, expected:Number):void 
		{
			assertThat(lcm(numbers[0], numbers[1]), equalTo(expected));
		}
	}
}