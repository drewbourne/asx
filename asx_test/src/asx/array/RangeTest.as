package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.collection.array;
	import org.hamcrest.object.equalTo;
	
	public class RangeTest
	{
		
		[Test]
		public function range_oneArg_returnsSequencialArray_fromZeroToStop():void
		{
			assertThat(range(10), array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9));
		}
	
		[Test]
		public function range_twoArgs_returnsSequencialArray_fromStartToStop():void
		{
			assertThat(range(1,11), array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
		}
		
		[Test]
		public function range_twoArgs_stepNotMultipleOfStep_returnsSequencialArray_endsBeforeStop():void
		{
			assertThat(range(0, 4, 3), array(0, 3));
		}
		
		[Test]
		public function range_threeArgs_returnsSequencialArray_fromStartToStop_byStep_even():void
		{
			assertThat(range(0, 30, 5), array(0, 5, 10, 15, 20, 25));
		}
		
		[Test]
		public function range_threeArgs_returnsSequencialArray_fromStartToStop_byStep_odd():void
		{
			assertThat(range(0, 10, 3), array(0, 3, 6, 9));
		}
		
		[Test]
		public function range_threeArgs_negativeStopAndStep_returnsSequencialArray_fromStartToStop():void
		{
			assertThat(range(0, -10, -1), array(0, -1, -2, -3, -4, -5, -6, -7, -8, -9));
		}
		
		[Test]
		public function range_twoArgs_positiveStart_negativeStep_returnsSequentialArray_fromStartToStop():void
		{
			assertThat(range(5, 0, -1), array(5, 4, 3, 2, 1));
		}
		
		[Test]
		public function range_oneArgs_zeroStop_returnsEmptyArray():void
		{
			assertThat(range(0), array());
		}
		
		[Test]
		public function range_twoArgs_positiveStep_largerStopThanStart_returnsEmptyArray():void
		{
			assertThat(range(1, 0), array());
		}
		
		[Test(expects="ArgumentError")]
		public function range_zero_throwsArgumentError():void
		{
			range(0, 1, 0);
		}
	}
}