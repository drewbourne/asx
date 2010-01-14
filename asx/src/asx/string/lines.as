package asx.string
{
  /**
   * Separate a String in lines. 
   */
  public function lines(value:String):Array
  {
    return value.split(/\r\n|\r|\n/);
  }
}