package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.collection.array;
  
  public class SwapTest
  {
    [Test]
    public function swap_withArray_swapsThePositionOfItems():void 
    {
      var items:Array = [4, 5, 6];
      assertThat(swap(items, 1, 2), array(4, 6, 5));
    }
  }
}