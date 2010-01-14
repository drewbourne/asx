package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.collection.arrayWithSize;
  import org.hamcrest.collection.hasItems;
  
  public class ShuffleTest
  {
    [Test]
    public function shuffle_withArray_randomisesTheOrderOfItems():void 
    {
      var items:Array = [1, 2, 3, 4, 5];
      var shuffled:Array = shuffle(items);
      assertThat(shuffled, arrayWithSize(5));
      assertThat(shuffled, hasItems(1, 2, 3, 4, 5));
    }
    
    [Test]
    public function shuffle_withArrayLike_randomisesTheOrderOfItems():void 
    {
      var items:ArrayCollection = new ArrayCollection([1, 2, 3, 4, 5]);
      var shuffled:Array = shuffle(items);
      assertThat(shuffled, arrayWithSize(5));
      assertThat(shuffled, hasItems(1, 2, 3, 4, 5));      
    }
  }
}