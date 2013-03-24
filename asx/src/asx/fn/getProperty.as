package asx.fn {  
	import asx.array.inject;
  
  /**
   * Returns a function that when called will get the property on the item.
   *  
   * @example 
   *  <listing version="3.0">
   *  var array:Array = [[1, 2, 3], [4, 5], [6]];
   *  var results:Array = array.map(getProperty('length')));
   *  assertThat(results, equalTo([3, 2, 1]));
   *  </listing>
   */
  public function getProperty(property:Object):Function {
	var chain:Array = property is Array ? property as Array : String(property).split('.');
	
	const getProp:Function = function(item:Object, field:*):Object {
		return item[field];
	};
	
	return function(item:Object, ...rest):Object {
		return inject(item, chain, getProp);
	};
  } 
}
