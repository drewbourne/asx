package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.collection.array;
  import org.hamcrest.object.equalTo;
  
  public class ForEachTest
  {
    [Test]
    public function forEach_withArray_appliesTheIteratorFunctionToEachItem():void 
    {
      var called:Array = [];
      var callee:Function = function(item:Object):void { called.push(item) };
      
      forEach([1, 2, 3], callee);
      
      assertThat(called, array(1, 2, 3));
    }
    
    [Test]
    public function forEach_withArrayLike_appliesTheIteratorFunctionToEachItem():void 
    {
      var called:Array = [];
      var callee:Function = function(item:Object):void { called.push(item) };
      
      forEach(new ArrayCollection([1, 2, 3]), callee);
      
      assertThat(called, array(1, 2, 3));
    }
  }
}