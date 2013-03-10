package asx.fn {  
  
  import asx.array.inject;
  
  // TODO sequence() examples
  /**
   * sequence(f1, f2, f3, ...fn)(...args) == fn(...(f3(f2(f1(...args)))))
   */
  public function sequence(...fns):Function {
    var val:*;
    return function(...args):Object {
      return inject(args, fns, function(memo:Array, fn:Function):Array {
        val = fn.apply(null, memo);
        return val === _ ? memo : [val];
      })[0]; 
    };
  }
}
