package asx.color
{
	import asx.string.substitute;
	
	import org.flexunit.assertThat;
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.object.equalTo;

	Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class RGBTest
	{
		public static function get rgbData():Array 
		{
			return [
				[[0, 0, 0], 0x0],
				[[255, 0, 0], 0xFF0000],
				[[0, 255, 0], 0x00FF00],
				[[0, 0, 255], 0x0000FF],
				[[255, 128, 0], 0xFF8000],
				[[0, 255, 128], 0x00FF80],
				[[128, 0, 255], 0x8000FF],
			];
		}
		
		[Test(dataProvider="rgbData")]
		public function rgbTest(colors:Array, expected:int):void 
		{
			assertThat(
				substitute("rgb({0},{1},{2}) === {3}", colors[0], colors[1], colors[2], expected),
				rgb(colors[0], colors[1], colors[2]), 
				equalTo(expected));
		}
		
		public static function get redData():Array
		{
			return [
				[rgb(0, 0, 0), 0x0],
				[rgb(255, 0, 0), 0xFF],
				[rgb(0, 255, 0), 0x0],
				[rgb(0, 0, 255), 0x0],
				[rgb(128, 255, 0), 0x80],
				[rgb(0, 128, 255), 0x0],
				[rgb(255, 0, 128), 0xFF],
			];	
		}
		
		[Test(dataProvider="redData")]
		public function redTest(color:int, expected:int):void 
		{
			assertThat(
				substitute("red({0}) === {1}", color, expected),
				red(color), 
				equalTo(expected));
		}
		
		public static function get greenData():Array
		{
			return [
				[rgb(0, 0, 0), 0x0],
				[rgb(255, 0, 0), 0x0],
				[rgb(0, 255, 0), 0xFF],
				[rgb(0, 0, 255), 0x0],
				[rgb(128, 255, 0), 0xFF],
				[rgb(0, 128, 255), 0x80],
				[rgb(255, 0, 128), 0x0],
			];	
		}
		
		[Test(dataProvider="greenData")]
		public function greenTest(color:int, expected:int):void 
		{
			assertThat(
				substitute("green({0}) === {1}", color, expected),
				green(color), 
				equalTo(expected));
		}
		
		public static function get blueData():Array
		{
			return [
				[rgb(0, 0, 0), 0x0],
				[rgb(255, 0, 0), 0x0],
				[rgb(0, 255, 0), 0x0],
				[rgb(0, 0, 255), 0xFF],
				[rgb(128, 255, 0), 0x0],
				[rgb(0, 128, 255), 0xFF],
				[rgb(255, 0, 128), 0x80],
			];	
		}
		
		[Test(dataProvider="blueData")]
		public function blueTest(color:int, expected:int):void 
		{
			assertThat(
				substitute("blue({0}) === {1}", color, expected),
				blue(color), 
				equalTo(expected));
		}
	}
}