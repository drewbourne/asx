package asx.array { 

  /**
   * Partition an Array into two divisions.
   *  
   * @param array Array of items to partition
   * @param iterator Function matching function(value:Object):Boolean; indicating which partition the item should be placed into. 
   * @return Array of [[...trues], [...falses]]
   * @example
   * <listing version="3.0">
   *  var values:Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
   *  var partitioned:Array = partition(values, function(value:Number):Boolean {
   *    return value % 2 == 0;
   *  });
   *  assertThat(partitioned, equalTo([[0, 2, 4, 6, 8], [1, 3, 5, 7, 9]]));
   * </listing>
   */
  public function partition(array:Array, iterator:Function):Array {
    var trues:Array = [],
        falses:Array = [];
    array.forEach(function(value:Object, i:int, a:Array):void {
      (iterator(value) ? trues : falses).push(value);
    });
    return [trues, falses];
  }
}
