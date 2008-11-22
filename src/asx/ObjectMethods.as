package asx
{
  public class ObjectMethods 
  {
    // while/to, map/transform
    
    /**
     * Dodgy version of #unfold, use with caution. 
     */
    public static function unfold(seed:*, incrementor:Function, stopCondition:Function = null):Array {
      var result:Array = [seed];
      var x:* = incrementor(seed);

      // use boolean cast rules if no stop condition function given
      if (! (stopCondition))
      {
        stopCondition = function(value:*):Boolean { return value; }; 
      }

      while (stopCondition(x))
      {
        result.push(x);
        x = incrementor(x);
      }
      return result;
    }
  }
}
