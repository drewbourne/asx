package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  import org.hamcrest.object.hasProperty;
  
  public class MaxTest
  {
    [Test]
    public function max_withArray_returnsTheMaximumItem():void 
    {
      assertThat(max([1, 101, 11, 10, 100]), equalTo(101));
      assertThat(max(['1', '101', '11', '10', '100']), equalTo('11'));
    }
    
    [Test]
    public function max_byField_withArray_returnsTheItemWithTheMaximumFieldValue():void 
    {
      var items:Array = [
        { value: 1 },
        { value: 111 },
        { value: 100 },
        ];
      assertThat(max(items, 'value'), hasProperty('value', 111));
    }
  }
}