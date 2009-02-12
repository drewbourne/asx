package asx.string {  
  
  /**
   * Pads a String with another String to the left for a given number of characters.
   *  
   * @param value
   * @param length
   * @param pad
   * @return left padded string
   */
  public function padStart(value:String, length:Number = 1, pad:String = ' '):String {
    if (length < value.length) 
      return value.substring(0, length);

    var padLength:Number = length - value.length;
    var padRepeat:Number = Math.ceil(padLength / pad.length);
    var padding:String = repeat(pad, padRepeat).slice(-padLength);

    return padding + value;
  } 
}
