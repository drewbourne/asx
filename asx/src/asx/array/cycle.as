package asx.array {
  
  /**
   * 
   */
  public function cycle(iterable:Object, n:int):Array {
    var result:Array = [];
    
    for (var i:int = 0, m:int = length(iterable); i < n; i++)
      result[result.length] = iterable[i % m];
    
    return result;
  }
}