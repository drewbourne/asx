package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class LengthTest
  {
    [Test]
    public function length_withArray():void 
    {
      assertThat(len([1, 2, 3]), equalTo(3));
    }
    
    [Test]
    public function length_withXML():void 
    {
      var x:XML = <root>
          <leaf />
          <leaf />
          <leaf />
        </root>;
        
      assertThat(len(x.children()), equalTo(3));
    }
  }
}