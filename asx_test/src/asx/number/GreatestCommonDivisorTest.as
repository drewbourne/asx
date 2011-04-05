package asx.number
{
	import org.flexunit.assertThat;
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.collection.array;
	import org.hamcrest.object.equalTo;
	
	Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class GreatestCommonDivisorTest
	{
		public static function gcdData():Array 
		{
			return [
				[[1, 2], 1],
				[[2, 4], 2],
				[[3, 6], 3],
				[[4, 8], 4],
				[[5, 10], 5],
				[[1680, 1050], 210]
			];
		}
		
		[Test(dataProvider="gcdData")]
		public function gcdTest(numbers:Array, expected:Number):void 
		{
			assertThat(gcd(numbers[0], numbers[1]), equalTo(expected));
		}
	}
}