package asx.array { 

  /**
   * Partition an Array into many divisions. 
   *  
   * @param array Array of items to partition
   * @param iterator Function matching function(value:Object):int; indicating which bucket the item should be placed into.
   * @return Array of Arrays, containing value as determined by iterator function. 
   * @example
   * <listing version="3.0">
   *  var source:Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
   *  var partitioned:Array = partitionBy(source, function(value:Number):int {
   *    return value % 3;
   *  });
   *  assertThat(partitioned, equalTo([[0, 3, 6, 9], [1, 4, 7], [2, 5, 8]]));
   * </listing>
   */
  public function partitionBy(array:Array, iterator:Function):Array {
    var partitions:Array = [];
    array.forEach(function(value:Object, i:int, a:Array):void {
      var index:int = iterator(value);
      var partition:Array = partitions[index];
      if (!partition) {
        partition = partitions[index] = [];
      }
      partition.push(value);
    });
    return partitions;
  } 
}
