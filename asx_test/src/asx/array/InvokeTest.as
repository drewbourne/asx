package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class InvokeTest
  {
    [Test]
    public function invoke_withArray_invokesTheNameMethodOnEachItemAndReturnsTheResults():void 
    {
      assertThat(invoke([1, 2, 3], 'toString'), equalTo(["1", "2", "3"]));
    }
    
    [Test]
    public function invoke_withArray_invokesTheNameMethodOnEachItemAndPassesInArguments():void 
    {
      assertThat(invoke([1, 2, 3], 'toString', 2), equalTo(["1", "10", "11"]));
    }
  }
}
