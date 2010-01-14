package asx.string
{
  // FIXME this isnt right, but its close.
  /**
   * Separate a String into words. 
   */
  public function words(value:String):Array
  {
    return value.split(/\b/);
  }
}