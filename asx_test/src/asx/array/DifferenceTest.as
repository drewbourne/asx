package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class DifferenceTest
  {
    [Test]
    public function difference_withArray_returnsTheItemsThatWereNotInBothInputArrays():void 
    {
      var one:Array = [1, 2, 3, 4, 5];
      var two:Array = [1, 3, 5, 7, 9];
      assertThat(difference(one, two), equalTo([2, 4, 7, 9]));      
    }
  }
}
