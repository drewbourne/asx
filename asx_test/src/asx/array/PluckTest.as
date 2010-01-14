package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class PluckTest
  {
    [Test]
    public function pluck_withArray_returnsAnArrayOfTheValueOfTheGivenFieldForEachItem():void 
    {
      assertThat(pluck('a bee seady ee effigy'.split(' '), 'length'), equalTo([1, 3, 5, 2, 6]));  
    }
    
    [Test]
    public function pluck_withArray_followsAChainOfFieldsFromAString():void 
    {
      assertThat(pluck(
          [{ outer: { middle: { inner: { value: 3 }}}}], 
          'outer.middle.inner.value'),
          equalTo([3]));      
    }
    
    [Test]
    public function pluck_withArray_followsAChainOfFieldsFromAnArray():void 
    {
      assertThat(pluck(
          [{ outer: { middle: { inner: { value: 3 }}}}], 
          ['outer', 'middle', 'inner', 'value']),
          equalTo([3]));
    }
  
    [Test]
    public function pluck_withArray_followsAChainOfMethods():void 
    {
      assertThat(pluck([1, 10, 100], 'toString().length'), equalTo([1, 2, 3]));
    }
    
    [Test]
    public function pluck_withArrayLike():void 
    {
      var items:ArrayCollection = new ArrayCollection([
        { values: new ArrayCollection([ 1, 2, 3 ]) },
        { values: new ArrayCollection([ 4, 5 ]) },
        { values: new ArrayCollection([ 6 ]) },
      ]);
      
      assertThat(pluck(items, 'values.length'), equalTo([3, 2, 1]));
    }
  }
}