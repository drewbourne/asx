package asx.string
{
	import org.flexunit.runners.Parameterized;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	Parameterized;
	
	[RunWith("org.flexunit.runners.Parameterized")]
	public class CamelizeTest
	{
		public static function camelizeWithLowerCaseFirstWordData():Array
		{
			return [
				["should camelize each word", 	"shouldCamelizeEachWord"],
				["should remove spaces", 		"shouldRemoveSpaces"],
				["should_remove_underscores", 	"shouldRemoveUnderscores"],
				["should-remove-hyphens", 		"shouldRemoveHyphens"]
			];
		}
		
		[Test(dataProvider="camelizeWithLowerCaseFirstWordData")]
		public function camelizeWithLowerCaseFirstWord(value:String, expected:String):void 
		{
			assertThat(camelize(value, true), equalTo(expected));	
		}
		
		public static function camelizeWithUpperCaseFirstWordData():Array
		{
			return [
				["should camelize each word", 	"ShouldCamelizeEachWord"],
				["should remove spaces", 		"ShouldRemoveSpaces"],
				["should_remove_underscores", 	"ShouldRemoveUnderscores"],
				["should-remove-hyphens", 		"ShouldRemoveHyphens"]
			];
		}
		
		[Test(dataProvider="camelizeWithUpperCaseFirstWordData")]
		public function camelizeWithUpperCaseFirstWord(value:String, expected:String):void 
		{
			assertThat(camelize(value), equalTo(expected));	
		}
	}
}