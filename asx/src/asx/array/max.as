package asx.array
{
  /**
   * Find the max item, or item with the max field value. 
   */
  public function max(iterable:Object, field:String=null):Object
  {
    var result:Object;
    var item:Object;
    
    if (field)
    {
      for each (item in iterable)
      {
        if (!result)
        {
          result = item;
        }
        else if (item && item[field] > result[field])
        {
          result = item;
        }
      }
    }
    else
    {
      for each (item in iterable)
      {
        if (!result)
        {
          result = item;
        }
        else if (item > result)
        {
          result = item;
        }
      }
    }
    
    return result;
  }
}