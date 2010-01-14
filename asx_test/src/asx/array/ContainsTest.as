package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class ContainsTest
	{
		[Test]
		public function contains_withArray_returnsTrueIfItemInArray():void 
		{
			assertThat(contains([], 0), equalTo(false));
          	assertThat(contains([1, 2, 3], 0), equalTo(false));
          	assertThat(contains([1, 2, 3], 3), equalTo(true));
		}

		[Test]
		public function contains_withArrayLike_returnsTrueIfItemInArray():void 
		{
			assertThat(contains(new ArrayCollection([]), 0), equalTo(false));
			assertThat(contains(new ArrayCollection([1, 2, 3]), 0), equalTo(false));
          	assertThat(contains(new ArrayCollection([1, 2, 3]), 3), equalTo(true));
		}
	}
}