package asx.array
{
	import mx.collections.ArrayCollection;
	
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;
	
	public class PartitionByTest
	{
		public function indexify(item:Object):int 
		{
			return int(item) % 3;	
		}
		
		[Test]
		public function partitionBy_withArray_toIndex():void 
		{
			assertThat(
				partitionBy([1, 2, 3, 4, 5, 6], indexify), 
				equalTo([[3, 6], [1, 4], [2, 5]]));
		}
		
		[Test]
		public function partitionBy_withArrayCollection_toIndex():void 
		{
			assertThat(
				partitionBy(new ArrayCollection([1, 2, 3, 4, 5, 6]), indexify), 
				equalTo([[3, 6], [1, 4], [2, 5]]));	
		}
	}
}