package asx.array {
  
  /**
   * Inserts the separator item between each item in an Array or Array-like 
   * Object. 
   * 
   * @param iterable
   * @param separator
   */
  public function intersperse(iterable:Object, separator:Object):Array {    
    var result:Array = [];
    
    for each (var item:Object in iterable) {
      result[result.length] = item;
      result[result.length] = separator;
    }
    
    return result.slice(0, -1);
  }
}