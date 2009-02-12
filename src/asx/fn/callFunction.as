package asx.fn {  
  
  public function callFunction(...args):Function {
    return function(fn:Function, ...rest):Object {
      return fn.apply(null, args);
    };
  } 
}
