package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class CycleTest
  {
    [Test]
    public function cycle_returnsAnArrayWithTheInputItemsCycledThroughTheGivenNumberOfTimes():void 
    {
      assertThat(cycle(['a', 'b', 'c'], 5), equalTo(['a', 'b', 'c', 'a', 'b'])); 
    }
  }
}