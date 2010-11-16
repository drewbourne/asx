package asx.string
{
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class ConstantizeTest
	{
		public static function constantizeData():Array 
		{
			return [
				["allYourCamelCases", "ALL_YOUR_CAMEL_CASES"],
				["ACapitalizedMonstrosity", "A_CAPITALIZED_MONSTROSITY"],
				["HTTPRequest", "HTTP_REQUEST"]
			];
		}
		
		[Test(dataProvider="constantizeData")]
		public function constantizeShouldUppercaseWordsAndSeparateByUnderscores(
			value:String, expected:String):void 
		{
			assertThat(constantize(value), equalTo(expected));	
		}
		
		public static function constantizeShouldSupportTheseCasesButItDoesntData():Array 
		{
			return [
				["HTTPRequest", "HTTP_REQUEST"]
			];
		}
		
		[Ignore]
		[Test(dataProvider="constantizeShouldSupportTheseCasesButItDoesntData")]
		public function constantizeShouldSupportTheseCasesButItDoesnt(value:String, expected:String):void 
		{
			assertThat(constantize(value), equalTo(expected));
		}
	}
}