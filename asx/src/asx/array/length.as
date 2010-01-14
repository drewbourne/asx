package asx.array
{
  /**
   * Determine the length of an Array-like Object.
   * 
   *  
   */
  public function length(iterable:Object):int
  {
    if ("length" in iterable)
      return (iterable.length is Function || iterable is XML || iterable is XMLList)
        ? int(iterable.length())
        : int(iterable.length);  
    
    var n:int = 0;
    
    for each (var item:Object in iterable)
      n++;
      
    return n;
  }
}