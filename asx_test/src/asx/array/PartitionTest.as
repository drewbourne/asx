package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class PartitionTest
  {
    [Test]
    public function partition_withArray_separatesValuesOnTheBooleanReturnValueOfTheIteratorFunction():void 
    {
      var greaterThan3:Function = function(value:Number):Boolean { return value > 3 };
      assertThat(partition([1, 2, 3, 4, 5], greaterThan3), equalTo([[4, 5], [1, 2, 3]])); 
    }
    
    [Test]
    public function partition_withArrayLike_separatesValuesOnTheBooleanReturnValueOfTheIteratorFunction():void 
    {
      var greaterThan3:Function = function(value:Number):Boolean { return value > 3 };
      assertThat(partition(new ArrayCollection([1, 2, 3, 4, 5]), greaterThan3), equalTo([[4, 5], [1, 2, 3]])); 
    }
  }
}