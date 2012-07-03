package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.collection.array;
  import org.hamcrest.object.equalTo;
  
  public class InGroupsOfTest
  {
    [Test]
    public function inGroupsOf_withArray_shouldSplitItemsIntoArraysOfGivenSize():void 
    {
      var values:Array = [1, 2, 3, 4, 5, 6, 7];
      assertThat(inGroupsOf(values, 3), equalTo([[1, 2, 3], [4, 5, 6], [7]]));
    }
	
	[Test]
	public function inGroupsOf_withArray_evenLength_shouldSplitItemsIntoArraysOfGivenSize():void 
	{
		var values:Array = [1, 2, 3, 4, 5, 6];
		assertThat(inGroupsOf(values, 3), equalTo([[1, 2, 3], [4, 5, 6]]));
	}
	
	[Test]
	public function inGroupsOf_withArray_shouldSplitItemsIntoArraysOfGivenSize_1():void 
	{
		var values:Array = [1, 2, 3, 4, 5, 6];
		assertThat(inGroupsOf(values, 1), equalTo([[1], [2], [3], [4], [5], [6]]));
	}
  }
}