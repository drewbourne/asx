package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class IntersperseTest
  {
    [Test]
    public function intersperse_withArray_insertsSeparaterBetweenEachItem():void
    {
      assertThat(
        intersperse(['a', 'b', 'c'], '-'), 
        equalTo(['a', '-', 'b', '-', 'c']));
    }
  }
}