package asx
{
  public class StringMethods
  {
    /**
     * Repeats the value string count number of times. 
     *  
     * @param value String to repeat
     * @param count Number of times to repeat the value String.
     * @return repeated String
     */
    static public function repeat(value:String, count:Number = 1):String
    {
      var out:String = '';
      while(count > 0){ out += value; --count; }
      return out;
    }

    /**
     * Pads a String with another String to the left for a given number of characters.
     *  
     * @param value
     * @param length
     * @param pad
     * @return left padded string
     */
    static public function padLeft(value:String, length:Number = 1, pad:String = ' '):String
    {
      if (length < value.length) 
        return value.substring(0, length);

      var padLength:Number = length - value.length;
      var padRepeat:Number = Math.ceil(padLength / pad.length);
      var padding:String = StringMethods.repeat(pad, padRepeat).slice(-padLength);

      return padding + value;
    }

    /**
     * Pads a String with another String to the right for a given number of characters.
     *  
     * @param value
     * @param length
     * @param pad
     * @return Right padded string
     */
    static public function padRight(value:String, length:Number = 1, pad:String = ' '):String
    {
      if (length < value.length)
        return value.substring(0, length);

      var out:String = value;
      var padLength:Number = length - value.length;
      var padRepeat:Number = Math.ceil(padLength / pad.length);
      var padding:String = StringMethods.repeat(pad, padRepeat).slice(0, padLength);

      return value + padding;
    }
    
    /**
     * 
     */
    static public function trim(value:String):String 
    {
      
    }
  }
}