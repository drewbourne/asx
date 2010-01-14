package asx.array {

  /**
   * Alias of <code>inject()</code>.
   * 
   * @see asx.array#inject() 
   */
  public function reduce(memo:Object, iterable:Object, iterator:Function):Object {
    return inject(memo, iterable, iterator);
  }
}
