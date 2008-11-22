package asx
{
  public class FunctionMethods
  {
    /**
     * Wraps a Function for use as an iterator, usually for use with Array#filter, Array#map, Array#every, Array#some, etc.
     *  
     * @example
     * <listing version="3.0">
     *  function uppercase(string:String):String { return (string || "").toUpperCase(); }
     *  var strings:Array = ["one", "three", "five"];
     *  var modified:Array = strings.map(toIterator(uppercase));
     * </listing>
     */
    public static function toIterator(iterator:Function):Function
    {
      var arity:int = iterator.length;
      
      // if the arity is 3 then its a normal iterator method and there is no point wrapping it
      if (arity == 3) {
        return iterator;
      }
      
      // we could optimize this to not do the apply() or slice() dependent on the arity
      // but its unlikely to make much difference in any reasonable use case. 
      // if you need speed why aren't you doing a raw array iteration?
      
      return function(value:Object, i:int, a:Array):Object {
        return iterator.apply(null, [value, i, a].slice(0, arity));
      };
    }
  }
  
}