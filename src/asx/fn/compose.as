package asx.fn {  
  
  // TODO compose() examples
  /**
   * compose(f1, f2, f3, ...fn)(...args) == f1(f2(f3(...(fn(...args)))))
   */
  public function compose(...fns):Function {
    
    return sequence.apply(null, fns.reverse()); 
  }
}
