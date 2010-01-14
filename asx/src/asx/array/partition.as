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
  public function partition(iterable:Object, predicate:Function):Array {
    var trues:Array = [];
    var falses:Array = [];
  
    for each (var item:Object in iterable) 
      if (predicate(item))
        trues[trues.length] = item;
      else
        falses[falses.length] = item;

    return [trues, falses];
  }
}
