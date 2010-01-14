package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class ExcludesTest
	{
		[Test]
		public function excludes_withArray_returnsTrueIfItemInArray():void 
		{
			assertThat(excludes([], 0), equalTo(true));
          	assertThat(excludes([1, 2, 3], 0), equalTo(true));
          	assertThat(excludes([1, 2, 3], 3), equalTo(false));
		}

		[Test]
		public function excludes_withArrayLike_returnsTrueIfItemInArray():void 
		{
			assertThat(excludes(new ArrayCollection([]), 0), equalTo(true));
			assertThat(excludes(new ArrayCollection([1, 2, 3]), 0), equalTo(true));
          	assertThat(excludes(new ArrayCollection([1, 2, 3]), 3), equalTo(false));
		}
	}
}