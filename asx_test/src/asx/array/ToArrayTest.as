package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.collection.array;
  import org.hamcrest.core.not;
  import org.hamcrest.object.strictlyEqualTo;
  
  public class ToArrayTest
  {
    [Test]
    public function toArray_withArray_returnsShallowCopy():void 
    {
      var items:Array = [1, 2, 3];
      assertThat(toArray(items), not(strictlyEqualTo(items)));
      assertThat(toArray(items), array(items));
    }
    
    [Test]
    public function toArray_withArrayLike_returnsArrayOfItems():void
    {
      var items:ArrayCollection = new ArrayCollection([1, 2, 3]);
      assertThat(toArray(items), array(items.toArray()));
    }
  }
}