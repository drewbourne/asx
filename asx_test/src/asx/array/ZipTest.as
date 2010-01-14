package asx.array
{
  import mx.collections.ArrayCollection;
  
  import org.flexunit.assertThat;
  import org.hamcrest.object.equalTo;
  
  public class ZipTest
  {
    [Test(description='takes arrays arguments and return an array where each entry is an array of the values at that index in the argument arrays')]
    public function zip_withArrays_takesArrayArgumentsAndReturnAnArrayWhereEachEntryIsAnArrayOfTheValuesAtThatIndexInTheArgumentArrays():void 
    {
      assertThat(zip([1, 2, 3], ['a', 'b', 'c']), 
                 equalTo([[1, 'a'], [2, 'b'], [3, 'c']]));
    }
    
    [Test]
    public function zip_withArrays_zipsOnlyTheMinimumLengthOfTheArrays():void {
      assertThat(zip([1, 2, 3], ['a', 'b', 'c'], [true, true, false, true]), 
                 equalTo([[1, 'a', true], [2, 'b', true], [3, 'c', false]]));      
    }
    
    [Test]
    public function zip_withArrayLikes_takesArrayArgumentsAndReturnAnArrayWhereEachEntryIsAnArrayOfTheValuesAtThatIndexInTheArgumentArrays():void 
    {
      assertThat(
        zip(new ArrayCollection([1, 2, 3]), 
            new ArrayCollection(['a', 'b', 'c'])), 
        equalTo([[1, 'a'], [2, 'b'], [3, 'c']]));

      assertThat(
        zip(new ArrayCollection([1, 2, 3]), 
            new ArrayCollection(['a', 'b', 'c']), 
            new ArrayCollection([true, true, false, true])), 
        equalTo([[1, 'a', true], [2, 'b', true], [3, 'c', false]]));      
    }
  }
}
