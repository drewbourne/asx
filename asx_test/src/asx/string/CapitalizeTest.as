package asx.string
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	public class CapitalizeTest
	{
		[Test]
		public function capitalize_shouldUppercaseFirstCharacterAndLowercaseTheRemainder():void 
		{
			assertThat(capitalize("all lowercase"), equalTo("All lowercase"));
			assertThat(capitalize("ALL UPPERCASE"), equalTo("All uppercase"));
			assertThat(capitalize("mixED"), equalTo("Mixed"));
		}
	}
}