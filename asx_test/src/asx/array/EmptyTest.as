package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class EmptyTest
  {
    [Test]
    public function empty_withNull_returnsTrue():void 
    {
      assertThat(empty(null), equalTo(true));
    }
    
    [Test]
    public function empty_withArray_withNoItemsReturnsTrue():void 
    {
      assertThat(empty([]), equalTo(true));
    }
    
    [Test]
    public function empty_withArray_withNullItemsReturnsFalse():void 
    {
      assertThat(empty([null]), equalTo(false));
      assertThat(empty([null, null]), equalTo(false));
    }
    
    [Test]
    public function empty_withArray_withItemsReturnsFalse():void 
    {
      assertThat(empty([0]), equalTo(false));
      assertThat(empty([0, 1, 2]), equalTo(false));
    }
    
    [Test]
    public function empty_withArrayLike():void 
    {
      assertThat(empty(new ArrayCollection()), equalTo(true));
      assertThat(empty(new ArrayCollection([null])), equalTo(false));
      assertThat(empty(new ArrayCollection([0, 1, 2])), equalTo(false));
    }
  }
}
