package asx.string
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.hasProperties;
	import org.hamcrest.object.isFalse;
	import org.hamcrest.object.isTrue;

	public class IsEmptyStringTest
	{
		[Test]
		public function isEmptyString_shouldReturnTrueForNull():void 
		{
			assertThat("should be true for <null>", isEmptyString(null), isTrue());
		}

		[Test]
		public function isEmptyString_shouldReturnTrueForWhitespace():void 
		{
			assertThat("should be true for <space>", 	isEmptyString(" "), isTrue());
			assertThat("should be true for <tab>",	 	isEmptyString("\t"), isTrue());
			assertThat("should be true for <newline>", 	isEmptyString("\n"), isTrue());
			
			assertThat("should be true for whitespace", isEmptyString(" \r\n\t"), isTrue());
		}
		
		[Test]
		public function isEmptyString_shouldReturnFalseForFalseForNonWhitespace():void 
		{
			assertThat("should be false for non-whitespace characters",
				isEmptyString("a"), isFalse());
		}
	}
}