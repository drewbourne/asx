package asx
{
  public class NumberMethods
  {
    /**
     * Match a Number if it is between the minimum and maximum values
     *  
     * Note: No check is made that the minimum is less than the maximum. 
     *  
     * @param value Number to check
     * @param minimum Minimum Number the value must be to be considered between. 
     * @param maximum Maximum Number the value must be to be considered between. 
     */
    static public function between(value:Number, minimum:Number, maximum:Number):Boolean
    {
      return (minimum <= value && value <= maximum);
    }

    /**
     * Force a value to stay within the specified bounds. If value is less than minimum it is set to the minimum, If value is greater than maximum than it is set to the maximum, else it stays at its set value. 
     *  
     * @param value
     * @param minimum 
     * @param maximum
     */
    static public function bound(value:Number, minimum:Number, maximum:Number):Number
    {
      return Math.min(Math.max(minimum, value), maximum);
    }

    /**
     * Force a value to be outside a specified range. If the value is not between the minimum or maximum then it is returned as is, else the closer of the minimum or maximum value is returned. 
     *  
     * @param value
     * @param minimum
     * @param maximum
     */
    static public function exclude(value:Number, minimum:Number, maximum:Number):Number
    {
      if (!between(value, minimum, maximum))
        return value;

      if (value == minimum && value == maximum)
        return NaN;

      var mindiff:Number = value - minimum;
      var maxdiff:Number = maximum - value;
      return mindiff <= maxdiff ? minimum : maximum;
    }

    /**
     * Causes a value to wrap between the minimum and maximum overflow points. 
     *  
     * @param value
     * @param minimum
     * @param maximum
     */
    static public function overflow(value:Number, minimum:Number, maximum:Number):Number
    {
      if (between(value, minimum, maximum))
        return value;

      var range:Number = maximum - minimum;
      var difference:Number;
      var modulus:Number;

      if (value < minimum)
      {
        difference = minimum - value;
        modulus = difference % range;
        return maximum - modulus;
      }

      if (value > maximum)
      {
        difference = value - maximum;
        modulus = difference % range;
        return minimum + modulus;
      }

      // shouldnt happen
      return value;
    }

    // round to the closest step
    /**
     * Round a value to the nearest step value. Allows for offsetting from an optional origin value.
     *  
     * @param value
     * @param step
     * @param origin
     */
    static public function snap(value:Number, step:Number = 1, origin:Number = 0):Number
    {
      return origin + (Math.round(value / step) * step);
    }

    /**
     * Normalizes a value between 0 and 1, given the minimum and maximum values for the range. 
     *  
     * @param value 
     * @param minimum
     * @param maximum
     * @return value scaled to be between 0 and 1
     */
    static public function normalize(value:Number, minimum:Number, maximum:Number):Number 
    {
      return (value - minimum) / (maximum - minimum);
    }

    /**
     * Takes a normalized value and expands it to fit the range given by minumum and maximum.
     *  
     * Note: No range checks are made on the normalised value, though it is expected to be between 0 and 1.
     *  
     * @param value Normalised value to expand. 
     * @param minimum
     * @param maximum
     * @return value scaled to be between minimum and maximum
     */
    static public function interpolate(normalizedValue:Number, minimum:Number, maximum:Number):Number 
    {
      return minimum + (maximum - minimum) * normalizedValue;
    }
    
    /**
     * Sum an Array of Numbers
     *  
     * @param numbers Array of Numbers to sum
     * @return total of the numbers in the source Array
     */
    static public function sum(numbers:Array):Number {
      
      return ArrayMethods.inject(0, numbers, function(memo:Number, n:Number):Number {
        return memo + n;
      }) as Number;
    }
  }
}