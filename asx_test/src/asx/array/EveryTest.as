package asx.array
{
  import asx.fn._;
  import asx.fn.partial;
  import asx.number.lt;
  
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class EveryTest
  { 
    [Test]
    public function every_withArray_returnsTrueIfEveryItemMatchesPredicate():void 
    {
      assertThat(every([1, 2, 3], partial(lt, _, 5)), equalTo(true));
    }
    
    [Test]
    public function every_withArray_returnsFalseIfAnyItemDoesNotMatchesPredicate():void 
    {
      assertThat(every([3, 4, 5], partial(lt, _, 5)), equalTo(false));
    }
    
    [Test]
    public function every_withArrayLike_returnsTrueIfEveryItemMatchesPredicate():void
    {
      assertThat(every(new ArrayCollection([1, 2, 3]), partial(lt, _, 5)), equalTo(true));
    }

    [Test]
    public function every_withArrayLike_returnsFalseIfAnyItemDoesNotMatchesPredicate():void 
    {
      assertThat(every(new ArrayCollection([3, 4, 5]), partial(lt, _, 5)), equalTo(false));
    }
  }
}