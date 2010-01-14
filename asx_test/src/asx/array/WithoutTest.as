package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class WithoutTest
  {
    [Test]
    public function without_withArray_returnsAnArrayWithoutTheSpecifiedItems():void 
    {
      var values:Array = [0, 1, 2, 3];
      assertThat(without(values, 2), equalTo([0, 1, 3]));
      assertThat(without(values, 0, 1), equalTo([2, 3]));      
    }

    [Test]
    public function without_withArrayLike_returnsAnArrayWithoutTheSpecifiedItems():void 
    {
      var values:ArrayCollection = new ArrayCollection([0, 1, 2, 3]);
      assertThat(without(values, 2), equalTo([0, 1, 3]));
      assertThat(without(values, 0, 1), equalTo([2, 3]));      
    }
  }
}
