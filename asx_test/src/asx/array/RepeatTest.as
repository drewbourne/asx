package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class RepeatTest
  {
    [Test]
    public function repeat_returnsAnArrayContainingTheGivenValueRepeatedTheGivenNumberOfTimes():void 
    {
      assertThat(repeat('x', 5), equalTo(['x', 'x', 'x', 'x', 'x'])); 
    }
  }
}