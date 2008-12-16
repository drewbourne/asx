package asx
{
  public class Functional
  {
    /**
     * compose(f1, f2, f3, ...fn)(...args) == f1(f2(f3(...(fn(...args)))))
     */
    static public function compose(...fns):Function 
    {
      return function(...args):Object {
        
        return ArrayMethods.inject(args, fns.reverse(), function(memo:Array, fn:Function):Array {
          return [fn.apply(null, memo)];
        })[0];
        
        /*for (var i:int = fns.length; --i >= 0;) {
          args = [fns[i].apply(null, args)];
        }
        return args[0];*/
      };
    }
    
    /**
     * sequence(f1, f2, f3, ...fn)(...args) == fn(...(f3(f2(f1(...args)))))
     */
    static public function sequence(...fns):Function 
    {
      return compose.apply(null, fns.reverse());
      
      // return function(...args):Object {
      //  
      //  return ArrayMethods.inject(args, fns, function(memo:Array, fn:Function):Array {
      //    return [fn.apply(null, memo)];
      //  })[0];
        
      //  for (var i:int = 0, n:int = fns.length; i < n; i++) {
      //    args = [fns[i].apply(null, args)];
      //  }
      //  return args[0];*/
      // };
    }
    
    /**
     * reduce(f, init, [x0, x1, x2]) == f(f(f(init, x0), x1), x2)
     */
    // TODO remove as its just inject with different order of args
    static public function reduce(fn:Function, init:Object, sequence:Array):Object 
    {
      return ArrayMethods.inject(init, sequence, fn);
    }
  }
}