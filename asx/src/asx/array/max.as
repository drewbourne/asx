package asx.array
{
	import asx.fn._;

  /**
   * Find the max item, or item with the max field value. 
   */
  public function max(iterable:Object, field:String=null):Object
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
        else if (item && item[field] > result)
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
        else if (item > result)
        {
          result = item;
        }
      }
    }
    
    return result;
  }
}