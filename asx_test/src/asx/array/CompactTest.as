package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class CompactTest
	{
		[Test]
		public function compact_withArray_returnsAnArrayWithoutNullValues():void 
		{
			assertThat(compact([null]), equalTo([]));
          	assertThat(compact([null, null, 3, null]), equalTo([3]));
          	assertThat(compact(['toast', 'waffles', null, 'crumpets']), equalTo(['toast', 'waffles', 'crumpets']));
		}
		
		[Test]
		public function compact_withArrayLike_returnsAnArrayWithoutNullValues():void 
		{
			assertThat(compact(new ArrayCollection([null])), equalTo([]));
          	assertThat(compact(new ArrayCollection([null, null, 3, null])), equalTo([3]));
          	assertThat(compact(new ArrayCollection(['toast', 'waffles', null, 'crumpets'])), equalTo(['toast', 'waffles', 'crumpets']));			
		}
	}
}