package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.collection.inArray;
  
  public class RandomTest
  {
    [Test]
    public function random_withArray_returnsARandomItemFromArray():void 
    {
      var items:Array = [1, 2, 3, 4, 5]; 
      assertThat(random(items), inArray(items));
    }
    
    [Test]
    public function random_withArrayLike_returnsARandomItemFromArray():void 
    {
      var items:ArrayCollection = new ArrayCollection([1, 2, 3, 4, 5]); 
      assertThat(random(items), inArray(items.toArray()));
    }
  }
}