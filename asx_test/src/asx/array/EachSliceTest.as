package asx.array
{
  import asx.fn.I;
  
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class EachSliceTest
  {
    [Test]
    public function eachSlice_withArray_groupsItemsIntoSlicesOfAGivenSizeAndMapsAFunctionOverEachGroup():void {
      var array:Array = [1, 2, 3, 4, 5, 6, 7];
      var slices:Array = [];
      assertThat(eachSlice(array, 3, I), equalTo([[1, 2, 3], [4, 5, 6], [7]]));
    }
    
    [Test]
    public function eachSlice_withArrayLike_groupsItemsIntoSlicesOfAGivenSizeAndMapsAFunctionOverEachGroup():void {
      var array:ArrayCollection = new ArrayCollection([1, 2, 3, 4, 5, 6, 7]);
      var slices:Array = [];
      assertThat(eachSlice(array, 3, I), equalTo([[1, 2, 3], [4, 5, 6], [7]]));
    }
  }
}