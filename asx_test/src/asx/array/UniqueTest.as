package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.collection.array;
  import org.hamcrest.object.equalTo;
  import org.hamcrest.object.hasProperty;
  
  public class UniqueTest
  {
    [Test]
    public function unique_byItem_withArray_returnsAnArrayWithoutDuplicateValues():void 
    {
      assertThat(unique([1, 1, 2, 3, 5]), equalTo([1, 2, 3, 5]));
      assertThat(unique(['one', 'two', 'two', 'two']), equalTo(['one', 'two']));
    }
    
    [Test]
    public function unique_byField_withArray_returnsAnArrayWithoutDuplicateFieldValues():void 
    {
      var items:Array = [{ id: 1, value: 1 }, { id: 2, value: 1 }, { id: 3, value: 2 }];
      assertThat(unique(items, "value"), array(hasProperty("id", 1), hasProperty("id", 3)));
    }

    [Test]
    public function unique_byItem_withArrayLike_returnsAnArrayWithoutDuplicateValues():void 
    {
      assertThat(unique(new ArrayCollection([1, 1, 2, 3, 5])), equalTo([1, 2, 3, 5]));
      assertThat(unique(new ArrayCollection(['one', 'two', 'two', 'two'])), equalTo(['one', 'two']));
    }
    
    [Test]
    public function unique_byField_withArrayLike_returnsAnArrayWithoutDuplicateFieldValues():void 
    {
      var items:ArrayCollection = new ArrayCollection([{ id: 1, value: 1 }, { id: 2, value: 1 }, { id: 3, value: 2 }]);
      assertThat(unique(items, "value"), array(hasProperty("id", 1), hasProperty("id", 3)));
    }

  }
}
