package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class IntersectionTest
  {
    [Test]
    public function intersection_withArray_returnsTheItemsThatWereInBothInputs():void 
    {
      var one:Array = [1, 2, 3, 4, 5];
      var two:Array = [1, 3, 5, 7, 9];
      assertThat(intersection(one, two), equalTo([1, 3, 5]));
    }
    
    [Test]
    public function intersection_withArrayLike_returnsTheItemsThatWereInBothInputs():void 
    {
      var one:ArrayCollection = new ArrayCollection([1, 2, 3, 4, 5]);
      var two:ArrayCollection = new ArrayCollection([1, 3, 5, 7, 9]);
      assertThat(intersection(one, two), equalTo([1, 3, 5]));
    }
    
    [Test]
    public function intersection_withMixed_returnsTheItemsThatWereInBothInputs():void 
    {
      var one:Array = [1, 2, 3, 4, 5];
      var two:ArrayCollection = new ArrayCollection([1, 3, 5, 7, 9]);
      assertThat(intersection(one, two), equalTo([1, 3, 5]));
    }
  }
}