package asx.string {  
  
  /**
   * Pads a String with another String to the right for a given number of characters.
   *  
   * @param value
   * @param length
   * @param pad
   * @return Right padded string
   */
  public function padEnd(value:String, length:Number = 1, pad:String = ' '):String {
    if (length < value.length)
      return value.substring(0, length);

    var out:String = value;
    var padLength:Number = length - value.length;
    var padRepeat:Number = Math.ceil(padLength / pad.length);
    var padding:String = repeat(pad, padRepeat).slice(0, padLength);

    return value + padding;
  } 
}
