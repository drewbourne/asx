package asx.array { 
   
   /**
    * Removes null items from an Array. 
    *  
    * @param array Array possibly containing null values
    * @return Array without items that are == null 
    * @example
    * <listing version="3.0">
    * var values:Array = [1, 2, null, 3, null];
    * var compacted:Array = compact(value);
    * assertThat(compacted, everyItem(notNullValue()));
    * assertThat(compacted, equalTo([1, 2, 3]));
    * </listing>
    */
   public function compact(array:Array):Array {
     return array.filter(itemIsNotNull);
   }
}

internal function itemIsNotNull(item:Object, i:int, a:Array):Boolean {
  return item !== null;
}
