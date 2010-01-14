package asx.array
{
  import asx.fn._;
  import asx.fn.partial;
  import asx.number.lt;
  
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class SomeTest
  { 
    [Test]
    public function some_withArray_returnsTrueIfSomeItemMatchesPredicate():void 
    {
      assertThat(some([1, 2, 3], partial(lt, _, 5)), equalTo(true));
    }
    
    [Test]
    public function some_withArray_returnsFalseIfAnyItemDoesNotMatchesPredicate():void 
    {
      assertThat(some([5, 6, 7], partial(lt, _, 5)), equalTo(false));
    }
    
    [Test]
    public function some_withArrayLike_returnsTrueIfSomeItemMatchesPredicate():void
    {
      assertThat(some(new ArrayCollection([1, 2, 3]), partial(lt, _, 5)), equalTo(true));
    }

    [Test]
    public function some_withArrayLike_returnsFalseIfAnyItemDoesNotMatchesPredicate():void 
    {
      assertThat(some(new ArrayCollection([5, 6, 7]), partial(lt, _, 5)), equalTo(false));
    }
  }
}