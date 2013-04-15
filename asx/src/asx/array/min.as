package asx.array
{
	import asx.fn._;

  /**
   * Find the min item, or item with the min field value. 
   */
  public function min(iterable:Object, field:String=null):Object
  {
    var result:Object = _;
    var item:Object;
    
    if (field)
    {
      for each (item in iterable)
      {
        if (result === _)
        {
          result = item[field];
        }
        else if (item && item[field] < result)
        {
          result = item[field];
        }
      }
    }
    else
    {
      for each (item in iterable)
      {
        if (result === _)
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