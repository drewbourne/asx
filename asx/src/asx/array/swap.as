package asx.array
{
  /**
   * Swap the position of two items in an Array. 
   */
  public function swap(array:Array, i:int, j:int):Array {
    var a:Object = array[i];
    var b:Object = array[j];
      
    array.splice(i, 1, b);
    array.splice(j, 1, a);
      
    return array;
  }
}