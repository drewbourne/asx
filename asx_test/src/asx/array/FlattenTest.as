package asx.array
{
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class FlattenTest
  {
    [Test]
    public function flatten_takesANestedArrayAndReturnsAOneDimensionalArray():void {
      assertThat(flatten([1, 2, [3, 4, 5, [6], [7, 8]], 9]), equalTo([1, 2, 3, 4, 5, 6, 7, 8, 9]));
    }
  }
}