package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.collection.array;
  import org.hamcrest.object.equalTo;
  
  public class TailTest
  {
    [Test]
    public function tail_withArray_returnsAnArrayWithoutTheFirstItem():void 
    {
      assertThat(tail([2, 1, 0]), equalTo([1, 0]));    
    }
      
    [Test]
    public function tail_withArray_returnsAnEmptyArrayIfLengthIsZeroOrOne():void 
    {
      assertThat(tail([]), array([]));
      assertThat(tail([1]), array([]));      
    } 
  }
}