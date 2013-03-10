package asx.fn {  
  
  // TODO partial() examples
  /**
   * Partial function argument application
   *  
   * @param fn Function to apply arguments to
   * @param ...rest Values to apply to the fn. Number of arguments to apply.
   */
  public function partial(fn:Function, ...rest):Function {
    var args:Array = rest.slice(0);
    var subpos:Array = [];
    var value:*;
    for (var i:int = 0; i < args.length; i++) {
      if (args[i] === undefined || args[i] === _) {
        args[i] = _;
        subpos.push(i);
      }
    }
    return function(...more):* {
      var specialized:Array = args.concat(more.slice(subpos.length));
      for (var i:int = 0; i < Math.min(subpos.length, more.length); i++) {
        specialized[subpos[i]] = more[i];
      }
      for (var j:int = 0; j < specialized.length; j++) {
        if (specialized[j] === undefined || specialized[j] === _) {
          specialized[j] = _;
          return partial.apply(null, [fn].concat(specialized));
        }
      }
      return fn.apply(null, specialized);
    }
  }; 
}
