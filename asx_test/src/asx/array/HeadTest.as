package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  import org.hamcrest.object.nullValue;
  
  public class HeadTest
  {
    [Test]
    public function head_withArray_returnsTheFirstItem():void 
    {
      assertThat(head([2, 1, 0]), equalTo(2));
    }
    
    [Test]
    public function head_withArray_returnsNullIfEmpty():void 
    {
      assertThat(head([]), nullValue());
    }
    
    [Test]
    public function head_withArrayLike_returnsTheFirstItem():void 
    {
      assertThat(head(new ArrayCollection([2, 1, 0])), equalTo(2));
    }
    
    [Test]
    public function head_withArrayLike_returnsNullIfEmpty():void 
    {
      assertThat(head(new ArrayCollection([])), nullValue());
    }
  }
}