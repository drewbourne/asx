package asx.array
{
  import asx.fn.getProperty;
  
  import flash.utils.Dictionary;
  
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.hasProperties;
  import org.hamcrest.object.hasProperty;
  
  public class ToDictionaryTest
  {
    [Test]
    public function toDictionary_byKeyField_withArray_shouldMapEachItemToADictionaryKey():void 
    {
      var items:Array = [
        { id: 1, value: 4 },
        { id: 3, value: 5 }
      ];
       
      var result:Dictionary = toDictionary(items, 'id');
      assertThat(result, hasProperties({
        1: hasProperty('value', 4),
        3: hasProperty('value', 5)
      }));
    }
    
        [Test]
    public function toDictionary_byKeyFunction_withArray_shouldMapEachItemToADictionaryKey():void 
    {
      var items:Array = [
        { id: 1, value: 4 },
        { id: 2, value: 4 },
        { id: 3, value: 5 }
      ];
       
      var result:Dictionary = toDictionary(items, getProperty('value'));
      assertThat(result, hasProperties({
        4: hasProperty('id', 2),
        5: hasProperty('id', 3)
      }));
    }
    
    [Test]
    public function toDictionary_withArrayLike_shouldMapEachItemToADictionaryKey():void
    {
      var items:ArrayCollection = new ArrayCollection([
        { id: 1, value: 4 },
        { id: 3, value: 5 }
      ]);
       
      var result:Dictionary = toDictionary(items, 'id');
      assertThat(result, hasProperties({
        1: hasProperty('value', 4),
        3: hasProperty('value', 5)
      }));
    }
  }
}
