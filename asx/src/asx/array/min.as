package asx.array
{
  /**
   * Find the min item, or item with the min field value. 
   */
  public function min(iterable:Object, field:String=null):Object
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
        else if (item && item[field] < result[field])
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
        else if (item < result)
        {
          result = item;
        }
      }
    }
    
    return result;
  }
}