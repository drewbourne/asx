package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  import org.hamcrest.object.hasProperty;
  
  public class MinTest
  {
    [Test]
    public function min_withArray_returnsTheMinimumItem():void 
    {
      assertThat(min([1, 101, 11, 10, 0, 100]), equalTo(0));
      assertThat(min(['1', '101', '11', '10', '0', '100']), equalTo('0'));
    }
    
    [Test]
    public function min_byField_withArray_returnsTheItemWithTheMinimumFieldValue():void 
    {
      var items:Array = [
        { value: 1 },
        { value: 111 },
        { value: 100 },
        ];
      assertThat(min(items, 'value'), hasProperty('value', 1));
    }
  }
}
